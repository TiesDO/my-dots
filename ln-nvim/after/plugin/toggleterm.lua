local term = require 'toggleterm'

term.setup({
    -- size can be a number or function which is passed the current terminal
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
})

-- vim.keymap.set('n', '<leader>tf', function() vim.cmd 'ToggleTerm direction=float' end)
vim.keymap.set('n', '<leader>tf', [[<Cmd>ToggleTerm direction=float<CR>]])
vim.keymap.set('n', '<leader>tv', function() vim.cmd 'ToggleTerm direction=vertical' end)
vim.keymap.set('n', '<leader>th', function() vim.cmd 'ToggleTerm direction=horizontal' end)

vim.keymap.set('t', '<C-\\>', [[<C-\><C-n>]])
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]])
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]])
