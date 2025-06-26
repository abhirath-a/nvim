{
  description = "Abhi's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in {
      homeModules.default = { config, pkgs, ... }: {
        programs.neovim = {
          enable = true;

          # Inject your real init.lua as a Lua string
          extraLuaConfig = builtins.readFile (self + "/init.lua");
        };
      };
    };
}

