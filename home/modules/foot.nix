{ ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Iosevka Nerd Font:size=16";
        shell = "zsh";
        pad = "6x6";
      };
      colors-dark = {
        alpha = "0.92";
        background = "030210";
        foreground = "bdbdbd";
        regular0 = "080808";
        regular1 = "ff5454";
        regular2 = "8cc85f";
        regular3 = "e3c78a";
        regular4 = "80a0ff";
        regular5 = "cf87e8";
        regular6 = "79dac8";
        regular7 = "bdbdbd";
        bright0 = "323437";
        bright1 = "ff5454";
        bright2 = "8cc85f";
        bright3 = "e3c78a";
        bright4 = "80a0ff";
        bright5 = "cf87e8";
        bright6 = "79dac8";
        bright7 = "c6c6c6";
      };
      cursor = {
        blink = "no";
      };
    };
  };
}
