{ pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  # noctalia shell
  nix.settings = {
  extra-substituters = [ "https://noctalia.cachix.org" ];
  extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.loader.systemd-boot.configurationLimit = 3;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  services.displayManager.ly.enable = true;
  networking.hostName = "main-pc";
  networking.networkmanager.enable = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 3d";
  };
  time.timeZone = "Europe/Budapest";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.resolved = {
    enable = true;
    settings.Resolve.DNSSEC = "false";
  };
  networking.enableIPv6 = false;
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
  virtualisation.docker.enable = true;
  users.users.kadam-x = {
    isNormalUser = true;
    description = "kadam";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
  };
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  programs.sway.enable = true;
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.ssh.startAgent = true;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
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
    wl-clipboard
    cliphist
  ];
  system.stateVersion = "25.11";
}
