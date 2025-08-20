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
    # treesitter
    nvim-treesitter.withAllGrammars
    ts-autotag-nvim
    # mini
    mini-nvim
    # cmp
    blink-cmp
    friendly-snippets
    copilot-lua
    blink-cmp-copilot
    # formatting
    conform-nvim
    # linting
    nvim-lint
    # minimal notification ui
    fidget-nvim
    # git
    vim-fugitive
    gitsigns-nvim

    harpoon2
    obsidian-nvim
    oil-nvim
    refactoring-nvim
    vim-surround
    undotree
    plenary-nvim
    kanagawa-nvim
  ];
  extraPackages = with pkgs; [
    lua-language-server
    nil
    gopls
    ruff
    basedpyright
    vtsls
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
