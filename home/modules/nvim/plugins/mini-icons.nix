{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    mini-icons = {
      package = pkgs.vimPlugins.mini-nvim;
      setup = ''require("mini.icons").setup({})'';
    };
  };
}
