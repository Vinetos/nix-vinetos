{ pkgs, ... }:

{
  enable = true;
  interactiveShellInit = ''
    any-nix-shell fish --info-right | source
  '';
}
