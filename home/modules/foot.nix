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
        alpha = "0.96";
        background = "0D1116";
        foreground = "e6d29e";
        selection-background = "e6d29e";
        selection-foreground = "0D1116";
        regular0 = "1d2021";
        regular1 = "f75a5a";
        regular2 = "98bb6c";
        regular3 = "e9c46a";
        regular4 = "719cd6";
        regular5 = "c58cff";
        regular6 = "72d5c8";
        regular7 = "c9b89b";
        bright0 = "474747";
        bright1 = "ff7a7a";
        bright2 = "b8d49c";
        bright3 = "f0d090";
        bright4 = "9dbde8";
        bright5 = "d9aaff";
        bright6 = "96e5da";
        bright7 = "e6d29e";
      };
      cursor = {
        blink = "no";
      };
    };
  };
}
