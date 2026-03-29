{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    mini-pairs = {
      package = pkgs.vimPlugins.mini-nvim;
      setup = ''require("mini.pairs").setup({})'';
    };
  };
}
