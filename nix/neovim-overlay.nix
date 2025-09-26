{ inputs }:
final: prev:
with final.pkgs.lib;
let
  pkgs = final;
  pkgs-locked = inputs.nixpkgs.legacyPackages.${pkgs.system};

  mkNeovim = pkgs.callPackage ./mkNeovim.nix {
    neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    inherit (pkgs-locked) wrapNeovimUnstable neovimUtils;
  };
  all-plugins = with pkgs.vimPlugins; [
    nvim-treesitter.withAllGrammars
    mini-pick
    blink-cmp
    friendly-snippets
    conform-nvim
    nvim-lint
    fidget-nvim
    vim-fugitive
    harpoon2
    vimwiki
    undotree
    plenary-nvim
    kanso-nvim
  ];
  extraPackages = with pkgs; [
    lua-language-server
    nil
    gopls
    ruff
    basedpyright
    vtsls
    ripgrep
    copilot-language-server
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
