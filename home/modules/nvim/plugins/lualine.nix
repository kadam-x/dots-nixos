{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    lualine = {
      package = pkgs.vimPlugins.lualine-nvim;
      setup = ''
        require("lualine").setup({
          options = {
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
