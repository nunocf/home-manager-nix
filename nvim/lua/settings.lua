local opt = vim.opt
local g = vim.g

vim.cmd [[
  set nowrap
  set nobackup
  set nowritebackup
  set noerrorbells
  set noswapfile
  set whichwrap+=<,>,[,],h,l
  set iskeyword+=-
]]

g.mapleader = ","

-- Undo files
opt.undofile = true

-- Indentation
opt.smartindent = true
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Set clipboard to system clipboard
opt.clipboard = "unnamedplus"

-- Use mouse
opt.mouse = "a"

-- Nicer UI
opt.termguicolors = true
opt.cursorline = false
opt.number = true

-- Get rid of Annoying viminfo file
opt.viminfo = ""
opt.viminfofile = "NONE"

-- Misc QOL
opt.smartcase = true
opt.ttimeoutlen = 5
opt.compatible = false
opt.autoread = true
opt.incsearch = true
opt.hidden = true
opt.shortmess = "atI"

opt.splitbelow = true
opt.splitright = true
opt.showmode = false
