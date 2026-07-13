-- ftplugin/java.lua
local jdtls = require("jdtls")
local mason_registry = require("mason-registry")

local bundles = {
	vim.fn.glob(
		mason_registry.get_package("java-debug-adapter"):get_install_path()
			.. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
		1
	),
}
vim.list_extend(
	bundles,
	vim.split(
		vim.fn.glob(mason_registry.get_package("java-test"):get_install_path() .. "/extension/server/*.jar", 1),
		"\n"
	)
)

jdtls.start_or_attach({
	cmd = { "jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "pom.xml" }, { upward = true })[1]),
	init_options = { bundles = bundles },
	on_attach = function(_, bufnr)
		jdtls.setup_dap({ hotcodereplace = "auto" })
	end,
})
