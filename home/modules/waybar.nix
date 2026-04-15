{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = [
      {
        reload_style_on_change = true;
        layer = "top";
        "custom/separator" = {
          format = "::";
          interval = "once";
          tooltip = false;
        };
        "modules-left" = [ "sway/workspaces" ];
        "modules-center" = [ "clock" ];
        "modules-right" = [
          "tray"
          "disk"
          "group/sysinfo"
          "network"
          "battery"
          "pulseaudio"
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
          format = "󰍛 {usage}%";
          interval = 2;
          tooltip = false;
          states = {
            critical = 90;
          };
        };
        memory = {
          format = "󰘚 {percentage}%";
          interval = 2;
          tooltip = false;
          states = {
            critical = 80;
          };
        };
        disk = {
          interval = 30;
          format = "󰋊 {percentage_used}%";
          path = "/";
          tooltip = false;
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟";
          format-icons = {
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          scroll-step = 1;
          tooltip = false;
        };
        battery = {
          interval = 30;
          format = "bat{capacity}%";
          format-charging = "bat {capacity}%";
          format-full = "bat full";
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
          format = "{:%a %d %b %H:%M:%S}";
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
      }
      window#waybar {
        background-color: rgba(40, 85, 119, 0.7);
      }
      tooltip {
        background-color: #073642;
        border: 1px solid #ffffe4;
        color: #93a1a1;
      }
      #clock, #tray, #cpu, #memory, #battery,
      #network, #disk, #pulseaudio {
        color: #ffffe4;
        margin: 2px 2px 0px 0px;
        padding: 2px 6px;
        opacity: 1;
      }
      #battery.warning  { color: #c0a36e; }
      #battery.critical { color: #c34043; }
      #battery.charging { color: #76946a; }
      #network.disconnected { color: #c34043; }
      #custom-separator { color: #ffffe4; opacity: 0.7; }
      #workspaces button         { color: #ffffe4; background-color: transparent; margin: 0 2px; padding: 0 2px; }
      #workspaces button.focused { background-color: #ffffe4; color: rgba(0, 0, 0, 0.7); margin: 0 2px; padding: 0 2px; }
      #workspaces button.urgent  { background-color: #dc322f; color: #ffffe4; margin: 0 2px; padding: 0 2px; }
    '';
  };
}
