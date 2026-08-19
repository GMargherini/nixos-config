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
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs =
    inputs @ { nixpkgs, home-manager, nixpkgs-stable, nixvim, ... }:
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
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.dolphin = ./home/home.nix;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = { inherit pkgs; inherit pkgs-stable; nixvim = nixvim.homeModules.nixvim; };
            }
            (import ./home/noctalia/default.nix { inputs = inputs; })
            #(import ./home/nixvim/default.nix { lib = lib; inputs = inputs; pkgs = pkgs; })
          ];
        };
      };
    };
}
