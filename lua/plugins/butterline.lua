return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            -- bufferline.lua
            options = {
		        close_command = "Bdelete %d",       -- 点击关闭按钮关闭
		        right_mouse_command = "Bdelete %d", -- 右键点击关闭
		        -- always_show_butterline = false,
                custom_filter = function(buf_number)
                    -- 过滤掉 [No Name] buffer
                    local buf_name = vim.fn.bufname(buf_number)
                    if buf_name == "" then
                    return false
                    end
                    return true
                end,

                indicator = {
			        icon = '▎', -- 分割线
			        style = 'underline',
		        },
		        buffer_close_icon = '󰅖',
		        modified_icon = '●',
		        close_icon = '',
		        offsets = {
			        {
				        filetype = "NvimTree",
				        text = "File Explorer" ,
				        text_align = "left",
				        separator = true,
                        -- highlight = "BufferLineFileExplorer",
			        },
		        },
            }
        })
    end,
}




