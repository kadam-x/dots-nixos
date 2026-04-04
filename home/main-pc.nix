{ pkgs, ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/starship-tokyoporn.nix
    # ./modules/starship-base16bmg.nix
    ./modules/workstyle.nix
    ./modules/nvim/default.nix
    ./modules/tmux.nix
    ./modules/sway.nix
    ./modules/qutebrowser.nix
    ./modules/yazi.nix
    ./modules/foot-tokyoporn.nix
    # ./modules/foot-base16bmg.nix
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = ./modules/noctalia-settings.json;
  };

  home.username = "kadam-x";
  home.homeDirectory = "/home/kadam-x";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    wget
    git
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
    eza
    unzip
    lazygit
    swayidle
  ];
}
