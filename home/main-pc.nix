{ pkgs, ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/waybar.nix
    ./modules/nvim/default.nix
    ./modules/tmux.nix
    ./modules/sway.nix
    ./modules/rofi.nix
    ./modules/qutebrowser.nix
    ./modules/yazi.nix
    ./modules/foot.nix
  ];
  home.username = "kadam-x";
  home.homeDirectory = "/home/kadam-x";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    wget
    git
    rofi
    qutebrowser
    slurp
    grim
    yazi
    btop
    ripgrep
    ncdu
    pulsemixer
    brave
    cmake
    dbeaver-bin
    vlc
    gimp
    telegram-desktop
    obsidian
    lutgen
    jq
    nodejs_24
    bun
    mpv
    opencode
    swayimg
    uv
    sioyek
    eza
    unzip
    lazygit
  ];
}
