{ pkgs, ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/starship-tokyoporn.nix
    # ./modules/starship-base16bmg.nix
    ./modules/waybar.nix
    ./modules/workstyle.nix
    ./modules/nvim/default.nix
    ./modules/tmux.nix
    ./modules/sway.nix
    ./modules/rofi.nix
    ./modules/qutebrowser.nix
    ./modules/yazi.nix
    ./modules/foot-tokyoporn.nix
    # ./modules/foot-base16bmg.nix
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
    swayimg
    uv
    sioyek
    eza
    unzip
    lazygit
    swww
  ];
}
