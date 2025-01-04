local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
		"html", "css", "diff", "java", "json", "toml", "yaml", "hyprlang", "jsonc", "regex",
		"scss" },
	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
