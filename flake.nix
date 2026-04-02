{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nvf,
      stylix,
      ...
    }:
    let
      mkSystem =
        host:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/${host}/default.nix
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bak";
              home-manager.users.kadam-x = {
                imports = [
                  nvf.homeManagerModules.default
                  stylix.homeModules.stylix
                  ./home/${host}.nix
                ];
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        main-pc = mkSystem "main-pc";
        laptop = mkSystem "laptop";
        server = mkSystem "server";
      };
    };
}
