vim.g.mapleader = ' '

-- move visually highlighted code up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 'J' stays in place
vim.keymap.set("n", "J", "mzJ`z")

-- half page jumping keeps cursor in the same place
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
-- paste without overwriting the paste buffer
vim.keymap.set('x', '<leader>p', [["_dP]])

-- next greatest remap ever : asbjornHaland
-- shorthand for yanking to system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- delete to void register
vim.keymap.set({'n', 'v'}, '<leader>d', [["_d]])

-- 'Q' is evil
vim.keymap.set('n', 'Q', '<nop>')

-- cancel ThePrimeagen for this one, don't @ me
vim.keymap.set('i', '<C-c>', '<Esc>')

-- quickfix navigation
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- find/replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- source the file
vim.keymap.set('n', '<leader><leader>', function()
    vim.cmd('source')
end)
