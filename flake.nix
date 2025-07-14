{
  description = "Abhi's neovim config packaged as nix flake";

#--  inputs = {
 # --  nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
# -- };
  outputs = { self, ... }:
  {
    # Just expose the source directory so others can use your config files
    defaultPackage.x86_64-linux = self;

    # Optional devShell if you want
    devShell.x86_64-linux = import ./shell.nix; # optional
  };
}
