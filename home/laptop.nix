{ pkgs, ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/nvim/default.nix
    ./modules/tmux.nix
    ./modules/sway-laptop.nix
    ./modules/tofi.nix
    ./modules/qutebrowser.nix
    ./modules/yazi.nix
    ./modules/foot.nix
    ./modules/dunst.nix
    ./modules/waybar-laptop.nix
  ];
  home.username = "kadam-x";
  home.homeDirectory = "/home/kadam-x";
  home.stateVersion = "25.11";
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  home.packages = with pkgs; [
    wget
    git
    tofi
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
    nodejs_24
    bun
    mpv
    opencode
    unzip
    swayimg
    uv
    eza
    bluetui
    impala
    lazygit
    wifitui
    libnotify
    swww
  ];
}
