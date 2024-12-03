local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('i', 'jj', '<ESC>', opts)
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohl<CR>', opts)
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
