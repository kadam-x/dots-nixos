{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    blink-cmp = {
      package = pkgs.vimPlugins.blink-cmp;
      setup = ''
        require("blink.cmp").setup({
          keymap = {
            preset   = "none",
            ["<Tab>"]   = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<CR>"]    = { "accept", "fallback" },
            ["<Esc>"]   = { "hide", "fallback" },
          },
          completion = {
            list = { selection = { preselect = true, auto_insert = true } },
            menu = { auto_show = true },
          },
        })
      '';
    };
  };
}
