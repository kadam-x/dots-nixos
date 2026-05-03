{ pkgs, ... }:
{
  imports = [
    # ./modules/sway.nix
    # ./modules/nvim/default.nix
    # ./modules/zsh.nix
    # ./modules/starship.nix
    # ./modules/tmux.nix
    # ./modules/tofi.nix
    # ./modules/yazi.nix
    # ./modules/foot.nix
    # ./modules/waybar.nix
    # ./modules/dunst.nix
  ];
  home.username = "kadamx";
  home.homeDirectory = "/home/kadamx";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
  ];
}
