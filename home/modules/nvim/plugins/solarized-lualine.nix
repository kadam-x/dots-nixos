{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    lualine = {
      package = pkgs.vimPlugins.lualine-nvim;
      setup = ''
        require("lualine").setup({
          options = {
            theme = {
              normal   = { a = { fg = "#839496", bg = "#073642", gui = "bold" }, b = { fg = "#93a1a1", bg = "#073642" }, c = { fg = "#657b83", bg = "NONE" } },
              insert   = { a = { fg = "#073642", bg = "#268bd2", gui = "bold" }, b = { fg = "#93a1a1", bg = "#073642" }, c = { fg = "#657b83", bg = "NONE" } },
              visual   = { a = { fg = "#073642", bg = "#d33682", gui = "bold" }, b = { fg = "#93a1a1", bg = "#073642" }, c = { fg = "#657b83", bg = "NONE" } },
              replace  = { a = { fg = "#073642", bg = "#dc322f", gui = "bold" }, b = { fg = "#93a1a1", bg = "#073642" }, c = { fg = "#657b83", bg = "NONE" } },
              command  = { a = { fg = "#073642", bg = "#b58900", gui = "bold" }, b = { fg = "#93a1a1", bg = "#073642" }, c = { fg = "#657b83", bg = "NONE" } },
              terminal = { a = { fg = "#073642", bg = "#2aa198", gui = "bold" }, b = { fg = "#93a1a1", bg = "#073642" }, c = { fg = "#657b83", bg = "NONE" } },
              inactive = { a = { fg = "#586e75", bg = "NONE" }, b = { fg = "#586e75", bg = "NONE" }, c = { fg = "#586e75", bg = "NONE" } },
            },
            component_separators = { left = "", right = "" },
            section_separators   = { left = "", right = "" },
            globalstatus = true,
          },
          sections = {
            lualine_a = { "mode" },
            lualine_b = { { "branch" }, { "diff", symbols = { added = "+", modified = "~", removed = "-" } } },
            lualine_c = { { "filename", path = 1, symbols = { modified = "", readonly = " [RO]" } } },
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
