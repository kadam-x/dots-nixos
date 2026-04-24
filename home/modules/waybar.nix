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
        ];
        "modules-center" = ["clock"];
        "modules-right" = [
          "tray"
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
          format = " {usage}%";
          interval = 2;
          tooltip = false;
        };
        memory = {
          format = " {percentage}%";
          interval = 2;
          tooltip = false;
        };
        disk = {
          interval = 30;
          format = "󰋊 {percentage_used}%";
          path = "/";
          tooltip = false;
        };
        pulseaudio = {
          format = "{icon} {volume}%";
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
          format-ethernet = "󰈀 eth";
          format-disconnected = "󰖪";
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          tooltip = false;
        };
        clock = {
          format = "{:%a %H:%M:%S %d/%m}";
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
        background-color: #030210;
      }

      #clock, #tray, #cpu, #memory, #disk,
      #network, #pulseaudio, #battery, #clock {
        background: transparent;
        color: #bdbdbd;
        padding-right: 2px;
        padding-left: 2px;
      }


      #battery.warning  { color: #000000; }
      #battery.critical { color: #ff5454; }
      #battery.charging { color: #8cc85f; }
      #network.disconnected { color: #ff5454; }

      #workspaces {
        background: transparent;
        margin-left: 0;
        padding-left: 0;
      }

      #workspaces button         { color: rgba(255, 255, 255, 0.4); background-color: transparent; margin: 0 0px; padding: 0 0px; }
      #workspaces button.focused { background-color: rgba(121, 218, 200, 0.4); color: rgba(255, 255, 255, 1); margin: 0 0px; padding: 0 0px; }
      #workspaces button.urgent  { background-color: #ff5454; color: #000000; margin: 0 0px; padding: 0 0px; }

      tooltip {
        background-color: #121212;
        border: 1px solid #373c40;
        color: #000000;
      }
    '';
  };
}
