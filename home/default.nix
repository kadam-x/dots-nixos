{ pkgs, ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/kitty.nix
    ./modules/starship.nix
    ./modules/waybar.nix
    ./modules/workstyle.nix
    ./modules/tmux.nix
    ./modules/nvim/default.nix
    ./modules/sway.nix
    ./modules/rofi.nix
    ./modules/theme.nix
    ./modules/qutebrowser.nix
  ];

  home.username = "kadam-x";
  home.homeDirectory = "/home/kadam-x";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
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
    librewolf
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
