{ config, pkgs, ... }:

{
  imports = [
    ./rules.nix
    ./keybinds.nix
    ./execonce.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.variables = [ "--all" ];
    settings = {
      monitor = [
        "eDP-1, 2880x1800@90, 0x0, 2.00"
      ];
      env = [
        "SDL_VIDEODRIVER,wayland"
        "CLUTTER_BACKEND,wayland"
        "GDK_BACKEND,wayland,x11"

        "XDG_SESSION_TYPE,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"

        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"

        "HYPRCURSOR_THEME,hypr_Bibata-Modern-Ice"
        "HYPRCURSOR_SIZE,16"
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,16"

        "LIBSEAT_BACKEND,logind"
      ];
      input = {
        kb_model = "";
        kb_layout = "us";
        kb_variant = "";
        kb_options = "ctrl:nocaps";
        repeat_rate = 25;
        repeat_delay = 600;

        follow_mouse = 0;
        float_switch_override_focus = 0;

        sensitivity = 0.4;
        accel_profile = "adaptive";

        natural_scroll = true;
        scroll_method = "2fg";

        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
          scroll_factor = 1.0;
          tap-to-click = true;
          drag_lock = true;
        };
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = true;
        workspace_swipe_distance = 250;
        workspace_swipe_cancel_ratio = 0.3;
        workspace_swipe_create_new = true;
        workspace_swipe_forever = false;
      };
      master = {
        orientation = "left";
        mfact = 0.55;
        allow_small_split = false;
        special_scale_factor = 0.9;
        new_status = "slave";
        new_on_top = false;
      };
      general = with config.colorScheme.palette; {
        layout = "master";
        no_focus_fallback = true;

        gaps_in = 0;
        gaps_out = 0;
        gaps_workspaces = -36;

        border_size = 1;
        no_border_on_floating = false;
        resize_on_border = true;
        extend_border_grab_area = 20;
        hover_icon_on_border = true;
        "col.active_border" = "rgba(${base01}ff) rgba(${base08}ff) rgba(${base01}ff)";
        "col.inactive_border" = "rgba(${base01}ff)";
      };
      cursor = {
        no_warps = true;
        inactive_timeout = 30;
      };
      decoration = with config.colorScheme.palette; {
        rounding = 0;

        active_opacity = 1;
        inactive_opacity = 1;
        fullscreen_opacity = 1;

        dim_inactive = false;
        dim_strength = 0.0;
        dim_special = 0.0;
        dim_around = 0.0;

        blur = {
          enabled = false;
          size = 3;
          passes = 5;
          vibrancy = 1;
        };

        shadow = {
          enabled = false;
          range = 2;
          render_power = 3;
          ignore_window = true;
          scale = 1.0;
          color = "rgba(${base01}ff)";
          offset = "0 0";
        };
      };
      animations = {
        enabled = true;
        bezier = [
          "linear, 0, 0, 0, 0"
          "smooth, 0.37, 0, 0.63, 1"
        ];
        animation = [
          "workspaces, 1, 2, smooth, slide"
          "specialWorkspace, 1, 2, smooth, slide"
          "windows, 1, 2, smooth, popin"
          "fade, 0"
          "borderangle, 1, 250, linear, loop"
        ];
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;

        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;

        enable_swallow = true;
        swallow_regex = "^(Kitty)$";
      };
    };
  };
}
