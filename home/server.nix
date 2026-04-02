{ pkgs, ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/nvim/default.nix
    ./modules/tmux.nix
  ];

  home.username = "kadam-x";
  home.homeDirectory = "/home/kadam-x";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    wget
    git
    yazi
    btop
    ripgrep
    ncdu
    cmake
    jq
    nodejs_24
    bun
    opencode
    unzip
    uv
    eza
    lazygit
  ];
}
