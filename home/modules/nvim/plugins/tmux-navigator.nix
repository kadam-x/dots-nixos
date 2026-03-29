{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    tmux-navigator = {
      package = pkgs.vimPlugins.vim-tmux-navigator;
      setup = ''
        vim.keymap.set("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
        vim.keymap.set("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
        vim.keymap.set("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
        vim.keymap.set("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>")
        vim.keymap.set("n", "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>")
      '';
    };
  };
}
