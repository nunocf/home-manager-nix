-- Functional wrapper for mapping custom keybindings
local function keymap(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Retain clipboard after pasting visually
keymap("v", "p", '"_dP', opts)

-- NvimTree File Explorer
keymap("v", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
