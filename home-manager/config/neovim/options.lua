-- STD 

--vim.g.wrap= false
vim.opt.wrap = false
--	vim.g.wrapmargin= 0
--	vim.g.textwidth= 0
vim.g.smartcase= true
vim.g.smartindent= true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.clipboard = 'unnamedplus'
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.tabstop = 2
vim.o.shiftwidth = 4
vim.o.updatetime = 300
vim.o.termguicolors = true
vim.o.mouse = 'a'


-- Key Mappings 
local map = vim.keymap.set
-- Close current window
map("n", "<leader>q", ":q <cr>", {silent = true })  -- not forced
map("n", "<leader>Q", ":q! <cr>", {silent = true }) -- forced
-- Save Buffer 
map("n", "<leader>w", ":w <cr>", {silent = true })  -- Current
map("n", "<leader>W", ":wa <cr>", {silent = true }) -- All 
-- Easily switch in between windows 
map("n", "<C-l>", "<c-w>w", {silent = true }) -- Next 
map("n", "<C-h>", "<c-w>W", {silent = true }) -- Previous  


-- for UFO 
vim.o.foldcolumn = '1' 
vim.o.foldlevel = 99 
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- For tree-nvim 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
