config: pkgs:
{
  enable = true;
  vimAlias = true;

  extraConfig = ''
    luafile ${config.xdg.configHome}/nvim/lua/settings.lua
    luafile ${config.xdg.configHome}/nvim/lua/treesitter.lua

    set background=dark
    colorscheme nord
  '';

  plugins = with pkgs.vimPlugins; [
    # matching line indents
    indentLine

    # nix syntax highlighting
    vim-nix

    # LSP
    

    # File tree
    nvim-tree-lua
    nvim-web-devicons

    # Eye candy
    nvim-treesitter
    nord-nvim
  ];
}
