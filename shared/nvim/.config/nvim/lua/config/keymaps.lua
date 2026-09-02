-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

pcall(vim.keymap.del, "n", "<leader>n")

map("n", "<leader>nn", function()
  Snacks.picker.notifications()
end, { desc = "Notification History" })

map("n", "<leader>nh", "<cmd>nohlsearch<CR>", {
  desc = "Clear Search Highlight",
})

map("n", "<leader>nm", "<cmd>Noice history<CR>", {
  desc = "Message History",
})

map("n", "<leader>nl", "<cmd>Noice last<CR>", {
  desc = "Last Message",
})
