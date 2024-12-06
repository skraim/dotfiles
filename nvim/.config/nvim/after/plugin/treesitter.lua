local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
		"javascript", "html", "bash", "css", "diff", "dockerfile", "java", "json", "nginx",
		"tmux", "toml", "tsx", "xml", "yaml", "gitignore", "hyprlang", "jsonc", "regex",
		"scss", "typescript" },
	sync_install = false,
	auto_install = true, 
	highlight = { enable = true },
	indent = { enable = true },  
})

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
