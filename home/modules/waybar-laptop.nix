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
        "modules-center" = [ ];
        "modules-right" = [
          "tray"
          "disk"
          "custom/separator"
          "group/sysinfo"
          "custom/separator"
          "battery"
          "custom/separator"
          "network"
          "custom/separator"
          "pulseaudio"
          "custom/separator"
          "clock"
        ];
        "group/sysinfo" = {
          orientation = "horizontal";
          modules = [
            "cpu"
            "custom/separator"
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
          format-muted = "󰝟";
          scroll-step = 1;
          tooltip = false;
        };
        battery = {
          interval = 30;
          format = "bat {capacity}%";
          format-charging = "bat  {capacity}%";
          format-full = "bat full";
          tooltip = false;
          states = {
            warning = 30;
            critical = 15;
          };
        };
        network = {
          format-wifi = "󰖩";
          format-disconnected = "󰖪";
          format-ethernet = "eth";
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
        background: rgba(0, 0, 0, 0.7);
        color: #beaa97;
      }
      tooltip {
        background-color: #073642;
        border: 1px solid #586e75;
        color: #93a1a1;
      }
      #clock, #tray, #cpu, #memory, #battery,
      #network, #disk, #pulseaudio {
        color: #586e75;
        margin: 2px 2px 0px 0px;
        padding: 2px 6px;
        opacity: 1;
      }
      #battery.warning  { color: #c0a36e; }
      #battery.critical { color: #c34043; }
      #battery.charging { color: #76946a; }
      #network.disconnected { color: #c34043; }
      #custom-separator { color: #586e75; opacity: 0.7; }
      #workspaces button         { color: #586e75; background-color: transparent; margin: 0 2px; padding: 0 2px; }
      #workspaces button.focused { background-color: #586e75; color: rgba(0, 0, 0, 0.7); margin: 0 2px; padding: 0 2px; }
      #workspaces button.urgent  { background-color: #dc322f; color: #586e75; margin: 0 2px; padding: 0 2px; }
    '';
  };
}
