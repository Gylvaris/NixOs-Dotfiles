{ pkgs, ...}:
{
    boot = {
        loader = {
            systemd-boot = {
                enable = true;
        };
        efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = ["nvidia-drm.modeset=1"];
  };
}