local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, desc = 'Goto definition' })
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, desc = 'Hover token' })
  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, { buffer = bufnr, desc = 'Search for workspace symobls' })
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { buffer = bufnr, desc = 'Show first next error message' })
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, desc = 'Show first previous error message' })
  vim.keymap.set('n', 'de', function() vim.diagnostic.open_float() end, { buffer = bufnr, desc = 'Show diagnostic error messages' })
  vim.keymap.set('n', 'df', vim.diagnostic.setloclist, { buffer = bufnr, desc = 'Open diagnostic quickfix list' })
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, desc = 'Code actions' })
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, { buffer = bufnr, desc = 'Show references' })
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { buffer = bufnr, desc = 'Rename token' })
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
	"tsserver",
  "html",
	"cssls",
  "tailwindcss",
	"svelte",
	"lua_ls",
	"pyright",
  "clangd",
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  formatting = lsp_zero.cmp_format({details = false}),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-c>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      local luasnip = require 'luasnip'
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      local luasnip = require 'luasnip'
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
})
