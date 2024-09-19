{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [
      # exit hyprland with no questions asked
      "$mod, Delete, exit"
      # workspaces
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod CONTROL_L, 1, movetoworkspacesilent, 1"
      "$mod CONTROL_L, 0, movetoworkspacesilent, 2"
      "$mod CONTROL_L, 3, movetoworkspacesilent, 3"
      "$mod CONTROL_L, 4, movetoworkspacesilent, 4"
      "$mod CONTROL_L, 5, movetoworkspacesilent, 5"
      "$mod CONTROL_L, 6, movetoworkspacesilent, 6"
      "$mod CONTROL_L, 7, movetoworkspacesilent, 7"
      "$mod CONTROL_L, 8, movetoworkspacesilent, 8"
      "$mod CONTROL_L, 9, movetoworkspacesilent, 9"
      # special workspaces
      "$mod, 0, togglespecialworkspace, scratchpad"
      "$mod , minus, movetoworkspacesilent, special:scratchpad"
      "$mod , equal, movetoworkspacesilent, e+0" # drop from special to underlying workspace
      # windows
      "$mod, L, cyclenext,"
      "$mod, H, cyclenext, prev"
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      "$mod SHIFT, L, swapnext,"
      "$mod SHIFT, H, swapnext, prev"
      "$mod SHIFT, left, movewindow, l"
      "$mod SHIFT, right, movewindow, r"
      "$mod SHIFT, up, movewindow, u"
      "$mod SHIFT, down, movewindow, d"
      "$mod, C, killactive"
      "$mod, F, togglefloating"
      # lock
      "$mod, space, exec, loginctl lock-session"
      # screenshot
      ''$mod, Y, exec, grim -g "$(slurp -d)" - | wl-copy''
      # apps
      "$mod, return, exec, $TERM"
      "$mod, R, exec, rofi -show drun -show-icons"
    ];
    bindm = [
      # windows mouse
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
    bindl = [
      # media keys
      ", xf86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
      ", xf86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"
      "SHIFT, xf86MonBrightnessDown, exec,brightnessctl -d tpacpi::kbd_backlight set 1-"
      "SHIFT, xf86MonBrightnessUp, exec,brightnessctl -d tpacpi::kbd_backlight set +1"
      ", xf86Favorites, exec,brightnessctl -d tpacpi::power set 0"
    ];
    bindel = [
      # media keys
      ", xf86MonBrightnessDown, exec,brightnessctl set 10-%"
      ", xf86MonBrightnessUp, exec,brightnessctl set +10%"
      ", xf86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
      ", xf86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
    ];
  };
}
