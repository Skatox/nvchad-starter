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
  "copilot",
}

-- Enable built-in and commonly available servers
vim.lsp.enable(servers)

-- Configure optional servers that may not be installed yet
pcall(function() vim.lsp.enable { "pylsp" } end)
pcall(function() vim.lsp.enable { "marksman" } end)


local map = vim.keymap.set

local format_on_save_group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = false })
local format_on_save_skip_ft = {
  javascript = true,
  javascriptreact = true,
  typescript = true,
  typescriptreact = true,
  vue = true,
}

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
        -- Only one autocmd per buffer; multiple LSP clients can attach.
        vim.api.nvim_clear_autocmds({ group = format_on_save_group, buffer = buffer })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = format_on_save_group,
          buffer = buffer,
          callback = function()
            local ft = vim.bo[buffer].filetype
            if format_on_save_skip_ft[ft] then
              return
            end

            vim.lsp.buf.format({ bufnr = buffer })
          end,
        })
      end
    end
  end
})
