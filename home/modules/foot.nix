{ ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Monospace:size=16";
        shell = "zsh";
        pad = "6x6";
      };
      colors-dark = {
        alpha = "0.97";
        background = "141415";
        foreground = "cdcdcd";
        regular0 = "141415";
        regular1 = "d8647e";
        regular2 = "7fa563";
        regular3 = "e8b589";
        regular4 = "7e98e8";
        regular5 = "bb9dbd";
        regular6 = "b4d4cf";
        regular7 = "cdcdcd";
        bright0 = "252530";
        bright1 = "d8647e";
        bright2 = "7fa563";
        bright3 = "f3be7c";
        bright4 = "6e94b2";
        bright5 = "c3c3d5";
        bright6 = "9bb4bc";
        bright7 = "cdcdcd";
      };
      cursor = {
        blink = "no";
      };
    };
  };
}
