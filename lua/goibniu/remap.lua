vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<leader>pv", ":Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>rl", ":update<CR> :source ~/.config/nvim/init.lua<CR>", { desc = "Reload lua config" })
vim.keymap.set("n", "<leader>so", ":so<CR>", { desc = "Reload current file" })
vim.keymap.set("n", "<leader>w", ":write<CR>", { desc = "Save current file" })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { desc = "Quit vim" })
vim.keymap.set("n", "<leader>sph", ":sp<CR>", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>sp", ":vsp<CR>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>nt", ":tabe", { desc = "Open new tab [filename]" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
vim.keymap.set("n", "<leader>-", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<leader>=", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<leader><left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<leader><right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Git functionality (using vimscript)
vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", { desc = "Git add" })
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
vim.keymap.set("n", "<leader>gl", ":Git pull<CR>", { desc = "Git pull" })
vim.keymap.set("n", "<leader>gd", ":Gdiff<CR>", { desc = "Git diff" })

-- Trying to get git blame to work...
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })
--vim.keymap.set("n", "<leader>gb", function()
--  return pcall(vim.cmd, "Gblame")
--end, { desc = "Git blame" })

-- Reformats the current file
vim.keymap.set("n", "<leader>rf", function()
	require("conform").format()
end, { desc = "Format current file" })

-- Open terminal with <Space> ft
vim.keymap.set("n", "<leader>t", function()
	vim.cmd("botright 15split | terminal")
end, { desc = "Open terminal" })

-- Exit terminal mode with Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>", { desc = "Exit and Close terminal" })

-- Minuet Keybinds
vim.keymap.set("n", "<leader>mp", "<cmd>Minuet duet predict<cr>", { desc = "Minuet duet predict" })
vim.keymap.set("n", "<leader>ma", "<cmd>Minuet duet apply<cr>", { desc = "Minuet duet apply" })
vim.keymap.set("n", "<leader>md", "<cmd>Minuet duet dismiss<cr>", { desc = "Minuet duet dismiss" })
