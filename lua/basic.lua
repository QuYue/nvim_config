-- Encode
vim.g.encoding = "UTF-8"
vim.o.encoding = "UTF-8"

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_newtrwPlugin = 1

-- Port for markdown
vim.g.mkdp_port = 7010
vim.g.mkdp_echo_preview_url = 1
--vim.g.mkdp_open_to_the_world = 1

-- Python block
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "TextChanged" }, {
  pattern = "*.py",
  callback = function()
    local ns = vim.api.nvim_create_namespace("python_cell_divider")
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)

    local width = vim.api.nvim_win_get_width(0)
    local line = string.rep("─", width)

    for i = 1, vim.api.nvim_buf_line_count(0) do
      local text = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1]
      if text and text:match("^%s*#%s*%%") then
        vim.api.nvim_buf_set_extmark(0, ns, i - 1, 0, {
          virt_text = { { line, "PythonCellDivider" } },
          virt_text_pos = "eol",
        })
      end
    end
  end,
})

vim.api.nvim_set_hl(0, "PythonCellDivider", {
  fg = "#7aa2f7",     -- 蓝色
  bold = true,
})

