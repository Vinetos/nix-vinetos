{ pkgs, ... }:

{
  enable = true;

  settings = {
    live_config_reload = true;

    window = {
      title = "Terminal";
    };

    background_opacity = 0.85;

    font = {
      normal.family = "Fira Code";
      normal.style = "Regular";
      size = 10.0;
    };

    cursor.style = "Underline";

    shell = {
      program = "${pkgs.fish}/bin/fish";
      args = [ "--init-command" "echo; neofetch --disable packages; echo" ];
    };

    colors = {
      primary = {
        background = "#2D2A2E";
        foreground = "#FCFCFA";
      };
      cursor = {
        text   = "0xFF261E";
        cursor = "0xFF261E";
      };
      normal = {
        black   = "#15191F";
        red     = "#F865A5";
        green   = "#29EDBE";
        yellow  = "#FFC457";
        blue    = "#33AEFF";
        magenta = "#AF54FF";
        cyan    = "#29EDBE";
        white   = "#B3B7BD";
      };
      bright = {
        black   = "#15191F";
        red     = "#FF598B";
        green   = "#1FE0A6";
        yellow  = "#FFB630";
        blue    = "#33AEFF";
        magenta = "#B467F9";
        cyan    = "#2BCAFC";
        white   = "#ECF2F2";
      };
    };
  };
}
