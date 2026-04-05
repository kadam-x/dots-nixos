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
        alpha = "0.75";
        background = "0D1116";
        foreground = "ffffff";
        selection-background = "987afb";
        selection-foreground = "0D1116";
        regular0 = "141b22"; # black
        regular1 = "f16c75"; # red
        regular2 = "37f499"; # green
        regular3 = "f1fc79"; # yellow
        regular4 = "987afb"; # blue → purple
        regular5 = "fca6ff"; # magenta → pink
        regular6 = "04d1f9"; # cyan
        regular7 = "ffffff"; # white
        bright0 = "232e3b"; # bright black
        bright1 = "f16c75"; # bright red (same, vivid enough)
        bright2 = "37f499"; # bright green
        bright3 = "f1fc79"; # bright yellow
        bright4 = "987afb"; # bright blue
        bright5 = "fca6ff"; # bright magenta
        bright6 = "04d1f9"; # bright cyan
        bright7 = "b7bfce"; # bright white → comment gray
      };
      cursor = {
        blink = "no";
      };
    };
  };
}
