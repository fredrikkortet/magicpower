--Lua config for Settings
local o = vim.o
--Set number
o.number = true
o.relativenumber = true
--Make search act "normal"
o.incsearch = true
--Updatefaster
o.updatetime = 300
--No sound on error
o.errorbells = false
--Little menu
o.wildmenu = true
--Save it in buffer
o.hidden = true
--Search better
o.hlsearch = false
--No wraping
o.wrap = false
--Search with cases
o.signcolumn = 'yes'
--Case search
o.smartcase = true
--Tabs
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.autoindent = true
o.smartindent = true
--Don't scroll to low
o.scrolloff = 8
o.expandtab = true
--Make a new undodir
o.undodir = vim.fn.expand("~/.undo")
o.undofile = true
--Enable filetype
vim.cmd[[filetype plugin on]]
vim.cmd[[filetype indent on]]
--Theme
vim.cmd[[hi Normal guibg=none ctermbg=none]]
