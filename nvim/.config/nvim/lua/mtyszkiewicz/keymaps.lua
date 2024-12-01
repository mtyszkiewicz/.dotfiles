-- Don't exit visual mode on indent
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Easier jumping to start/end of the line
vim.keymap.set("n", "E", "$")
vim.keymap.set("n", "B", "^")

-- Keep paste buffer after overwrite
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Keep paste buffer after delete
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Yank to system clipboard using Space+y
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Diagnostics
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
