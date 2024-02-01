{ pkgs, config, inputs, ... }: 
{
  home.packages = with pkgs;[
    gamemode
    gamescope
    winetricks
    protonup-qt
    protontricks
    wineWowPackages.stable
    prismlauncher
    heroic
    lutris
  ];
}