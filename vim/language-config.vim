autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
              enable = true,         -- false will disable the whole extension
        },
}
EOF

lua <<EOF
require'lspconfig'.tsserver.setup{}
EOF

" lua <<EOF
" local null_ls = require("null-ls")

"local sources = { null_ls.builtins.formatting.prettierd }

"null_ls.config({ sources = sources })
"EOF

