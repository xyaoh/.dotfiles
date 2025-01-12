{ config, pkgs, ... }:

{
   wayland.windowManager.hyprland.settings = {
     windowrulev2 = [
       # 'no gaps when only'
       "bordersize 0, floating:0, onworkspace:w[tv1]"
       "bordersize 0, floating:0, onworkspace:f[1]"
     ];

     workspace = [
     ];
   };
}
