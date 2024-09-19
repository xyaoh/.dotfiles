# man configuration.nix
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # --- Flakes ---
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # --- Bootloader ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 1;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.systemd-boot.editor = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.consoleLogLevel = 0;
  boot.kernelParams = [ "quiet" "rd.udev.log_level=3" "udev.log_priority=3" ];

  # --- Networking ---
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # --- Audio ---
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # --- Time zone ---
  time.timeZone = "America/Montreal";

  # --- Internationalisation properties ---
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

  # --- TTY ---
  console = {
    enable = true;
    earlySetup = true;
    keyMap = "us";
  };

  # --- Keymap ---
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # --- Users ---
  users.users.xyaohfu = {
    isNormalUser = true;
    description = "Anthony GRANGE";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    packages = with pkgs; [];
  };

  # --- Packages ---
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    brightnessctl
    pulseaudio
    pulsemixer
    wget
    git
    neovim
    home-manager
    gcc
    rustup
  ];

  # --- WindowManager ---
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  hardware.graphics.enable = true;
  # hint electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  # --- Steam ---
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # --- Nixos ---
  system.stateVersion = "23.05"; # Did you read the comment?
}
