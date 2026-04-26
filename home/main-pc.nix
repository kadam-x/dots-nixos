{ pkgs, ... }:
{
  imports = [
    ./modules/sway.nix
    ./modules/nvim/default.nix
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/tmux.nix
    ./modules/tofi.nix
    ./modules/yazi.nix
    ./modules/foot.nix
    ./modules/waybar.nix
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

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    gtk4.theme = null;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  home.packages = with pkgs; [
    wget
    git
    tofi
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
    nodejs_24
    bun
    mpv
    opencode
    swayimg
    uv
    eza
    unzip
    lazygit
    hyprpicker
    wiremix
    qbittorrent
    obs-studio
    libnotify
    swww
  ];
}
