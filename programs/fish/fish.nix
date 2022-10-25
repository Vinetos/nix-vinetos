{ pkgs, ... }:

{
  enable = true;
  interactiveShellInit = ''
    ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
  '';
  
  shellInit = ''
    # Postgres Create Database
    pcb() {
        psql postgresql://postgres:postgres@localhost:5432/postgres -c 'CREATE DATABASE $1'"
    }
  '';
  
  shellAliases = {
      # Nix
      ns = "nix-shell -p "
      # Java
      sjh = "set JAVA_HOME ~/.nix-profile/lib/openjdk/";
      gsi = "git submodule update --init --recursive";
  };
}
