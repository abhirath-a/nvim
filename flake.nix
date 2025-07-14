{
  description = "Abhi's neovim config packaged as nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux"; # or builtins.currentSystem
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.default =
        pkgs.runCommand "nvim-config"
          {
            # no build inputs because just copying files
          }
          ''
            mkdir -p $out/config/nvim
            cp ${self}/init.lua $out/config/nvim/init.lua
          '';
    };
}
