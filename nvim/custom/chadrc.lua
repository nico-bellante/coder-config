-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "tokyonight",
}

M.mappings = require"custom.mappings"

M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig"
      },
      nvimtree = function() 
         require("nvim-tree").setup({view = {side = "right"}})
      end   
   },
   user = {
      ['nvim-telescope/telescope-fzf-native.nvim'] = {run = 'make'},
      ['nvim-treesitter/playground'] = {
         config=function()
            require "nvim-treesitter.configs".setup {
               playground = {
                 enable = true,
                 disable = {},
                 updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                 persist_queries = false, -- Whether the query persists across vim sessions
                 keybindings = {
                   toggle_query_editor = 'o',
                   toggle_hl_groups = 'i',
                   toggle_injected_languages = 't',
                   toggle_anonymous_nodes = 'a',
                   toggle_language_display = 'I',
                   focus_language = 'f',
                   unfocus_language = 'F',
                   update = 'R',
                   goto_node = '<cr>',
                   show_help = '?',
                 },
               }
             }
         end
      },
      ['jose-elias-alvarez/null-ls.nvim'] = {
         after = "nvim-lspconfig",
         config=function() 
            require('null-ls').setup({
               sources = {
                  require('null-ls').builtins.formatting.prettierd
               },
            })
         end
      }
   },
   override = {
      ["nvim-telescope/telescope.nvim"] = {
         extensions_list = { "themes", "terms", "fzf" },
         extensions = {
            fzf = {
               fuzzy = true,
               override_generic_sorter = true,
               override_file_sorter = true,
               case_mode = 'smart_case',
            }
         }
      },
   }
}

return M
