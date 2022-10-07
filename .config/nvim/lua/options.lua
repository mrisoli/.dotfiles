vim.opt.nu = true
vim.opt.rnu = true
vim.opt.background = "dark"
vim.opt.backspace = "indent,eol,start"
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.backupdir = "/Users/marcelo.risoli/.config/nvim/.backup"
vim.opt.directory = "/Users/marcelo.risoli/.config/nvim/.tmp"
vim.opt.omnifunc = "ale#completion#OmniFunc"
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd({ 'BufWritePre' }, { command = '%s/\\s\\+$//e' })
-- vim.api.nvim_create_autocmd({ 'BufWritePost' }, { pattern = '*.ts,*.js', command = '!ctags . &<CR>' })