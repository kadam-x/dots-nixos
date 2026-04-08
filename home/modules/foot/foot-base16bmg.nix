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
        alpha = "0.95";
        background = "000000";
        foreground = "c1c1c1";
        selection-background = "9b8d7f";
        selection-foreground = "1e1e1e";
        regular0 = "121212";
        regular1 = "912222";
        regular2 = "9b8d7f";
        regular3 = "8c7f70";
        regular4 = "888888";
        regular5 = "999999";
        regular6 = "aaaaaa";
        regular7 = "c1c1c1";
        bright0 = "333333";
        bright1 = "5f8787";
        bright2 = "9b8d7f";
        bright3 = "8c7f70";
        bright4 = "888888";
        bright5 = "999999";
        bright6 = "aaaaaa";
        bright7 = "999999";
      };
      cursor = {
        blink = "no";
      };
    };
  };
}
