-- Ctrl + b 打开/关闭 Nvim-Tree 目录
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Ctrl + j 打开/隐藏 Terminal
local term_win = nil   -- 保存窗口 ID
local term_buf = nil   -- 保存 buffer ID

vim.keymap.set("n", "<C-j>", function()
  -- 如果 terminal 窗口存在并且可见 → 隐藏
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_hide(term_win)  -- 隐藏窗口，不关闭 buffer
    return
  end

  -- 如果 buffer 存在但窗口不存在 → 重新显示 terminal
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    -- 在最底部显示一个 split
    vim.cmd("botright split")
    term_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(term_win, term_buf)
    return
  end

  -- 否则：第一次打开 terminal
  vim.cmd("botright split | terminal")
  term_win = vim.api.nvim_get_current_win()
  term_buf = vim.api.nvim_win_get_buf(term_win)
end, { noremap = true, silent = true })

-- terminal 使用 Esc 退出编辑模式
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true })

-- Tab/Shift-Tab 切 buffer
-- 下一个 buffer
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
-- 上一个 buffer
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
-- 鼠标点击
vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { silent = true })
