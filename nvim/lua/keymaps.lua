-- Functional wrapper for mapping custom keybindings
local function keymap(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- split vertical
keymap("n", "<leader>vs", ":vsplit<CR><C-6>")

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")
keymap("n", "<leader><leader>", "<C-6>")

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l")

-- Retain clipboard after pasting visually
keymap("v", "p", '"_dP')

-- NvimTree File Explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope keybinds
keymap("n", "<leader>f", ":Telescope find_files<CR>")
keymap("n", "<leader>st", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- stop highlighting with <CR>
keymap("n", "<CR>", ":noh<CR><CR>", { noremap = true })

-- Diagnostics
keymap('n', '<leader>X', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
keymap('n', '<leader>x', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })

-- Lazygit
keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
keymap('n', '<leader>lr', ':LspRestart<CR>', { noremap = true, silent = true })

-- Copy filename/filepath
keymap('n', '<leader>cf', ':let @+=expand("%")<CR>', { noremap = true, silent = true })
keymap('n', '<leader>cp', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })
