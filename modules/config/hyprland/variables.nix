{ ... }:
{
    # █▀▀ █▄░█ █░█
    # ██▄ █░▀█ ▀▄▀
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "1";
    DISABLE_QT5_COMPAT = "0";
    GDK_BACKEND = "wayland";
    ANKI_WAYLAND = "1";
    DIRENV_LOG_FORMAT = "";
    WLR_DRM_NO_ATOMIC = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "kvantum";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    XDG_SESSION_DESKTOP = "Hyprland";
    QT_QPA_PLATFORM = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";

    # env nvidia
    NVD_BACKEND = "direct";

    #env = __VK_LAYER_NV_optimus,NVIDIA_only
    __NV_PRIME_RENDER_OFFLOAD = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";

    # firefox

    MOZ_DISABLE_RDD_SANDBOX = "1";
    EGL_PLATFORM = "wayland";
    # vulkan
    #env = WLR_RENDERER,vulkan

    GTK_THEME = "Catppuccin-Mocha-Compact-Lavender-Dark";
  };
}