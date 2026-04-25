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
        alpha = "0.95";
        background = "0D1116";
        foreground = "ffffff";
        selection-background = "987afb";
        selection-foreground = "0D1116";
        regular0 = "141b22"; 
        regular1 = "f16c75"; 
        regular2 = "37f499"; 
        regular3 = "f1fc79"; 
        regular4 = "987afb"; 
        regular5 = "fca6ff"; 
        regular6 = "04d1f9"; 
        regular7 = "ffffff"; 
        bright0 = "232e3b"; 
        bright1 = "f16c75"; 
        bright2 = "37f499"; 
        bright3 = "f1fc79"; 
        bright4 = "987afb"; 
        bright5 = "fca6ff"; 
        bright6 = "04d1f9"; 
        bright7 = "b7bfce"; 
      };
      cursor = {
        blink = "no";
      };
    };
  };
}
