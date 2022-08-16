config: pkgs:
{
  enable = true;
  vimAlias = true;

  extraConfig = ''
    luafile ${config.xdg.configHome}/nvim/lua/settings.lua
    luafile ${config.xdg.configHome}/nvim/lua/treesitter.lua
    luafile ${config.xdg.configHome}/nvim/lua/bufferline.lua
    luafile ${config.xdg.configHome}/nvim/lua/galaxyline.lua

    lua << EOF
    vim.defer_fn(function()
      vim.cmd [[
        luafile ${config.xdg.configHome}/nvim/lua/lsp.lua
      ]]
    end, 70)
    EOF

    set background=dark
    colorscheme nord
  '';

  plugins = with pkgs.vimPlugins; [
    # matching line indents
    indentLine

    # nix syntax highlighting
    vim-nix

    # LSP
    nvim-lspconfig
    nvim-compe

    # File tree
    nvim-tree-lua
    nvim-web-devicons

    # Eye candy
    nvim-treesitter
    nord-nvim

    bufferline-nvim
    galaxyline-nvim
  ];
}
