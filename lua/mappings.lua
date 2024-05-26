require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


-- HOP
map("n", "<leader>w", "<cmd>HopWord<CR>", { desc  = "Easy motion" })

-- DAP
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc  = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd> DapContinue<CR>", { desc  = "Run or continue the debugger" })

-- nvimtree
map("n", "<F4>", "<cmd> NvimTreeToggle <CR>", { desc  = "toggle nvimtree" })
map("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", { desc  = "focus nvimtree" })

-- comment_additional and toggle it in both modes
map("n", "gcc", function()
  require("Comment.api").toggle.linewise.current()
end, { desc  = "toggle comment" })

map("v","gcc", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc  = "toggle comment" })


-- tabs
map("n", "gt", function()
  require("nvchad.tabufline").next()
end, { desc  = "goto next buffer" })
map("n", "gT", function()
  require("nvchad.tabufline").prev()
end, { desc  = "goto prev buffer" })

-- close buffer + hide terminal buffer
map ("n", "gx", function()
  require("nvchad.tabufline").close_buffer()
end, { desc  = "close buffer" })

-- ctrl_p
map("n", "<C-p>", "<cmd> Telescope find_files <CR>", { desc  = "find files" })
map("n", "<D-p>", "<cmd> Telescope find_files <CR>",{ desc  =  "find files" })
map("n", "<C-S-p>", "<cmd> Telescope live_grep <CR>", { desc  = "find in files" })
map("n", "<D-S-p>", "<cmd> Telescope live_grep <CR>", { desc  = "find in files" })