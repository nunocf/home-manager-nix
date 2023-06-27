config:
{
  enable = true;

  enableAutosuggestions = true;
  enableSyntaxHighlighting = true;

  shellAliases = {
    ll = "ls -l";
    update = "home-manager switch --impure";
    edit = "home-manager edit";
    nri = "cd ~/dev/NoRedInk";
  };

  history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };

  oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "robbyrussell";
  };
}
