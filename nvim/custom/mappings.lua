local M = {}

M.telescope = {
  n = {
    ["<leader><leader>"] = { "<cmd> Telescope<CR>", "open telescope" },
    ["\\\\"] = { "<cmd> Telescope find_files<CR>", "open telescope" },
    ["\\f"] = { "<cmd> Telescope live_grep<CR>", "open telescope live grep" },
  }
}

M.shortcuts = {
  n = {
    ["<leader>m"] = { "<cmd> :e ~/.config/nvim/lua/custom/mappings.lua <CR>", "edit nvim mappings" },
    ["<leader>v"] = { "<cmd> :e ~/.config/nvim/lua/custom/chadrc.lua <CR>", "edit nvim mappings" },
  }
}

return M
