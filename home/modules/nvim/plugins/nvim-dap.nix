{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
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
  };
}
