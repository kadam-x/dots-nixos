{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    theme.enable = false;
    extraPlugins.gruvbox = {
      package = pkgs.vimPlugins.gruvbox-nvim;
      setup = ''
        require("gruvbox").setup()
        vim.cmd("colorscheme gruvbox")
      '';
    };
  };
}
