require 'lualine'.setup()

-- empty setup using defaults
require("nvim-tree").setup({
    prefer_startup_root = true,
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

vim.keymap.set('n', '<leader>p', require'nvim-tree.api'.tree.toggle)

local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  vim.cmd.cd(data.file)

  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
