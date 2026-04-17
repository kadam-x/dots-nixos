{ pkgs, ... }:
let
  statusScript = pkgs.writeShellScript "sway-status" ''
    while true; do
      CPU=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t} else printf "%d", (u-u1)/(t-t1)*100}' \
        <(grep 'cpu ' /proc/stat) <(sleep 0.5; grep 'cpu ' /proc/stat))
      RAM=$(free | awk '/Mem:/ {printf "%d", $3/$2*100}')
      DISK=$(df / | awk 'NR==2 {gsub(/%/,""); printf "%d", $5}')

      BAT_CAP=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
      if [ -n "$BAT_CAP" ]; then
        BAT_STATUS=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null || echo "")
        if [ "$BAT_STATUS" = "Charging" ]; then
          BAT_STR="  bat ''${BAT_CAP}%+"
        else
          BAT_STR="  bat ''${BAT_CAP}%"
        fi
      else
        BAT_STR=""
      fi

      WIFI=$(nmcli -t -f active,ssid dev wifi 2>/dev/null | awk -F: '/^yes/ {print $2}')
      if [ -n "$WIFI" ]; then
        NET_STR="  ''${WIFI}"
      else
        ETH_UP=$(ip -o link show | awk '/ether/ && /UP/ && !/lo/ {print $2; exit}' | tr -d ':')
        if [ -n "$ETH_UP" ]; then
          NET_STR="  eth"
        else
          NET_STR=""
        fi
      fi

      DATE=$(date +'%a %d %b %H:%M')
      echo "cpu ''${CPU}%  ram ''${RAM}%  disk ''${DISK}%''${BAT_STR}''${NET_STR}  ''${DATE}"
      sleep 1
    done
  '';
in
{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    config = {
      modifier = "Mod4";
      terminal = "foot";
      defaultWorkspace = "workspace number 1";
      bars = [
        {
          position = "top";
          trayOutput = "*";
          trayPadding = 4;
          statusCommand = "${statusScript}";
          extraConfig = ''
            icon_theme Papirus
          '';
          colors = {
            background = "#222222";
          };
          fonts = {
            names = [ "Iosevka Nerd Font" ];
            size = 13.0;
          };
        }
      ];
      gaps = {
        inner = 0;
        outer = 0;
        smartGaps = true;
        smartBorders = "on";
      };
      colors = {};
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
      output = { };
      window.commands = [
        {
          criteria = { app_id = "wiremix"; };
          command = "floating enable, resize set 800 600, move position center";
        }
        {
          criteria = { app_id = "yazi"; };
          command = "floating enable, resize set 1200 1000, move position center";
        }
        {
          criteria = { app_id = "org.qbittorrent.qBittorrent"; };
          command = "floating enable, resize set 800 600, move position center";
        }
        {
          criteria = { app_id = "ncdu"; };
          command = "floating enable, resize set 1000 800, move position center";
        }
        {
          criteria = { app_id = "btop"; };
          command = "floating enable, resize set 1000 800, move position center";
        }
        {
          criteria = { app_id = "swayimg"; };
          command = "floating enable";
        }
        {
          criteria = { app_id = "nmtui"; };
          command = "floating enable, resize set 600 400, move position center";
        }
        {
          criteria = { app_id = "impala"; };
          command = "floating enable, resize set 800 500, move position center";
        }
        {
          criteria = { app_id = "bluetui"; };
          command = "floating enable, resize set 800 500, move position center";
        }
        {
          criteria = { app_id = "vlc"; };
          command = "focus";
        }
        {
          criteria = { app_id = "qtws"; };
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
          "${mod}+a" = "exec tofi-drun | xargs swaymsg exec --";
          "${mod}+period" = "exec jome -dCLRkw16 -d | wl-copy";
          "${mod}+u" = "exec hyprpicker -a";
          "${mod}+n" =
            "exec bash -c 'obsidian \"obsidian://new?vault=notes&file=quicknotes/$(date +%Y-%m-%d-%H%M).md\" && swaymsg [title=\"Obsidian\"] focus'";
          "${mod}+p" = "exec bash ~/.config/tofi/scripts/project-picker";
          "${mod}+m" = "exec bash ~/.config/tofi/scripts/system-pc";
          "${mod}+w" = "exec bash ~/.config/tofi/scripts/wallpaper-picker";
          "${mod}+Shift+s" =
            "exec sh -c 'grim -g \"$(slurp)\" - | tee ~/Pictures/Screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png | wl-copy'";
          "${mod}+q" = "kill";
          "${mod}+v" = "floating toggle";
          "${mod}+j" = "focus left";
          "${mod}+k" = "focus right";
          "${mod}+h" = "exec swaymsg resize shrink right 5ppt || swaymsg resize grow left 5ppt";
          "${mod}+l" = "exec swaymsg resize grow right 5ppt || swaymsg resize shrink left 5ppt";
          "${mod}+Ctrl+j" = "move left";
          "${mod}+Ctrl+k" = "move right";
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
        { command = "/usr/lib/polkit-kde-authentication-agent-1"; }
        { command = "dunst"; }
        { command = "wl-paste --type text --watch cliphist store"; }
        { command = "wl-paste --type image --watch cliphist store"; }
        { command = "qbittorrent --no-splash"; }
        { command = "swww-daemon"; }
      ];
    };
    extraConfig = ''
      floating_modifier Mod4 normal
      default_border pixel 2
      default_floating_border pixel 2

      output DP-1 resolution 2560x1440@240Hz position 0,0
      output eDP-1 resolution 1920x1080@60Hz position 0,0
    '';
  };
}
