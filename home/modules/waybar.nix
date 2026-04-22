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
        cpu = {
          format = "  {usage}%";
          interval = 2;
          tooltip = false;
        };
        memory = {
          format = "  {percentage}%";
          interval = 2;
          tooltip = false;
        };
        disk = {
          interval = 30;
          format = "󰋊  {percentage_used}%";
          path = "/";
          tooltip = false;
        };
        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "󰝟  {volume}%";
          format-icons = {
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          scroll-step = 1;
          tooltip = false;
        };
        battery = {
          interval = 30;
          format = "{icon}  {capacity}%";
          format-charging = "󱐋  {capacity}%";
          format-full = "󰁹  full";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          tooltip = false;
        };
        network = {
          format-wifi = "{icon}  {essid}";
          format-ethernet = "󰈀  eth";
          format-disconnected = "󰖪";
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          tooltip = false;
        };
        clock = {
          format = "{:%A %H:%M:%S %d/%m/%Y}";
          interval = 1;
        };
      }
    ];
    style = ''
      * {
        border: none;
        border-radius: 0;
        min-height: 0;
        font-family: "Monospace";
        font-size: 16px;
        padding: 0;
        margin: 0;
      }

      window#waybar {
        background-color: rgba(8, 8, 8, 0.85);
        padding: 1px 8px;
      }

      #clock, #tray, #cpu, #memory, #disk,
      #network, #pulseaudio, #battery {
        background: transparent;
        color: #ffffe4;
        margin: 2px 4px;
        padding: 0 6px;
      }

      #clock {
        padding: 0 10px;
        color: #ffffe4;
      }

      #battery.warning  { color: #ffffe4; }
      #battery.critical { color: #ff5454; }
      #battery.charging { color: #8cc85f; }
      #network.disconnected { color: #ff5454; }

      #workspaces {
        background: transparent;
        margin-left: 0;
        padding-left: 0;
      }

      #workspaces button         { color: #ffffe4; background-color: transparent; margin: 0 2px; padding: 0 0px; }
      #workspaces button.focused { background-color: #ffffe4; color: rgba(0, 0, 0, 0.7); margin: 0 2px; padding: 0 0px; }
      #workspaces button.urgent  { background-color: #ff5454; color: #ffffe4; margin: 0 2px; padding: 0 0px; }

      #workspaces button:hover {
        background: rgba(178, 178, 178, 0.08);
      }

      tooltip {
        background-color: #121212;
        border: 1px solid #373c40;
        color: #ffffe4;
      }
    '';
  };
}
