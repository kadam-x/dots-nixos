{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    prefix = "C-a";
    baseIndex = 1;
    mouse = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    shell = "${pkgs.zsh}/bin/zsh";

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];

    extraConfig = ''
      # Unbind default prefix
      unbind C-b
      bind C-a send-prefix

      # Reload config
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config Reloaded!"

      # Fix Colors
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Windows and Panes
      setw -g pane-base-index 1
      set -g renumber-windows on
      set -g status-interval 10

      # Vi copy mode
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send -X copy-selection-and-cancel

      # Pane switching (Manual overrides for vim-tmux-navigator if needed)
      bind -n C-h select-pane -L
      bind -n C-j select-pane -D
      bind -n C-k select-pane -U
      bind -n C-l select-pane -R

      # Splits
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # Resize
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5
      bind -r m resize-pane -Z

      # --- THEME ---
      set -g status-position top
      set -g status-justify "left"
      set -g status-left-length 100
      set -g status-right-length 100

      set -g pane-border-style "fg=#3a3f58"
      set -g pane-active-border-style "fg=#987afb"
      set -g status-style "bg=#051a2b,fg=#a0a0a0"
      set -g message-style "fg=#987afb,bg=#2a2e3f,align=centre"
      set -g message-command-style "fg=#987afb,bg=#2a2e3f,align=centre"
      set -g window-status-activity-style "fg=#f1fa8c,bg=#051a2b,none"
      set -g window-status-separator ""
      set -g window-status-style "fg=#a0a0a0,bg=#051a2b,none"
      set -g window-status-current-format "#[fg=#a0a0a0,bg=#051a2b] #I*: #[fg=#987afb,bg=#051a2b,bold]#W "
      set -g window-status-format "#[fg=#a0a0a0,bg=#051a2b] #I: #[fg=#a0a0a0,bg=#051a2b]#W "
      set -g status-left "#[fg=#a0a0a0,bg=#051a2b] [#S] "
      set -g status-right "#{?client_prefix,#[fg=#987afb],#[fg=#a0a0a0]}[PREFIX] #[fg=#3a3f58]| #[fg=#a0a0a0]#{pane_current_command} "
      set -g mode-style "fg=#987afb bg=#2a2e3f bold"
      set -g clock-mode-colour "#987afb"

      # --- HELP POPUP ---
      bind ? display-popup -E -w 60% -h 30% "printf '\033[1;38;2;156;141;126mQUICK REFERENCE\033[0m\n\033[1;33mPREFIX: Ctrl-a\033[0m\n\033[1;36mPANES\033[0m               \033[1;36mWINDOWS\033[0m           \033[1;36mSESSIONS\033[0m\n\033[0;38;2;156;141;126m─────\033[0m               \033[0;38;2;156;141;126m───────\033[0m           \033[0;38;2;156;141;126m────────\033[0m\n\033[0;32m|\033[0m split vert       \033[0;32mc\033[0m new             \033[0;32ms\033[0m list\n\033[0;32m-\033[0m split horiz      \033[0;32mn\033[0m next            \033[0;32md\033[0m detach\n\033[0;32mhjkl\033[0m navigate      \033[0;32mp\033[0m prev            \033[0;32m$\033[0m rename\n\033[0;32mHJKL\033[0m resize        \033[0;32m,\033[0m rename\n\033[0;32mm\033[0m maximize         \033[0;32m&\033[0m kill\n\033[0;32mx\033[0m kill\n\033[0;33m?\033[0m help  \033[0;33mr\033[0m reload  \033[0;33m:\033[0m command mode\n\033[2mPress any key to close\033[0m\n'; ${pkgs.zsh}/bin/zsh -c 'read -k 1'"
    '';
  };
}
