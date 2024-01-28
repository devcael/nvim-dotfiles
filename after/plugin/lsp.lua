require("nvim-lsp-installer").setup({
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})


local lsp_format_on_save = function(bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_format_on_save(bufnr);

  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({
})

require('mason-lspconfig').setup({
  ensure_installed = {
    'jdtls',
    'gopls',
    'clangd',
    "lua_ls",
    "eslint",
    "html",
    "jsonls",
    "tsserver",
  },
  handlers = {
    lsp_zero.default_setup,
    jdtls = lsp_zero.noop,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})




local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }


cmp.setup({
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
  },
  window = {
    completion = cmp.config.window.bordered({
      border = 'rounded',

      winhighlight = 'NormalFloat:MyPMenu,FloatBorder:MyPMenu,CursorLine:MyPmenuSel,Search:None',

    })

  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<enter>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})

vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  virtual_lines = false,
  signs = false,
  update_in_insert = false,
})

require('lspconfig').clangd.setup({
  cmd = {
    "clangd"
  },
  filetypes = {
    "c", "cpp", "objc", "objcpp", "cuda", "proto"
  },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { 'utf-8', 'utf-16' },
  },

})

require 'lspconfig'.lua_ls.setup {}

require 'lspconfig'.vuels.setup {

  cmd = { "vls" },
  filetypes = { "vue" },
  init_options = {
    config = {
      css = {},
      emmet = {},
      html = {
        suggest = {}
      },
      javascript = {
        format = {}
      },
      stylusSupremacy = {},
      typescript = {
        format = {}
      },
      vetur = {
        completion = {
          autoImport = true,
          tagCasing = "kebab",
          useScaffoldSnippets = true
        },
        format = {
          defaultFormatter = {
            js = "prettier",
            ts = "prettier"
          },
          defaultFormatterOptions = {},
          scriptInitialIndent = false,
          styleInitialIndent = false
        },
        useWorkspaceDependencies = false,
        validation = {
          script = true,
          style = true,
          template = true
        }
      }
    }
  }
}
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

require 'lspconfig'.html.setup {
  capabilities = capabilities,
}

-- Configurações do nvim-lspconfig
require('lspconfig').pyright.setup {
  settings = {
    python = {
      analysis = {
        errors = {}, -- Desativa a exibição de erros
      },
    },
  },
}
