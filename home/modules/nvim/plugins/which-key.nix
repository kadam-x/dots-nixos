{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    which-key = {
      package = pkgs.vimPlugins.which-key-nvim;
      setup = ''
        require("which-key").setup({
          delay   = 0,
          preset  = "helix",
          triggers = {
            { "<leader>", mode = "n" },
            { "s", mode = "n" },
          },
          spec = {
            { "<leader>s", group = "Split" },
            { "<leader>l", group = "Lazy Git" },
            { "<leader>f", group = "Find" },
            { "<leader>d", group = "Debug" },
          },
        })
      '';
    };
  };
}
