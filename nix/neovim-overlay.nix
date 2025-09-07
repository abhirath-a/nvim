{ inputs }:
final: prev:
with final.pkgs.lib;
let
  pkgs = final;

  # mkNvimPlugin =
  #   src: pname:
  #   pkgs.vimUtils.buildVimPlugin {
  #     inherit pname src;
  #     version = src.lastModifiedDate;
  #   };
  #
  pkgs-locked = inputs.nixpkgs.legacyPackages.${pkgs.system};

  mkNeovim = pkgs.callPackage ./mkNeovim.nix {
    neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    inherit (pkgs-locked) wrapNeovimUnstable neovimUtils;
  };
  all-plugins = with pkgs.vimPlugins; [
    nvim-treesitter.withAllGrammars
    mini-nvim
    blink-cmp
    friendly-snippets
    conform-nvim
    nvim-lint
    fidget-nvim
    vim-fugitive
    gitsigns-nvim
    harpoon2
    obsidian-nvim
    oil-nvim
    refactoring-nvim
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
    copilot-language-server-fhs
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
