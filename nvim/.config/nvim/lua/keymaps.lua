local Utils = require'utils'

-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
-- local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local tnoremap = Utils.tnoremap
-- local nmap = Utils.nmap
-- local xmap = Utils.xmap

vim.g.mapleader = " "
vim.g.maplocalleader = " "
--Normal mode
    nnoremap("<C-p",'"+P')
    -- Switch buffers (needs nvim-bufferline)
    nnoremap("<TAB>", "<Cmd>BufferLineCycleNext<CR>")
    nnoremap("<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>")
    nnoremap("<leader>bc", "<Cmd>bdelete!<CR>")
    -- Telescope
    nnoremap("<leader>ff", "<Cmd>Telescope find_files<CR>")
    nnoremap("<leader>fb", "<Cmd>Telescope buffers<CR>")
    nnoremap("<leader>fg", "<Cmd>Telescope live_grep<CR>")
    -- NvimTree
    nnoremap("<leader>e", "<Cmd>NeoTreeShowToggle<CR>")
    --Terminal
    nnoremap("<leader>t","<Cmd>terminal<CR>")
    nnoremap("<leader>s","<Cmd> %s//gc")
    nnoremap("<leader>gg","<Cmd>LazyGitCurrentFile<CR>")

--Visual mode
    vnoremap("<C-c>",'"+y')
--Terminal mode
    tnoremap("<Esc>", "<C-\\><C-n>")
