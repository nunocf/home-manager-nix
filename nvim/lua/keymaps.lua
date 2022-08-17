-- Functional wrapper for mapping custom keybindings
local function keymap(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Retain clipboard after pasting visually
keymap("v", "p", '"_dP')

-- NvimTree File Explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope keybinds
keymap("n", "<leader>f", ":Telescope find_files<CR>")
keymap("n", "<leader>st", ":Telescope live_grep<CR>")

-- stop highlighting with <CR> 
keymap("n", "<CR>", ":noh<CR><CR>", {noremap = true})

