-- Functional wrapper for mapping custom keybindings
function keymap(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Retain clipboard after pasting visually
keymap("v", "p", '"_dP', opts)
