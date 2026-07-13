-- === === === === === === === === === ===
--                NVIM-DAP
-- === === === === === === === === === ===

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

-- Auto open/close dap-ui with the debug session
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- === === === === === === === === === ===
--         SHARED CODELLDB ADAPTER
--            (Rust and C use this)
-- === === === === === === === === === ===

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "codelldb", -- adjust path if installed via Mason
		args = { "--port", "${port}" },
	},
}

-- === === === === === === === === === ===
--                  SWIFT
-- === === === === === === === === === ===
-- Xcode 16+ ships its own DAP-compatible debugger, so
-- xcodebuild.nvim now wires this up internally — no
-- codelldb adapter or dap.configurations.swift needed.

require("xcodebuild.integrations.dap").setup()

-- === === === === === === === === === ===
--                   RUST
-- === === === === === === === === === ===

dap.configurations.rust = {
	{
		name = "Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

-- === === === === === === === === === ===
--                    C
-- === === === === === === === === === ===

dap.configurations.c = {
	{
		name = "Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

-- === === === === === === === === === ===
--                 PYTHON
-- === === === === === === === === === ===

require("dap-python").setup(vim.fn.expand("~/.virtualenvs/debugpy/bin/python"))

-- === === === === === === === === === ===
--          JAVASCRIPT / REACT
-- === === === === === === === === === ===

require("dap-vscode-js").setup({
	debugger_path = vim.fn.expand("~/.local/share/vscode-js-debug"),
	adapters = { "pwa-node", "pwa-chrome" },
})

for _, lang in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
	dap.configurations[lang] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-chrome",
			request = "launch",
			name = "Debug in Chrome (localhost:3000)",
			url = "http://localhost:3000",
			webRoot = "${workspaceFolder}",
			userDataDir = false,
		},
	}
end
