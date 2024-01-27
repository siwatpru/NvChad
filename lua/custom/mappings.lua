---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>gg"] = { "<cmd> Neogit <CR>", "Neogit" },

    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "window up" },

    -- neotest
    ["<leader>oo"] = {
      function()
        require("neotest").summary.toggle()
      end,
      'Toggle Neotest sidebar'
    },
    ["<leader>of"] = {
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      'Run test on current file'
    },
    ["<leader>or"] = {
      function()
        require("neotest").run.run()
      end,
      'Run nearest test'
    },
    ["<leader>tr"] = {
      "<cmd>TodoTelescope<cr>",
      'Open TODO list in telescope'
    },
  },
  i = {
    ["<C-\\>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

-- imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
-- let g:copilot_no_tab_map = v:true

-- more keybinds!

-- Move line in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center screen after jumping with C-d/C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center screen after next searc
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

return M
