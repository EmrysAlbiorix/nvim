require("goibniu.remap")
require("goibniu.packs")
require("goibniu.options")
require("goibniu.format")
require("goibniu.minuet")
print("hello from Goibniu")

-- === === === === === === === === === ===
--          LSP CONFIGURATION
-- === === === === === === === === === ===
-- Mason setup
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- Treesitter setup
---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"typescript",
		"tsx",
		"javascript",
		"html",
		"css",
		"lua",
		"bash",
		"rust",
		"graphql",
		"json",
		"swift",
	},
	highlight = { enable = true },
})

-- Configure lua_ls
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }, -- Recognize vim as valid global
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

-- Enable all servers
vim.lsp.enable({
	"lua_ls",
	"bashls",
	"rust_analyzer",
	"graphql",
	"ts_ls",
	"html",
	"cssls",
	"tailwindcss",
	"jsonls",
	"sourcekit",
})

-- Essential LSP keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- === === === === === === === === === ===
--        TELESCOPE (FUZZY FINDER)
-- === === === === === === === === === ===
require("telescope").setup({
	defaults = {
		layout_config = {
			horizontal = { preview_width = 0.55 },
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Telescope help tags" })

-- === === === === === === === === === ===
--         BLINK.CMP (COMPLETION)
-- === === === === === === === === === ===
-- Icons for minuet
local kind_icons = {
	-- LLM Provider icons
	claude = "󰋦",
	openai = "󱢆",
	codestral = "󱎥",
	gemini = "",
	Groq = "",
	Openrouter = "󱂇",
	Ollama = "󰳆",
	["Llama.cpp"] = "󰳆",
	Deepseek = "",
}

require("blink-cmp").setup({
	fuzzy = {
		implementation = "lua",
	},
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
		kind_icons = kind_icons,
	},
	keymap = {
		-- Manually invoke minuet completion.
		["<A-y>"] = require("minuet").make_blink_map(), -- ⌥y actives minuet
		["<A-CR>"] = { "accept", "fallback" }, -- ⌥Enter accepts whole item
	},
	sources = {
		-- Enable minuet for autocomplete
		default = { "lsp", "path", "buffer", "snippets" },
		-- For manual completion only, remove 'minuet' from default
		providers = {
			minuet = {
				name = "minuet",
				module = "minuet.blink",
				async = true,
				-- Should match minuet.config.request_timeout * 1000,
				-- since minuet.config.request_timeout is in seconds
				timeout_ms = 10000, -- Max time to wait (match minuet.lua request_timeout)
				score_offset = 50, -- Gives minuet higher priority among suggestions
			},
		},
	},
	-- Recommended to avoid unnecessary request
	completion = { trigger = { prefetch_on_insert = false } },
})

-- === === === === === === === === === ===
--                GIT SETUP
-- === === === === === === === === === ===
require("gitsigns").setup({
	signs = {
		add = { text = "⊕" },
		change = { text = "#" },
		delete = { text = "-" },
		-- ... more options
	},
	status_formatter = function(action, head_sha)
		if action == "ADD" then
			return "[+]"
		elseif action == "DEL" then
			return "[-]"
		else
			return nil
		end
	end,
	--signs_style = {
	-- or just use the default icons from fugitive
	-- this keeps git blame and other commands working nicely with both plugins
	--},
})

-- === === === === === === === === === ===
--              FILE EXPLORER
-- === === === === === === === === === ===
require("mini.icons").setup()
require("oil").setup()
