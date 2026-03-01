vim.cmd("let g:netrw_liststyle = 3")

-- ---------------------------------------------------------
-- Editor Options
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
opt.tabstop = 2
opt.shiftwidth = 2
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
-- Color schemes that can be light or dark will be made dark.
opt.termguicolors = true
opt.background = "dark"

-- Always show the sign column to prevent text shifting
-- (important for diagnostics, git signs, etc.)
opt.signcolumn = "yes"


-- --- Clipboard ---
-- Sync Neovim clipboard with system clipboard.
-- Enables seamless copy/paste between editor and OS.
opt.clipboard:append("unnamedplus")


-- --- Window Splitting ---
opt.splitright = true   -- Split vertical window to the right.
opt.splitbelow = true    -- Split horizontal window to the bottom.

-- --- Mouse Support ---
-- Enables mouse usage in all modes.
-- Useful for resizing splits or quick selection.
opt.mouse = "a"
