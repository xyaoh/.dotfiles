{ config, pkgs, ... }:

{
  home.file = {
    "${config.xdg.dataHome}/icons/hypr_Bibata-Modern-Ice".source = ./scripts/hypr_Bibata-Modern-Ice;
  };
}
