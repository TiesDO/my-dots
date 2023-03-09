
-- NOTE: NvimTree configuration

require("nvim-tree").setup({
    renderer = {
    icons = {
      show = {
        git = true,
	file = true,
	folder = true,
	folder_arrow = true,
      },
      glyphs = {
        folder = {
          arrow_closed = "⏵",
          arrow_open = "⏷",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "⌥",
          renamed = "➜",
          untracked = "★",
          deleted = "⊖",
          ignored = "◌",
        },
      },
    },
  },
  actions = {
      open_file = {
          quit_on_open = true
      }
  }
})

-- open Treeview when vim is opened with dir as argument
local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  vim.cmd.cd(data.file)

  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.keymap.set('n', '<leader>p', require'nvim-tree.api'.tree.toggle, { desc = "Toggle treeview" })
