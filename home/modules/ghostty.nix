{ ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "Monospace";
      font-size = 16;
      confirm-close-surface = false;
      shell-integration-features = "no-cursor";
      shell-integration = "zsh";
      window-padding-x = 6;
      window-padding-y = 6;
      cursor-style = "block";
      cursor-style-blink = "false";
      background-opacity = 0.95;
      background = "0D1116";
      foreground = "ffffff";
      selection-background = "987afb";
      selection-foreground = "0D1116";

      palette = [
        "0=#141b22"
        "1=#f16c75"
        "2=#37f499"
        "3=#f1fc79"
        "4=#987afb"
        "5=#fca6ff"
        "6=#04d1f9"
        "7=#ffffff"
        "8=#232e3b"
        "9=#f16c75"
        "10=#37f499"
        "11=#f1fc79"
        "12=#987afb"
        "13=#fca6ff"
        "14=#04d1f9"
        "15=#b7bfce"
      ];
    };
  };
}
