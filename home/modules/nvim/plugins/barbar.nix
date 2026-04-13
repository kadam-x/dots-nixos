{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    barbar = {
      package = pkgs.vimPlugins.barbar-nvim;
      setup = ''
        vim.g.barbar_auto_setup = false
        require("barbar").setup({
            icons = {
              filetype = {
                enabled = false,
            },
          },
        })
        vim.keymap.set("n", "K",   "<Cmd>BufferNext<CR>",     { silent = true })
        vim.keymap.set("n", "J", "<Cmd>BufferPrevious<CR>", { silent = true })
      '';
    };
  };
}
