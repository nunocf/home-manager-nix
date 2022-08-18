config: pkgs:
{
  enable = true;
  vimAlias = true;

  extraConfig = ''
    luafile ${config.xdg.configHome}/nvim/lua/settings.lua
    luafile ${config.xdg.configHome}/nvim/lua/keymaps.lua
    luafile ${config.xdg.configHome}/nvim/lua/_nvim-tree.lua
    luafile ${config.xdg.configHome}/nvim/lua/treesitter.lua
    luafile ${config.xdg.configHome}/nvim/lua/_bufferline.lua
    luafile ${config.xdg.configHome}/nvim/lua/_telescope.lua
    luafile ${config.xdg.configHome}/nvim/lua/_galaxyline.lua
    luafile ${config.xdg.configHome}/nvim/lua/surround-nvim.lua

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
    # Misc
    surround-nvim
    rainbow
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

    # Telescope
    popup-nvim
    plenary-nvim
    telescope-nvim

    # Eye candy
    nvim-treesitter
    nord-nvim
    bufferline-nvim
    galaxyline-nvim
  ];
}
