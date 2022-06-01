{ config, pkgs, lib, ... }:

let
  # sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
  # sudo nix-channel --update
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./battery.nix
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
    # Automatic overlay is in ~/.config/nixpkgs/overlays
    # to stay up-to-date
    discord
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "vinetos";
  home.homeDirectory = "/home/vinetos";

  programs = {
    home-manager.enable = true;
    neovim = import ./programs/nvim/nvim.nix { inherit pkgs; };

    alacritty = import ./programs/alacritty/alacritty.nix { inherit pkgs; };
    rofi = import ./programs/rofi/rofi.nix { inherit config; };

    fish = import ./programs/fish/fish.nix { inherit pkgs; };

    starship = import ./programs/starship/starship.nix;

    git = import ./programs/git/git.nix;
  };

  fonts.fontconfig.enable = true;
  
  services = {
    picom = import ./programs/picom/picom.nix;
    polybar = import ./programs/polybar/polybar.nix { inherit pkgs; };
    gpg-agent = import ./programs/gpg-agent/gpg-agent.nix;
    betterlockscreen = import ./programs/betterlockscreen/betterlockscreen.nix;
  };

  xsession.windowManager.i3 = import ./programs/i3/i3.nix {inherit pkgs lib; };

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
