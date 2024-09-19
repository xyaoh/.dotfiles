{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    xdg-utils
  ];

  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/downloads";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pictures";
      publicShare = "${config.home.homeDirectory}/public";
      templates = "${config.home.homeDirectory}/templates";
      videos = "${config.home.homeDirectory}/videos";
      extraConfig = {
        WORKSPACE_DIR = "${config.home.homeDirectory}/workspace";
      };
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [ "org.pwmt.zathura.desktop" ];

        "x-scheme-hander/https" = [ "firefox.desktop" ];
        "x-scheme-hander/http" = [ "firefox.desktop" ];
        "x-scheme-hander/about" = [ "firefox.desktop" ];
        "text/html" = [ "firefox.desktop" ];
        "text/xml" = [ "firefox.desktop" ];
      };
    };
  };
}
