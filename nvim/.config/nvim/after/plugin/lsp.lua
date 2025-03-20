local lsp = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'pyright',
        'clangd',
        'rust_analyzer',
        'ltex',
        'eslint',
    },
    handlers = {
        lsp.default_setup,
    },
})

local cmp = require('cmp')
local cmp_mappings = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
})

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp_mappings,
    preselect = 'none',
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
    },
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = buffnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
