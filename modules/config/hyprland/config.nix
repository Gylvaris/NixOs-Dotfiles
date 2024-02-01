{ ... }:
let
    color = (import ../../variables/colors.nix);
    window_manager = (import ../../variables/window_manager.nix);
in
{
    wayland.windowManager.hyprland = {
        extraConfig = "
            $mainMod = SUPER
            $terminal = kitty
            $fileManager = dolphin
            $menu = rofi -show drun -show-icons
            $editor = code
            $browser = firefox

            monitor=,1920x1080@120,0x0,1

        # Execute your favorite apps at launch

        exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP # for XDPH
        exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP # for XDPH
        exec-once = dbus-update-activation-environment --systemd --all # for XDPH
        exec-once = nm-applet --indicator &
        exec-once = waybar &
        exec-once = dunst
        exec-once = waypaper

        input {
            kb_layout = pl
            follow_mouse = 1

            touchpad {
                natural_scroll = no
            }
            sensitivity = 0
            force_no_accel = 1
        }

        device:epic-mouse-v1 {
            sensitivity = -0.5
        }

        misc {
            force_default_wallpaper = -1 # Set to 0 to disable the anime mascot wallpapers
            vrr = 0
            swallow_regex = ^(kitty)$
            no_direct_scanout = true
            enable_swallow = true
            mouse_move_enables_dpms = true
            disable_splash_rendering = true
            disable_hyprland_logo = true
        }

        general {
            sensitivity = 1.00
            apply_sens_to_raw = 1
            gaps_in = 3
            gaps_out = 8
            border_size = 0
            col.active_border = rgba(bb9af7ff) rgba(b4f9f8ff) 45deg
            col.inactive_border = rgba(565f89cc) rgba(9aa5cecc) 45deg

            layout = dwindle

            allow_tearing = false

            border_part_of_window = false
        }

        xwayland {
            force_zero_scaling = true
        }

        dwindle {
            pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = yes # you probably want this
        }

        master {
            new_is_master = true
            new_on_top = 1
            mfact = 0.5
        } 

        decoration {

            rounding = 12
            fullscreen_opacity = 1.0
            inactive_opacity = 0.85
            active_opacity = 1.0

            dim_inactive = true
            dim_strength = 0.1
    
            blur {
                enabled = yes
                size = 7
                passes = 3
                new_optimizations = on
                ignore_opacity = on
                xray = true
            }

            drop_shadow = yes
            shadow_range = 6
            shadow_render_power = 1
            col.shadow = rgba(1a1a1aee)
            col.shadow_inactive = 0x50000000

            #layerrule = blur,waybar
        }


        animations {
            enabled = yes
            bezier = wind, 0.05, 0.9, 0.1, 1.05
            bezier = winIn, 0.1, 1.1, 0.1, 1.1
            bezier = winOut, 0.3, -0.3, 0, 1
            bezier = liner, 1, 1, 1, 1
            animation = windows, 1, 6, wind, slide
            animation = windowsIn, 1, 6, winIn, slide
            animation = windowsOut, 1, 5, winOut, slide
            animation = windowsMove, 1, 5, wind, slide
            animation = border, 1, 1, liner
            animation = borderangle, 1, 30, liner, loop
            animation = fade, 1, 10, default
            animation = workspaces, 1, 5, wind
        }


      # ----------------------------------------------------------------
      
    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        bind = $mainMod, backspace, exec, $terminal
        bind = $mainMod, Q, killactive, 
        bind = $mainMod, M, exit, 
        bind = $mainMod, E, exec, $fileManager
        bind = $mainMod, V, togglefloating,
        bindr = $mainMod, $mainMod_L, exec, $menu
        bind = $mainMod, P, pseudo, # dwindle
        bind = $mainMod, J, togglesplit, # dwindle
        bind = $mainMod, ESCAPE, exec, killall waybar || waybar
        bind = $mainMod, C, exec, $editor
        bind = $mainMod, F, exec, $browser

    # Move focus with mainMod + arrow keys
        bind = $mainMod, left, movefocus, l
        bind = $mainMod, right, movefocus, r
        bind = $mainMod, up, movefocus, u
        bind = $mainMod, down, movefocus, d

    # Switch workspaces with mainMod + [0-9]
        bind = $mainMod, 1, workspace, 1
        bind = $mainMod, 2, workspace, 2
        bind = $mainMod, 3, workspace, 3
        bind = $mainMod, 4, workspace, 4
        bind = $mainMod, 5, workspace, 5
        bind = $mainMod, 6, workspace, 6
        bind = $mainMod, 7, workspace, 7
        bind = $mainMod, 8, workspace, 8
        bind = $mainMod, 9, workspace, 9
        bind = $mainMod, 0, workspace, 10

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
        bind = $mainMod SHIFT, 1, movetoworkspace, 1
        bind = $mainMod SHIFT, 2, movetoworkspace, 2
        bind = $mainMod SHIFT, 3, movetoworkspace, 3
        bind = $mainMod SHIFT, 4, movetoworkspace, 4
        bind = $mainMod SHIFT, 5, movetoworkspace, 5
        bind = $mainMod SHIFT, 6, movetoworkspace, 6
        bind = $mainMod SHIFT, 7, movetoworkspace, 7
        bind = $mainMod SHIFT, 8, movetoworkspace, 8
        bind = $mainMod SHIFT, 9, movetoworkspace, 9
        bind = $mainMod SHIFT, 0, movetoworkspace, 10

    # Example special workspace (scratchpad)
        #bind = $mainMod, S, togglespecialworkspace, magic
        #bind = $mainMod SHIFT, S, movetoworkspace, special:magic

    # Scroll through existing workspaces with mainMod + scroll
        bind = $mainMod, mouse_down, workspace, e+1
        bind = $mainMod, mouse_up, workspace, e-1

    # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = $mainMod, mouse:272, movewindow
        bindm = $mainMod, mouse:273, resizewindow

    # flameshot
        bind = $mainMod SHIFT, S, exec, flameshot gui
      
    # windowrule

        windowrulev2 = nomaximizerequest, class:.* # You'll probably like this.
        windowrulev2 = opacity 0.90 0.90,class:^(firefox)$
        windowrulev2 = opacity 0.80 0.80,class:^(Steam)$
        windowrulev2 = opacity 0.80 0.80,class:^(steam)$
        windowrulev2 = opacity 0.80 0.80,class:^(steamwebhelper)$
        windowrulev2 = opacity 0.80 0.80,class:^(Spotify)$
        windowrulev2 = opacity 0.80 0.80,class:^(Code)$
        windowrulev2 = opacity 0.80 0.80,class:^(code-url-handler)$
        windowrulev2 = opacity 0.80 0.80,class:^(kitty)$
        windowrulev2 = opacity 0.80 0.80,class:^(org.kde.dolphin)$
        windowrulev2 = opacity 0.80 0.80,class:^(nwg-look)$
        windowrulev2 = opacity 0.80 0.80,class:^(qt5ct)$
        windowrulev2 = opacity 0.80 0.80,class:^(discord)$ #Discord-Electron
        windowrulev2 = opacity 0.80 0.80,class:^(net.davidotek.pupgui2)$ #ProtonUp-Qt
        windowrulev2 = opacity 0.80 0.70,class:^(pavucontrol)$
        windowrulev2 = opacity 0.80 0.70,class:^(nm-applet)$
        windowrulev2 = opacity 0.80 0.70,class:^(nm-connection-editor)$
        windowrulev2 = opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$

        windowrulev2 = float,class:^(qt5ct)$
        windowrulev2 = float,class:^(nwg-look)$
        windowrulev2 = float,class:^(net.davidotek.pupgui2)$ #ProtonUp-Qt
        windowrulev2 = float,class:^(pavucontrol)$
        windowrulev2 = float,class:^(nm-applet)$
        windowrulev2 = float,class:^(nm-connection-editor)$
        windowrulev2 = float,class:^(org.kde.polkit-kde-authentication-agent-1)$

        # xwaylandvideobridge
        windowrulev2 = opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$
        windowrulev2 = noanim,class:^(xwaylandvideobridge)$
        windowrulev2 = nofocus,class:^(xwaylandvideobridge)$
        windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$
    ";
  };
}