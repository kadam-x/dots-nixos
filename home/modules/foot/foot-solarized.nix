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
        background = "052a36";
        foreground = "839496";
        selection-background = "073642";
        selection-foreground = "93a1a1";
        regular0 = "073642"; # black   (base02)
        regular1 = "dc322f"; # red
        regular2 = "859900"; # green
        regular3 = "b58900"; # yellow
        regular4 = "268bd2"; # blue
        regular5 = "d33682"; # magenta
        regular6 = "2aa198"; # cyan
        regular7 = "eee8d5"; # white   (base2)
        bright0 = "002b36"; # black   (base03)
        bright1 = "cb4b16"; # red     (orange)
        bright2 = "586e75"; # green   (base01)
        bright3 = "657b83"; # yellow  (base00)
        bright4 = "839496"; # blue    (base0)
        bright5 = "6c71c4"; # magenta (violet)
        bright6 = "93a1a1"; # cyan    (base1)
        bright7 = "fdf6e3"; # white   (base3)
      };
      cursor = {
        blink = "no";
      };
    };
  };
}
