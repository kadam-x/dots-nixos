{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    theme.enable = false;
    extraPlugins.solarized = {
      package = pkgs.vimPlugins.nvim-solarized-lua;
      setup = ''
        vim.o.background = "dark"
        vim.o.termguicolors = true
        vim.cmd.colorscheme("solarized")
        vim.api.nvim_set_hl(0, "Normal",      { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SignColumn",  { bg = "NONE" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
      '';
    };
  };
}
