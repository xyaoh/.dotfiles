# man home.configuration.nix
# offline -> home-manager build --option substitute false
#            home-manager build --option fallback true
{ config, pkgs, nix-colors, ... }:

{
  # --- Home-Manager ---
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";

  # --- Host ---
  home.username = "xyaohfu";
  home.homeDirectory = "/home/xyaohfu";

  # --- Session ---
  home.sessionVariables = {
    EDITOR = "nvim";
    TERM = "kitty";
  };

  # --- Colors ---
  colorScheme = {
    name = "gruvbox-material-medium-dark";
    palette = {
      base00 = "141617"; # bgdim
      base01 = "1d2021"; # bg0
      base02 = "282828"; # bg1
      base03 = "3c3836"; # bg2
      base04 = "504945"; # bg3
      base05 = "442e2d"; # bgred
      base06 = "473c29"; # bgyellow
      base07 = "2e3b3b"; # bgblue
      base08 = "ddc7a1"; # fg0
      base09 = "ea6962"; # red
      base0A = "e78a4e"; # orange
      base0B = "d8a657"; # yellow
      base0C = "a9b665"; # green
      base0D = "89b482"; # cyan
      base0E = "7daea3"; # blue
      base0F = "d3869b"; # purple
    };
  };

  # --- Features ---
  imports = [
    nix-colors.homeManagerModules.default
    ../tui
    ../gui
  ];
}
