{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = [
      {
        reload_style_on_change = true;
        layer = "top";
        "modules-left" = [ 
          "sway/workspaces"
          "tray"
        ];
        "modules-center" = ["clock"];
        "modules-right" = [
          "pulseaudio"
          "disk"
          "group/sysinfo"
          "network"
          "battery"
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
        font-size: 18px;
        padding: 0;
        margin: 0;
      }

      window#waybar {
        background-color: rgba(40, 40, 40, 0.7);
        padding: 1px 8px;
      }

      #clock, #tray, #cpu, #memory, #disk,
      #network, #pulseaudio, #battery {
        background: transparent;
        color: #a89984;
        margin: 2px 4px;
        padding: 0 6px;
      }

      #clock {
        padding: 0 10px;
      }

      #battery.warning  { color: #fe8019; }
      #battery.critical { color: #fb4934; }
      #battery.charging { color: #b8bb26; }
      #network.disconnected { color: #fb4934; }

      #workspaces {
        background: transparent;
      }

      #workspaces button         { color: #a89984; background-color: transparent; margin: 0 2px; padding: 0 2px; }
      #workspaces button.focused { background-color: #a89984; color: rgba(0, 0, 0, 0.7); margin: 0 2px; padding: 0 2px; }
      #workspaces button.urgent  { background-color: #dc322f; color: #a89984; margin: 0 2px; padding: 0 2px; }

      #workspaces button:hover {
        background: rgba(255, 255, 255, 0.08);
      }

      tooltip {
        background-color: #1d2021;
        border: 1px solid #504945;
        color: #ebdbb2;
      }
    '';
  };
}
