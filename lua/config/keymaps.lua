local keymap = vim.keymap
local util = require("util")

-- qol
keymap.set('n', '<leader>s', ':w<cr>')
keymap.set('n', '<leader>o', ':b#<cr>')
keymap.set('n', '<leader>q', util.buffer_close)
keymap.set('n', '<esc>', '<esc>:nohl<cr>')

-- insert mode
keymap.set({ 'i', 'o' }, '<M-h>', '<left>')
keymap.set({ 'i', 'o' }, '<M-l>', '<right>')
keymap.set({ 'i', 'o' }, '<M-j>', '<down>')
keymap.set({ 'i', 'o' }, '<M-k>', '<up>')
keymap.set({ 'i', 'o' }, '<M-y>', '<c-o>^')
keymap.set({ 'i', 'o' }, '<M-o>', '<c-o>$')
keymap.set({ 'i', 'o' }, '<M-u>', '<c-o>cc')
keymap.set({ 'i', 'o' }, '<M-n>', '<c-w>')

-- motion
keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')
keymap.set('n', '<M-j>', '<c-d>zz')
keymap.set('n', '<M-k>', '<c-u>zz')
keymap.set({ "n", "x" }, "H", "^")
keymap.set({ "n", "x" }, "L", "g_")
keymap.set({ "n", "x" }, "M", "`")

-- visual selection
keymap.set('n', 'gv', '`[v`]')
keymap.set('x', '<up>', ':m \'<-2<CR>gv=gv')
keymap.set('x', '<down>', ':m \'>+1<CR>gv=gv')
keymap.set('x', '<tab>', '>gv')
keymap.set('x', '<s-tab>', '<gv')
keymap.set('x', '.', ':norm .<cr>')
keymap.set('x', '@', ':norm @q<cr>')

--terminal
keymap.set('t', '<leader><esc>', '<C-\\><C-n>')
