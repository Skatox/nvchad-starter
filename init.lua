vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

vim.schedule(function()
  require "options"
  require "autocmds"
  require "mappings"
end)

-- Miguel's customizations
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%s %{v:relnum} %{v:lnum}"
vim.g.neovide_scale_factor = 1.5
vim.g.neovide_input_macos_option_key_is_meta = true
vim.g.copilot_node_command = "~/.asdf/installs/nodejs/24.10.0/bin/node"

vim.opt.termguicolors = true



-- ===================================
-- Colemak Layout Detection and Remaps
-- (macOS Only) 🖥️
-- ===================================

-- 1. Check if the OS is macOS (Kernel name is 'Darwin')
if vim.loop.os_uname().sysname == "Darwin" then
  local function is_colemak()
    -- The macOS-specific command to read the active keyboard layout from preferences
    local command =
    "defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' | sed -E 's/^.+ = \"?([^\"\"]+)\"?;$/\\1/'"

    -- Execute the shell command and capture the output
    local layout_output = vim.fn.system(command)

    -- Check if the output contains "Colemak"
    return layout_output:match('Colemak') ~= nil
  end

  -- 2. If on macOS, check the layout and apply remaps
  if is_colemak() then
    vim.notify("macOS & Colemak detected. Applying custom navigation remaps (h, n, e, i).", vim.log.levels.INFO)

    local colemak_opts = { noremap = true, silent = true }

    -- Core Movement Remaps (H, N, E, I -> Left, Down, Up, Right)
    vim.keymap.set({ 'n', 'v', 's' }, 'n', 'j', colemak_opts) -- Colemak 'n' -> QWERTY 'j' (Down)
    vim.keymap.set({ 'n', 'v', 's' }, 'e', 'k', colemak_opts) -- Colemak 'e' -> QWERTY 'k' (Up)
    vim.keymap.set({ 'n', 'v', 's' }, 'i', 'l', colemak_opts) -- Colemak 'i' -> QWERTY 'l' (Right)
  end
else
  -- On Linux, Windows, or any other OS, this block does nothing,
  -- leaving the default 'hjkl' and other mappings untouched.
  -- You can add a notification here if you want:
  -- vim.notify("Not on macOS. Skipping Colemak remaps.", vim.log.levels.INFO)
end


vim.schedule(function()
  require('nvim-tree').setup()
  require("hardtime").setup()
  require("overseer").setup()
end)
