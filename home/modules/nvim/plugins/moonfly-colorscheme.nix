{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    theme.enable = false;
    extraPlugins.moonfly = {
      package = pkgs.vimPlugins.vim-moonfly-colors;
      setup = ''
        vim.cmd([[colorscheme moonfly]])
        vim.api.nvim_set_hl(0, "Normal",          { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalFloat",     { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatBorder",     { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatTitle",      { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatFooter",     { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC",        { bg = "NONE" })
        vim.api.nvim_set_hl(0, "Pmenu",           { bg = "NONE" })
        vim.api.nvim_set_hl(0, "PmenuSbar",       { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SignColumn",      { bg = "NONE" })
        vim.api.nvim_set_hl(0, "StatusLine",      { bg = "NONE" })
        vim.api.nvim_set_hl(0, "StatusLineNC",    { bg = "NONE" })
        vim.api.nvim_set_hl(0, "WinSeparator",    { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SnacksNormal",    { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SnacksBorder",    { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SnacksBackdrop",  { bg = "NONE" })
      '';
    };
  };
}
