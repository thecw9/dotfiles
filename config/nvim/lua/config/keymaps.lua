local keymap = vim.keymap.set

keymap("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
keymap("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- edit
keymap("n", "<C-q>", "<cmd>q<cr>", { desc = "Quit" })
keymap("n", "<C-s>", "<cmd>w<cr>", { desc = "Save" })

-- buffers
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
keymap("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
keymap("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
keymap("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- windows
keymap("n", "<C-h>", "<C-w>h", { desc = "Window left" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Window down" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Window up" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Clear search with <esc>
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

