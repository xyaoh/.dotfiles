{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    package = pkgs.starship;
    settings = {
      format = ''
        ( \[$username$hostname\]) $directory( $nix_shell)( $jobs)
          $character
      '';

      character = {
        format = "$symbol ";
        success_symbol = "[❯](bold bright-yellow)";
        error_symbol = "[❯](bold red)";
      };

      username = {
        format = "[$user]($style)";
        style_root = "bold italic yellow";
        style_user = "bold italic yellow";
      };

      hostname = {
        ssh_only = true;
        format = "[$ssh_symbol$hostname]($style)";
        ssh_symbol = "@";
        style = "bold italic yellow";
      };

      directory = {
        format = "[$path]($style)[$read_only]($read_only_style)";
        read_only = "-";
        style = "bold cyan";
        read_only_style = "bold yellow";
        truncation_length = 4;
        truncate_to_repo = true;
        truncation_symbol = "../";
      };

      nix_shell = {
        format = "[$state($name)]($style)";
        style = "bold italic blue";
        pure_msg = "";
        impure_msg = "*";
      };

      jobs = {
        format = "[\\[$symbol$number\\]]($style)";

        symbol = "+";
        style = "bold italic yellow";
        symbol_threshold = 1;
        number_threshold = 1;
      };
    };
  };
}
