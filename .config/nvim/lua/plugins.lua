local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'editorconfig/editorconfig-vim'
  -- use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'kylechui/nvim-surround'

  use 'arcticicestudio/nord-vim'

  use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'jremmen/vim-ripgrep'
  use 'kien/ctrlp.vim'

  use 'sheerun/vim-polyglot'

  use 'wakatime/vim-wakatime'

  -- use 'diepm/vim-rest-console'

  use {'neoclide/coc.nvim', branch = 'release'}
  use 'dense-analysis/ale'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'simrat39/symbols-outline.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      auto_open = true,
      auto_close = true
    }
  end
  }
end)
