{
  description = "Mam kurwa depresje";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    nix-gaming.url = "github:fufexan/nix-gaming";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, self, ...} @ inputs:
    let
      selfPkgs = import ./pkgs;
      username = "gylvaris";
    in
    {
      overlays.default = selfPkgs.overlay;
      nixosConfigurations = import ./modules/system/default.nix {
        inherit self nixpkgs inputs username;
      };
    };
}