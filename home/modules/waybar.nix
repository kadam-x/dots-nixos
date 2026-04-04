{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;

    settings = [
      {
        reload_style_on_change = true;
        layer = "top";

        "custom/separator" = {
          format = "|";
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
      }
      window#waybar {
        background: rgba(0, 0, 0, 0.7);
        color: #c8c8c8;
      }
      tooltip {
        background-color: #111111;
        border: 1px solid #888888;
      }
      #clock, #tray, #cpu, #memory, #battery,
      #network, #disk, #pulseaudio {
        color: #c8c8c8;
        margin: 2px 2px 0px 0px;
        padding: 2px 8px;
      }
      #battery.warning  { color: #c0a36e; }
      #battery.critical { color: #c34043; }
      #battery.charging { color: #76946a; }
      #network.disconnected { color: #c34043; }
      #custom-oslogo {
        color: #c8c8c8;
        margin-right: 6px;
        margin-left: 2px;
        padding-left: 2px;
        padding-right: 10px;
      }
      #custom-separator {
        color: #c8c8c8;
        opacity: 0.3;
      }
      #workspaces button.empty   { color: #444444; background-color: transparent; }
      #workspaces button         { color: #888888; background-color: transparent; margin: 0 2px; padding: 0 2px; }
      #workspaces button.focused { background-color: #c8c8c8; color: #000000; margin: 0 2px; padding: 0 2px; }
      #workspaces button.visible { background-color: #aaaaaa; color: #000000; margin: 0 2px; padding: 0 2px; }
      #workspaces button.urgent  { background-color: #c34043; color: #000000; margin: 0 2px; padding: 0 2px; }
    '';
  };
}
