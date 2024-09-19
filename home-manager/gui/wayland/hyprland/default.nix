{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprcursor.nix
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk 
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk 
    ];
  };

  programs.bash = {
    profileExtra = builtins.readFile ./scripts/autostart_hyprland.sh;
  };
}
