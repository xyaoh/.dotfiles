{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # /* start discord once without override every flake update */
    # discord
    (discord.override { withOpenASAR = true; withVencord = true; })
    brave
  ];
}
