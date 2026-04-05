{ pkgs, ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/nvim/default.nix
    ./modules/tmux.nix
    ./modules/niri.nix
    ./modules/qutebrowser.nix
    ./modules/yazi.nix
    ./modules/foot.nix
  ];
  programs.noctalia-shell = {
    enable = true;
    settings = ./modules/noctalia-settings.json;
  };
  home.pointerCursor = {
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
    size = 24;
    gtk.enable = true;
  };

  home.username = "kadam-x";
  home.homeDirectory = "/home/kadam-x";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    wget
    git
    qutebrowser
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
    eza
    unzip
    lazygit
    swayidle
  ];
}
