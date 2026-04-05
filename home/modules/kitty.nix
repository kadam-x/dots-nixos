{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "Iosevka Nerd Font";
      size = 16;
    };
    settings = {
      shell = "zsh";
      window_padding_width = 6;
      confirm_os_window_close = 0;
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/mykitty";
      background_opacity = "0.95";
      cursor_shape = "beam";
      cursor_beam_thickness = "7";
      cursor_blink_interval = 0;
      background = "#0D1116";
      foreground = "#ffffff";
      selection_background = "#987afb";
      selection_foreground = "#0D1116";
      cursor = "#ffffff";
      cursor_text_color = "#0D1116";
      cursor_opacity = "0.7";
      url_color = "#04d1f9";
      color0 = "#141b22";
      color1 = "#f16c75";
      color2 = "#37f499";
      color3 = "#f1fc79";
      color4 = "#987afb";
      color5 = "#fca6ff";
      color6 = "#04d1f9";
      color7 = "#ffffff";
      color8 = "#232e3b";
      color9 = "#f16c75";
      color10 = "#37f499";
      color11 = "#f1fc79";
      color12 = "#987afb";
      color13 = "#fca6ff";
      color14 = "#04d1f9";
      color15 = "#b7bfce";
    };
  };
}
