{
  description = "Abhi's neovim config packaged as nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        pname = "abhivim";
        version = "0.1";
        src = ./.;
        buildInputs = [
          pkgs.neovim
          pkgs.nodejs
          pkgs.ripgrep
          pkgs.fzf
          pkgs.fd
        ];

        # No build phase, just create a launcher script
        installPhase = ''
          mkdir -p $out/bin
          cat > $out/bin/nvim <<EOF
          #!${pkgs.stdenv.shell}
          export PATH=${pkgs.nodejs}/bin:${pkgs.ripgrep}/bin:${pkgs.fzf}/bin:${pkgs.fd}/bin:\$PATH
          exec ${pkgs.neovim}/bin/nvim "\$@"
          EOF
          chmod +x $out/bin/nvim
        '';

        meta = with pkgs.lib; {
          description = "Abhi's neovim config packaged as nix flake";
          license = licenses.mit;
          maintainers = with maintainers; [ ];
        
	platforms = platforms.all
};
      };

      apps.${system}.default = {
        type = "app";
        program = "${self.packages.${system}.default}/bin/nvim";
      };
    };
}
