{ pkgs, ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/kitty.nix
    ./modules/nvim/default.nix
    ./modules/tmux.nix
    ./modules/sway.nix
    ./modules/waybar.nix
    ./modules/rofi.nix
    ./modules/theme.nix
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
    wl-clipboard
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
    unzip
    swaybg
    uv
    eza
    sioyek
  ];
}
