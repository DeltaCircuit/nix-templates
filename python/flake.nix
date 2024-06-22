{
  description = "Python 3.11 flake using pip / venv";

  inputs.nixpkgs.url = "github:nixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPacakges.${system};
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          python311
          black
          pre-commit
        ];

        name = "python-v311";

        shellHook = ''
          python -m venv .venv
          source ./.venv/bin/activate
          pip install -r requirements.txt
          pre-commit install
        '';
      };
    });
}
