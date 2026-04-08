{ ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    config = {
      modifier = "Mod4";
      terminal = "foot";
      defaultWorkspace = "workspace number 1";
      bars = [ ];
      gaps = {
        inner = 5;
        outer = 15;
        smartGaps = false;
        smartBorders = "on";
      };
      colors = {
        focused = {
          border = "#ffffe4";
          background = "#121212";
          text = "#beaa97";
          indicator = "#ffffe4";
          childBorder = "#ffffe4";
        };
        focusedInactive = {
          border = "#ffffe4";
          background = "#121212";
          text = "#555555";
          indicator = "#ffffe4";
          childBorder = "#ffffe4";
        };
        unfocused = {
          border = "#121212";
          background = "#121212";
          text = "#555555";
          indicator = "#121212";
          childBorder = "#121212";
        };
        urgent = {
          border = "#f7768e";
          background = "#121212";
          text = "#beaa97";
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
        "DP-1" = {
          resolution = "2560x1440@240Hz";
          position = "0,0";
          bg = "~/Pictures/Wallpapers/base16-bmg/cloud-black-metal.jpg fill";
        };
      };
      window.commands = [
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
          # Volume
          "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "${mod}+equal" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          "${mod}+minus" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          # Apps
          "${mod}+Return" = "exec foot";
          "${mod}+b" = "exec qutebrowser";
          "${mod}+e" = "exec foot --app-id yazi -e yazi";
          "${mod}+d" = "exec tofi-drun";
          "${mod}+period" = "exec jome -dCLRkw16 -d | wl-copy";
          "${mod}+u" = "exec hyprpicker -a";
          "${mod}+n" =
            "exec bash -c 'obsidian \"obsidian://new?vault=notes&file=quicknotes/$(date +%Y-%m-%d-%H%M).md\" && swaymsg [title=\"Obsidian\"] focus'";
          "${mod}+p" = "exec bash ~/.config/tofi/scripts/project-picker";
          "${mod}+m" = "exec bash ~/.config/tofi/scripts/system-pc";
          # Screenshot
          "${mod}+Shift+s" =
            "exec sh -c 'grim -g \"$(slurp)\" - | tee ~/Pictures/Screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png | wl-copy'";
          # Sway
          "${mod}+q" = "kill";
          "${mod}+v" = "floating toggle";
          # Focus
          "${mod}+j" = "focus left";
          "${mod}+k" = "focus right";
          # Resize
          "${mod}+h" = "exec swaymsg resize shrink right 50px || swaymsg resize grow left 50px";
          "${mod}+l" = "exec swaymsg resize grow right 50px || swaymsg resize shrink left 50px";
          # Move
          # Move
          "${mod}+Ctrl+j" = "move left";
          "${mod}+Ctrl+k" = "move right";
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
        { command = "waybar"; }
        { command = "/usr/lib/polkit-kde-authentication-agent-1"; }
        { command = "dunst"; }
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
}
