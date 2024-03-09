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

require("lazy").setup({
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },

    {
        "folke/neoconf.nvim",
        cmd = "Neoconf",
    },

    "folke/neodev.nvim",

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = 'nvim-lua/plenary.nvim',
    },

    {--Theme
        'folke/tokyonight.nvim',
        --config = function()
        --	vim.cmd('colorscheme tokyonight-moon')
        --end
    },

    {-- Treesitter highlight
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

    -- Undo
    'mbbill/undotree',

    -- Color highlight
    'norcalli/nvim-colorizer.lua',

    -- Git
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',

    -- Zen mode
    'folke/zen-mode.nvim',

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
    },

    -- Buffer line
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'kyazdani42/nvim-web-devicons',
    },
    -- LSP with lsp-zero
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    },
})
