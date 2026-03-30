{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    nvim-web-devicons = {
      package = pkgs.vimPlugins.nvim-web-devicons;
      setup = ''
        require("nvim-web-devicons").setup({
                override = {},
          color_icons = false,
              })'';
    };
  };
}
