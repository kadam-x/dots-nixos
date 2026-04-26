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
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nvf,
      noctalia,
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
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.kadam-x = {
                imports = [
                  nvf.homeManagerModules.default
                  noctalia.homeModules.default
                  ./home/${host}.nix
                ];
              };
            }
          ];
        };
      inputs = {
        inherit nixpkgs home-manager nvf noctalia;
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
