
-- NOTE: Nvim Comment configuration
require 'nvim_comment'.setup()

-- NOTE: Todo Comment configuration
require 'todo-comments'.setup()

-- NOTE: Which-key configuration
require 'which-key'.setup()

-- NOTE: UFO configuration
require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
    end
})

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- keymaps
vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = "Open all Folds"})
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = "Close all Folds"})

-- NOTE: Codi Scratchpad configuration
vim.g['codi#rightalign'] = 1
vim.keymap.set('n', '<leader>ro', function() vim.cmd('Codi!!') end, { desc = "Toggle Codi" })
vim.keymap.set('n', '<leader>rp', function() vim.cmd('CodiExpand') end, { desc = "Expand Codi eval" })

