{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "test";
        email = "example@example.com";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}  
