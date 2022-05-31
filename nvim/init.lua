print('hello wrld')

-- plugins
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- auto-sync
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])
    -- switch back to -> autocmd BufWritePost plugins.lua source <afile> | PackerCompile


require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- themes
  use { 'folke/tokyonight.nvim',  branch= 'main' }
  use 'marko-cerovac/material.nvim'

  use 'chrisbra/Colorizer'

  -- functionality
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'neovim/nvim-lspconfig'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config=function()
      require('telescope').setup {
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
          }
        }
      }

      require('telescope').load_extension('fzf')
    end
  }

  use 'tpope/vim-fugitive'
  use 'tpope/vim-eunuch'

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup{
        keymaps = {
          -- Default keymap options
          noremap = true,

          ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
          ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
        }
      }
    end
  }

  use 'vimwiki/vimwiki'


  use {
    "folke/lua-dev.nvim",
    config = function()
      require('lua-dev').setup({})
    end
  }

  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup()
    end
  }

  use {
    'lambdalisue/fern.vim',
    requires={
      {'antoinemadec/FixCursorHold.nvim'},
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config=function() require('lualine').setup() end
  }


  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {'luochen1990/rainbow',
    config = function()
      vim.g.rainbow = 1
    end
  }

  use {
    'mhartington/formatter.nvim',
    config=function()
    require('formatter').setup({
      logging = false,
      filetype = {
        javascript = {
            -- prettierd
           function()
              return {
                exe = "prettierd",
                args = {vim.api.nvim_buf_get_name(0)},
                stdin = true
              }
            end
        },
        typescript = {
            -- prettierd
           function()
              return {
                exe = "prettierd",
                args = {vim.api.nvim_buf_get_name(0)},
                stdin = true
              }
            end
        },
        typescriptreact = {
            -- prettierd
           function()
              return {
                exe = "prettierd",
                args = {vim.api.nvim_buf_get_name(0)},
                stdin = true
              }
            end
        },
        css = {
            -- prettierd
           function()
              return {
                exe = "prettierd",
                args = {vim.api.nvim_buf_get_name(0)},
                stdin = true
              }
            end
        },
        -- other formatters ...
      }
    })
    end
  }


  use 'tpope/vim-rhubarb'

  use 'github/copilot.vim'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.tsx,*.css,*.js,*.rs,*.lua FormatWrite
augroup END
]], true)

-- theming
vim.g.tokyonight_style = "night"
vim.cmd[[colorscheme tokyonight]]

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

vim.opt.number = true

vim.g.mapleader = '\\'


local map = function(key)
  -- get the extra options
  local opts = {noremap = true}
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
end

map {'n', '<Leader><Leader>', "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<CR>"}
map {'n', '<Leader>g', "<cmd>lua require('telescope.builtin').git_status()<CR>"}
map {'n', '<Leader>f', "<cmd>lua require('telescope.builtin').live_grep()<CR>"}
map {'n', '<Leader>s', "<cmd>lua require('telescope.builtin').git_status()<CR>"}
map {'n', '<Leader>v', "<cmd>:e $MYVIMRC<CR>"}
map {'n', '<Leader>]', "<cmd>:Fern %:h<CR>"}

function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        api.nvim_command('augroup '..group_name)
        api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            api.nvim_command(command)
        end
        api.nvim_command('augroup END')
    end
end

function _G.ReloadConfig()
    local hls_status = vim.v.hlsearch
    for name,_ in pairs(package.loaded) do
        if name:match('^nico') then
            package.loaded[name] = nil
        end
    end
    dofile(vim.env.MYVIMRC)
    if hls_status == 0 then
        vim.opt.hlsearch = false
    end
end

local autocmds = {
    reload_vimrc = {
        {"BufWritePre", "$MYVIMRC", "lua ReloadConfig()"};
    };
}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end



vim.opt.completeopt='menu,menuone,noselect'

local cmp = require'cmp'

cmp.setup({
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['pyright'].setup {
  capabilities = capabilities
}
