{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    package = pkgs.mako;

    defaultTimeout = 20000;
    anchor = "top-right";
    width = 350;
    height = 75;
    margin = "5";
    padding = "5,10";
    borderSize = 1;
    icons = false;

    font = "JetBrainsMono Nerd Font Mono 9.5";
    textColor = "#${config.colorScheme.palette.base08}";
    backgroundColor = "#${config.colorScheme.palette.base00}";
    borderColor = "#${config.colorScheme.palette.base01}";
    progressColor = "#${config.colorScheme.palette.base01}";

    extraConfig = ''
      text-alignment=center
      [urgency=low]
      border-color=#${config.colorScheme.palette.base0E}
      [urgency=normal]
      border-color=#${config.colorScheme.palette.base0B}
      [urgency=critical]
      border-color=#${config.colorScheme.palette.base09}
      default-timeout=0
    '';
  };
}
