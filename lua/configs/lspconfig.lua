require("nvchad.configs.lspconfig").defaults()

vim.lsp.config('copilot', {
  settings = {
    telemetry = {
      telemetryLevel = "off",
    }
  }
})

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "vue_ls",
  "lua_ls",
  "intelephense",
  "copilot"
}
vim.lsp.enable(servers)


local map = vim.keymap.set

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local buffer = ev.buf

    if client then
      -- Enable completion
      if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
        vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
        vim.lsp.completion.enable(true, client.id, buffer, { autotrigger = true })
        map('i', '<C-Space>',
          function()
            vim.lsp.completion.get()
          end,
          { desc = "Trigger lsp completion" }
        )
      end

      -- Enable LLM-based inline completion
      if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion) then
        vim.lsp.inline_completion.enable(true, { bufnr = buffer })
        map("i", "<Tab>",
          function()
            if not vim.lsp.inline_completion.get() then
              return "<Tab>"
            end
          end,
          { expr = true, replace_keycodes = true, desc = "Apply the currently displayed completion suggestion" }
        )
        map("i", "<M-n>",
          function()
            vim.lsp.inline_completion.select({})
          end,
          { desc = "Show next inline completion suggestion", }
        )
        map("i", "<M-p>",
          function()
            vim.lsp.inline_completion.select({ count = -1 })
          end,
          { desc = "Show previous inline completion suggestion", }
        )
      end

      -- Add normal-mode keymappings for signature help
      if client:supports_method('textDocument/signatureHelp') then
        map('n', '<C-s>',
          function()
            vim.lsp.buf.signature_help()
          end,
          { desc = "Trigger lsp signature help" }
        )
      end

      -- Auto-format on save
      if client:supports_method('textDocument/formatting') then
        vim.api.nvim_create_autocmd('BufWritePre', {
          buffer = buffer,
          callback = function()
            vim.lsp.buf.format({ bufnr = buffer, id = client.id })
          end,
        })
      end
    end
  end
})
