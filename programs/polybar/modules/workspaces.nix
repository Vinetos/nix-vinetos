{ color }:

{
  type = "internal/i3";

  enable-scroll = false;

  index-sort = true;
  strip-wsnumbers = true;

  format = "<label-state> <label-mode>";
  format-background = color.shades."1";	
  format-foreground = color.foreground;
  format-padding = 1;

  label-focused = "%name%";
  label-focused-padding = 2;

  label-unfocused = "%name%";
  label-unfocused-padding = 2;
}
