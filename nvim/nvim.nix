config: pkgs:
{
  enable = true;
  vimAlias = true;

  extraConfig = ''
    luafile ${config.xdg.configHome}/nvim/lua/settings.lua
    luafile ${config.xdg.configHome}/nvim/lua/keymaps.lua
    luafile ${config.xdg.configHome}/nvim/lua/_nvim-tree.lua
    luafile ${config.xdg.configHome}/nvim/lua/_treesitter.lua
    luafile ${config.xdg.configHome}/nvim/lua/_bufferline.lua
    luafile ${config.xdg.configHome}/nvim/lua/_telescope.lua
    luafile ${config.xdg.configHome}/nvim/lua/_galaxyline.lua
    luafile ${config.xdg.configHome}/nvim/lua/surround-nvim.lua
    luafile ${config.xdg.configHome}/nvim/lua/_toggleterm.lua
    luafile ${config.xdg.configHome}/nvim/lua/_nvim-autopairs.lua
    luafile ${config.xdg.configHome}/nvim/lua/_gitsigns.lua

    lua << EOF
    vim.defer_fn(function()
      vim.cmd [[
        luafile ${config.xdg.configHome}/nvim/lua/lsp/configs.lua
        luafile ${config.xdg.configHome}/nvim/lua/lsp/handlers.lua
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
    nvim-autopairs
    comment-nvim
    vim-commentary

    # matching line indents
    indentLine

    # nix syntax highlighting
    vim-nix

    # LSP
    nvim-lspconfig

    # Cmp plugins
    nvim-cmp
    cmp-buffer
    cmp-path
    cmp-cmdline
    cmp_luasnip

    #Git
    lazygit-nvim

    #Snippets
    luasnip
    friendly-snippets

    # File tree
    nvim-tree-lua
    nvim-web-devicons

    # Telescope
    popup-nvim
    plenary-nvim
    telescope-nvim
    telescope-live-grep-args-nvim

    # Git
    gitsigns-nvim

    # Eye candy
    nvim-treesitter.withAllGrammars
    nvim-ts-context-commentstring
    nord-nvim
    bufferline-nvim
    galaxyline-nvim
    toggleterm-nvim
    haskell-vim
  ];
}
