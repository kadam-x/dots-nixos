{ ... }:
{
  xdg.configFile = {
    "rofi/base16-bmg.rasi".text = ''
      * {
          bg:               #111111;
          bg-selected:      #1a1a1a;
          fg:               #c8c8c8;
          accent:           #c8c8c8;
          border-strong:    #888888;
          border-subtle:    #444444;
          background-color: transparent;
          text-color:       @fg;
          font:             "Iosevka Term";
      }
      window {
          background-color: @bg;
          border:           3px;
          border-color:     @border-strong;
          border-radius:    0px;
          width:            600px;
          padding:          0;
      }
      mainbox {
          children: [ inputbar, listview ];
      }
      inputbar {
          background-color: @bg;
          children:         [ prompt, entry ];
          padding:          10px;
          border:           0px 0px 2px 0px;
          border-color:     @border-strong;
      }
      prompt {
          padding:    0px 10px 0px 0px;
          text-color: @accent;
      }
      entry {
          text-color: @fg;
      }
      listview {
          lines:        15;
          columns:      1;
          fixed-height: false;
      }
      element {
          padding:       6px 12px;
          border-radius: 4px;
      }
      element selected {
          background-color: @bg-selected;
          text-color:       #9c8d7e;
      }
      element-text {
          text-color: inherit;
      }
    '';
    "rofi/config.rasi".text = ''
      configuration {
          modi:                 ["drun", "window", "run"];
          icon-theme:           "retrosmart";
          show-icons:           true;
          font:                 "Iosevka Term";
          terminal:             "foot";
          drun-display-format:  "{icon} {name}";
          location:             0;
          disable-history:      false;
          sidebar-mode:         false;
          display-drun:         " ";
          display-run:          " ";
          display-window:       " ";
          kb-row-up:            "Up,Control+k";
          kb-row-left:          "Left,Control+h";
          kb-row-right:         "Right,Control+l";
          kb-row-down:          "Down,Control+j";
          kb-accept-entry:      "Control+z,Control+y,Return,KP_Enter";
          kb-remove-to-eol:     "";
          kb-move-char-back:    "Control+b";
          kb-remove-char-back:  "BackSpace";
          kb-move-char-forward: "Control+f";
          kb-mode-complete:     "Control+o";
      }
      @theme "base16-bmg.rasi"
    '';
    "rofi/scripts/note" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        VAULT_DIR="$HOME/notes"
        mkdir -p "$VAULT_DIR"
        options="open dir
        create note
        fzf
        ripgrep"
        choice=$(echo -e "$options" | rofi -dmenu -i -p "" -theme-str 'window {width: 10%;} listview {lines: 4; columns: 1;} element selected {background-color: #2a2a38; text-color: #c5c9c5;} inputbar {enabled: false;}')
        choice_clean=$(echo "$choice" | xargs)
        case "$choice_clean" in
          "fzf")
            foot --app-id foot-notes -e bash -c "
              cd '$VAULT_DIR' && \
              selected=\$(find . -type f -name '*.md' | \
                fzf --preview 'bat --theme base16 --style=numbers --color=always {}' \
                    --preview-window=right:60% \
                    --height=100%) && \
              [ -n \"\$selected\" ] && nvim \"\$selected\"
            " &
            ;;
          "ripgrep")
            foot --app-id foot-notes -e bash -c '
              cd "'"$VAULT_DIR"'" && \
              selected=$(fzf --disabled --ansi \
                --prompt "Search Content > " \
                --bind "change:reload:rg --column --line-number --no-heading --color=always --smart-case -- {q} || true" \
                --delimiter ":" \
                --preview "bat --style=numbers --color=always --highlight-line {2} {1}" \
                --preview-window="right:60%:+{2}-/2") && \
              [ -n "$selected" ] && \
              file=$(echo "$selected" | cut -d":" -f1) && \
              line=$(echo "$selected" | cut -d":" -f2) && \
              nvim "+$line" "$file"
            ' &
            ;;
          "open dir")
            foot --app-id foot-notes -e bash -c "cd '$VAULT_DIR' && yazi" &
            ;;
          "create note")
            note_name=$(rofi -dmenu -p "Note name (blank for timestamp)" -theme-str 'window {width: 25%;} listview {enabled: false;}')
            rofi_exit=$?
            [ $rofi_exit -ne 0 ] && exit 0
            if [ -z "$note_name" ]; then
              timestamp=$(date +%Y-%m-%d-%H%M)
              note_file="$VAULT_DIR/$timestamp.md"
            else
              safe_name=$(echo "$note_name" | tr ' ' '-' | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9-]//g')
              note_file="$VAULT_DIR/$safe_name.md"
            fi
            if [ ! -f "$note_file" ]; then
              echo "# $(basename "$note_file" .md)" > "$note_file"
              echo "" >> "$note_file"
              echo "tags: " >> "$note_file"
              echo "" >> "$note_file"
              echo "## Overview" >> "$note_file"
              echo "" >> "$note_file"
            fi
            foot --app-id foot-notes -e nvim "$note_file" &
            ;;
        esac
      '';
    };
    "rofi/scripts/project-picker" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        PROJECTS_DIR="$HOME/projects"
        function sanitize() { echo "$1" | tr ' ./' '___'; }
        function create_session() {
          local session_name="$1"
          local project_path="$2"
          tmux new-session -d -s "$session_name" -c "$project_path"
          tmux rename-window -t "$session_name:1" "editor"
          tmux send-keys -t "$session_name:editor" "nvim" Enter
          tmux split-window -v -t "$session_name:editor" -c "$project_path" -p 25
          tmux split-window -h -t "$session_name:editor.2" -c "$project_path"
          tmux split-window -h -t "$session_name:editor.2" -c "$project_path"
          tmux send-keys -t "$session_name:editor.2" "opencode" Enter
          tmux select-pane -t "$session_name:editor.1"
          tmux new-window -t "$session_name" -n "lazygit" -c "$project_path"
          tmux send-keys -t "$session_name:lazygit" "lazygit" Enter
          tmux select-window -t "$session_name:editor"
        }
        active_sessions=$(tmux list-sessions -F "#S ●" 2>/dev/null)
        all_projects=$(find "$PROJECTS_DIR" -maxdepth 1 -mindepth 1 -type d ! -name "archive" -printf "%f\n")
        combined_list=$(echo -e "''${active_sessions}\n''${all_projects}")
        selected_raw=$(echo "$combined_list" | rofi -dmenu -i -p "Project")
        [ -z "$selected_raw" ] && exit 0
        selected=$(echo "$selected_raw" | sed 's/ ●//')
        session_name=$(sanitize "$selected")
        project_path="$PROJECTS_DIR/$selected"
        if ! tmux has-session -t "$session_name" 2>/dev/null; then
          [ ! -d "$project_path" ] && project_path="$HOME"
          create_session "$session_name" "$project_path"
        fi
        if [ -n "$TMUX" ]; then
          tmux switch-client -t "$session_name"
        else
          foot -e tmux attach-session -t "$session_name" &
        fi
      '';
    };
    "rofi/scripts/system" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        choice=$(printf "btop\nncdu\npulsemixer\nwifi\nbluetooth" | rofi -dmenu -p "" -theme-str 'window {width: 10%;} listview {lines: 5; columns: 1;} inputbar {enabled: false;}')
        case "$choice" in
          "btop")       foot --app-id btop -e btop & ;;
          "ncdu")       foot --app-id ncdu -e ncdu / & ;;
          "pulsemixer") foot --app-id wiremix -e pulsemixer & ;;
          "wifi")       foot --app-id impala -e impala & ;;
          "bluetooth")  foot --app-id bluetui -e bluetui & ;;
        esac
      '';
    };
  };
}
