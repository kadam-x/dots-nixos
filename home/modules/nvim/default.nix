{ lib, pkgs, ... }:
{
  imports = [
    ./plugins/default.nix
  ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      luaConfigPre = ''
        -- OPTIONS
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.showmode = false
        vim.opt.showtabline = 2
        vim.opt.laststatus = 3
        vim.g.neovide_refresh_rate = 60
        vim.opt.termguicolors = true
        vim.opt.nu = true
        vim.opt.relativenumber = true
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
        vim.opt.shiftwidth = 4
        vim.opt.expandtab = true
        vim.opt.smartindent = true
        vim.opt.ruler = false
        vim.opt.swapfile = false
        vim.opt.backup = false
        vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
        vim.opt.undofile = true
        vim.opt.inccommand = "split"
        vim.opt.background = "dark"
        vim.opt.scrolloff = 8
        vim.opt.signcolumn = "no"
        vim.opt.splitright = true
        vim.opt.splitbelow = true
        vim.opt.updatetime = 50
        vim.opt.mouse = "a"
        vim.o.foldenable = true
        vim.o.foldmethod = "manual"
        vim.o.foldlevel = 99
        vim.o.foldcolumn = "0"
        vim.g.clipboard = {
          name = "wl-clipboard",
          copy  = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
          paste = { ["+"] = "wl-paste", ["*"] = "wl-paste" },
          cache_enabled = 1,
        }

        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
          opts = opts or {}
          opts.border = opts.border or "rounded"
          return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end

        vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "InsertLeave" }, {
          callback = function()
            vim.opt.cursorline = true
            vim.opt.cursorlineopt = "number"
          end,
        })
        vim.api.nvim_create_autocmd("InsertEnter", {
          callback = function()
            vim.opt.cursorline = true
            vim.opt.cursorlineopt = "both"
          end,
        })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
          callback = function()
            vim.opt_local.textwidth = 80
            vim.opt_local.formatoptions:append("t")
            vim.opt_local.smartindent = false
          end,
        })
        vim.api.nvim_create_autocmd("VimEnter", {
          callback = function()
            if vim.fn.argc() == 1 then
              local arg = vim.fn.argv(0)
              if vim.fn.isdirectory(arg) == 1 then
                vim.defer_fn(function()
                  pcall(vim.api.nvim_buf_delete, 0, { force = true })
                  require("snacks").dashboard.open()
                end, 10)
              end
            end
          end,
        })
        vim.api.nvim_create_autocmd("TextYankPost", {
          desc = "Highlight when yanking text",
          group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
          callback = function() vim.hl.on_yank() end,
        })

        vim.keymap.set("n", "q:", "<nop>")
        vim.keymap.set("n", "q/", "<nop>")
        vim.keymap.set("n", "q?", "<nop>")
        vim.keymap.set({ "n", "v" }, "d", '"_d', { desc = "Delete without yanking" })
        vim.keymap.set({ "n", "v" }, "D", '"_D', { desc = "Delete to EOL without yanking" })
        vim.keymap.set({ "n", "v" }, "c", '"_c', { desc = "Change without yanking" })
        vim.keymap.set({ "n", "v" }, "C", '"_C', { desc = "Change to EOL without yanking" })
        vim.keymap.set("n", "D", "dd", { desc = "Cut line" })
        vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking selection" })
        vim.keymap.set("n", "V", "ggVG", { desc = "Select all" })

        -- KEYMAPS
        vim.g.mapleader = " "
        vim.g.maplocalleader = " "

        local opts = { noremap = true, silent = true }

        vim.keymap.set("n", "x", "V", { desc = "Select line (Helix style)" })
        vim.keymap.set("v", "x", "j", { desc = "Extend selection (Helix)" })
        vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
        vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
        vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })
        vim.keymap.set("n", "J", "mzJ`z")
        vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
        vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })
        vim.keymap.set("n", "n", "nzzzv")
        vim.keymap.set("n", "N", "Nzzzv")
        vim.keymap.set("v", "<", "<gv", opts)
        vim.keymap.set("v", ">", ">gv", opts)
        vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
        vim.keymap.set("i", "<C-c>", "<Esc>")
        vim.keymap.set("n", "<C-c>", ":nohl<CR>", { silent = true })
        vim.keymap.set("n", "Q", "<nop>")
        vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
        vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word globally" })
        vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
        vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
        vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equal split size" })
        vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })
        vim.keymap.set("n", "<leader>fp", function()
          local filePath = vim.fn.expand("%:~")
          vim.fn.setreg("+", filePath)
          print("File path copied: " .. filePath)
        end, { desc = "Copy file path" })
        local isLspDiagnosticsVisible = true
        vim.keymap.set("n", "<leader>lx", function()
          isLspDiagnosticsVisible = not isLspDiagnosticsVisible
          vim.diagnostic.config({
            virtual_text = isLspDiagnosticsVisible,
            underline = isLspDiagnosticsVisible,
          })
        end, { desc = "Toggle LSP diagnostics" })
      '';
    };
  };
}
