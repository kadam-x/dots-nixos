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
            lualine_c = { },
            lualine_x = { },
            lualine_y = { },
            lualine_z = { "location" },
          },
          inactive_sections = {
            lualine_c = { },
            lualine_x = { },
          },
        })
      '';
    };
  };
}
