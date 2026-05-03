{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    theme.enable = false;
    extraPlugins.vague-nvim = {
      package = pkgs.vimPlugins.vague-nvim;
      setup = ''
        vim.cmd("colorscheme vague")
      '';
    };
  };
}
