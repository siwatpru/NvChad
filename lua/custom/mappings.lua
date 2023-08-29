---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>gg"] = { "<cmd> Neogit <CR>", "Neogit" },

    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "window up" },

  },
  i = {
    ["<C-\\>"] = {
      function()vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')  end,
      "Copilot Accept",
      {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
    }
  }
}


        -- imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
        -- let g:copilot_no_tab_map = v:true

-- more keybinds!

return M
