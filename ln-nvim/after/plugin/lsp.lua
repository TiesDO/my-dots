-- setup mason
require 'mason-lspconfig'.setup({
})

-- NOTE: Mason configuration

require 'mason'.setup {}

-- NOTE: LSP configuration

require('mason-lspconfig').setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end
}

-- LSP keybindings
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float,
    { desc = "Show diagnostic message", noremap = true, silent = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
    { desc = "Goto previous diagnostic message", noremap = true, silent = true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
    { desc = "Goto next diagnostic message", noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist,
    { desc = "Open local diagnostic list", noremap = true, silent = true })

local on_attach = function(_, bufnr)
    local bufopts = function(description)
        return { noremap = true, silent = true, buffer = bufnr, desc = description }
    end

    vim.opt.signcolumn = "yes"
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts("Goto declaration"))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts("Goto definition"))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts("Hover, show documentation"))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts("Goto implementation"))
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts("View signature help"))
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts("Add workspace folder"))
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts("Remove workspace folder"))
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts("List workspace folders"))
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts("Show type definition"))
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts("Rename symbol"))
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts("Code Actions"))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts("Goto buffer references"))
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts("Format buffer"))
end

-- NOTE: Linter configuration

require('mason-null-ls').setup({
    ensure_installed = { 'prettier' }
})

require 'mason-null-ls'.setup_handlers {
    function(source_name, methods)
        require("mason-null-ls.automatic_setup")(source_name, methods)
    end,
}

require 'null-ls'.setup()

-- NOTE: DAP configuration

require('mason-nvim-dap').setup({
    automatic_setup = true
})

local dap = require 'dap'

require 'mason-nvim-dap'.setup_handlers {
    function(source_name)
        require('mason-nvim-dap.automatic_setup')(source_name)
    end
}

require 'nvim-dap-virtual-text'.setup()

vim.diagnostic.config({
    underline = {
        severity = { min = vim.diagnostic.severity.WARN }
    },
    virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR }
    },
    update_in_insert = true
})

-- keybindings

vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = "Continue Debugging" })
vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = "Step Over" })
vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = "Step Into" })
vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = "Step Out" })
vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })

-- NOTE: CMP configuration

local cmp = require 'cmp'
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local luasnip = require 'luasnip'

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

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
        },
    },
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'path' },
        }, {
            { name = 'buffer', keyword_length = 5 }
        }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
})

local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

vim.keymap.set('i', '<C-n>', function() luasnip.jump(1) end, { noremap = true, silent = true })
vim.keymap.set('s', '<C-n>', function() luasnip.jump(1) end, { noremap = true, silent = true })
vim.keymap.set('i', '<C-p>', function() luasnip.jump(-1) end, { noremap = true, silent = true })
vim.keymap.set('s', '<C-p>', function() luasnip.jump(-1) end, { noremap = true, silent = true })
