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
    opts = function()
      return require "configs.formatter"
    end
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
  { "mg979/vim-visual-multi" },
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
  -- IA toodadls
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
  --                   suggestion_color = {gui = "#808080", cterm = 244},
  --        exclude_filetypes = {"TelescopePrompt"}
  --     })
  --   end,
  -- },
  {
    "github/copilot.vim",
    lazy = false,
    -- config = function()
    --   vim.g.copilot_no_tab_map = true;
    --   vim.g.copilot_assume_mapped = true;
    -- end
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
  {
    "swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "<c-h>", "<cmd>ZellijNavigateLeftTab<cr>",  { silent = true, desc = "navigate left or tab"  } },
      { "<c-j>", "<cmd>ZellijNavigateDown<cr>",  { silent = true, desc = "navigate down"  } },
      { "<c-k>", "<cmd>ZellijNavigateUp<cr>",    { silent = true, desc = "navigate up"    } },
      { "<c-l>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "navigate right or tab" } },
    },
    opts = {},
  }  -- {
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
