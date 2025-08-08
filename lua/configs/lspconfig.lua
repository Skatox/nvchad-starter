require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "inteliphense", "volar" }
vim.lsp.enable(servers)

