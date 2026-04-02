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

      background = "#000000";
      foreground = "#c1c1c1";
      selection_background = "#9b8d7f";
      selection_foreground = "#1e1e1e";
      cursor = "#c1c1c1";
      cursor_text_color = "#000000";
      cursor_opacity = "0.7";
      url_color = "#5f8787";

      color0 = "#121212";
      color1 = "#912222";
      color2 = "#9b8d7f";
      color3 = "#8c7f70";
      color4 = "#888888";
      color5 = "#999999";
      color6 = "#aaaaaa";
      color7 = "#c1c1c1";
      color8 = "#333333";
      color9 = "#5f8787";
      color10 = "#9b8d7f";
      color11 = "#8c7f70";
      color12 = "#888888";
      color13 = "#999999";
      color14 = "#aaaaaa";
      color15 = "#999999";
    };
  };
}
