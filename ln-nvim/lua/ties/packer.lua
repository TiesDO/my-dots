vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use 'wbthomason/packer.nvim'

    -- CORE

    -- file finding
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = { 'TSUpdate' }
    }

    -- Tree view
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        tag = 'nightly'
    }

    -- lua line
    use { 'nvim-lualine/lualine.nvim' }

    -- lsp
    use { 'neovim/nvim-lspconfig' }

    -- auto complete
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }

    use { "L3MON4D3/LuaSnip" }
    use { 'saadparwaiz1/cmp_luasnip' }

    -- sources
    use { 'hrsh7th/cmp-path' }

    -- automatic lsp install / config
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }

    -- dap
    use { 'mfussenegger/nvim-dap' }
    use { 'jay-babu/mason-nvim-dap.nvim' }
    use { 'theHamsta/nvim-dap-virtual-text' }

    -- formatting and linting
    use { 'jose-elias-alvarez/null-ls.nvim' }
    use { 'jay-babu/mason-null-ls.nvim' }

    -- Terminal
    
    use {"akinsho/toggleterm.nvim", tag = '*' }

    -- UTIL
    use { 'terrortylor/nvim-comment' }
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use { 'folke/which-key.nvim' }
    use { 'folke/todo-comments.nvim' }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'manzeloth/live-server' }

    -- Scratchpad
    use { 'metakirby5/codi.vim' }

    -- THEME
    use({
        'projekt0n/github-nvim-theme',
        tag = 'v0.0.7',
    })
end)
