{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprlock
  ];

  home.file = {
    "${config.xdg.configHome}/hypr/hyprlock.conf".source = ./scripts/hyprlock.conf;
  };
}
