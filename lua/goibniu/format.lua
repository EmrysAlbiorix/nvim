-- === === === === === === === === === ===
--              COLOR SCHEME
-- === === === === === === === === === ===
-- Basic setup
require("tokyonight").setup({
	style = "night", -- Options: "storm", "moon", "night", "day"
	transparent = false,
})

-- Apply the colorscheme
vim.cmd([[colorscheme tokyonight]])

-- === === === === === === === === === ===
--           CONFORM FORMATTING
-- === === === === === === === === === ===

require("conform").setup({
	formatters_by_ft = {
		bash = { "shfmt" },
		css = { "prettierd" },
		graphql = { "prettierd" },
		html = { "prettierd" },
		javascript = { "eslint_d", "prettierd" },
		javascriptreact = { "eslint_d", "prettierd" },
		json = { "prettierd" },
		jsonc = { "prettierd" },
		lua = { "stylua" },
		markdown = { "prettierd" },
		rust = { "rustfmt" },
		scss = { "prettierd" },
		sh = { "shfmt" },
		toml = { "taplo" },
		typescript = { "eslint_d", "prettierd" },
		typescriptreact = { "eslint_d", "prettierd" },
		swift = { "swiftformat" },
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})

-- === === === === === === === === === ===
--             LAYOUT OPTIONS
-- === === === === === === === === === ===

vim.wo.relativenumber = true -- For relative line numbers
--vim.wo.number = true       -- For absolute line numbers
