vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

-- === === === BASIC MOVEMENTS === === ===
-- zz for line center
-- zt for line top
-- zb for line bottom

-- === === === === === === === === === ===
--              FILE CONTROLS
-- === === === === === === === === === ===

-- Main controls
vim.keymap.set("n", "<leader>pv", ":Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>so", ":so<CR>", { desc = "Reload current file" })
vim.keymap.set("n", "<leader>w", ":write<CR>", { desc = "Save current file" })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { desc = "Quit vim" })

-- Reload primary config file
vim.keymap.set("n", "<leader>rl", function()
	print("Goibniu Reloaded")
	vim.cmd("update")
	vim.cmd("source ~/.config/nvim/init.lua")
end, { desc = "Reload lua config" })

-- Reformats the current file
vim.keymap.set("n", "<leader>rf", function()
	require("conform").format()
end, { desc = "Format current file" })

-- === === === === === === === === === ===
--            WINDOW CONTROLS
-- === === === === === === === === === ===

-- Create windows
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

-- === === === === === === === === === ===
--           MAIN GIT COMMANDS
-- === === === === === === === === === ===

-- Git functionality (using vimscript)
vim.keymap.set("n", "<leader>gss", ":Git<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", { desc = "Git add" })
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
vim.keymap.set("n", "<leader>gp", ":Git push", { desc = "Git push" })
vim.keymap.set("n", "<leader>gl", ":Git pull<CR>", { desc = "Git pull" })
vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR>", { desc = "Git diff (vertical split)" })
vim.keymap.set("n", "<leader>gD", ":Gvdiffsplit ", { desc = "Git diff against branch/commit" })
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })

-- === === === === === === === === === ===
--        BRANCH & FILE COMMANDS
-- === === === === === === === === === ===

-- Switch branches
vim.keymap.set("n", "<leader>gsw", ":Git switch ", { desc = "Git switch branch" })
vim.keymap.set("n", "<leader>gsc", ":Git switch -c ", { desc = "Git switch (create new branch)" })

-- Restore files
vim.keymap.set("n", "<leader>grr", ":Git restore ", { desc = "Git restore file" })
vim.keymap.set("n", "<leader>grs", ":Git restore --staged ", { desc = "Git restore (unstage) file" })

-- Merge
vim.keymap.set("n", "<leader>gm", ":Git merge ", { desc = "Git merge branch" })

-- Rebase
vim.keymap.set("n", "<leader>gR", ":Git rebase ", { desc = "Git rebase branch" })

-- Delete
vim.keymap.set("n", "<leader>g-", ":Git branch -d ", { desc = "Git delete branch" })

-- === === === === === === === === === ===
--            GIT BRANCH TREE
-- === === === === === === === === === ===

-- Tree of all branches
vim.keymap.set("n", "<leader>gt", function()
	vim.cmd("Git log --graph --all --oneline --decorate")
end, { desc = "Git log graph (all branches)" })

-- Tree of current branch
vim.keymap.set("n", "<leader>gT", function()
	vim.cmd("Git log --graph --oneline --decorate")
end, { desc = "Git log graph (current branch)" })

-- Consider using vim-flog for nicer looking tree if basic setup becomes an issue

-- === === === === === === === === === ===
--              MASON CONTROLS
-- === === === === === === === === === ===

-- Mason commands for package instal
vim.keymap.set("n", "<leader>m", ":Mason <CR>", { desc = "Open Mason" })
vim.keymap.set("n", "<leader>mi", ":MasonInstall ", { desc = "Start MasonInstall" })
-- add more as needed, but most can be done through Mason interface

-- === === === === === === === === === ===
--           TERMINAL COMMANDS
-- === === === === === === === === === ===

-- Open terminal with <Space> ft
vim.keymap.set("n", "<leader>t", function()
	vim.cmd("botright 15split | terminal")
end, { desc = "Open terminal" })

-- Exit terminal mode with Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>", { desc = "Exit and Close terminal" })

-- === === === === === === === === === ===
--            MINUET COMMANDS
-- === === === === === === === === === ===

-- Minuet Keybinds
vim.keymap.set("n", "<leader>mp", "<cmd>Minuet duet predict<cr>", { desc = "Minuet duet predict" })
vim.keymap.set("n", "<leader>ma", "<cmd>Minuet duet apply<cr>", { desc = "Minuet duet apply" })
vim.keymap.set("n", "<leader>md", "<cmd>Minuet duet dismiss<cr>", { desc = "Minuet duet dismiss" })

-- === === === === === === === === === ===
--          XCODEBUILD COMMANDS
-- === === === === === === === === === ===

-- XCODEBUILD Keybinds
vim.keymap.set("n", "<leader>xx", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild actions" })
vim.keymap.set("n", "<leader>xf", "<cmd>XcodebuildProjectManager<cr>", { desc = "Project manager" })
vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build project" })
vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & run project" })
vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run tests" })
vim.keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle code coverage" })

-- === === === === === === === === === ===
--                DAP
-- === === === === === === === === === ===

-- Dap Keybinds
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<cr>", { desc = "Continue" })
vim.keymap.set("n", "<leader>do", "<cmd>DapStepOver<cr>", { desc = "Step over" })
vim.keymap.set("n", "<leader>di", "<cmd>DapStepInto<cr>", { desc = "Step into" })
vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", { desc = "Toggle DAP UI" })
