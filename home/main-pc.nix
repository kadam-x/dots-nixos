{ pkgs, ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/kitty.nix
    ./modules/waybar.nix
    ./modules/workstyle.nix
    ./modules/nvim/default.nix
    ./modules/tmux.nix
    ./modules/sway.nix
    ./modules/rofi.nix
    ./modules/stylix.nix
    ./modules/qutebrowser.nix
  ];

  home.username = "kadam-x";
  home.homeDirectory = "/home/kadam-x";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    wget
    git
    rofi
    qutebrowser
    kitty
    slurp
    grim
    yazi
    workstyle
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
    swaybg
    uv
    sioyek
    eza
    unzip
  ];
}
