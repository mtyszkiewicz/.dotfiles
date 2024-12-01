-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
    end,
})

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "FocusGained" }, {
    callback = function()
        -- Only check if not in command mode and the buffer is a normal buffer
        if vim.fn.mode() ~= 'c' and vim.bo.buftype == '' then
            vim.cmd('checktime')
        end
    end,
    pattern = { "*" },
})

-- Set theme transparency
local transparent_elements = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "LineNr",
    "Folded",
    "NonText",
    "SpecialKey",
    "VertSplit",
    "SignColumn",
    "EndOfBuffer",
    -- "CursorLine",
    "WinSeparator",
}
for _, elem in pairs(transparent_elements) do
    vim.cmd("hi " .. elem .. " guibg=NONE ctermbg=NONE")
end
