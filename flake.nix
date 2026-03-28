{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    # Helper to reduce repetition when adding machines
    mkSystem = host: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/${host}/default.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.kadam-x = import ./home/default.nix;
        }
      ];
    };
  in
  {
    nixosConfigurations = {
      main-pc = mkSystem "main-pc";
      laptop  = mkSystem "laptop";
      server  = mkSystem "server";
    };
  };
}
