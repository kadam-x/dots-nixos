{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    lualine = {
      package = pkgs.vimPlugins.lualine-nvim;
      setup = ''
        require("lualine").setup({
          options = {
            theme = {
              normal   = { a = { fg = "#011627", bg = "#987afb", gui = "bold" }, b = { fg = "#37f499", bg = "#051a2b" }, c = { fg = "#b7bfce", bg = "#051a2b" } },
              insert   = { a = { fg = "#011627", bg = "#37f499", gui = "bold" }, b = { fg = "#37f499", bg = "#051a2b" }, c = { fg = "#b7bfce", bg = "#051a2b" } },
              visual   = { a = { fg = "#011627", bg = "#fca6ff", gui = "bold" }, b = { fg = "#37f499", bg = "#051a2b" }, c = { fg = "#b7bfce", bg = "#051a2b" } },
              replace  = { a = { fg = "#011627", bg = "#04d1f9", gui = "bold" }, b = { fg = "#37f499", bg = "#051a2b" }, c = { fg = "#b7bfce", bg = "#051a2b" } },
              command  = { a = { fg = "#011627", bg = "#e58f2a", gui = "bold" }, b = { fg = "#37f499", bg = "#051a2b" }, c = { fg = "#b7bfce", bg = "#051a2b" } },
              terminal = { a = { fg = "#011627", bg = "#9ad900", gui = "bold" }, b = { fg = "#37f499", bg = "#051a2b" }, c = { fg = "#b7bfce", bg = "#051a2b" } },
              inactive = { a = { fg = "#232e3b", bg = "#051a2b" }, b = { fg = "#232e3b", bg = "#051a2b" }, c = { fg = "#232e3b", bg = "#051a2b" } },
            },
            component_separators = { left = "", right = "" },
            section_separators   = { left = "", right = "" },
            globalstatus = true,
          },
          sections = {
            lualine_a = { "mode" },
            lualine_b = { { "branch" }, { "diff", symbols = { added = "+", modified = "~", removed = "-" }, diff_color = { added = { fg = "#37f499" }, modified = { fg = "#e58f2a" }, removed = { fg = "#f16c75" } } } },
            lualine_c = { { "filename", path = 1, symbols = { modified = " [+]", readonly = " [RO]" } } },
            lualine_x = { "filetype" },
            lualine_y = { { function() return "Bufs:" .. #vim.fn.getbufinfo({ buflisted = 1 }) end } },
            lualine_z = { "location" },
          },
          inactive_sections = {
            lualine_c = { "filename" },
            lualine_x = { "location" },
          },
        })
      '';
    };
  };
}
