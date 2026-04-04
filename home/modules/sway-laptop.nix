{ pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "foot";
      menu = "rofi -show drun -theme-str 'window {width: 25%;}'";
      defaultWorkspace = "workspace number 1";
      bars = [ ];
      gaps = {
        inner = 5;
        outer = 10;
        smartGaps = false;
        smartBorders = "on";
      };
      colors = {
        focused = {
          border = "#999999";
          background = "#24283b";
          text = "#c0caf5";
          indicator = "#999999";
          childBorder = "#999999";
        };
        focusedInactive = {
          border = "#414868";
          background = "#24283b";
          text = "#787c99";
          indicator = "#414868";
          childBorder = "#414868";
        };
        unfocused = {
          border = "#24283b";
          background = "#24283b";
          text = "#787c99";
          indicator = "#24283b";
          childBorder = "#24283b";
        };
        urgent = {
          border = "#f7768e";
          background = "#24283b";
          text = "#ffffff";
          indicator = "#f7768e";
          childBorder = "#f7768e";
        };
      };
      input = {
        "type:keyboard" = {
          xkb_layout = "us,hu";
          xkb_options = "grp:win_space_toggle";
        };
        "type:pointer" = {
          accel_profile = "flat";
        };
        "type:touchpad" = {
          natural_scroll = "enabled";
          tap = "enabled";
        };
      };
      output = {
        "eDP-1" = {
          resolution = "1920x1080@60Hz";
          position = "0,0";
        };
      };
      window.commands = [
        {
          criteria = {
            app_id = "jome";
          };
          command = "floating enable, resize set 600 400, move position center";
        }
        {
          criteria = {
            app_id = "wiremix";
          };
          command = "floating enable, resize set 800 600, move position center";
        }
        {
          criteria = {
            app_id = "yazi";
          };
          command = "floating enable, resize set 1200 1000, move position center";
        }
        {
          criteria = {
            app_id = "org.qbittorrent.qBittorrent";
          };
          command = "floating enable, resize set 800 600, move position center";
        }
        {
          criteria = {
            app_id = "ncdu";
          };
          command = "floating enable, resize set 1000 800, move position center";
        }
        {
          criteria = {
            app_id = "btop";
          };
          command = "floating enable, resize set 1000 800, move position center";
        }
        {
          criteria = {
            app_id = "swayimg";
          };
          command = "floating enable";
        }
        {
          criteria = {
            app_id = "nmtui";
          };
          command = "floating enable, resize set 600 400, move position center";
        }
        {
          criteria = {
            app_id = "notes";
          };
          command = "floating enable, resize set 1000 800, move position center";
        }
        {
          criteria = {
            app_id = "impala";
          };
          command = "floating enable, resize set 800 500, move position center";
        }
        {
          criteria = {
            app_id = "bluetui";
          };
          command = "floating enable, resize set 800 500, move position center";
        }
        {
          criteria = {
            app_id = "vlc";
          };
          command = "focus";
        }
        {
          criteria = {
            app_id = "qtws";
          };
          command = "focus";
        }
      ];
      keybindings =
        let
          mod = "Mod4";
        in
        {
          "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "${mod}+equal" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          "${mod}+minus" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          "${mod}+Return" = "exec foot";
          "${mod}+b" = "exec qutebrowser";
          "${mod}+e" = "exec foot --app-id yazi -e yazi";
          "${mod}+a" = "exec noctalia-shell ipc call launcher toggle";
          "Ctrl+Escape" = "exec noctalia-shell ipc call sessionMenu toggle";
          "${mod}+period" = "exec jome -dCLRkw16 -d | wl-copy";
          "${mod}+Escape" = "exec bash ~/.config/rofi/scripts/power-menu";
          "${mod}+n" = "exec bash ~/.config/rofi/scripts/note";
          "${mod}+p" = "exec bash ~/.config/rofi/scripts/project-picker";
          "${mod}+m" = "exec bash ~/.config/rofi/scripts/system";
          "${mod}+r" = "exec bash ~/.config/sway/cycle-resize.sh";
          # Screenshot
          "${mod}+Shift+s" =
            "exec sh -c 'grim -g \"$(slurp)\" - | tee ~/Pictures/Screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png | wl-copy'";
          # Sway
          "${mod}+q" = "kill";
          "${mod}+v" = "floating toggle";
          # Focus
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";
          # Move
          "${mod}+Ctrl+h" = "move left";
          "${mod}+Ctrl+j" = "move down";
          "${mod}+Ctrl+k" = "move up";
          "${mod}+Ctrl+l" = "move right";
          # Workspaces
          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";
          # Move to workspace
          "${mod}+Ctrl+1" = "move container to workspace number 1";
          "${mod}+Ctrl+2" = "move container to workspace number 2";
          "${mod}+Ctrl+3" = "move container to workspace number 3";
          "${mod}+Ctrl+4" = "move container to workspace number 4";
          "${mod}+Ctrl+5" = "move container to workspace number 5";
          "${mod}+Ctrl+6" = "move container to workspace number 6";
          "${mod}+Ctrl+7" = "move container to workspace number 7";
          "${mod}+Ctrl+8" = "move container to workspace number 8";
          "${mod}+Ctrl+9" = "move container to workspace number 9";
          "${mod}+Ctrl+0" = "move container to workspace number 10";
        };
      startup = [
        {
          command = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway";
          always = true;
        }
        {
          command = "noctalia-shell";
        }
        {
          command = "workstyle &> /tmp/workstyle.log";
          always = true;
        }
        { command = "/usr/lib/polkit-kde-authentication-agent-1"; }
        { command = "dunst"; }
        { command = "swww-daemon"; }
        { command = "wl-paste --type text --watch cliphist store"; }
        { command = "wl-paste --type image --watch cliphist store"; }
        { command = "qbittorrent --no-splash"; }
      ];
    };
    extraConfig = ''
      floating_modifier Mod4 normal
      default_border pixel 2
      default_floating_border pixel 2
    '';
  };
  xdg.configFile."sway/cycle-resize.sh" = {
    executable = true;
    text = ''
      #!/bin/bash
      current=$(swaymsg -t get_tree | jq '.. | objects | select(.focused==true) | .rect.width')
      total=$(swaymsg -t get_outputs | jq '.[0].rect.width')
      pct=$((current * 100 / total))
      if [ "$pct" -lt 40 ]; then
          swaymsg resize set width 50 ppt
      elif [ "$pct" -lt 60 ]; then
          swaymsg resize set width 66 ppt
      else
          swaymsg resize set width 33 ppt
      fi
    '';
  };
}
