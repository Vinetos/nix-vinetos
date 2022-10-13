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
    };
    init.defaultBranch = "main";
    pull.rebase = true;
  };
  
}
