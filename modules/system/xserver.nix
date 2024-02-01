{ pkgs, ... }: 
{
    services.xserver = {
        enable = true;
        layout = "pl";
        displayManager = {
            sddm.enable = true;
            defaultSession = "hyprland";
        };
        libinput = {
            enable = true;
        };
    };

  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}