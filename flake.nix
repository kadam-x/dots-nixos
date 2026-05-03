{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
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
                  ./home/${host}.nix
                ];
              };
            }
          ];
        };
      inputs = {
      };
    in
    {
      nixosConfigurations = {
        main-pc = mkSystem "main-pc";
        laptop = mkSystem "laptop";
        server = mkSystem "server";
      };
	homeConfigurations = {
        "kadamx" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs; };
          modules = [
           ./home/main-pc.nix
          ];
       };
    };
  };
}
