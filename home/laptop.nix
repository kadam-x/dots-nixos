{ pkgs, ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/starship/starship-base16bmg.nix
    # ./modules/starship/starship-dreamy.nix
    ./modules/nvim/default.nix
    ./modules/tmux.nix
    ./modules/sway-laptop.nix
    ./modules/waybar/waybar-laptop-base16bmg.nix
    # ./modules/waybar/waybar-laptop-dreamy.nix
    ./modules/tofi.nix
    ./modules/qutebrowser.nix
    ./modules/yazi.nix
    ./modules/foot/foot-base16bmg.nix
    # ./modules/foot/foot-dreamy.nix
  ];

  home.username = "kadam-x";
  home.homeDirectory = "/home/kadam-x";
  home.stateVersion = "25.11";

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
  ];
}
