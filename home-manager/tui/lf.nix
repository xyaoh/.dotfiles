{ config, pkgs, ... }:

{
  programs.lf = {
    enable = true;
    package = pkgs.lf;
    # TODO settings
  };
}
