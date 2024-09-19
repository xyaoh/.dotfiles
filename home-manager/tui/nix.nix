{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = _:true;

  nix = {
    package = pkgs.nix;
    settings = {
      warn-dirty = false;
      experimental-features = "nix-command flakes";
    };
  };
}
