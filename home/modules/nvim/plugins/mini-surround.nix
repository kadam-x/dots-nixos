{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    mini-surround = {
      package = pkgs.vimPlugins.mini-nvim;
      setup = ''require("mini.surround").setup({})'';
    };
  };
}
