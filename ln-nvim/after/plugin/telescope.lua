local bn = require 'telescope.builtin'

-- Standard Telescope windows
vim.keymap.set('n', '<leader>ff', function() bn.find_files() end)
vim.keymap.set('n', '<leader><leader>', function() bn.buffers() end)
vim.keymap.set('n', '<leader>/', function() bn.current_buffer_fuzzy_find() end)
vim.keymap.set('n', '<leader>f/', function() bn.live_grep() end)

vim.keymap.set('n', '<leader>fd', function() bn.diagnostics() end)

-- telescope Git

vim.keymap.set('n', '<leader>fgc', function ()
    bn.git_commits()
end)

vim.keymap.set('n', '<leader>fgs', function ()
    bn.git_status()
end)

-- Todo plugin

vim.keymap.set('n', '<leader>ft', function ()
    vim.cmd 'TodoTelescope'
end)
