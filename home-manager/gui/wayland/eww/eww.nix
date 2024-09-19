{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    eww
    # utilities
    jq
    socat
  ];

  home.file = {
    "${config.xdg.configHome}/eww/eww.yuck".source = ./eww.yuck;
    "${config.xdg.configHome}/eww/eww.scss".source = ./eww.scss;
    # scripts dependencies: nmcli(NetworkManager), pactl(PulseAudio) 
    "${config.xdg.configHome}/eww/scripts".source = ./scripts;
    "${config.xdg.configHome}/eww/_colors.scss".text = with config.colorScheme.palette; ''
    $base00: #${base00};
    $base01: #${base01};
    $base02: #${base02};
    $base03: #${base03};
    $base04: #${base04};
    $base05: #${base05};
    $base06: #${base06};
    $base07: #${base07};
    $base08: #${base08};
    $base09: #${base09};
    $base0A: #${base0A};
    $base0B: #${base0B};
    $base0C: #${base0C};
    $base0D: #${base0D};
    $base0E: #${base0E};
    $base0F: #${base0F};
    '';
  };
}
