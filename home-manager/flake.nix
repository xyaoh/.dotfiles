{
  description = "Xyaohfu's home-manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    nixvim.url = "github:xyaoh/.nixvim";
  };

  outputs = { nixpkgs, home-manager, nix-colors, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations = {
        xyaohfu = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit nix-colors; inherit nixvim; };
          modules = [ ./hosts/xyaohfu.nix ];
        };
      };
    };
}
