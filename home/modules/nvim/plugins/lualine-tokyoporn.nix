{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    lualine = {
      package = pkgs.vimPlugins.lualine-nvim;
      setup = ''
        require("lualine").setup({
          options = {
            theme = {
              normal   = { a = { fg = "#0D1116", bg = "#987afb", gui = "bold" }, b = { fg = "#37f499", bg = "#141b22" }, c = { fg = "#b7bfce", bg = "#141b22" } },
              insert   = { a = { fg = "#0D1116", bg = "#37f499", gui = "bold" }, b = { fg = "#37f499", bg = "#141b22" }, c = { fg = "#b7bfce", bg = "#141b22" } },
              visual   = { a = { fg = "#0D1116", bg = "#fca6ff", gui = "bold" }, b = { fg = "#37f499", bg = "#141b22" }, c = { fg = "#b7bfce", bg = "#141b22" } },
              replace  = { a = { fg = "#0D1116", bg = "#04d1f9", gui = "bold" }, b = { fg = "#37f499", bg = "#141b22" }, c = { fg = "#b7bfce", bg = "#141b22" } },
              command  = { a = { fg = "#0D1116", bg = "#e58f2a", gui = "bold" }, b = { fg = "#37f499", bg = "#141b22" }, c = { fg = "#b7bfce", bg = "#141b22" } },
              terminal = { a = { fg = "#0D1116", bg = "#9ad900", gui = "bold" }, b = { fg = "#37f499", bg = "#141b22" }, c = { fg = "#b7bfce", bg = "#141b22" } },
              inactive = { a = { fg = "#232e3b", bg = "#141b22" }, b = { fg = "#232e3b", bg = "#141b22" }, c = { fg = "#232e3b", bg = "#141b22" } },
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
