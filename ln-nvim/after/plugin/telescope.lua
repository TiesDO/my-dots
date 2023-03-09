
-- NOTE: Telescope configuration

local bn = require 'telescope.builtin'

vim.keymap.set('n', '<leader>ff', function() bn.find_files() end, { desc = "Find all Files" })
vim.keymap.set('n', '<leader><leader>', function() bn.buffers() end, { desc = "Show buffer files" })
vim.keymap.set('n', '<leader>/', function() bn.current_buffer_fuzzy_find() end, { desc = "FzF current buffer" })
vim.keymap.set('n', '<leader>f/', function() bn.live_grep() end, { desc = "FzF workspace" })
vim.keymap.set('n', '<leader>fd', function() bn.diagnostics() end, { desc = "Find diagnostics" })
vim.keymap.set('n', '<leader>fgc', function() bn.git_commits() end, { desc = "Find git commits" })
vim.keymap.set('n', '<leader>fgs', function() bn.git_status() end, { desc = "Find git status" })
vim.keymap.set('n', '<leader>ft', function() vim.cmd 'TodoTelescope' end, { desc = "Find Todo's" })
