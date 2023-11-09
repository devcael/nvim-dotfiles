local status, nvim_lsp = pcall(require, 'lspconfig')

if (not status) then
  return
end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- Formatting
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
    vim.api.nvim_command [[augroup END]]
  end
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  settings = {
    completions = {
      completeFunctionCalls = true
    }
  }
}
