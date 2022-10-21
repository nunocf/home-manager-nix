{ config, pkgs, ... }:

let

  # Break config up:
  # some_config = import ./some_path/some_config.nix

  nvimConfig = import "${config.xdg.configHome}/nvim/nvim.nix";
  zshConfig = import "${config.xdg.configHome}/zsh/zsh.nix";
  gitConfig = import "${config.xdg.configHome}/git/git.nix";
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.

  home.username = "nunocf";
  home.homeDirectory = "/Users/nunocf";

  imports = [
    ./darwin-application-activation.nix
  ];

  home.sessionVariables = {
    EDITOR="nvim";
    TERMINAL="kitty";
  };
  
  fonts.fontconfig.enable = true;
  
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    kitty
    kitty-themes
    zsh
    nix
    jq
    fzf
    ripgrep
    graphviz

    slack

    #Lsp stuff 
    rnix-lsp
    sumneko-lua-language-server
    haskellPackages.haskell-language-server
    haskellPackages.hlint
    elmPackages.elm-language-server
    elmPackages.elm-format
    nodePackages.eslint
    nodePackages.prettier
    nodePackages.vscode-langservers-extracted

  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # NeoVim setup & alias
  programs.neovim = nvimConfig config pkgs;

  # direnv
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # git ofc
  programs.git = gitConfig;

  # Terminal stuff
  programs.kitty = {
    enable = true;

    settings = {
      font_size = "16.0";
      font_family = "FiraCode Nerd Font";
      disable_ligatures = "never";
      copy_on_select = "yes";
    };

    theme = "Nord";

    keybindings = {
      "ctrl+shift+h" = "goto_layout horizontal";
    };
  };
  programs.zsh = zshConfig config;

  # Terminal utils
  programs.bat.enable = true;
}
