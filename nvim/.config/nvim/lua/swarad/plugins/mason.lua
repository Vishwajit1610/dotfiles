return {
  -- Mason: package manager for LSP servers, linters, formatters
  -- Think of it like pacman, but specifically for language tooling.
  -- It downloads and manages binaries into ~/.local/share/nvim/mason/
  "williamboman/mason.nvim",
  dependencies = {
    -- Bridge between Mason and lspconfig.
    -- Without this, you'd have to manually tell lspconfig WHERE mason
    -- installed each server. This plugin does that automatically.
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- These servers will be auto-installed when you open Neovim.
      -- You never need to run :MasonInstall manually for these.
      ensure_installed = {
        "ts_ls",          -- TypeScript/JavaScript/JSX/TSX
        "html",           -- HTML
        "cssls",          -- CSS/SCSS/LESS
        "tailwindcss",    -- Tailwind CSS class completions
        "eslint",         -- ESLint diagnostics
        "lua_ls",         -- Lua (for editing your own nvim config)
        "emmet_ls",       -- Emmet abbreviations in JSX/HTML
      },
    })
  end,
}
