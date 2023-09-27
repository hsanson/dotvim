local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

lazy.setup({
  spec = {
    -- Colorscheme:
    -- The colorscheme should be available when starting Neovim.
    {
      'rebelot/kanagawa.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        require("kanagawa").setup({
          compile = true,
          commentStyle = { italic = true },
          transparent = true,
          dimInactive = true,
          -- Themes wave, lotus, or dragon
          theme = 'dragon'
        })
      end
    },

    -- other colorschemes:
    {
      'navarasu/onedark.nvim',
      lazy = true,
      priority = 1000,
      config = function()
        require("kanagawa").setup({
          -- styles: dark, darker, cool, deep, warm, warmer, light
          style = 'darker',
          colors = { fg = '#b2bbcc' }, --default: #a0a8b7
        })
      end
    },

    { 'tanvirtin/monokai.nvim', lazy = true },
    { 'https://github.com/rose-pine/neovim', name = 'rose-pine', lazy = true },

    -- Icons
    { 'nvim-tree/nvim-web-devicons', lazy = true },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      dependencies = {
        'nvim-treesitter/nvim-treesitter',
      },
    },

    -- Telescope
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    {
       'nvim-telescope/telescope.nvim',
       branch = '0.1.x',
       dependencies = {
         'nvim-treesitter/nvim-treesitter',
         'nvim-tree/nvim-web-devicons',
         'nvim-lua/plenary.nvim',
         'BurntSushi/ripgrep',
         'nvim-telescope/telescope-fzf-native.nvim'
       }
    },

    -- Rnvimr
    {
      "kevinhwang91/rnvimr",
      keys = {
        { "-", "<cmd>RnvimrToggle<cr>", desc = "Open Ranger" }
      },
      config = function()
        vim.g.rnvimr_enable_ex = 1
        vim.g.rnvimr_enable_picker = 1
        vim.g.rnvimr_enable_bw = 1
      end,
    },

  }
})
