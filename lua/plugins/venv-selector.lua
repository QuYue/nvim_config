-- If want to remove the config, use rm -rf ~/.cache/venv-selector
return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        {
            "nvim-telescope/telescope.nvim",
            branch = "0.1.x",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
    },
    ft = "python", -- Load when opening Python files
    keys = {
        { ",v", "<cmd>VenvSelect<cr>" },      -- select 
        { ",d", "<cmd>VenvDeactivate<cr>" },  -- deactivate
    },
    opts = {
        conda = { command = "conda" },
        search = {
      conda_envs = {
        --
        command = "conda env list | grep -v '#' | awk '{print $NF \"/bin/python\"}'",
      },
    },

        options = {
            anaconda_base_path = "/Applications/My_Softwares/Anaconda3/anaconda3",
            anaconda_envs_path = "/Applications/My_Softwares/Anaconda3/anaconda3/envs",
        },
    },
    config = function(_, opts)
        require("venv-selector").setup(opts)
        --
        vim.api.nvim_create_user_command("VenvDeactivate", function()
            require("venv-selector").deactivate()
        end, {})
    end,
}
