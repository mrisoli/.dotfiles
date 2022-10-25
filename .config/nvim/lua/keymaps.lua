vim.api.nvim_set_keymap('n', '<Leader>s', ':%s/\\<<C-r><C-w>\\>/', { noremap = true })
vim.api.nvim_set_keymap('n', '=j', ':%!python -m json.tool<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>g', ':Rg<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>.', ':CtrlPTag<cr>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-k>', '<Plug>(ale_previous_wrap)', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<Plug>(ale_next_wrap)', { noremap = false, silent = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})

vim.keymap.set('n', '-', '<Plug>(leap-forward)', {})
vim.keymap.set('n', '_', '<Plug>(leap-backward)', {})
