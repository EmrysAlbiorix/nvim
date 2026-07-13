-- === === === SWIFT DEBUG KEYMAP === === ===
-- Xcode-specific: build, run & attach the debugger in one step
vim.keymap.set("n", "<leader>dd", function()
	require("xcodebuild.integrations.dap").build_and_debug()
end, { buffer = true, desc = "Build & debug (Xcode)" })
