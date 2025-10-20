require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html", 
  "cssls", 
  "ts_ls", 
  "vue_ls",
  "intelephense"
}
vim.lsp.enable(servers)

