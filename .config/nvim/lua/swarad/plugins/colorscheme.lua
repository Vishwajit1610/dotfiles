-- Add Colorscheme - Catppuccin-Mocha
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,    -- load before anything else
  config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
  end
}

