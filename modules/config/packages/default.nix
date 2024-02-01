{ inputs, pkgs, self, config, lib, ... }: 
{
    home = {
        packages = let
            nix-gaming = inputs.nix-gaming.packages.${pkgs.system};
            nixpkgs-wayland = inputs.nixpkgs-wayland.packages.${pkgs.system};
            aagl-gtk-on-nix = inputs.aagl.packages.${pkgs.system};
        in with pkgs; [
            firefox
            dunst
            libnotify
            neofetch
            btop
            nvtop
            lshw
            vscode.fhs
            pavucontrol
            libsForQt5.qt5ct
            libsForQt5.dolphin
            libsForQt5.dolphin-plugins
            xdg-user-dirs
            spotify
            nwg-look
            waypaper
            corretto17
            mesa
            unzip
            xdg-utils
            ffmpeg_6-full
            alsa-utils
            flameshot
            polkit
            discord-canary
            libva
            libva-utils
            polkit
            libsForQt5.sddm
            easyeffects
            gnome.gnome-keyring
            gnome.seahorse
            vesktop
            aagl-gtk-on-nix.anime-games-launcher
        ];
    };
}