{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    theme.enable = false;
    extraPlugins.moonfly = {
      package = pkgs.vimPlugins.vim-moonfly-colors;
      setup = ''
        vim.cmd([[colorscheme moonfly]])
      '';
    };
  };
}
