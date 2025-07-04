vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local VIEW_WIDTH_FIXED = 40
local view_width_max = VIEW_WIDTH_FIXED

local function toggle_width_adaptive()
	if view_width_max == -1 then
		view_width_max = VIEW_WIDTH_FIXED
	else
		view_width_max = -1
	end

	require("nvim-tree.api").tree.reload()
end

local function my_on_attach(bufnr)
	local api = require('nvim-tree.api')

	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default
	vim.keymap.set("n", "<C-]>",          api.tree.change_root_to_node,       opts("CD"))
	vim.keymap.set("n", "<C-e>",          api.node.open.replace_tree_buffer,  opts("Open: In Place"))
	vim.keymap.set("n", "<C-k>",          api.node.show_info_popup,           opts("Info"))
	vim.keymap.set("n", "<C-r>",          api.fs.rename_sub,                  opts("Rename: Omit Filename"))
	vim.keymap.set("n", "<C-t>",          api.node.open.tab,                  opts("Open: New Tab"))
	vim.keymap.set("n", "<C-v>",          api.node.open.vertical,             opts("Open: Vertical Split"))
	vim.keymap.set("n", "<C-x>",          api.node.open.horizontal,           opts("Open: Horizontal Split"))
	vim.keymap.set("n", "<BS>",           api.node.navigate.parent_close,     opts("Close Directory"))
	vim.keymap.set("n", "<CR>",           api.node.open.edit,                 opts("Open"))
	vim.keymap.set("n", "<Tab>",          api.node.open.preview,              opts("Open Preview"))
	vim.keymap.set("n", ">",              api.node.navigate.sibling.next,     opts("Next Sibling"))
	vim.keymap.set("n", "<",              api.node.navigate.sibling.prev,     opts("Previous Sibling"))
	vim.keymap.set("n", ".",              api.node.run.cmd,                   opts("Run Command"))
	vim.keymap.set("n", "-",              api.tree.change_root_to_parent,     opts("Up"))
	vim.keymap.set("n", "bd",             api.marks.bulk.delete,              opts("Delete Bookmarked"))
	vim.keymap.set("n", "bt",             api.marks.bulk.trash,               opts("Trash Bookmarked"))
	vim.keymap.set("n", "bmv",            api.marks.bulk.move,                opts("Move Bookmarked"))
	vim.keymap.set("n", "B",              api.tree.toggle_no_buffer_filter,   opts("Toggle Filter: No Buffer"))
	vim.keymap.set("n", "c",              api.fs.copy.node,                   opts("Copy"))
	vim.keymap.set("n", "C",              api.tree.toggle_git_clean_filter,   opts("Toggle Filter: Git Clean"))
	vim.keymap.set("n", "[c",             api.node.navigate.git.prev,         opts("Prev Git"))
	vim.keymap.set("n", "]c",             api.node.navigate.git.next,         opts("Next Git"))
	vim.keymap.set("n", "d",              api.fs.remove,                      opts("Delete"))
	vim.keymap.set("n", "D",              api.fs.trash,                       opts("Trash"))
	vim.keymap.set("n", "E",              api.tree.expand_all,                opts("Expand All"))
	vim.keymap.set("n", "e",              api.fs.rename_basename,             opts("Rename: Basename"))
	vim.keymap.set("n", "]e",             api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
	vim.keymap.set("n", "[e",             api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
	vim.keymap.set("n", "F",              api.live_filter.clear,              opts("Live Filter: Clear"))
	vim.keymap.set("n", "f",              api.live_filter.start,              opts("Live Filter: Start"))
	vim.keymap.set("n", "g?",             api.tree.toggle_help,               opts("Help"))
	vim.keymap.set("n", "gy",             api.fs.copy.absolute_path,          opts("Copy Absolute Path"))
	vim.keymap.set("n", "ge",             api.fs.copy.basename,               opts("Copy Basename"))
	vim.keymap.set("n", "H",              api.tree.toggle_hidden_filter,      opts("Toggle Filter: Dotfiles"))
	vim.keymap.set("n", "I",              api.tree.toggle_gitignore_filter,   opts("Toggle Filter: Git Ignore"))
	vim.keymap.set("n", "J",              api.node.navigate.sibling.last,     opts("Last Sibling"))
	vim.keymap.set("n", "K",              api.node.navigate.sibling.first,    opts("First Sibling"))
	vim.keymap.set("n", "L",              api.node.open.toggle_group_empty,   opts("Toggle Group Empty"))
	vim.keymap.set("n", "M",              api.tree.toggle_no_bookmark_filter, opts("Toggle Filter: No Bookmark"))
	vim.keymap.set("n", "m",              api.marks.toggle,                   opts("Toggle Bookmark"))
	vim.keymap.set("n", "o",              api.node.open.edit,                 opts("Open"))
	vim.keymap.set("n", "O",              api.node.open.no_window_picker,     opts("Open: No Window Picker"))
	vim.keymap.set("n", "p",              api.fs.paste,                       opts("Paste"))
	vim.keymap.set("n", "P",              api.node.navigate.parent,           opts("Parent Directory"))
	vim.keymap.set("n", "q",              api.tree.close,                     opts("Close"))
	vim.keymap.set("n", "r",              api.fs.rename,                      opts("Rename"))
	vim.keymap.set("n", "R",              api.tree.reload,                    opts("Refresh"))
	vim.keymap.set("n", "s",              api.node.run.system,                opts("Run System"))
	vim.keymap.set("n", "S",              api.tree.search_node,               opts("Search"))
	vim.keymap.set("n", "u",              api.fs.rename_full,                 opts("Rename: Full Path"))
	vim.keymap.set("n", "U",              api.tree.toggle_custom_filter,      opts("Toggle Filter: Hidden"))
	vim.keymap.set("n", "W",              api.tree.collapse_all,              opts("Collapse"))
	vim.keymap.set("n", "x",              api.fs.cut,                         opts("Cut"))
	vim.keymap.set("n", "y",              api.fs.copy.filename,               opts("Copy Name"))
	vim.keymap.set("n", "Y",              api.fs.copy.relative_path,          opts("Copy Relative Path"))
	vim.keymap.set("n", "<2-LeftMouse>",  api.node.open.edit,                 opts("Open"))
	vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node,       opts("CD"))

	-- custom
	vim.keymap.set("n", "A",              api.fs.create,                      opts("Create File Or Directory"))
	vim.keymap.set("n", "w", 	      toggle_width_adaptive, 		  opts("Toggle Adaptive Width"))
end

local function get_view_width_max()
	return view_width_max
end

vim.opt.termguicolors = true

require("nvim-tree").setup({
	hijack_cursor = true,
	filesystem_watchers = {
		ignore_dirs = {
			"node_modules",
		},
	},
	git = {
		enable = false,
	},
	view = {
		relativenumber = true,
		width = {
			min = 40,
			max = get_view_width_max,
		},
	},
	renderer = {
		highlight_modified = "name",
		highlight_bookmarks = "name",
		highlight_diagnostics = "name",
		indent_markers = {
			enable = true,
		},
		full_name = true,
	},
	modified = {
		enable = true,
	},
	diagnostics = {
		enable = true,
	},
	on_attach = my_on_attach,
	system_open = {
		cmd = "kitty"
	}
})

local prev = { new_name = "", old_name = "" }
vim.api.nvim_create_autocmd("User", {
  pattern = "NvimTreeSetup",
  callback = function()
    local events = require("nvim-tree.api").events
    events.subscribe(events.Event.NodeRenamed, function(data)
      if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
        data = data
        Snacks.rename.on_rename_file(data.old_name, data.new_name)
      end
    end)
  end,
})

vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Nvim Tree Toggle" })
vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>",
	{ noremap = true, silent = true, desc = "Nvim Tree Focus on file" })
