{ config, pkgs, nixvim, ... }:

{
  home.packages = [
    nixvim.packages.${pkgs.system}.default 
  ];
}
