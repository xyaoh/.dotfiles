{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dbus-update-activation-environment --systemd --all"
      "hypridle"
      "eww daemon && eww open statusbar"
      "nice -n 19 kitty +kitten panel --edge=background pipes-rs -k 'curved' -d 30 -t 0.05 -r 0.2"
    ];
  };
}
