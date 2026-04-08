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
        background: rgba(13, 17, 22, 0.9);
        color: #ffffff;
      }
      tooltip {
        background-color: #141b22;
        border: 1px solid #987afb;
      }
      #clock, #tray, #cpu, #memory, #disk, #pulseaudio {
        color: #ffffff;
        margin: 2px 2px 0px 0px;
        padding: 2px 6px;
      }
      #custom-separator {
        color: #987afb;
        opacity: 0.5;
      }
      #workspaces button         { color: #3d2a5e; background-color: transparent; margin: 0 2px; padding: 0 2px; }
      #workspaces button.focused { background-color: #987afb; color: #0D1116; font-weight: bold; margin: 0 2px; padding: 0 2px; }
      #workspaces button.urgent  { background-color: #f16c75; color: #0D1116; margin: 0 2px; padding: 0 2px; }
      #cpu.critical    { color: #f16c75; }
      #memory.critical { color: #f16c75; }
    '';
  };
}
