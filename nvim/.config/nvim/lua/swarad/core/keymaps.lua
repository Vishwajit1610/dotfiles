-- ---------------------------------------------------------
--  Leader Keys
-- ---------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ---------------------------------------------------------
--  Key Mappings
-- ---------------------------------------------------------
local map = vim.keymap.set

local opts = { noremap = true, silent = true }

-- --- File Operations ---
map("n", "<leader>w", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save file" })
map("n", "<leader>q", "<cmd>q<cr>", { noremap = true, silent = true, desc = "Quit window" })

map("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Exit insert mode" })

map("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent and keep selection" })
map("v", "<", "<gv", { noremap = true, silent = true, desc = "Outdent and keep selection" })

-- map("n", "<leader>cd", "<cmd>Ex<cr>", { noremap = true, silent = true, desc = "Open file explorer (netrw)" })

map("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })

map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })

-- --- Window Management ---
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- --- Telescope ---
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true, desc = "Find files" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true, desc = "Live grep search" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { noremap = true, silent = true, desc = "Fuzzy find recent files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true, desc = "Find open buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true, desc = "Search help tags" })

-- --- Search Utilities ---
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { noremap = true, silent = true, desc = "Clear search highlights" })

