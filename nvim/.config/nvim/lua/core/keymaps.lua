-- Don't exit visual mode on indent
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Yank to system clipboard using Space+y
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Diagnostics
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
