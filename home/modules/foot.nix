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
        background = "080808";
        foreground = "bdbdbd";
        selection-background = "b2ceee";
        selection-foreground = "080808";
        regular0 = "373c40";
        regular1 = "ff5454";
        regular2 = "8cc85f";
        regular3 = "e3c78a";
        regular4 = "80a0ff";
        regular5 = "ce76e8";
        regular6 = "7ee0ce";
        regular7 = "de935f";
        bright0 = "f09479";
        bright1 = "fe3b7b";
        bright2 = "42cf89";
        bright3 = "cfcfb0";
        bright4 = "78c2ff";
        bright5 = "ae81ff";
        bright6 = "85dc85";
        bright7 = "e2637f";
      };
      cursor = {
        blink = "no";
      };
    };
  };
}
