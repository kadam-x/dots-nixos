{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_status$character";
      right_format = "$python$nodejs$cpp$rust$cmd_duration$hostname$username";
      character = {
        vicmd_symbol = "[N](bold) >>>";
        success_symbol = "[󰄾](bold)";
        error_symbol = "[󰄾](bold red)";
      };
      directory = {
        style = "bold blue";
        read_only = " 󰌾";
        truncation_length = 3;
        truncate_to_repo = true;
        format = "[$path]($style)[$read_only]($read_only_style) ";
      };
      python = {
        symbol = "";
        format = "[$symbol$version]($style) ";
        style = "bold";
      };
      nodejs = {
        symbol = "󰎙";
        format = "[$symbol$version]($style) ";
        style = "bold";
      };
      cpp = {
        symbol = "";
        format = "[$symbol$version]($style) ";
        style = "bold";
      };
      rust = {
        symbol = "󱘗 ";
        format = "[$symbol$version]($style) ";
        style = "bold";
      };
      golang = {
        symbol = "";
        format = "[$symbol$version]($style) ";
        style = "bold";
      };
      git_branch = {
        format = "[$branch]($style) ";
        style = "bold cyan";
      };
      git_status = {
        style = "bold";
        untracked = "";
        modified = "[!$count](bold yellow)";
        staged = "[+$count](bold green)";
        renamed = "[󰄾$count](bold)";
        deleted = "[-$count](bold red)";
        ahead = "[󰄿$count](bold)";
        behind = "[󰄼$count](bold)";
        diverged = "[󱓊$ahead_count󱓋$behind_count](bold)";
      };
      hostname = {
        ssh_only = true;
        format = "󰖟[$hostname]($style) ";
        style = "bold";
      };
      cmd_duration = {
        min_time = 2000;
        format = "[$duration]($style) ";
        style = "bold";
      };
    };
  };
}
