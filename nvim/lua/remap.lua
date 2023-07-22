vim.g.mapleader = ' '

-- Cancel ThePrimeagen for this one, don't @ me
vim.keymap.set("i", "<C-c>", "<Esc>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Q is evil
vim.keymap.set("n", "Q", "<nop>")

-- source the file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
