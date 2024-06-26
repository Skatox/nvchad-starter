return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "js-debug-adapter",
        "prettier",
        "typescript-language-server"
      }
    }
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "phaazon/hop.nvim",
    lazy=false,
    config = function()
      require'hop'.setup {}
      require "configs.hop-config"
    end,
  },
  { "michaeljsmith/vim-indent-object" },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "christoomey/vim-tmux-navigator",
    config = function()
      require "configs.tmux"
    end,
  },

  -- IDE
  -- {
  --   "amiorin/vim-project",
  --   lazy = false,
  --   config = function()
  --       vim.cmd("source ~/.config/nvim/lua/custom/configs/vim-project.nvim")
  --   end,
  -- },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    "coffebar/neovim-project",
    opts = {
      projects = { -- define project roots
        "~/Sites/*",
        "/var/www/*",
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
  },
  {
    "tpope/vim-obsession",
    lazy = false,
  },
  { "dyng/ctrlsf.vim" },
  { "Yggdroot/indentLine"},
  { 
    "inkarkat/vim-ReplaceWithRegister",
    lazy = false,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
    config = function()
      require "configs.visual-multi"
    end,
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function (options)
      return require "configs.formatter"
    end
  },
  { "mhinz/vim-signify" },
  {
    "mfussenegger/nvim-dap",
    config = function ()
      require "configs.dap"
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    "tommcdo/vim-exchange",
    lazy = false,
  },
  -- {
  --   "codota/tabnine-nvim",
  --   lazy = false,
  --   build = "./dl_binaries.sh",
  --   config = function()
  --     require('tabnine').setup({
  --        disable_auto_comment=true,
  --        accept_keymap="<Tab>",
  --        dismiss_keymap = "<C-]>",
  --        debounce_ms = 800,
  --        suggestion_color = {gui = "#808080", cterm = 244},
  --        exclude_filetypes = {"TelescopePrompt"}
  --     })
  --   end,
  -- },
  {
    "github/copilot.vim",
    lazy = false
  },
  {
    'mvllow/modes.nvim',
    tag = 'v0.2.0',
    lazy = false,
    config = function()
       require('modes').setup()
    end
  },
  -- Overrides default config
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- PHP
  { "adoy/vim-php-refactoring-toolbox" },
  {
    "stephpy/vim-php-cs-fixer",
    ft = "php"
  },

  -- JS
  { "maxmellon/vim-jsx-pretty" },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end
  },
  {
    "Galooshi/vim-import-js",
    lazy = false,
  },
-- Improve VIM usage
  {
     "m4xshen/hardtime.nvim",
     dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
     opts = {}
  },
  {
    "tris203/precognition.nvim",
    --event = "VeryLazy",
    config = {
    -- startVisible = true,
    -- showBlankVirtLine = true,
    -- highlightColor = { link = "Comment" },
    -- hints = {
    --      Caret = { text = "^", prio = 2 },
    --      Dollar = { text = "$", prio = 1 },
    --      MatchingPair = { text = "%", prio = 5 },
    --      Zero = { text = "0", prio = 1 },
    --      w = { text = "w", prio = 10 },
    --      b = { text = "b", prio = 9 },
    --      e = { text = "e", prio = 8 },
    --      W = { text = "W", prio = 7 },
    --      B = { text = "B", prio = 6 },
    --      E = { text = "E", prio = 5 },
    -- },
    -- gutterHints = {
    --     -- prio is not currently used for gutter hints
    --     G = { text = "G", prio = 1 },
    --     gg = { text = "gg", prio = 1 },
    --     PrevParagraph = { text = "{", prio = 1 },
    --     NextParagraph = { text = "}", prio = 1 },
    -- },
    },
  }
}
