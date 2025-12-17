-- <leader> -- 
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })


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

vim.keymap.set("n", "<leader>q", ":Bdelete<CR>", { silent = true })

------------------------------
-- Telescope Keymaps
------------------------------
--local ok, tel_builtin = pcall( require, "telescope.builtin" )
-- 查找文件
--if ok then
vim.keymap.set('n', "<C-p>", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true, desc = "Find Files (Telescope)" })
-- 全局搜索文本 
vim.keymap.set('n', "<C-f>", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true, desc = "Live Grep (Telescope)" })
-- 列出打开的 buffers
vim.keymap.set('n', "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true, desc = "List Buffers (Telescope)" })
-- 帮助文档
vim.keymap.set('n', "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true, desc = "Help Tags (Telescope)" })



------------------------------
-- Comment Keymaps
------------------------------
-- 行注释：<leader> + \
vim.keymap.set("n", "<leader>\\", function()
    require("Comment.api").toggle.linewise.current()
end, {
    noremap = true,
    silent = true,
    desc = "Toggle line comment",
})
-- 行注释：<leader> + \  (视觉模式)
vim.keymap.set("v", "<leader>\\", function()
    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<ESC>", true, false, true),
        "nx",
        false
    )
    require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, {
    noremap = true,
    silent = true,
    desc = "Toggle line comment (visual)",
})

-- 块注释：<leader> + Shift + \  (也就是 <leader>|)
vim.keymap.set("n", "<leader>|", function()
    require("Comment.api").toggle.blockwise.current()
end, {
    noremap = true,
    silent = true,
    desc = "Toggle block comment",
})
-- 块注释：<leader> + Shift + \  (视觉模式)
vim.keymap.set("v", "<leader>|", function()
    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<ESC>", true, false, true),
        "nx",
        false
    )
    require("Comment.api").toggle.blockwise(vim.fn.visualmode())
end, {
    noremap = true,
    silent = true,
    desc = "Toggle block comment (visual)",
})


------------------------------
-- 缩进 indentation keymaps
------------------------------
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })







