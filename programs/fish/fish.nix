{ pkgs, ... }:

{
  enable = true;
  interactiveShellInit = ''
    ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
  '';
  shellAliases = {
      sjh = "set JAVA_HOME ~/.nix-profile/lib/openjdk/";
      gsi = "git submodule update --init --recursive";
  };
}
