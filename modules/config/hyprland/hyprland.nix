{ inputs, pkgs, ...}: 
{
    home ={
        packages = let
            nixpkgs-wayland = inputs.nixpkgs-wayland.packages.${pkgs.system};
        in with pkgs; [
            nixpkgs-wayland.swww
            rofi-wayland
            glib
            wayland
            direnv
            xdg-desktop-portal-hyprland
        ];
    };

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    systemd.enable = true;
  };
}