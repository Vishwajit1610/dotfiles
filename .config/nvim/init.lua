
-- =========================================================
-- Neovim Core Configuration
-- Purpose: Establish sane, predictable editor behavior
-- This file defines editor invariants, not workflow plugins
-- =========================================================


-- ---------------------------------------------------------
-- 1. Leader Keys
-- ---------------------------------------------------------
-- Leader keys act as a namespace for custom shortcuts.
-- Setting them early ensures all mappings use the same base.
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- ---------------------------------------------------------
-- 2. Editor Options
-- ---------------------------------------------------------
-- vim.opt provides a clean Lua interface to Vim options.
local opt = vim.opt


-- --- Line Numbers ---
-- Absolute number shows current line.
-- Relative numbers make vertical movement (j/k) faster.
opt.number = true
opt.relativenumber = true
opt.cursorline = true

-- --- Indentation ---
-- tabstop: visual width of a tab character
-- shiftwidth: number of spaces used for auto-indent
-- expandtab: convert tabs into spaces
-- smartindent: basic automatic indentation for code
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true


-- --- Line Wrapping ---
-- Disable wrapping so code lines stay visually aligned.
opt.wrap = false


-- --- Cursor Context ---
-- Keeps a margin of lines around the cursor.
-- Prevents “cursor glued to screen edge” syndrome.
opt.scrolloff = 8
opt.sidescrolloff = 8


-- --- Search Behavior ---
-- ignorecase: case-insensitive search by default
-- smartcase: case-sensitive if uppercase is used
-- incsearch: show matches while typing
-- hlsearch: highlight all matches
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true


-- --- UI & Colors ---
-- Enables 24-bit RGB colors in the terminal.
opt.termguicolors = true

-- Always show the sign column to prevent text shifting
-- (important for diagnostics, git signs, etc.)
opt.signcolumn = "yes"


-- --- Clipboard ---
-- Sync Neovim clipboard with system clipboard.
-- Enables seamless copy/paste between editor and OS.
opt.clipboard = "unnamedplus"


-- --- Mouse Support ---
-- Enables mouse usage in all modes.
-- Useful for resizing splits or quick selection.
opt.mouse = "a"


-- ---------------------------------------------------------
-- 3. Key Mappings
-- ---------------------------------------------------------
-- vim.keymap.set is the modern, Lua-first mapping API.
local map = vim.keymap.set

-- noremap: prevents recursive mappings
-- silent: suppresses command-line output
local opts = { noremap = true, silent = true }


-- --- File Operations ---
-- Fast save and quit without reaching for : commands
map("n", "<leader>w", "<cmd>w<cr>", opts)
map("n", "<leader>q", "<cmd>q<cr>", opts)

-- Fast exit from insert mode
map("i", "jk", "<ESC>", opts) 

-- Keep visual selection when indenting
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)

-- Fast redirect to Explorer without reaching for : commands
map("n", "<leader>cd", "<cmd>Ex<cr>", opts)

-- Move lines up and down in normal mode
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

-- Move selected lines up and down in visual mode
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- --- Telescope ---
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) 

-- --- Search Utilities ---
-- Clear search highlights after / searches
map("n", "<leader>h", "<cmd>nohlsearch<cr>", opts)


-- ---------------------------------------------------------
-- 4. Plugin Manager (lazy.nvim)
-- ---------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("plugins")


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
