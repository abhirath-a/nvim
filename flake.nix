{
  description = "Abhi's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; # Adjust for your system
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system}.neovim = pkgs.neovim.override {
        configure = {
          customRC = ''
            source ${self}/init.lua
          '';
        };
        nativeBuildInputs = [ pkgs.luaPackages.luarocks ];
      };

      homeConfigurations.abhi = home-manager.lib.homeManagerConfiguration {
        inherit system;
        modules = [
          ./home.nix
          self.homeModules.default
        ];
        pkgs = nixpkgs.legacyPackages.${system};
      };
    };
}
