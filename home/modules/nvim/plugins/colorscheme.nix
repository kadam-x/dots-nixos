{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    theme.enable = false;
    extraPlugins.gruvbox-baby = {
      package = pkgs.vimPlugins.gruvbox-baby;
      setup = ''
        vim.cmd("colorscheme gruvbox-baby")
      '';
    };
  };
}
  

