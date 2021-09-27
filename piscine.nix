{ config, pkgs, ... }:

let 
  url = https://discord.com/api/download?platform=linux&format=tar.gz;

in {
  home.packages = with pkgs; [
    gdb
    gcc
    #clang
    clang-tools
    cmake
    gnumake
    jetbrains.clion
  ];

  programs = {
    fish = {
      enable = true;
      promptInit = ''
         any-nix-shell fish --info-right | source
       '';
       shellAliases = {
         ll = "ls -lh";
         la = "ls -a";
         compile = "gcc -Wextra -Wall -Werror -std=c99 -pedantic";
       };
     };
  };
}
