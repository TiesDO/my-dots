-- setup mason
require 'mason'.setup({
})
require 'mason-lspconfig'.setup({
})

-- always there
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.opt.signcolumn = "yes"
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- CMP setup
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require 'cmp'
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local luasnip = require 'luasnip'

-- luasnip remaps

vim.keymap.set('i', '<C-n>', function() luasnip.jump(1) end, { noremap = true, silent = true })
vim.keymap.set('s', '<C-n>', function() luasnip.jump(1) end, { noremap = true, silent = true })
vim.keymap.set('i', '<C-p>', function() luasnip.jump(-1) end, { noremap = true, silent = true })
vim.keymap.set('s', '<C-p>', function() luasnip.jump(-1) end, { noremap = true, silent = true })

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = {
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-j>'] = cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Select
        }),
            ['<C-k>'] = cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Select
        }),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<C-i>'] = cmp.mapping.confirm {
            select = true,
            behavior = cmp.ConfirmBehavior.Insert
        }
    },
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'luasnip' }
        }, {
            { name = 'buffer', keyword_length = 5 }
        }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    experimental = {
        ghost_text = { hl_group = 'comment'}
    }
})

local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

require('mason-lspconfig').setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end
}

vim.diagnostic.config({
    underline = {
        severity = { min = vim.diagnostic.severity.WARN }
    },
    virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR }
    },
    update_in_insert = true
})

-- Formatting
require('mason-null-ls').setup({
    ensure_installed = { 'prettier' }
})

require 'mason-null-ls'.setup_handlers {
    function(source_name, methods)
        require("mason-null-ls.automatic_setup")(source_name, methods)
    end,
}

require 'null-ls'.setup()

-- Dap config

require ('mason-nvim-dap').setup({
    automatic_setup = true
})

require 'mason-nvim-dap'.setup_handlers {
    function (source_name)
        require('mason-nvim-dap.automatic_setup')(source_name)
    end
}

local dap = require 'dap'

vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end)

require 'nvim-dap-virtual-text'.setup()
