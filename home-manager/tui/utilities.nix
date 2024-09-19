{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zip
    unzip

    bottom # system monitor
    mdbook # create book from markdown
    fzf # fuzzy finder

    ripgrep # grep
    fd # find
    procs # ps
    dust # du
  ];

  # gamma
  services.wlsunset = {
    enable = true;
    package = pkgs.wlsunset;
    sunrise = "06:00";
    sunset = "18:00";
    temperature = {
      day = 6500;
      night = 4500;
    };
  };

  # spotify
  programs.ncspot = {
    enable = true;
    package = pkgs.ncspot;
  };

  home.shellAliases = {
    "spotify" = "ncspot";
  };
}
