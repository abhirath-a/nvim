{ inputs }:
final: prev:
with final.pkgs.lib;
let
  pkgs = final;

  mkNvimPlugin =
    src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  pkgs-locked = inputs.nixpkgs.legacyPackages.${pkgs.system};

  mkNeovim = pkgs.callPackage ./mkNeovim.nix {
    inherit (pkgs-locked) wrapNeovimUnstable neovimUtils;
  };

  all-plugins = with pkgs.vimPlugins; [
    nvim-treesitter.withAllGrammars
    mini-ai
    mini-pairs
    mini-pick
    mini-extra
    mini-icons
    mini-hipatterns
    kanagawa-nvim
    lze
    blink-cmp
    friendly-snippets
    copilot-lua
    blink-cmp-copilot
    conform-nvim
    nvim-lint
    fidget-nvim
    vim-fugitive
    gitsigns-nvim
    harpoon2
    obsidian-nvim
    oil-nvim
    refactoring-nvim
    vim-surround
    undotree
    ts-autotag-nvim
    plenary-nvim
  ];

  extraPackages = with pkgs; [
    lua-language-server
    nil
    gopls
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
