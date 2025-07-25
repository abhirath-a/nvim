{
  description = "Abhi's Neovim Configuration";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      forAllSystems =
        function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "aarch64-linux"
        ] (system: function nixpkgs.legacyPackages.${system});
    in
    rec {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            alejandra
            stylua
          ];
        };
      });

      packages = forAllSystems (pkgs: rec {
        neovim = pkgs.callPackage ./nix/pkg/neovim.nix { bundled = false; };
        neovim-bundled = pkgs.callPackage ./nix/pkg/neovim.nix { };
        default = neovim-bundled;
      });

      overlays.default = final: prev: {
        neovim = final.callPackage ./nix/pkg/neovim.nix { bundled = false; };
        neovim-bundled = final.callPackage ./nix/pkg/neovim.nix { };
      };
    };
}
