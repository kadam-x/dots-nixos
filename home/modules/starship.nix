{ config, pkgs, ... }:
{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
      palette = "tokyoporn";

      format = "$directory$git_branch$git_status\n$character";
      right_format = "$python$nodejs$cpp$rust$cmd_duration$hostname$username";

      character = {
        vicmd_symbol = "[N](bold fg) >>>";
        success_symbol = "[»](bold fg)";
        error_symbol = "[»](bold red)";
      };

      directory = {
        style = "bold fg";
        read_only = " 󰌾";
        truncation_length = 3;
        truncate_to_repo = true;
        format = "[$path]($style)[$read_only]($read_only_style) ";
      };

      python = {
        symbol = "";
        format = "[$symbol$version]($style) ";
        style = "bold gray";
      };
      nodejs = {
        symbol = "󰎙";
        format = "[$symbol$version]($style) ";
        style = "bold gray";
      };
      cpp = {
        symbol = "";
        format = "[$symbol$version]($style) ";
        style = "bold gray";
      };
      rust = {
        symbol = "󱘗 ";
        format = "[$symbol$version]($style) ";
        style = "bold fg";
      };
      golang = {
        symbol = "";
        format = "[$symbol$version]($style) ";
        style = "bold fg";
      };

      git_branch = {
        format = "[$symbol$branch]($style) ";
        style = "bold fg";
      };

      git_status = {
        style = "bold fg";
        untracked = "";
        modified = "[!$count](bold yellow)";
        staged = "[+$count](bold green)";
        renamed = "[󰄾$count](bold gray)";
        deleted = "[$count](bold red)";
        ahead = "[󰄿$count](bold fg)";
        behind = "[󰄼$count](bold fg)";
        diverged = "[󱓊$ahead_count󱓋$behind_count](bold fg)";
      };

      hostname = {
        ssh_only = true;
        format = "󰖟[$hostname]($style) ";
        style = "bold fg";
      };

      cmd_duration = {
        min_time = 2000;
        format = "[$duration]($style) ";
        style = "bold gray";
      };
      palettes = {
        tokyoporn = {
          bg = "#0D1116";
          fg = "#ffffff";
          red = "#f16c75";
          green = "#37f499";
          yellow = "#f1fc79";
          blue = "#04d1f9";
          purple = "#987afb";
          aqua = "#04d1f9";
          gray = "#b7bfce";
          orange = "#e58f2a";
          pink = "#fca6ff";
          lime = "#9ad900";
        };
      };
    };
  };
}
