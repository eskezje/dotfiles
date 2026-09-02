vim.g.mapleader = " "

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

local map = vim.keymap.set

-- General keymaps
map("n", "<leader>q", "<cmd>qa!<CR>", { desc = "Quit all (force)" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Write file" })
-- map("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlight" })

map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>bD", "<cmd>%bd|e#|bd#<CR>", { desc = "Delete all buffers except current" })
map("n", "<leader>bl", "<cmd>buffers<CR>", { desc = "List all buffers" })
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "Find buffer (Telescope)" })

for i = 1, 9 do
  map("n", "<leader>" .. i, function()
    vim.cmd("BufferLineGoToBuffer " .. i)
  end, { desc = "Go to buffer " .. i })
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
