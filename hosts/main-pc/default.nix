{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  networking.hostName = "main-pc";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Budapest";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "hu_HU.UTF-8";
    LC_IDENTIFICATION = "hu_HU.UTF-8";
    LC_MEASUREMENT    = "hu_HU.UTF-8";
    LC_MONETARY       = "hu_HU.UTF-8";
    LC_NAME           = "hu_HU.UTF-8";
    LC_NUMERIC        = "hu_HU.UTF-8";
    LC_PAPER          = "hu_HU.UTF-8";
    LC_TELEPHONE      = "hu_HU.UTF-8";
    LC_TIME           = "hu_HU.UTF-8";
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  users.users.kadam-x = {
    isNormalUser = true;
    description  = "kadam";
    extraGroups  = [ "networkmanager" "wheel" ];
    shell        = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.sway.enable   = true;
  programs.waybar.enable = true;
  programs.dconf.enable  = true;
  programs.zsh.enable    = true;   # must be here since it's the login shell

  programs.gnupg.agent = {
    enable          = true;
    enableSSHSupport = true;
  };

  environment.sessionVariables = {
    GTK_THEME               = "Adwaita:dark";
    XCURSOR_THEME           = "Bibata-Modern-Classic";
    XCURSOR_SIZE            = "24";
    NIXOS_OZONE_WL          = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    iosevka
    font-awesome
    noto-fonts
    noto-fonts-color-emoji
  ];

  environment.systemPackages = with pkgs; [
    wget
    git
    bibata-cursors
    gnome-themes-extra
    docker
  ];

  system.stateVersion = "25.11";
}
