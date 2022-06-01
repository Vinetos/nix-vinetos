{ config, pkgs, lib, ... }:

let
  # sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
  # sudo nix-channel --update
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  feather-icons = builtins.fetchurl { 
    url = "https://github.com/adi1090x/polybar-themes/blob/46154c5283861a6f0a440363d82c4febead3c818/fonts/panels/icomoon_feather.ttf?raw=true";
    sha256 = "d74dc222a0ee04ebd2a169fed8eb437692a98833c06534f5450400fd024a9bbb";
  };
in
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./battery.nix
    ./discord.nix
  ];

  home.packages = with pkgs; [
    # Overview
    htop
    neofetch
    feh
    gnupg
    netcat
    xfce.thunar

     # Tools
    i3lock-fancy
    pavucontrol
    arandr
    pkgs.networkmanagerapplet
    libnotify
    gparted
    remmina
    pywal

    # Dev tools
    any-nix-shell
    gitAndTools.gitflow
    git-lfs
    nodejs
    maven
    jdk
    unstable.jetbrains.idea-ultimate
    unstable.jetbrains.pycharm-professional
    curl
    p7zip
    docker-compose

    # clang-tools
    # (hiPrio gcc)
    # cmake
    # gnumake
    # gdb
    # unstable.jetbrains.clion
    # nlohmann_json
    # Fonts
    font-awesome
    material-design-icons
    (pkgs.nerdfonts.override { 
      fonts = [ "FiraCode" "DroidSansMono" "Iosevka" ]; 
    })

    # Fun
    spotify
    thunderbird
    flameshot
    teams
    postman
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "vinetos";
  home.homeDirectory = "/home/vinetos";

  programs = {
    home-manager.enable = true;
    neovim = import ./nvim.nix { inherit pkgs; };

    alacritty = import ./alacritty.nix { inherit pkgs; };
    rofi = import ./rofi.nix { inherit pkgs; inherit config; };

    fish = import ./fish.nix { inherit pkgs; };

    starship = import ./starship.nix { inherit pkgs; };

    git = {
      enable = true;
      userName = "Valentin Chassignol";
      userEmail = "Vinetosdev"+"@"+"gmail"+"."+"com";
    };
  };

  fonts.fontconfig.enable = true;
  
  services = {
    picom = {
      enable = true;
      activeOpacity = "1.0";
      inactiveOpacity = "1.0";
      menuOpacity = "1.0";
   };
    polybar = import ./programs/polybar/polybar.nix { inherit pkgs; };
    gpg-agent = {
      enable = true;

      enableSshSupport = true;
      pinentryFlavor = "curses";
    };

    betterlockscreen = {
      enable = true;
      inactiveInterval = 10;
      arguments = [ "--blur 0.5"];
    };
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
  home.stateVersion = "21.11";
}
