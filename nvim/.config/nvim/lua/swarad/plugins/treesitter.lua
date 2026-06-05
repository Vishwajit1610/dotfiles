return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",   -- pin to master: new 'main' branch removed configs API
  lazy = false,        -- treesitter must NOT lazy-load (official requirement)
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- master branch uses nvim-treesitter.configs — this is correct here
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "lua",
        "vim",
        "vimdoc",
        "markdown",
        "bash",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max then return true end
        end,
      },
      indent = { enable = true },
    })

    require("nvim-ts-autotag").setup()
  end,
}
