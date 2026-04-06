{ pkgs, ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/nvim/default.nix
    ./modules/tmux.nix
    ./modules/sway.nix
    ./modules/waybar.nix
    ./modules/rofi.nix
    ./modules/qutebrowser.nix
    ./modules/yazi.nix
    ./modules/foot.nix
  ];

  programs.bash.profileExtra = ''
    if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec startx
    fi
  '';

  home.file.".xinitrc".text = ''
    # Keyboard layout
    setxkbmap -layout us,hu -option grp:win_space_toggle

    # Mouse: flat accel
    xinput set-prop "pointer:$(xinput list --name-only | grep -i mouse | head -1)" \
      "libinput Accel Profile Enabled" 0 1 2>/dev/null || true

    # Wallpaper
    feh --randomize --bg-fill ~/Pictures/wallpapers-Base16BMG/* &

    # Clipboard daemon
    xclip &

    # Notifications
    dunst &

    # Polkit
    /usr/lib/polkit-kde-authentication-agent-1 &

    # qBittorrent
    qbittorrent --no-splash &

    exec oxwm
  '';

  home.username = "kadam-x";
  home.homeDirectory = "/home/kadam-x";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    wget
    git
    rofi
    qutebrowser
    maim
    xclip
    feh
    xdotool
    xorg.xprop
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
    sioyek
    eza
    unzip
    lazygit
  ];
}
