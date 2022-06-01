{ color }:

let 
  padding = 4;
in
{
  type = "internal/i3";

  format = "<label-state> <label-mode>";

  index-sort = true;
  wrapping-scroll = true;
  strip-wsnumbers = true;
	
  label-mode = "%mode%";
  label-mode-padding = padding;
  label-mode-foreground = color.foreground;
  label-mode-background = color.background;

  label-focused = "%name%";
  label-focused-background = color.background;
  label-focused-underline = color.shades."2";
  label-focused-padding = padding;

  label-unfocused = "%name%";
  label-unfocused-padding = padding;

  label-visible = "V %index%";
  label-visible-background = "\${self.label-focused-background}";
  label-visible-underline = "\${self.label-focused-background}";
  label-visible-padding = "\${self.label-focused-padding}";

  label-urgent = "";
  label-urgent-background = color.shades."1";
  label-urgent-padding = padding;

}
