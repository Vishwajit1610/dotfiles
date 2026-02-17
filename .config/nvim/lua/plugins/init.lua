require("lazy").setup({
    -- Add Colorscheme - Catppuccin-Mocha
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,    -- load before anything else
        config = function()
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },
    
    -- Add Lualine Statusline -- 
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
            options = {
            theme = "catppuccin",
            section_separators = "",
            component_separators = "",
            },
        })
        end,
    },

    -- Add Telescope Plugin Spec
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
    },
})
