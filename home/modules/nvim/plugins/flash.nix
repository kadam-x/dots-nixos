{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    flash = {
      package = pkgs.vimPlugins.flash-nvim;
      setup = ''
        require("flash").setup({
          modes = { search = { enabled = true }, char = { enabled = false } },
          highlight = { backdrop = true },
        })
        vim.keymap.set({ "n", "x", "o" }, "f", function() require("flash").jump() end, { desc = "Flash" })
      '';
    };
  };
}
