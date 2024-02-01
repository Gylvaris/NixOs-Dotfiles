{ pkgs, inputs, username, ...}:
let
  packages = with pkgs; [

  ];
in
{
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        extraSpecialArgs = { inherit inputs username; };
        users.${username} = {
            imports = [ (import ./../config) ];
            home.username = "${username}";
            home.homeDirectory = "/home/${username}";
            home.stateVersion = "23.11";
            programs.home-manager.enable = true;
        };
    };

    users.users.${username} = {
        isNormalUser = true;
        description = "${username}";
        extraGroups = [ "networkmanager" "wheel" ];
    };
    nix.settings.allowed-users = [ "${username}" ];
}