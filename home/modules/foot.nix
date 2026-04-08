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
        background = "011627";
        foreground = "d6deeb";
        selection-background = "1d3b53";
        selection-foreground = "ffffff";
        regular0 = "011627"; # black
        regular1 = "ef5350"; # red
        regular2 = "22da6e"; # green
        regular3 = "addb67"; # yellow
        regular4 = "82aaff"; # blue
        regular5 = "c792ea"; # magenta
        regular6 = "21c7a8"; # cyan
        regular7 = "ffffff"; # white
        bright0 = "575656"; # bright black
        bright1 = "f78c6c"; # bright red
        bright2 = "ecc48d"; # bright green
        bright3 = "addb67"; # bright yellow
        bright4 = "82aaff"; # bright blue
        bright5 = "c792ea"; # bright magenta
        bright6 = "7fdbca"; # bright cyan
        bright7 = "d6deeb"; # bright white
      };
      cursor = {
        blink = "no";
      };
    };
  };
}
