{
  description = "Abhi's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";  # Adjust if needed
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Export a Home Manager module named "default"
      homeModules.default = { config, pkgs, ... }: {
        programs.neovim = {
          enable = true;

          # Read your actual init.lua file inside this flake repo
          extraLuaConfig = builtins.readFile (self + "/init.lua");

          # Optional: specify the Neovim package from nixpkgs
          package = pkgs.neovim;
        };
      };
    };
}
