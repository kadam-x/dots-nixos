{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins = {
    render-markdown = {
      package = pkgs.vimPlugins.render-markdown-nvim;
      setup = ''
        require("render-markdown").setup({
          enabled = true,
          file_types = { "markdown" },
        })
      '';
    };
  };
}
