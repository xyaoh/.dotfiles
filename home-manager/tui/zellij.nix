{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    package = pkgs.zellij;
    settings = {
      pane_frames = false;

      theme = "gruvbox-material";
      themes = {
        gruvbox-material = with config.colorScheme.palette; {
        fg = "#${base08}";
        bg = "#${base01}";
        black = "#${base01}";
        red = "#${base09}";
        green = "#${base0C}";
        yellow = "#${base0B}";
        blue = "#${base0E}";
        magenta = "#${base0F}";
        cyan = "#${base0D}";
        white = "#${base08}";
        orange = "#${base0A}";
        };
      };
    # TODO settings
    };
  };
}
