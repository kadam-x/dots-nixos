{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    baseIndex = 1;
    mouse = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];
    extraConfig = ''
      # Unbind default prefix
      unbind C-b
      bind C-a send-prefix
      # Reload config
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config Reloaded!"
      # Fix Colors
      set -ag terminal-overrides ",xterm-256color:RGB"
      set -as terminal-features ",xterm-256color:transparent"
      # Windows and Panes
      setw -g pane-base-index 1
      set -g renumber-windows on
      set -g status-interval 10
      # Vi copy mode
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send -X copy-selection-and-cancel
      # Pane switching (Manual overrides for vim-tmux-navigator if needed)
      bind -n C-h select-pane -L
      bind -n C-j select-pane -D
      bind -n C-k select-pane -U
      bind -n C-l select-pane -R
      # Splits
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      # Resize
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5
      bind -r m resize-pane -Z
      # --- THEME ---
      set -g status-position top
      set -g status-justify "left"
      set -g status-left-length 100
      set -g status-right-length 100
      set -g pane-border-style "fg=#3a3f58"
      set -g pane-active-border-style "fg=#987afb"
      set -g status-style "bg=default,fg=#b7bfce"
      set -g message-style "fg=#987afb,bg=default,align=centre"
      set -g message-command-style "fg=#987afb,bg=default,align=centre"
      set -g window-status-activity-style "fg=#f1fc79,bg=default,none"
      set -g window-status-separator ""
      set -g window-status-style "fg=#b7bfce,bg=default,none"
      set -g window-status-current-format "#[fg=#b7bfce,bg=default] #I*: #[fg=#987afb,bg=default,bold]#W "
      set -g window-status-format "#[fg=#b7bfce,bg=default] #I: #[fg=#b7bfce,bg=default]#W "
      set -g status-left "#[fg=#b7bfce,bg=default] [#S] "
      set -g status-right "#{?client_prefix,#[fg=#987afb],#[fg=#b7bfce]}[PREFIX] #[fg=#3a3f58]| #[fg=#b7bfce]#{pane_current_command} "
      set -g mode-style "fg=#987afb bg=default bold"
      set -g clock-mode-colour "#987afb"
      # --- HELP POPUP ---
      bind ? display-popup -E -w 60% -h 30% "printf '\033[2m╭─────────────────────────────────────────────╮\033[0m\n\033[2m│\033[0m \033[1;37mQUICK REFERENCE\033[0m \033[2m─── PREFIX: \033[0;37mCtrl-a\033[0m \033[2m│\033[0m\n\033[2m├─────────────────────────────────────────────┤\033[0m\n\033[2m│\033[0m \033[2;37mPANES\033[0m            \033[2;37mWINDOWS\033[0m        \033[2;37mSESSIONS\033[0m  \033[2m│\033[0m\n\033[2m│\033[0m \033[0;37m|\033[0m split vert    \033[0;37mc\033[0m new          \033[0;37ms\033[0m list     \033[2m│\033[0m\n\033[2m│\033[0m \033[0;37m-\033[0m split horiz   \033[0;37mn\033[0m next         \033[0;37md\033[0m detach   \033[2m│\033[0m\n\033[2m│\033[0m \033[0;37mhjkl\033[0m navigate   \033[0;37mp\033[0m prev         \033[0;37m$\033[0m rename   \033[2m│\033[0m\n\033[2m│\033[0m \033[0;37mHJKL\033[0m resize     \033[0;37m,\033[0m rename                  \033[2m│\033[0m\n\033[2m│\033[0m \033[0;37mm\033[0m maximize      \033[0;37m&\033[0m kill                    \033[2m│\033[0m\n\033[2m│\033[0m \033[0;37mx\033[0m kill                                     \033[2m│\033[0m\n\033[2m├─────────────────────────────────────────────┤\033[0m\n\033[2m│\033[0m \033[2;37m?\033[0m help  \033[2;37mr\033[0m reload  \033[2;37m:\033[0m command mode           \033[2m│\033[0m\n\033[2m╰─────────────────────────────────────────────╯\033[0m\n\033[2mpress any key to close\033[0m\n'; ${pkgs.zsh}/bin/zsh -c 'read -k 1'"
    '';
  };
}
