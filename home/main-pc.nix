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
    ./modules/dunst.nix
  ];
  home.username = "kadamx";
  home.homeDirectory = "/home/kadamx";
  home.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    LIBVA_DRIVER_NAME = "radeonsi";
  };
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
    cmake
    dbeaver-bin
    lutgen
    nodejs_24
    bun
    mpv
    swayimg
    uv
    eza
    unzip
    lazygit
    hyprpicker
    wiremix
    libnotify
    swww
    noto-fonts
    noto-fonts-color-emoji
  ];
}
