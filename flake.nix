{
  description = "Abhi's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeModules = {
        default = { config, pkgs, ... }: {
          programs.neovim = {
            enable = true;
            package = pkgs.neovim;
            extraLuaConfig = builtins.readFile (self + "/init.lua");
          };
        };
      };
    };
}
