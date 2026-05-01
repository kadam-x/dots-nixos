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
          "sway/window"
        ];
        "modules-center" = [];
        "modules-right" = [
          "tray"
          "disk"
          "network"
          "pulseaudio"
          "battery"
          "clock"
        ];
        "sway/workspaces" = {
          format = "{icon}";
        };
        "sway/window" = {
          format = "> {title}";
        };
        cpu = {
          format = "cpu{usage}%";
          interval = 2;
          tooltip = false;
        };
        memory = {
          format = "ram{percentage}%";
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
          format = "󰕾 {volume}%";
          format-muted = "󰝟 {volume}%";
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
        };
        network = {
          format-wifi = "{icon} {essid}";
          format-ethernet = "󰈀 eth";
          format-disconnected = "󰖪";
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          tooltip = false;
        };
        clock = {
          format = "󱑒 {:%m/%d %H:%M}";
          interval = 1;
          tooltip = false;
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
        padding-bottom: 1px;
        padding-top: 1px;
        margin: 0;
      }
      window#waybar {
        background-color: rgba(13, 18, 22, 0.95);
      }
      #workspaces {
        background: transparent;
        margin-left: 0;
        padding-left: 0;
      }
      #workspaces button {
        color: rgba(255, 255, 255, 0.4);
        background-color: transparent;
        padding: 0 4px;
      }
      #workspaces button.focused {
        background-color: rgba(121, 218, 200, 0.4);
        color: rgba(255, 255, 255, 1);
        padding: 0 4px;
      }
      #workspaces button.urgent {
        background-color: #ff5454;
        color: #000000;
        padding: 0 4px;
      }
      #window {
        color: #bdbdbd;
        padding-left: 6px;
      }
      #tray,
      #disk,
      #network,
      #pulseaudio,
      #battery,
      #clock {
        background: transparent;
        color: #bdbdbd;
        padding: 0 6px;
      }
      #battery.warning  { color: #000000; }
      #battery.critical { color: #ff5454; }
      #battery.charging { color: #8cc85f; }
      #network.disconnected { color: #ff5454; }
      tooltip {
        background-color: #121212;
        border: 1px solid #373c40;
        color: #000000;
      }
    '';
  };
}
