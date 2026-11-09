{
  description = "Home Manager configuration of dolphin";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nixpkgs-stable,
      nixvim,
      stylix,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
        config.allowUnfree = true;
      };
      pkgs-stable = import nixpkgs-stable {
        system = system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        mainframe = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit pkgs-stable;
          };
          system = system;
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = false;
              home-manager.useUserPackages = true;
              home-manager.users.dolphin = ./home/home.nix;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = {
                inherit pkgs;
                inherit pkgs-stable;
                nixvim = nixvim.homeModules.nixvim;
                stylix = stylix.homeModules.stylix;
              };
            }
            (import ./home/noctalia/default.nix { inputs = inputs; })
          ];
        };
      };
      homeConfigurations."dolphin" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs;
        modules = [
          stylix.homeModules.stylix
          ./home/home.nix
        ];
      };
    };
}
