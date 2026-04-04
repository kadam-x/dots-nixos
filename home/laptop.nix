{ pkgs, ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/nvim/default.nix
    ./modules/tmux.nix
    ./modules/sway-laptop.nix
    ./modules/qutebrowser.nix
    ./modules/workstyle.nix
    ./modules/yazi.nix
    ./modules/foot.nix
  ];
  programs.noctalia-shell = {
    enable = true;
    settings = ./modules/noctalia-settings-laptop.json;
  };

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
    swayimg
    uv
    eza
    lazygit
    swayidle
  ];
}
