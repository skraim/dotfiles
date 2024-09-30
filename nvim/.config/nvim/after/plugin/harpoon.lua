local harpoon = require("harpoon")

local function read_state_file()
    local file = io.open(os.getenv("HOME") .. "/scripts/force_qwerty_state", "r")
    if not file then
        return nil
    end
    local content = file:read("*a")
    file:close()
    return content
end

local force_qwerty = read_state_file()

if force_qwerty then
    force_qwerty = tonumber(force_qwerty:match("%d+"))
else
    force_qwerty = 0
end

harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)

vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

if force_qwerty == 1 then
    vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-m>", function() harpoon:list():select(4) end)
else
    vim.keymap.set("n", "<C-m>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<C-n>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-e>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-i>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(4) end)
end
