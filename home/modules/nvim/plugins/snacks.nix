{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {

    snacks = {
      package = pkgs.vimPlugins.snacks-nvim;
      setup = ''
                require("snacks").setup({
                  bigfile   = { enabled = true },
                  image     = { enabled = false },
                  indent    = { enabled = true },
                  lazygit   = { enabled = true },
                  picker    = { enabled = true },
                  dashboard = {
                    enabled = true,
                    preset  = {
                      header = [[
         ██████╗███╗   ██╗███████╗███████╗██╗   ██╗██╗███╗   ███╗
        ██╔════╝████╗  ██║██╔════╝╚══███╔╝██║   ██║██║████╗ ████║
        ╚█████╗ ██╔██╗ ██║█████╗    ███╔╝ ██║   ██║██║██╔████╔██║
         ╚═══██╗██║╚██╗██║██╔══╝   ███╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
        ██████╔╝██║ ╚████║███████╗███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
                    },
                    sections = {
                      { section = "header" },
                      { section = "keys", gap = 1, padding = 1 },
                      { section = "recent_files", icon = " ", title = "Recent Files", indent = 2, padding = 1 },
                    },
                  },
                })

                -- Snacks keymaps
                vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit() end,            { desc = "Lazygit" })
                vim.keymap.set("n", "<leader>un", function() Snacks.notifier.hide() end,      { desc = "Dismiss notifications" })
                vim.keymap.set({ "n", "t" }, "<A-h>", function() Snacks.terminal.toggle(nil, { win = { position = "bottom" } }) end, { desc = "Toggle terminal" })
                vim.keymap.set("n", "<leader><leader>", function() Snacks.picker.buffers() end,     { desc = "Find Buffers" })
                vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end,             { desc = "Find Files" })
                vim.keymap.set("n", "<leader>fg", function() Snacks.picker.grep() end,              { desc = "Live Grep" })
                vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end,            { desc = "Recent Files" })
                vim.keymap.set({ "n", "x" }, "<leader>fw", function() Snacks.picker.grep_word() end, { desc = "Find Word" })
                vim.keymap.set("n", "<leader>fb", function() Snacks.picker.grep_buffers() end,      { desc = "Grep Buffers" })
                vim.keymap.set("n", "<leader>fh", function() Snacks.picker.help() end,              { desc = "Help Tags" })
                vim.keymap.set("n", "<leader>fk", function() Snacks.picker.keymaps({ confirm = "edit" }) end, { desc = "Keymaps" })
                vim.keymap.set("n", "<leader>fd", function() Snacks.picker.diagnostics() end,       { desc = "Diagnostics" })
                vim.keymap.set("n", "<leader>fn", function() Snacks.picker.files({ cwd = "/etc/nixos/home/modules/nvim" }) end, { desc = "Neovim Config Files" })
                vim.keymap.set("n", "<leader>td", function() Snacks.picker.grep({ search = "TODO|PERF|HACK|NOTE|FIX|FIXME", live = false }) end, { desc = "TODO list" })
                vim.keymap.set("n", "X",  function() Snacks.bufdelete() end,               { desc = "Delete Buffer" })
      '';
    };
  };
}
