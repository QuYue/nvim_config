-- Github Copilot
return {
  "github/copilot.vim",
  event = "InsertEnter", -- 进入插入模式才加载，不卡启动
  config = function()
    -- 禁用默认 <Tab> 映射（非常重要，避免和 blink.cmp / 缩进冲突）
    vim.g.copilot_no_tab_map = true

    -- 使用 Alt-l 接受 Copilot 建议（你也可以换）
    vim.keymap.set("i", "<C-L>", 'copilot#Accept("<CR>")', {
      silent = true,
      expr = true,
      replace_keycodes = false,
    })

    -- 可选：下一条 / 上一条
    -- vim.keymap.set("i", "<C-K>", "<Plug>(copilot-next)", { silent = true })
    -- vim.keymap.set("i", "<C-I>", "<Plug>(copilot-previous)", { silent = true })

    -- 可选：手动触发
    vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-suggest)", { silent = true })
  end,
}
