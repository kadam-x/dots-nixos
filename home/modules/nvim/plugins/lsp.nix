{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    languages = {
      enableTreesitter = true;
      python = { enable = true; lsp.enable = true; };
      nix    = { enable = true; lsp.enable = true; };
      lua    = { enable = true; lsp.enable = true; };
      rust   = { enable = true; lsp.enable = true; };
      clang  = { enable = true; lsp.enable = true; };
      ts     = { enable = true; lsp.enable = true; };
      html   = { enable = true; };
      css    = { enable = true; };
    };

    lsp = {
      enable = true;
      formatOnSave = true;
    };

    extraPlugins = {
      conform = {
        package = pkgs.vimPlugins.conform-nvim;
        setup = ''
          require("conform").setup({
            formatters_by_ft = {
              javascript = { "prettier" },
              typescript = { "prettier" },
              css        = { "prettier" },
              html       = { "prettier" },
              json       = { "prettier" },
              yaml       = { "prettier" },
              markdown   = { "prettier" },
            },
          })
        '';
      };
    };
  };
}
