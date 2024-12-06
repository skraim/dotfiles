vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gb", ':Git blame<CR>')

vim.api.nvim_create_augroup("DisableFugitiveMappings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "DisableFugitiveMappings",
  pattern = "fugitive",
  callback = function()
    vim.api.nvim_buf_del_keymap(0, "n", "a")
  end,
})
