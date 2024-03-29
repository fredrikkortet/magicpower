-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

    -- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    -- Theme
	use({ 
		'folke/tokyonight.nvim',
        --config = function()
		--	vim.cmd('colorscheme tokyonight-moon')
		--end
	})

    -- Treesitter highlight
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- Undo
	use('mbbill/undotree')

    -- Color highlight
    use('norcalli/nvim-colorizer.lua')

    -- Git
	use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')

    -- Zen mode
    use('folke/zen-mode.nvim')

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }

    -- Buffer line
    use({
        'akinsho/nvim-bufferline.lua',
        tag = "v3.*",
        requires = 'kyazdani42/nvim-web-devicons',
    })
    -- LSP with lsp-zero
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
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
	}

end)
