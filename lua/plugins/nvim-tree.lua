-- nvim-tree keymappings
local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    -- vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    end

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
    require("nvim-web-devicons").setup({default=true,})
    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      on_attach=my_on_attach,
      filters={git_ignored=false,},
      view = { 
          side = "left",
          number = false,
          relativenumber = false,
          signcolumn = "yes",
          -- width = 30,
      },
      renderer = {
          -- 把只有一个子目录的路径合并显示
          group_empty = true,

          -- 显示目录层级的 | 线
          indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└ ",
                edge   = "│ ",
                item   = "│ ",
                bottom = "─ ",
                none   = "  ",
                },
            },
        }
    })
    end,
}
