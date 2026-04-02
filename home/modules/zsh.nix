{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = false;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
    ];

    history = {
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    shellAliases = {
      l = "eza -lh --icons=auto";
      ld = "eza -lhD --icons=auto";
      ll = "eza -lha --icons=auto --sort=name --group-directories-first";
      ls = "eza -1 --icons=auto";
      lt = "eza --icons=auto --tree";
    };

    sessionVariables = {
      QT_QPA_PLATFORM = "wayland";
      EDITOR = "nvim";
      VISUAL = "nvim";
      SUDO_EDITOR = "nvim";
    };

    initContent = ''
      zstyle ':completion:*' menu no
      zstyle ':completion:*:default' list-colors "''${(s.:.)LS_COLORS}" 'ma=48;5;4;fg=15'
      zstyle ':completion:*:descriptions' format '[%d]'
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
      zstyle ':fzf-tab:*' switch-group '<' '>'

      _z_tab() {
        if [[ "$BUFFER" == "z" ]] || [[ "$BUFFER" == z\ * ]]; then
          local query="''${BUFFER#z }"
          BUFFER=""
          CURSOR=0
          zle -R
          zi --query "$query"
          zle reset-prompt
          return
        fi
        if (( ''${+widgets[fzf-tab-complete]} )); then
          zle fzf-tab-complete
        else
          zle expand-or-complete
        fi
      }
      zle -N _z_tab
      bindkey '\t' _z_tab

      eval "$(direnv hook zsh)"
    '';
  };

  programs.fzf.enable = true;
  programs.starship.enable = true;
  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
  };
}
