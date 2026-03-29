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
                vim.keymap.set("n", "<leader>fn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Neovim Config Files" })
                vim.keymap.set("n", "<leader>td", function() Snacks.picker.grep({ search = "TODO|PERF|HACK|NOTE|FIX|FIXME", live = false }) end, { desc = "TODO list" })
                vim.keymap.set("n", "<leader>x",  function() Snacks.bufdelete() end,               { desc = "Delete Buffer" })
      '';
    };

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

    yazi = {
      package = pkgs.vimPlugins.yazi-nvim;
      setup = ''
        require("yazi").setup({
          open_for_directories = false,
          keymaps = {
            show_help                          = "<f1>",
            open_file_in_vertical_split        = "<c-v>",
            open_file_in_horizontal_split      = "<c-x>",
            open_file_in_tab                   = "<c-t>",
            grep_in_directory                  = "<c-s>",
            replace_in_directory               = "<c-g>",
            cycle_open_buffers                 = "<tab>",
            copy_relative_path_to_selected_files = "<c-y>",
            send_to_quickfix_list              = "<c-q>",
          },
        })
        vim.keymap.set("n", "<leader>e",  "<cmd>Yazi<cr>",        { desc = "Open yazi at current file" })
        vim.keymap.set("n", "<leader>E",  "<cmd>Yazi cwd<cr>",    { desc = "Open yazi in cwd" })
        vim.keymap.set("n", "<leader>fy", "<cmd>Yazi toggle<cr>", { desc = "Resume last yazi session" })
      '';
    };

    nvim-dap = {
      package = pkgs.vimPlugins.nvim-dap;
      setup = ''
        local dap    = require("dap")
        local dapui  = require("dapui")
        require("dapui").setup({})
        require("nvim-dap-virtual-text").setup({ commented = true })
        require("dap-python").setup("python3")

        vim.fn.sign_define("DapBreakpoint",         { text = "", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DapStopped",            { text = "", texthl = "DiagnosticSignWarn", linehl = "Visual" })

        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
        end
        map("n", "<leader>db", dap.toggle_breakpoint, "Debug: Toggle Breakpoint")
        map("n", "<leader>dc", dap.continue,          "Debug: Start/Continue")
        map("n", "<leader>do", dap.step_over,         "Debug: Step Over")
        map("n", "<leader>di", dap.step_into,         "Debug: Step Into")
        map("n", "<leader>dO", dap.step_out,          "Debug: Step Out")
        map("n", "<leader>dq", dap.terminate,         "Debug: Terminate")
        map("n", "<leader>du", dapui.toggle,          "Debug: Toggle UI")
      '';
    };

    nvim-dap-ui = {
      package = pkgs.vimPlugins.nvim-dap-ui;
      setup = "";
    };

    nvim-dap-python = {
      package = pkgs.vimPlugins.nvim-dap-python;
      setup = "";
    };

    nvim-dap-virtual-text = {
      package = pkgs.vimPlugins.nvim-dap-virtual-text;
      setup = "";
    };

    mini-surround = {
      package = pkgs.vimPlugins.mini-nvim;
      setup = ''require("mini.surround").setup({})'';
    };

    mini-pairs = {
      package = pkgs.vimPlugins.mini-nvim;
      setup = ''require("mini.pairs").setup({})'';
    };

    guess-indent = {
      package = pkgs.vimPlugins.guess-indent-nvim;
      setup = ''require("guess-indent").setup({})'';
    };

    nvim-numbertoggle = {
      package = pkgs.vimPlugins.nvim-numbertoggle;
      setup = "";
    };

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

    # gitsigns = {
    #   package = pkgs.vimPlugins.gitsigns-nvim;
    #   setup = ''require("gitsigns").setup({})'';
    # };
  };
}
