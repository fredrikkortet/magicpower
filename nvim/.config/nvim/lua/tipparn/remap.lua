vim.g.mapleader = " "

local set = vim.keymap.set
set("n", "<leader>pv", vim.cmd.Ex)

set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
set("n", "<leader>p", "\"_dP")

set("n", "<leader>y", "\"+y")
set("v", "<leader>y", "\"+y")
set("n", "<leader>Y", "\"+Y")

