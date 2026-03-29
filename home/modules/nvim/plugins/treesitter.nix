{ pkgs, ... }:
{
  programs.nvf.settings.vim.treesitter = {
    enable = true;
    grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash c diff html lua luadoc markdown markdown-inline
      query vim vimdoc rust regex python nix astro cpp
    ];
  };
}
