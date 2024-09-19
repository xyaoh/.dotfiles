{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = {
      env = {
        TERM = "alacritty";
      };
      window = {
        dynamic_title = true;
        title = "Alacritty";
        class = {
          general = "Alacritty";
          instance = "Alacritty";
        };
        dynamic_padding = true;
        padding = {
          x = 0;
          y = 0;
        };
        opacity = 1.0;
      };
      font = {
        size = 9.5;
        normal = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Regular";
        };
        italic = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Italic";
        };
        bold = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Bold";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Bold Italic";
        };
      };
      colors = with config.colorScheme.palette; {
        bright = {
          black = "0x${base00}";
          red = "0x${base09}";
          green = "0x${base0C}";
          yellow = "0x${base0B}";
          blue = "0x${base0E}";
          magenta = "0x${base0F}";
          cyan = "0x${base0D}";
          white = "0x${base08}";
        };
        normal = {
          black = "0x${base00}";
          red = "0x${base09}";
          green = "0x${base0C}";
          yellow = "0x${base0B}";
          blue = "0x${base0E}";
          magenta = "0x${base0F}";
          cyan = "0x${base0D}";
          white = "0x${base08}";
        };
        primary = {
          background = "0x${base01}";
          foreground = "0x${base08}";
        };
      };
    };
  };
}
