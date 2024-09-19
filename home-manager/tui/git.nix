{ config, pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
      package = pkgs.git;
      userEmail = "grangeanthony@pm.me";
      userName = "xyaoh";
    };

    lazygit = {
      enable = true;
      package = pkgs.lazygit;
    };

    gh = {
      enable = true;
      package = pkgs.gh;
    };
  };
}
