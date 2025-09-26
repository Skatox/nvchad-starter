require("nvchad.configs.lspconfig").defaults()


require('lspconfig').intelephense.setup({
    root_dir = function()
        return vim.loop.cwd() -- Sets the current working directory as the root
    end,
    -- Optional: Pass Intelephense specific initialization options
    init_options = {
    },
})

local servers = { "html", "cssls", "ts_ls", "intelephense", "vue_ls" }
vim.lsp.enable(servers)


