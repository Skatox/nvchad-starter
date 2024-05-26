-- Changing the default f keyword
vim.api.nvim_set_keymap('', '<Leader>f', "<cmd>lua require'hop'.hint_char1()<cr>", {})

-- Pattern Matching with t keyword
vim.api.nvim_set_keymap('n', '<Leader>t', "<cmd>HopPattern<CR>", {noremap = true})
