{ pkgs, ... }:
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
        font-family: "Iosevka Nerd Font";
        font-size: 16px;
        letter-spacing: 0.5px;
        padding: 0;
        margin: 0;
      }

      window#waybar {
        background-color: rgba(13, 17, 22, 0.9);
        padding: 1px 8px;
      }

      #clock, #tray, #cpu, #memory, #disk,
      #network, #pulseaudio, #battery {
        background: transparent;
        margin: 2px 6px;
        padding: 0 4px;
      }

      #clock { color: #d5c4a1; padding: 0 10px; }
      #pulseaudio { color: #a89984; }
      #disk { color: #b16286; }
      #cpu { color: #83a598; }
      #memory { color: #d79921; }
      #network { color: #689d6a; }
      #battery { color: #98971a; }

      #battery.warning  { color: #d65d0e; }
      #battery.critical { color: #fb4934; }
      #battery.charging { color: #b8bb26; }
      #network.disconnected { color: #fb4934; }

      #workspaces {
        background: transparent;
      }

      #workspaces button {
        color: #928374;
        background-color: transparent;
        padding: 0 2px;
        margin: 0 2px;
      }

      #workspaces button.focused {
        color: #111111;
        background-color: #a89984;
        padding: 0 2px;
        margin: 0 2px;
      }

      #workspaces button.urgent {
        background-color: #fb4934;
        color: #ebdbb2;
      }

      tooltip {
        background-color: #1d2021;
        border: 1px solid #504945;
        color: #ebdbb2;
      }
    '';
  };
}
