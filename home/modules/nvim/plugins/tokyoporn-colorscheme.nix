{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    theme.enable = false;
    extraPlugins.base16 = {
      package = pkgs.vimPlugins.base16-nvim;
      setup = ''
        require("base16-colorscheme").setup({
          base00 = "#0D1116", base01 = "#141b22", base02 = "#232e3b",
          base03 = "#3d2a5e", base04 = "#b7bfce", base05 = "#ffffff",
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
        vim.api.nvim_set_hl(0, "Visual",      { bg = "#3d2a5e" })
        vim.api.nvim_set_hl(0, "Search",      { bg = "#3d2a5e", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "Comment",     { fg = "#b7bfce", italic = true })
        vim.api.nvim_set_hl(0, "LineNr",      { fg = "#232e3b" })
        vim.api.nvim_set_hl(0, "CursorLineNr",{ fg = "#987afb", bold = true })
        vim.api.nvim_set_hl(0, "Cursor",      { fg = "#0D1116", bg = "#f94dff" })
        -- Syntax
        vim.api.nvim_set_hl(0, "Keyword",    { fg = "#987afb", bold = true })
        vim.api.nvim_set_hl(0, "Function",   { fg = "#04d1f9" })
        vim.api.nvim_set_hl(0, "String",     { fg = "#37f499" })
        vim.api.nvim_set_hl(0, "Constant",   { fg = "#fca6ff" })
        vim.api.nvim_set_hl(0, "Type",       { fg = "#9ad900" })
        vim.api.nvim_set_hl(0, "Number",     { fg = "#e58f2a" })
        vim.api.nvim_set_hl(0, "Operator",   { fg = "#04d1f9" })
        vim.api.nvim_set_hl(0, "Identifier", { fg = "#ffffff" })
        -- Pmenu
        vim.api.nvim_set_hl(0, "Pmenu",    { fg = "#ffffff",  bg = "#141b22" })
        vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#0D1116", bg = "#987afb", bold = true })
        -- Spell
        vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "#f16c75" })
        vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = "#f1fc79" })
        -- Flash
        vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#f94dff", bg = "#3d2a5e", bold = true })
        -- Diagnostics
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#f16c75" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn",  { fg = "#f1fc79" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint",  { fg = "#04d1f9" })
        -- Telescope
        vim.api.nvim_set_hl(0, "TelescopeBorder",        { fg = "#987afb" })
        vim.api.nvim_set_hl(0, "TelescopeSelectionCaret",{ fg = "#f94dff" })
        -- Markdown headings
        vim.api.nvim_set_hl(0, "@markup.heading.1", { fg = "#987afb", bg = "#2d244b", bold = true })
        vim.api.nvim_set_hl(0, "@markup.heading.2", { fg = "#37f499", bg = "#10492d", bold = true })
        vim.api.nvim_set_hl(0, "@markup.heading.3", { fg = "#04d1f9", bg = "#013e4a", bold = true })
        vim.api.nvim_set_hl(0, "@markup.heading.4", { fg = "#fca6ff", bg = "#4b314c", bold = true })
        vim.api.nvim_set_hl(0, "@markup.heading.5", { fg = "#9ad900", bg = "#1e2b00", bold = true })
        vim.api.nvim_set_hl(0, "@markup.heading.6", { fg = "#e58f2a", bg = "#2d1c08", bold = true })
        vim.api.nvim_set_hl(0, "@markup.raw.block", { bg = "#141b22" })
        vim.api.nvim_set_hl(0, "@markup.raw",       { fg = "#04d1f9", bg = "#141b22" })
        vim.api.nvim_set_hl(0, "@markup.link.url",  { fg = "#04d1f9", underline = true })
        vim.api.nvim_set_hl(0, "@markup.link",      { fg = "#987afb" })
        -- Barbar active tab
        vim.api.nvim_set_hl(0, "BufferCurrent",            { fg = "#0D1116", bg = "#987afb", bold = true })
        vim.api.nvim_set_hl(0, "BufferCurrentMod",         { fg = "#0D1116", bg = "#987afb" })
        vim.api.nvim_set_hl(0, "BufferCurrentSign",        { fg = "#0D1116", bg = "#987afb" })
        vim.api.nvim_set_hl(0, "BufferDefaultCurrentIcon", { fg = "#0D1116", bg = "#987afb" })
        -- Barbar visible tabs
        vim.api.nvim_set_hl(0, "BufferVisible",            { fg = "#987afb", bg = "#141b22" })
        vim.api.nvim_set_hl(0, "BufferVisibleMod",         { fg = "#e58f2a", bg = "#141b22" })
        vim.api.nvim_set_hl(0, "BufferVisibleSign",        { fg = "#232e3b", bg = "#141b22" })
        vim.api.nvim_set_hl(0, "BufferDefaultVisibleIcon", { bg = "#141b22" })
        -- Barbar inactive tabs
        vim.api.nvim_set_hl(0, "BufferInactive",            { fg = "#b7bfce", bg = "#141b22" })
        vim.api.nvim_set_hl(0, "BufferInactiveMod",         { fg = "#e58f2a", bg = "#141b22" })
        vim.api.nvim_set_hl(0, "BufferInactiveSign",        { fg = "#232e3b", bg = "#141b22" })
        vim.api.nvim_set_hl(0, "BufferDefaultInactiveIcon", { bg = "#141b22" })
        -- Barbar tabline
        vim.api.nvim_set_hl(0, "BufferTabpageFill", { fg = "#141b22", bg = "#0D1116" })
        vim.api.nvim_set_hl(0, "BufferTabpages",    { fg = "#987afb", bg = "#0D1116", bold = true })
        -- Line numbers
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#232e3b", bg = "#141b22" })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#232e3b", bg = "#141b22" })
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      '';
    };
  };
}
