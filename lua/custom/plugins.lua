local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end,
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
    },
    config = true,
    lazy = false,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
    },
    lazy = false,
    config = function()
      require("telescope").load_extension "harpoon"

      local mark = require "harpoon.mark"
      local ui = require "harpoon.ui"

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
      vim.keymap.set("n", "<leader>h", function()
        ui.nav_file(1)
      end)
      vim.keymap.set("n", "<leader>j", function()
        ui.nav_file(2)
      end)
      vim.keymap.set("n", "<leader>k", function()
        ui.nav_file(3)
      end)
      vim.keymap.set("n", "<leader>l", function()
        ui.nav_file(4)
      end)
      vim.keymap.set("n", "<leader>;", function()
        ui.nav_file(5)
      end)
    end,
  },

  {
    "siwatpru/git-worktree.nvim",
    lazy = false,
    branch = "catch-and-handle-telescope-related-error",
    config = function()
      require("telescope").load_extension "git_worktree"

      require("git-worktree").setup {
        change_directory_command = "cd",
        update_on_change = true,
        update_on_change_command = "e .",
        clearjumps_on_change = true,
        autopush = false,
      }

      -- require('git-worktree').on_tree_change(function(op, metadata)
      --   if op == require('git-worktree').Operations.Switch then
      --     -- Change shell directory to the git root
      --     vim.cmd("cd! " .. metadata.path)
      --     print("Changed to worktree: " .. metadata.path)
      --   end
      -- end)
      --
      -- :lua
      vim.keymap.set("n", "<leader>gw", function()
        require("telescope").extensions.git_worktree.git_worktrees()
      end)
      vim.keymap.set("n", "<leader>ga", function()
        require("telescope").extensions.git_worktree.create_git_worktree()
      end)
    end,
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  {
    "folke/neodev.nvim",
  },

  {
    "Bekaboo/dropbar.nvim",
    lazy = false,
  },

  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    version = "*",
    config = true,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",

      -- Test runners
      "haydenmeade/neotest-jest",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-jest" {
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.js",
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          },
          require "neotest-rust",
          require "neotest-python",
        },
      }
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
