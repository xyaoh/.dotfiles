{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    libnotify
  ];

  systemd.user.services.notify-battery-low = {
    Unit = {
      Description = "low battery notification service";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.writeShellScriptBin "notify-battery-low"
        (builtins.readFile ./scripts/notify_battery_low.sh)
      }/bin/notify-battery-low";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  systemd.user.timers.notify-battery-low = {
    Unit = {
      Description = "run low battery notification service every few minutes";
      PartOf = [ "graphical-session.target" ];
    };
    Timer = {
      OnBootSec = "5min";
      OnUnitActiveSec = "5min";
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
