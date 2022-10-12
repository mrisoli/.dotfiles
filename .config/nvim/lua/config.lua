vim.g.ctrlp_map = '<c-p>'
vim.g.ctrlp_cmd = 'CtrlPMRU'
vim.g.ale_completion_enabled = 1
vim.g.ale_sign_error = ' '
vim.g.ale_sign_warning = '⚠ '
vim.g.ale_fix_on_save = 1

vim.cmd "colorscheme dracula"

vim.cmd "source ~/.config/nvim/coc.vim"

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  open_on_setup = true,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "html",
    "scss"
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsename = { "javascript", "typescript.tsx" }

require("nvim-surround").setup()

require('colorizer').setup()

require('leap')
