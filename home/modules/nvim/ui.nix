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

      barbar = {
        package = pkgs.vimPlugins.barbar-nvim;
        setup = ''
          vim.g.barbar_auto_setup = false
          require("barbar").setup({})
          vim.keymap.set("n", "<Tab>",   "<Cmd>BufferNext<CR>",     { silent = true })
          vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { silent = true })
        '';
      };

      mini-icons = {
        package = pkgs.vimPlugins.mini-nvim;
        setup = ''require("mini.icons").setup({})'';
      };
      nvim-web-devicons = {
        package = pkgs.vimPlugins.nvim-web-devicons;
        setup = ''require("nvim-web-devicons").setup({})'';
      };
    };
  };
}
