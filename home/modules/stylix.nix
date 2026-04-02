{ pkgs, ... }:
{
  gtk.gtk4.theme = null;
  stylix = {
    enable = true;
    autoEnable = false;

    base16Scheme = {
      base00 = "000000";
      base01 = "121212";
      base02 = "222222";
      base03 = "333333";
      base04 = "999999";
      base05 = "c1c1c1";
      base06 = "d6d2c8";
      base07 = "ffffff";
      base08 = "912222";
      base09 = "aaaaaa";
      base0A = "8c7f70";
      base0B = "9b8d7f";
      base0C = "6f7b68";
      base0D = "888888";
      base0E = "999999";
      base0F = "444444";
    };

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/wallpapers/nix-wallpaper-simple-dark-gray.png";
      sha256 = "sha256-4DeM7jHFa8HnIjGsOiKQtBB/3JHBPEVMXZg7k9bqJ4=";
    };
    polarity = "dark";

    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sizes = {
        terminal = 13;
        applications = 12;
      };
    };

    targets = {
      gtk.enable = true;
      qt.enable = true;
      kitty.enable = false;
      waybar.enable = false;
      qutebrowser.enable = false;
      neovim.enable = false;
      starship.enable = false;
      tmux.enable = false;
    };
  };
}
