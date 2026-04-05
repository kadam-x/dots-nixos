{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.niri.settings = {
    prefer-no-csd = true;

    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

    hotkey-overlay.skip-at-startup = true;

    animations.slowdown = 0.4;

    input = {
      keyboard = {
        numlock = true;
        xkb = { };
      };
      touchpad = {
        tap = true;
        natural-scroll = true;
      };
      mouse = {
        accel-speed = 0.0;
        accel-profile = "flat";
      };
    };

    outputs."DP-1" = {
      mode = {
        width = 2560;
        height = 1440;
        refresh = 240.0;
      };
      position = {
        x = 0;
        y = 0;
      };
      backdrop-color = "#181818";
    };

    layout = {
      gaps = 15;
      background-color = "transparent";
      center-focused-column = "never";
      preset-column-widths = [
        { proportion = 0.5; }
        { proportion = 0.33; }
        { proportion = 0.67; }
      ];
      default-column-width = {
        proportion = 0.5;
      };
      focus-ring = {
        enable = false;
        width = 2;
        active.color = "#9c8d7e";
        inactive.color = "#505050";
      };
      border = {
        enable = false;
        width = 1.5;
        active.color = "#7fc8ff";
        inactive.color = "#505050";
        urgent.color = "#9b0000";
      };
      shadow = {
        enable = false;
        softness = 50;
        spread = 15;
        offset = {
          x = 0;
          y = 5;
        };
        color = "#0007";
      };
    };

    gestures.hot-corners.enable = false;

    spawn-at-startup = [
      { command = [ "noctalia-shell" ]; }
      { command = [ "qbittorrent" ]; }
      { command = [ "xwayland-satellite" ]; }
    ];

    window-rules = [
      # Corner radius for all windows
      {
        geometry-corner-radius = {
          top-left = 0.0;
          top-right = 0.0;
          bottom-left = 0.0;
          bottom-right = 0.0;
        };
        clip-to-geometry = true;
      }
      # Inactive window opacity
      {
        matches = [ { is-active = false; } ];
        opacity = 0.9;
      }
      # Neovim opacity
      {
        matches = [
          {
            app-id = "^foot$";
            title = ".*nvim.*";
          }
        ];
        opacity = 0.95;
      }
      # Workspace assignments
      {
        matches = [ { app-id = "librewolf$"; } ];
        open-maximized = true;
      }
      {
        matches = [ { app-id = "org.qutebrowser.qutebrowser$"; } ];
        open-maximized = true;
      }
      {
        matches = [ { app-id = "vlc$"; } ];
        open-maximized = true;
      }
      {
        matches = [ { app-id = "qtws$"; } ];
        open-maximized = true;
      }
      # Large floating windows
      {
        matches = [
          { app-id = "wiremix$"; }
          { app-id = "ncdu$"; }
          { app-id = "btop$"; }
        ];
        open-floating = true;
        default-column-width = {
          fixed = 1200;
        };
        default-window-height = {
          fixed = 1000;
        };
      }
      # Small floating windows
      {
        matches = [
          { app-id = "jome$"; }
          { app-id = "org.qbittorrent.qBittorrent$"; }
          { app-id = "org.pulseaudio.pavucontrol$"; }
        ];
        open-floating = true;
        default-column-width = {
          fixed = 800;
        };
        default-window-height = {
          fixed = 600;
        };
      }
      # Floating terminals/tools
      {
        matches = [
          { app-id = "foot-notes$"; }
          { app-id = "yazi$"; }
          { app-id = "swayimg$"; }
        ];
        open-floating = true;
        default-column-width = {
          fixed = 1200;
        };
        default-window-height = {
          fixed = 1000;
        };
      }
      # Foot default width
      {
        matches = [ { app-id = "^foot$"; } ];
        default-column-width = {
          proportion = 0.33;
        };
      }
    ];

    layer-rules = [
      {
        matches = [ { namespace = "^wallpaper$"; } ];
        place-within-backdrop = true;
      }
      {
        matches = [ { namespace = "^noctalia-wallpaper-.*$"; } ];
        place-within-backdrop = true;
      }
    ];

    binds =
      with config.lib.niri.actions;
      let
        noctalia = cmd: {
          action.spawn = [
            "noctalia-shell"
            "ipc"
            "call"
          ]
          ++ (lib.splitString " " cmd);
        };
      in
      {
        "Mod+Shift+Slash".action = show-hotkey-overlay;

        # Applications
        "Mod+Return".action.spawn = [ "foot" ];
        "Mod+A".action = (noctalia "launcher toggle").action;
        "Mod+Alt+L".action.spawn = [ "swaylock" ];
        "Mod+B".action.spawn = [ "qutebrowser" ];
        "Mod+E".action.spawn = [
          "foot"
          "--app-id"
          "yazi"
          "-e"
          "yazi"
        ];
        "Mod+Escape".action = (noctalia "sessionMenu toggle").action;
        "Mod+N".action.spawn-sh = ''obsidian "obsidian://new?vault=notes&name=$(date +%Y-%m-%d-%H%M)"'';
        "Mod+P".action = (noctalia "launcher toggle").action;
        "Mod+Period".action.spawn-sh = "noctalia-shell ipc call launcher emoji";
        "Mod+U".action.spawn = [
          "hyprpicker"
          "-a"
        ];
        "Ctrl+Escape".action = (noctalia "sessionMenu toggle").action;

        # Audio
        "XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
        };
        "XF86AudioLowerVolume" = {
          allow-when-locked = true;
          action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
        };
        "XF86AudioMute" = {
          allow-when-locked = true;
          action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
        "XF86AudioMicMute" = {
          allow-when-locked = true;
          action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        };

        # Media
        "XF86AudioPlay" = {
          allow-when-locked = true;
          action.spawn-sh = "playerctl play-pause";
        };
        "XF86AudioStop" = {
          allow-when-locked = true;
          action.spawn-sh = "playerctl stop";
        };
        "XF86AudioPrev" = {
          allow-when-locked = true;
          action.spawn-sh = "playerctl previous";
        };
        "XF86AudioNext" = {
          allow-when-locked = true;
          action.spawn-sh = "playerctl next";
        };

        # Brightness
        "XF86MonBrightnessUp" = {
          allow-when-locked = true;
          action.spawn = [
            "brightnessctl"
            "--class=backlight"
            "set"
            "+10%"
          ];
        };
        "XF86MonBrightnessDown" = {
          allow-when-locked = true;
          action.spawn = [
            "brightnessctl"
            "--class=backlight"
            "set"
            "10%-"
          ];
        };

        # Overview & window management
        "Mod+O" = {
          repeat = false;
          action = toggle-overview;
        };
        "Super+Q" = {
          repeat = false;
          action = close-window;
        };

        # Focus navigation
        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+H".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        "Mod+J".action = focus-workspace-down;
        "Mod+K".action = focus-workspace-up;

        # Move windows
        "Mod+Ctrl+H".action = move-column-left;
        "Mod+Ctrl+L".action = move-column-right;
        "Mod+Ctrl+J".action = move-column-to-workspace-down;
        "Mod+Ctrl+K".action = move-column-to-workspace-up;

        # Column positioning
        "Mod+Home".action = focus-column-first;
        "Mod+End".action = focus-column-last;
        "Mod+Ctrl+Home".action = move-column-to-first;
        "Mod+Ctrl+End".action = move-column-to-last;

        # Mouse wheel workspace
        "Mod+WheelScrollDown" = {
          cooldown-ms = 150;
          action = focus-workspace-down;
        };
        "Mod+WheelScrollUp" = {
          cooldown-ms = 150;
          action = focus-workspace-up;
        };
        "Mod+Ctrl+WheelScrollDown" = {
          cooldown-ms = 150;
          action = move-column-to-workspace-down;
        };
        "Mod+Ctrl+WheelScrollUp" = {
          cooldown-ms = 150;
          action = move-column-to-workspace-up;
        };

        # Mouse wheel column
        "Mod+WheelScrollRight".action = focus-column-right;
        "Mod+WheelScrollLeft".action = focus-column-left;
        "Mod+Ctrl+WheelScrollRight".action = move-column-right;
        "Mod+Ctrl+WheelScrollLeft".action = move-column-left;

        # Shift wheel horizontal
        "Mod+Shift+WheelScrollDown".action = focus-column-right;
        "Mod+Shift+WheelScrollUp".action = focus-column-left;
        "Mod+Ctrl+Shift+WheelScrollDown".action = move-column-right;
        "Mod+Ctrl+Shift+WheelScrollUp".action = move-column-left;

        # Direct workspace access
        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;

        # Move to workspace
        "Mod+Ctrl+1".action.move-column-to-workspace = [ 1 ];
        "Mod+Ctrl+2".action.move-column-to-workspace = [ 2 ];
        "Mod+Ctrl+3".action.move-column-to-workspace = [ 3 ];
        "Mod+Ctrl+4".action.move-column-to-workspace = [ 4 ];
        "Mod+Ctrl+5".action.move-column-to-workspace = [ 5 ];
        "Mod+Ctrl+6".action.move-column-to-workspace = [ 6 ];
        "Mod+Ctrl+7".action.move-column-to-workspace = [ 7 ];
        "Mod+Ctrl+8".action.move-column-to-workspace = [ 8 ];
        "Mod+Ctrl+9".action.move-column-to-workspace = [ 9 ];
        # Column operations
        "Mod+BracketLeft".action = consume-or-expel-window-left;
        "Mod+BracketRight".action = consume-or-expel-window-right;
        "Mod+Comma".action = consume-window-into-column;

        # Window sizing
        "Mod+R".action = switch-preset-column-width;
        "Mod+Shift+R".action = switch-preset-window-height;
        "Mod+Ctrl+R".action = reset-window-height;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;
        "Mod+Ctrl+F".action = expand-column-to-available-width;

        # Centering
        "Mod+C".action = center-column;
        "Mod+Ctrl+C".action = center-visible-columns;

        # Fine adjustments
        "Mod+Minus".action = {
          set-column-width = "-10%";
        };
        "Mod+Equal".action = {
          set-column-width = "+10%";
        };
        "Mod+Shift+Minus".action = {
          set-window-height = "-10%";
        };
        "Mod+Shift+Equal".action = {
          set-window-height = "+10%";
        };

        # Floating
        "Mod+V".action = toggle-window-floating;
        "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

        # Tabbed
        "Mod+W".action = toggle-column-tabbed-display;

        # Screenshots
        "Mod+Shift+S".action = {
          screenshot = { };
        };
        "Ctrl+Print".action = {
          screenshot-screen = { };
        };
        "Alt+Print".action = {
          screenshot-window = { };
        };

        # System
        "Mod+Shift+E".action = quit;
        "Ctrl+Alt+Delete".action = quit;
        "Mod+Shift+P".action = power-off-monitors;
      };
  };
}
