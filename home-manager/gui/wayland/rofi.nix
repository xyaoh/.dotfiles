{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    font = "JetBrainsMono Nerd Font Mono 10";
    theme = "iggy";
    # TODO settings
  };
}
