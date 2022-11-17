{ pkgs, ...}:

{
  enable = true;

  # User config
  userName = "Valentin Chassignol";
  userEmail = "Vinetosdev"+"@"+"gmail"+"."+"com";

  # Signing Module
  signing = {
    key = "D40082CCAF4E61A4";
    signByDefault = true;
  };

  # Extra Config
  extraConfig = {
    core = {
      editor = "vim";
      core.pager = "${pkgs.delta}/bin/delta --dark";
    };
    init.defaultBranch = "main";
    pull.rebase = true;
  };

  # Alias
  aliases = {
      # Better log
      l =  "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
      # Branch create from $2 and create tracked branch
      bc = "!sh -c 'git switch -c \"$1\" \"$2\" && git push --set-upstream origin \"$1\"' -";
      bd = "!sh -c 'git switch main && git push -d origin \"$1\" && git branch -d \"$1\"' -";
  };
  
}
