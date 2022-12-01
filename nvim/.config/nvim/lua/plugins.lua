-- Plugin definition and loading
-- local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd
-- Boostrap Packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone','https://github.com/wbthomason/packer.nvim', install_path})
end
-- Rerun PackerCompile everytime pluggins.lua is updated
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
-- Load Packer
cmd([[packadd packer.nvim]])

-- Initialize pluggins
return require('packer').startup(function(use)
    -- Let Packer manage itself
    use({'wbthomason/packer.nvim', opt = true})
    --themes
    use 'folke/tokyonight.nvim'
    -- to be sure its installed 
    use'kyazdani42/nvim-web-devicons' -- optional, for file icon
    --statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require('plugins.lualine') end
    }
    -- bufferline
    use({
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.bufferline') end,
        event = 'BufWinEnter',
    })
    -- NeoTree
    use {
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
          "nvim-lua/plenary.nvim",
          "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
        }
    }
    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
      --requires = { { "nvim-lua/plenary.nvim" } },
      --config = function()
      --require("plugins.telescope") end,
    })
    -- Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        config = function() require('plugins.treesitter') end,
        run = ':TSUpdate'
    })
    -- dashboard
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }
    -- LSP server
    use({
        'neovim/nvim-lspconfig',
        config = function() require('plugins.lspconfig') end
    })
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    -- Autocomplete
    use "L3MON4D3/LuaSnip"  -- Snippet engine

    use({
        "hrsh7th/nvim-cmp",
        -- Sources for nvim-cmp
        requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip",
        },
        config = function() require('plugins.cmp') end,
    })
    if packer_bootstrap then
        require('packer').sync()
    end
end)
