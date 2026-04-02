{
  description = "Pure Nix Flake Python Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          python311
          uv
        ];

        shellHook = ''
          if [ ! -d ".venv" ]; then
            uv venv
          fi
          source .venv/bin/activate

          export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]}:$LD_LIBRARY_PATH"

          echo "Python 3.11 Nix Shell Active"
        '';
      };
    };
}
