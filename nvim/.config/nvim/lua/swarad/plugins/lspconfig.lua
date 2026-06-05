return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- ---------------------------------------------------------
    -- NEW API (nvim-lspconfig v3 + Neovim 0.11+)
    -- require("lspconfig").xxx.setup() is DEAD.
    -- New pattern:
    --   vim.lsp.config("server", { ...overrides... })  -- customize
    --   vim.lsp.enable("server")                        -- activate
    -- nvim-lspconfig provides server defaults in its lsp/ directory.
    -- vim.lsp.enable() finds them automatically.
    -- ---------------------------------------------------------

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- ---------------------------------------------------------
    -- Diagnostic signs in the gutter
    -- ---------------------------------------------------------
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN]  = " ",
          [vim.diagnostic.severity.HINT]  = "󰠠 ",
          [vim.diagnostic.severity.INFO]  = " ",
        },
      },
      virtual_text = true,
      underline = true,
      update_in_insert = false,
    })

    -- ---------------------------------------------------------
    -- on_attach keymaps via LspAttach autocmd
    -- This is the new idiomatic way — fires when ANY server attaches.
    -- ---------------------------------------------------------
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local map = vim.keymap.set
        local buf = args.buf
        local opts = function(desc)
          return { noremap = true, silent = true, buffer = buf, desc = desc }
        end

        -- Navigation
        map("n", "gd",  vim.lsp.buf.definition,      opts("Go to definition"))
        map("n", "gD",  vim.lsp.buf.declaration,     opts("Go to declaration"))
        map("n", "gi",  vim.lsp.buf.implementation,  opts("Go to implementation"))
        map("n", "gr",  vim.lsp.buf.references,      opts("Show references"))
        map("n", "gt",  vim.lsp.buf.type_definition, opts("Go to type definition"))

        -- Documentation
        map("n", "K",   vim.lsp.buf.hover,           opts("Hover docs"))

        -- Code actions
        map("n", "<leader>rn", vim.lsp.buf.rename,       opts("Rename symbol"))
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))

        -- Diagnostics
        map("n", "<leader>d", vim.diagnostic.open_float, opts("Show line diagnostics"))
        map("n", "[d",        vim.diagnostic.goto_prev,  opts("Prev diagnostic"))
        map("n", "]d",        vim.diagnostic.goto_next,  opts("Next diagnostic"))

        -- Format
        map("n", "<leader>fm", function()
          vim.lsp.buf.format({ async = true })
        end, opts("Format file"))
      end,
    })

    -- ---------------------------------------------------------
    -- Per-server customization (capabilities + any overrides)
    -- nvim-lspconfig already knows filetypes, root patterns, cmd.
    -- We only need to pass what we want to CHANGE or ADD.
    -- ---------------------------------------------------------

    local servers = {
      "ts_ls",
      "html",
      "cssls",
      "tailwindcss",
      "eslint",
      "emmet_ls",
    }

    for _, server in ipairs(servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
      })
      vim.lsp.enable(server)
    end

    -- lua_ls needs extra settings to understand Neovim's API
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })
    vim.lsp.enable("lua_ls")

    -- eslint: auto-fix on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
      callback = function()
        vim.lsp.buf.code_action({
          context = { only = { "source.fixAll.eslint" } },
          apply = true,
        })
      end,
    })
  end,
}
