{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config.allowUnfree = true; };
  feather-icons = builtins.fetchurl { 
    url = "https://github.com/adi1090x/polybar-themes/blob/46154c5283861a6f0a440363d82c4febead3c818/fonts/panels/icomoon_feather.ttf?raw=true";
    sha256 = "d74dc222a0ee04ebd2a169fed8eb437692a98833c06534f5450400fd024a9bbb";
  };
in
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./battery.nix
    ./piscine.nix
  ];

  home.packages = with pkgs; [
    # Overview
    neofetch
    feh
    gnupg

     # Tools
    i3lock-fancy
    libnotify

    # Dev tools
    any-nix-shell
    gitAndTools.gitflow
    git-lfs
    nodejs

    # Fonts
    font-awesome
    fira-code
    fira-code-symbols
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "valentin.chassignol";
  home.homeDirectory = "/home/valentin.chassignol";
  home.keyboard.variant = "intl";

  programs = {
    home-manager.enable = true;
    neovim = import ./nvim.nix { inherit pkgs; };

    alacritty = import ./alacritty.nix { inherit pkgs; };    

    git = {
      enable = true;
      userName = "Valentin Chassignol";
      userEmail = "valentin.chassignol@gmail.com";
    };
  };

  fonts.fontconfig.enable = true;
  
  services = {
    polybar = import ./polybar.nix { inherit pkgs; };
    gpg-agent = {
      enable = true;

      enableSshSupport = true;
      pinentryFlavor = "curses";
    };
    picom.enable = true;
  };

  xsession.windowManager.i3 = import ./i3.nix {inherit pkgs lib; };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
