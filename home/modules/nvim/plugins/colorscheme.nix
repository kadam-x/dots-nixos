{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    theme.enable = false;
    extraPlugins.base16 = {
      package = pkgs.vimPlugins.base16-nvim;
      setup = ''
        require("base16-colorscheme").setup({
          base00 = "#0D1116", base01 = "#141b22", base02 = "#232e3b",
          base03 = "#5d4685", base04 = "#b7bfce", base05 = "#ffffff",
          base06 = "#e9b3fd", base07 = "#ffffff", base08 = "#f16c75",
          base09 = "#e58f2a", base0A = "#f1fc79", base0B = "#37f499",
          base0C = "#04d1f9", base0D = "#987afb", base0E = "#fca6ff",
          base0F = "#9ad900",
        })
        -- UI Base
        vim.api.nvim_set_hl(0, "Normal",      { fg = "#ffffff", bg = "#0D1116" })
        vim.api.nvim_set_hl(0, "NormalNC",    { fg = "#b7bfce", bg = "#141b22" })
        vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#ffffff", bg = "#141b22" })
        vim.api.nvim_set_hl(0, "CursorLine",  { bg = "#232e3b" })
        vim.api.nvim_set_hl(0, "Visual",      { bg = "#29124f" })
        vim.api.nvim_set_hl(0, "Search",      { bg = "#5d4685", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "Comment",     { fg = "#b7bfce", italic = true })
        vim.api.nvim_set_hl(0, "LineNr",      { fg = "#232e3b" })
        vim.api.nvim_set_hl(0, "CursorLineNr",{ fg = "#987afb", bold = true })
        vim.api.nvim_set_hl(0, "Cursor",      { fg = "#0D1116", bg = "#f94dff" })
        -- Flash
        vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#f94dff", bg = "#5d4685", bold = true })
        -- Syntax
        vim.api.nvim_set_hl(0, "Keyword",    { fg = "#987afb", bold = true })
        vim.api.nvim_set_hl(0, "Function",   { fg = "#04d1f9" })
        vim.api.nvim_set_hl(0, "String",     { fg = "#37f499" })
        vim.api.nvim_set_hl(0, "Constant",   { fg = "#fca6ff" })
        vim.api.nvim_set_hl(0, "Type",       { fg = "#9ad900" })
        vim.api.nvim_set_hl(0, "Number",     { fg = "#e58f2a" })
        vim.api.nvim_set_hl(0, "Operator",   { fg = "#04d1f9" })
        vim.api.nvim_set_hl(0, "Identifier", { fg = "#ffffff" })
        -- Line numbers
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#232e3b", bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#232e3b", bg = "NONE" })
      '';
    };
  };
}
