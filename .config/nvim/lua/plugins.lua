require("lazy").setup({

  'github/copilot.vim',
  'editorconfig/editorconfig-vim',
  'tpope/vim-fugitive',
  'kylechui/nvim-surround',
  'wakatime/vim-wakatime',

  { "catppuccin/nvim", name = "catppuccin" },


  'jremmen/vim-ripgrep',
  'kien/ctrlp.vim',

  'pantharshit00/vim-prisma',
  'leafgarland/typescript-vim',
  'vim-crystal/vim-crystal',


  'nvim-tree/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',
  'simrat39/symbols-outline.nvim',

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },

  { 'ibhagwan/fzf-lua', dependencies = 'nvim-tree/nvim-web-devicons'},

  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/vim-vsnip',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        auto_open = true,
        auto_close = true,
      }
    end
  },

  'norcalli/nvim-colorizer.lua',

  'gennaro-tedesco/nvim-peekup',
  'ggandor/leap.nvim',

})
