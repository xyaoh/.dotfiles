{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Rythm Doctor
      "windowdance,title:^(Rhythm Doctor)$"
      "forceinput,title:^(Rhythm Doctor)$"
    ];
  };
}
