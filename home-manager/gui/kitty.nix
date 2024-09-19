{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pipes-rs
  ];

  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    environment = {
      TERM = "kitty";
    };
    settings = {
      # TODO
    };
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 9.5;
    };
    theme = "Gruvbox Material Dark Hard";
  };

}
