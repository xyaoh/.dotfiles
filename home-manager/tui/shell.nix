{ config, pkgs, ... }:

{
  programs = {
    bash = {
      enable = true;
    };

    eza = {
      enable = true;
      package = pkgs.eza;
    };
    zoxide = {
      enable = true;
      package = pkgs.zoxide;
    };
    bat = {
      enable = true;
      package = pkgs.bat;
    };
  };

  home.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";

    ls = "eza";
    lt = "eza --tree --level=2";
    ll = "eza -l";
    cd = "z";
    cat = "bat -p";
  };
}
