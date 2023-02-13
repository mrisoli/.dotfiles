vim.g.ctrlp_map = '<c-p>'
vim.g.ctrlp_cmd = 'CtrlPMRU'

vim.cmd.colorscheme "catppuccin-mocha"

require("nvim-tree").setup({
  sort_by = "case_sensitive",
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

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

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
    "lua",
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

require('lualine').setup{
  options = { theme = "catppuccin" }
}

require("symbols-outline").setup()
vim.g.symbols_outline = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = true,
  position = 'right',
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  keymaps = { -- These keymaps can be a string or a table for multiple keys
  close = {"<Esc>", "q"},
  goto_location = "<Cr>",
  focus_location = "o",
  hover_symbol = "<C-space>",
  toggle_preview = "K",
  rename_symbol = "r",
  code_actions = "a",
},
lsp_blacklist = {},
symbol_blacklist = {},
symbols = {
  File = {icon = "", hl = "TSURI"},
  Module = {icon = "", hl = "TSNamespace"},
  Namespace = {icon = "", hl = "TSNamespace"},
  Package = {icon = "", hl = "TSNamespace"},
  Class = {icon = "𝓒", hl = "TSType"},
  Method = {icon = "ƒ", hl = "TSMethod"},
  Property = {icon = "", hl = "TSMethod"},
  Field = {icon = "", hl = "TSField"},
  Constructor = {icon = "", hl = "TSConstructor"},
  Enum = {icon = "ℰ", hl = "TSType"},
  Interface = {icon = "ﰮ", hl = "TSType"},
  Function = {icon = "", hl = "TSFunction"},
  Variable = {icon = "", hl = "TSConstant"},
  Constant = {icon = "", hl = "TSConstant"},
  String = {icon = "𝓐", hl = "TSString"},
  Number = {icon = "#", hl = "TSNumber"},
  Boolean = {icon = "⊨", hl = "TSBoolean"},
  Array = {icon = "", hl = "TSConstant"},
  Object = {icon = "⦿", hl = "TSType"},
  Key = {icon = "🔐", hl = "TSType"},
  Null = {icon = "NULL", hl = "TSType"},
  EnumMember = {icon = "", hl = "TSField"},
  Struct = {icon = "𝓢", hl = "TSType"},
  Event = {icon = "🗲", hl = "TSType"},
  Operator = {icon = "+", hl = "TSOperator"},
  TypeParameter = {icon = "𝙏", hl = "TSParameter"}
}
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<C-k>', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<C-j>', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})


local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " "
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.completion.spell,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

-- Set up lspconfig.
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['tsserver'].setup{
  capabilities = capabilities,
  on_attach = on_attach
}

local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end

vim.keymap.set('n', '<leader>qf', quickfix, { noremap = true, silent = true })
