{ pkgs, lib, ... }: 
{
  programs.steam = {
    enable = true;
  };
  programs.gamemode.enable = true;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-runtime"
  ];
}