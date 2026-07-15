-- === === === === === === === === === ===
--               WHICH-KEY
-- === === === === === === === === === ===

require("which-key").setup({
	preset = "modern",
})

-- Group labels — purely cosmetic, groups your leader-prefixed
-- keymaps under a readable heading in the popup
require("which-key").add({
	{ "<leader>g", group = "Git" },
	{ "<leader>f", group = "Telescope/Find" },
	{ "<leader>s", group = "Split/Save/Source" },
	{ "<leader>m", group = "Minuet" },
	{ "<leader>d", group = "DAP/Debug" },
	{ "<leader>x", group = "Xcodebuild" },
	{ "<leader>r", group = "Reload/Rename/Refs" },
})
