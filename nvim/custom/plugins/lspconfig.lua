local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = { "html", "cssls", "clangd", "jsonls", "pyright", "tsserver"}

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
      }
   end

   vim.lsp.set_log_level("trace")

end

return M