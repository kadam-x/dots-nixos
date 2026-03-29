{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    nvim-numbertoggle = {
      package = pkgs.vimPlugins.nvim-numbertoggle;
      setup = "";
    };
  };
}
