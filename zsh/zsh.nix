config:
{
  enable = true;
  
  enableAutosuggestions = true;
  enableSyntaxHighlighting = true;

  shellAliases = {
    ll = "ls -l";
    update = "home-manager switch";
    edit = "home-manager edit";
  };

  history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };

  oh-my-zsh = {
    enable = true;
    plugins = ["git"];
    theme = "robbyrussell";
  };
}
