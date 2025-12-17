return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local ok, lualine = pcall(require, "lualine")
        if not ok then
            vim.notify("没有找到 lualine")
            return
        end

		lualine.setup({
			options = {
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = " ", right = ""}
                -- section_separators = { left = " ", right = "" },
			},
			extensions = { "nvim-tree", "toggleterm" },
			sections = {
				lualine_a = {
					{
						"mode",
						icons_enabled = true,
					},
				},
				lualine_b = {
					"branch",
					"diff",
				},
                lualine_c = {
					{
						"filetype",
						colored = true,
						icon_only = true,
					},
                    {"filename", path=1},
				},

				lualine_x = {},

				lualine_y = {
                    "venv-selector",
                    "encoding",
                },

				lualine_z = {
					"progress",
				},
			},
		})
    end,
}
