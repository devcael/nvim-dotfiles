local jdtls_setup = require("plugin.jdtls_setup");

function setupJava()
  jdtls_setup.jdtls_setup();
end

vim.api.nvim_create_user_command(
  'SetupJava',
  setupJava,
  { nargs = '?' }
)

-- CallJava Lsp Automatic
vim.api.nvim_create_autocmd('FileType', {
  group = java_cmds,
  pattern = { 'java' },
  desc = 'Setup jdtls',
  callback = setupJava,
})
