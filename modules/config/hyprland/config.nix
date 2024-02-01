{ ... }:
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
        exec-once = hyprctl setcursor Nordzy-cursors 22 &
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
            disable_autoreload = true
        }

      general {
        layout = dwindle

        gaps_in = 5
        gaps_out = 10
        border_size = 2
        col.active_border = rgb(cba6f7) rgb(94e2d5) 45deg
        col.inactive_border = 0x00000000
        border_part_of_window = false
      }

        xwayland {
            force_zero_scaling = true
        }

      dwindle {
        no_gaps_when_only = false
        force_split = 0
        special_scale_factor = 1.0
        split_width_multiplier = 1.0
        use_active_for_splits = true
        pseudotile = yes
        preserve_split = yes
      }

      master {
        new_is_master = true
        special_scale_factor = 1
        no_gaps_when_only = false
      }

      decoration {
        rounding = 12
        
        active_opacity = 0.90;
        inactive_opacity = 0.90;
        fullscreen_opacity = 1.0;

        blur {
          enabled = true

          size = 3
          passes = 3
          
          brightness = 1
          contrast = 1.300000
          ignore_opacity = true
          noise = 0.011700
          
          new_optimizations = true
          
          xray = true
        }


      animations {
        enabled = true
        
        bezier = fluent_decel, 0, 0.2, 0.4, 1
        bezier = easeOutCirc, 0, 0.55, 0.45, 1
        bezier = easeOutCubic, 0.33, 1, 0.68, 1
        bezier = easeinoutsine, 0.37, 0, 0.63, 1

        # Windows
        animation = windowsIn, 1, 3, easeOutCubic, popin 30% # window open
        animation = windowsOut, 1, 3, fluent_decel, popin 70% # window close.
        animation = windowsMove, 1, 2, easeinoutsine, slide # everything in between, moving, dragging, resizing.
        
        # Fade
        animation = fadeIn, 1, 3, easeOutCubic  # fade in (open) -> layers and windows
        animation = fadeOut, 1, 2, easeOutCubic # fade out (close) -> layers and windows
        animation = fadeSwitch, 0, 1, easeOutCirc # fade on changing activewindow and its opacity
        animation = fadeShadow, 1, 10, easeOutCirc # fade on changing activewindow for shadows
        animation = fadeDim, 1, 4, fluent_decel # the easing of the dimming of inactive windows
        animation = border, 1, 2.7, easeOutCirc # for animating the border's color switch speed
        animation = borderangle, 1, 30, fluent_decel, once # for animating the border's gradient angle - styles: once (default), loop
        animation = workspaces, 1, 4, easeOutCubic, fade # styles: slide, slidevert, fade, slidefade, slidefadevert
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