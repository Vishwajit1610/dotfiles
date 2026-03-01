require("swarad.core")
require("swarad.lazy")

-- ---------------------------------------------------------
-- autocommands 
-- ---------------------------------------------------------
-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 150,
    })
  end,
})
