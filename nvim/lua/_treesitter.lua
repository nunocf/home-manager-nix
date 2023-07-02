require('nvim-treesitter.configs').setup {
  -- grammars are taken care of by Nix
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}
