{ config, ... }:

{
  enable = true;
  theme = 
  let
  # Adapted from squared nord theme
  # from LR-Tech (https://github.com/lr-tech/rofi-themes-collection)
  # 
  inherit (config.lib.formats.rasi) mkLiteral;
  # Use `mkLiteral` for string-like values that should show without
  # quotes, e.g.:
  # {
  #   foo = "abc"; => foo: "abc";
  #   bar = mkLiteral "abc"; => bar: abc;
  # };
  in {
    "*" = {
      font = "FiraCode Nerd Font Medium 12";
      
      bg0 = mkLiteral "#2E3440";
      bg1 = mkLiteral "#3B4252";
      fg0 = mkLiteral "#D8DEE9";

      accent-color = mkLiteral "#88C0D0";
      urgent-color = mkLiteral "#EBCB8B";

      background-color = mkLiteral "transparent";
      text-color = mkLiteral "@fg0";

      margin  =   mkLiteral "0";
      padding =   mkLiteral "0";
      spacing =   mkLiteral "0";
    };
    
    "window" = {
      location =   mkLiteral "center";
      width    =   mkLiteral "480";
      y-offset =   mkLiteral "-160";

      background-color = mkLiteral "@bg0";
    };
    
    "inputbar" = {
      spacing = mkLiteral "8px";
      padding = mkLiteral "8px";

      background-color = mkLiteral "@bg1";
    };

    "prompt, entry, element-icon, element-text" = {
      vertical-align = mkLiteral "0.5";
    };

    "prompt" = {
      text-color= mkLiteral "@accent-color";
    };

    "textbox" = {
      padding = mkLiteral "8px";
      background-color = mkLiteral "@bg1";
    };

    "listview" = {
      padding = mkLiteral "4px 0";
      lines   = mkLiteral "8";
      columns = mkLiteral "1";

      fixed-height = mkLiteral "false";
    };

    "element" = {
      spacing = mkLiteral "8px";
      padding = mkLiteral "8px";
    };

    "element normal normal" = {
      text-color = mkLiteral "@fg0";
    };
    
    "element normal urgent" = {
      text-color = mkLiteral "@urgent-color";
    };

    "element normal active" = {
      text-color = mkLiteral "@accent-color";
    };

    "element selected" = {
      text-color = mkLiteral "@bg0";
    };

    "element selected normal, element selected active" = {
      background-color = mkLiteral "@accent-color";
    };

    "element selected urgent" = {
      background-color = mkLiteral "@urgent-color";
    };

    "element-icon" = {
      size = mkLiteral "0.8em";
    };
    
    "element-text" = {
      text-color = mkLiteral "inherit";
    };
  };
}
