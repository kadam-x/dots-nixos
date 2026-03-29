{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    theme = {
      enable = false; # we manage colorscheme manually
    };

    extraPlugins = {
      base16 = {
        package = pkgs.vimPlugins.base16-nvim;
        setup = ''
          require("base16-colorscheme").setup({
            base00 = "#000000", base01 = "#121212", base02 = "#222222",
            base03 = "#333333", base04 = "#999999", base05 = "#c1c1c1",
            base06 = "#999999", base07 = "#c1c1c1", base08 = "#5f8787",
            base09 = "#aaaaaa", base0A = "#8c7f70", base0B = "#9b8d7f",
            base0C = "#aaaaaa", base0D = "#888888", base0E = "#999999",
            base0F = "#444444",
          })
          vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#912222" })
          vim.api.nvim_set_hl(0, "TSComment",  { fg = "#6f7b68" })
          vim.api.nvim_set_hl(0, "Comment",    { fg = "#6f7b68" })
          vim.api.nvim_set_hl(0, "Visual",     { bg = "#9b8d7f", fg = "#1e1e1e" })
          vim.api.nvim_set_hl(0, "Search",     { bg = "#9b8d7f", fg = "#1e1e1e" })
          vim.api.nvim_set_hl(0, "PmenuSel",   { bg = "#9b8d7f", fg = "#1e1e1e" })
          vim.api.nvim_set_hl(0, "LineNrAbove",{ fg = "#888888", bg = "#222222" })
          vim.api.nvim_set_hl(0, "LineNrBelow",{ fg = "#888888", bg = "#222222" })
          vim.api.nvim_set_hl(0, "LineNr",     { fg = "#d6d2c8" })
          vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#999999", bg = "#222222", bold = true })
        '';
      };
    };
  };
}
