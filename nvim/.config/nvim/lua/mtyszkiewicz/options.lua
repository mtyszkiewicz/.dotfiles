vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.cmdheight=0

-- Hide tilda characters
vim.opt.fillchars = { eob = " " }

-- Tabs vs spaces
vim.o.tabstop = 4
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4  -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4   -- Number of spaces inserted when indenting

-- Highlight cursor line
vim.opt.cursorline = true
