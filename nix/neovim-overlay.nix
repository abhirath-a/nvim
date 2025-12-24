{ inputs }:
final: prev:
with final.pkgs.lib;
let
  pkgs = final;
  pkgs-locked = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};

  mkNeovim = pkgs.callPackage ./mkNeovim.nix {
    neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
    inherit (pkgs-locked) wrapNeovimUnstable neovimUtils;
  };
  all-plugins = with pkgs.vimPlugins; [
    nvim-treesitter.withAllGrammars
    fzf-lua
    blink-cmp
    conform-nvim
    nvim-lint
    fidget-nvim
    vim-fugitive
    kanso-nvim
  ];
  extraPackages = with pkgs; [
    fzf
    fd
    lua-language-server
    nil
    gopls
    ruff
    basedpyright
    vtsls
    ripgrep
    rust-analyzer
    marksman
    astro-language-server
  ];
in
{
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  nvim-dev = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
    appName = "nvim-dev";
    wrapRc = false;
  };

  nvim-luarc-json = final.mk-luarc-json {
    plugins = all-plugins;
  };
}
