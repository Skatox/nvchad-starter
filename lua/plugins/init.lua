return {
  -- Code formatting
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
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
    "mhartington/formatter.nvim",
    event = "VeryLazy",
  },

  -- Code edition
  {
    "tpope/vim-commentary"
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "tommcdo/vim-exchange",
    lazy = false,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  { "inkarkat/vim-ReplaceWithRegister" },

  -- Code navigation
  {
    'smoka7/hop.nvim',
    version = "*",
    lazy=false,
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    },
    config = function()
      require'hop'.setup {}
      require "configs.hop-config"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    config = function()
      require "configs.tmux"
    end,
  },

  -- Control version
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
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    opts = {
        enabled = false,
        message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
        date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
        virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
    },
  },
  { "mhinz/vim-signify" },
  -- Task Manager
  {
    'stevearc/overseer.nvim',
    opts = {},
  },
  -- IDE
  { "airblade/vim-rooter" },
  {
    "coffebar/neovim-project",
    opts = {
      projects = { -- define project roots
        "~/Developer/*",
        "~/Sites/*",
        "/var/www/*",
      },
      last_session_on_startup = false,
      picker = {
        type = "telescope",
      }
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
      require("nvim-tree").setup {}
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
    "MaximilianLloyd/tw-values.nvim",
    keys = {
        { "<leader>sv", "<cmd>TWValues<cr>", desc = "Show tailwind CSS values" },
    },
    opts = {
        border = "rounded", -- Valid window border style,
        show_unknown_classes = true, -- Shows the unknown classes popup
        focus_preview = true, -- Sets the preview as the current window
        copy_register = "", -- The register to copy values to,
        keymaps = {
            copy = "<C-y>"  -- Normal mode keymap to copy the CSS values between {}
        }
    }
},
  {
    "mfussenegger/nvim-dap",
    config = function ()
      require "configs.dap"
    end
  },
  { "tpope/vim-obsession" },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  -- IA Tools
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
       -- vim.g.copilot_no_tab_map = true;
       -- vim.g.copilot_assume_mapped = true;
    end
  },
  {
    "xTacobaco/cursor-agent.nvim",
    config = function()
      vim.keymap.set("n", "<leader>ca", ":CursorAgent<CR>", { desc = "Cursor Agent: Toggle terminal" })
      vim.keymap.set("v", "<leader>ca", ":CursorAgentSelection<CR>", { desc = "Cursor Agent: Send selection" })
      vim.keymap.set("n", "<leader>cA", ":CursorAgentBuffer<CR>", { desc = "Cursor Agent: Send buffer" })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
     dependencies = {
       { "nvim-lua/plenary.nvim", branch = "master" },
     },
     build = "make tiktoken",
     opts = { },
  },
  -- Nvim UI
  {
    'mvllow/modes.nvim',
    tag = 'v0.2.0',
    lazy = false,
    config = function()
      require('modes').setup({
      colors = {
          bg = "", -- Optional bg param, defaults to Normal hl group
          copy = "#f5c359",
          delete = "#c75c6a",
          insert = "#78ccc5",
          visual = "#9745be",
        },

        -- Set opacity for cursorline and number background
        line_opacity = 0.15,

        -- Enable cursor highlights
        set_cursor = true,

        -- Enable cursorline initially, and disable cursorline for inactive windows
        -- or ignored filetypes
        set_cursorline = true,

        -- Enable line number highlights to match cursorline
        set_number = true,

        -- Disable modes highlights in specified filetypes
        -- Please PR commonly ignored filetypes
        ignore_filetypes = { 'NvimTree', 'TelescopePrompt' }
      });
    end
  },
  -- {
  --   "rcarriga/nvim-notify",
  --   opts = {
  --     timeout = 5000,
  --     background = "#FFFFFF";
  --     render = "wrapped-compact",
  --   },
  -- },
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     -- "rcarriga/nvim-notify",
  --     }
  -- },
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
     opts = {
       disabled_keys = {
         ["<Up>"] = {"n"},
         ["<Down>"] = {"n"},
         ["<Left>"] = {"n"},
         ["<Right>"] = {"n"},
       },
     }
  },
  -- {
  --   "tris203/precognition.nvim",
  --   event = "VeryLazy",
  --   config = {
  --    startVisible = true,
  --    showBlankVirtLine = true,
  --    highlightColor = { link = "Comment" },
  --     hints = {
  --         Caret = { text = "^", prio = 2 },
  --         Dollar = { text = "$", prio = 1 },
  --         MatchingPair = { text = "%", prio = 5 },
  --         Zero = { text = "0", prio = 1 },
  --         w = { text = "w", prio = 10 },
  --         b = { text = "b", prio = 9 },
  --         e = { text = "e", prio = 8 },
  --         W = { text = "W", prio = 7 },
  --         B = { text = "B", prio = 6 },
  --         E = { text = "E", prio = 5 },
  --    },
  --    gutterHints = {
  --        -- prio is not currently used for gutter hints
  --        G = { text = "G", prio = 1 },
  --        gg = { text = "gg", prio = 1 },
  --        PrevParagraph = { text = "{", prio = 1 },
  --        NextParagraph = { text = "}", prio = 1 },
  --    },
  --   },
  --  }
}
