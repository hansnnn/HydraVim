local present, nvim_lsp = pcall(require, "lspconfig")

if not present then
    return
end

local servers = {'solargraph','ccls','clangd', 'pyright', 'tsserver', 'html', 'gopls', 'jsonls', 'lua_ls', 'vimls', 'cssls'}

vim.diagnostic.config({
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
  virtual_text = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach
    }
end
