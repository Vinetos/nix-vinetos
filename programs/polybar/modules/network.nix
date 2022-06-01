{ color }:
let
  interface = "wlo1";
in
  {
    type = "internal/network";
    interface = interface;

    unknown-as-up = true;

    format-connected = "<ramp-signal> <label-connected>";
    format-connected-prefix-font = 2;
    format-connected-background = color.shades."4";
    format-connected-padding = 2;

    format-disconnected = "<label-disconnected>";
    format-disconnected-prefix = "ﲁ";
    format-disconnected-prefix-font = 2;
    format-disconnected-background = color.shades."4";
    format-disconnected-padding = 2;

    label-connected = "%{A1:networkmanager_dmenu &:} %essid%%{A}";
    label-disconnected = "%{A1:networkmanager_dmenu &:} Offline%{A}";

    ramp-signal-0 = "說";
    ramp-signal-1 = "說";
    ramp-signal-2 = "說";

  }
