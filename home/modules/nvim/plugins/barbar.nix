{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    barbar = {
      package = pkgs.vimPlugins.barbar-nvim;
      setup = ''
        vim.g.barbar_auto_setup = false
        require("barbar").setup({})
        vim.keymap.set("n", "<Tab>",   "<Cmd>BufferNext<CR>",     { silent = true })
        vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { silent = true })
      '';
    };
  };
}
