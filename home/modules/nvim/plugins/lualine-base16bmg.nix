{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {

    lualine = {
      package = pkgs.vimPlugins.lualine-nvim;
      setup = ''
        require("lualine").setup({
          options = {
            theme = {
              normal   = { a = { fg = "#888888", bg = "#111111", gui = "bold" }, b = { fg = "#9c8d7e", bg = "#111111" }, c = { fg = "#888888", bg = "#111111" } },
              insert   = { a = { fg = "#111111", bg = "#9c8d7e", gui = "bold" }, b = { fg = "#9c8d7e", bg = "#111111" }, c = { fg = "#888888", bg = "#111111" } },
              visual   = { a = { fg = "#111111", bg = "#888888", gui = "bold" }, b = { fg = "#9c8d7e", bg = "#111111" }, c = { fg = "#888888", bg = "#111111" } },
              replace  = { a = { fg = "#111111", bg = "#888888", gui = "bold" }, b = { fg = "#9c8d7e", bg = "#111111" }, c = { fg = "#888888", bg = "#111111" } },
              command  = { a = { fg = "#111111", bg = "#888888", gui = "bold" }, b = { fg = "#9c8d7e", bg = "#111111" }, c = { fg = "#888888", bg = "#111111" } },
              terminal = { a = { fg = "#111111", bg = "#888888", gui = "bold" }, b = { fg = "#9c8d7e", bg = "#111111" }, c = { fg = "#888888", bg = "#111111" } },
              inactive = { a = { fg = "#444444", bg = "#111111" }, b = { fg = "#444444", bg = "#111111" }, c = { fg = "#444444", bg = "#111111" } },
            },
            component_separators = { left = "", right = "" },
            section_separators   = { left = "", right = "" },
            globalstatus = true,
          },
          sections = {
            lualine_a = { "mode" },
            lualine_b = { { "branch" }, { "diff", symbols = { added = "+", modified = "~", removed = "-" } } },
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
