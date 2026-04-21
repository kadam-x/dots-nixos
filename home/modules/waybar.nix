{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = [
      {
        reload_style_on_change = true;
        layer = "top";
        "modules-left" = [ "sway/workspaces" ];
        "modules-center" = [];
        "modules-right" = [
          "tray"
          "disk"
          "group/sysinfo"
          "network"
          "battery"
          "pulseaudio"
          "clock"
        ];
        "group/sysinfo" = {
          orientation = "horizontal";
          modules = [
            "cpu"
            "memory"
          ];
        };
        "sway/workspaces" = {
          format = "{icon}";
        };
        "sway/window" = {
          max-length = 50;
        };
        tray = {
          spacing = 10;
          tooltip = false;
        };
        cpu = {
          format = "cpu {usage}%";
          interval = 2;
          tooltip = false;
          states = {
            critical = 90;
          };
        };
        memory = {
          format = "ram {percentage}%";
          interval = 2;
          tooltip = false;
          states = {
            critical = 80;
          };
        };
        disk = {
          interval = 30;
          format = "disk {percentage_used}%";
          path = "/";
          tooltip = false;
        };
        pulseaudio = {
          format = "vol {volume}%";
          scroll-step = 1;
          tooltip = false;
        };
        battery = {
          interval = 30;
          format = "{icon} {capacity}%";
          format-charging = "󱐋 {capacity}%";
          format-full = "󰁹 full";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          tooltip = false;
          states = {
            warning = 30;
            critical = 15;
          };
        };
        network = {
          format-wifi = "{icon} {essid}";
          format-ethernet = "󰈀 eth";
          format-disconnected = "󰖪";
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          tooltip = false;
        };
        clock = {
          format = "{:%a %d %b  %H:%M:%S}";
          interval = 1;
        };
      }
    ];
    style = ''
      * {
        border: none;
        border-radius: 0;
        min-height: 0;
        font-family: "Iosevka Nerd Font";
        font-size: 14px;
        padding: 0;
        margin: 0;
      }

      window#waybar {
        background-color: rgba(40, 85, 119, 0.7);
        padding: 1px 8px;
      }

      #clock, #tray, #cpu, #memory, #battery,
      #network, #disk, #pulseaudio {
        color: #ffffe4;
        padding: 0 10px;
        margin: 0;
      }

      #clock {
        font-weight: 500;
        padding-right: 6px;
      }

      #tray {
        padding: 0 6px;
      }

      #battery.warning  { color: #c0a36e; }
      #battery.critical { color: #c34043; }
      #battery.charging { color: #76946a; }
      #network.disconnected { color: #c34043; }

      #workspaces {
        background: transparent;
      }
      #workspaces button {
        color: rgba(255, 255, 228, 0.45);
        background: transparent;
        padding: 0 6px;
        font-size: 15px;
      }
      #workspaces button.focused {
        color: #ffffe4;
      }
      #workspaces button.urgent {
        background-color: #dc322f;
        color: #ffffe4;
      }
      #workspaces button:hover {
        background: rgba(255, 255, 228, 0.08);
      }

      tooltip {
        background-color: #073642;
        border: 1px solid #ffffe4;
        color: #93a1a1;
      }
    '';
  };
}
