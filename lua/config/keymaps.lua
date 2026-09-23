-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-e>", function()
  vim.cmd("%!c_formatter_42")
  vim.cmd("Stdheader")
end, { desc = "Format with c_formatter_42 and update 42 header" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("n", "<S-ScrollWheelUp>", "zh", { desc = "Scroll left" })
vim.keymap.set("n", "<S-ScrollWheelDown>", "zl", { desc = "Scroll right" })

vim.keymap.set("n", "<C->>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-<>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })

local function move_horizontal(direction)
  local wrap_command = direction == "h" and "b" or "t"
  local current = vim.api.nvim_get_current_win()

  vim.cmd.wincmd(direction)
  if vim.api.nvim_get_current_win() == current then
    -- 中間ウィンドウを経由せず、反対側の端へ直接移動する。
    -- これによりNeo-treeからファイルを開く際の直前ウィンドウを保つ。
    vim.cmd.wincmd(wrap_command)
  end
end

vim.keymap.set("n", "<C-h>", function()
  move_horizontal("h")
end, { desc = "Go to left window (wrap)" })

vim.keymap.set("n", "<C-l>", function()
  move_horizontal("l")
end, { desc = "Go to right window (wrap)" })

vim.keymap.set("n", "<leader>d", function()
  Snacks.bufdelete()
end, {
  desc = "Delete current buffer",
  nowait = true,
})

for _, lhs in ipairs({ "<C-/>", "<C-_>" }) do
  vim.keymap.set("n", lhs, "gcc", { remap = true, desc = "Toggle comment" })
  vim.keymap.set("v", lhs, "gc", { remap = true, desc = "Toggle comment" })
end

if vim.g.neovide then
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor or 1.0

  vim.keymap.set({ "n", "i", "v" }, "<C-=>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
  end, { desc = "Increase Neovide font size" })

  vim.keymap.set({ "n", "i", "v" }, "<C-->", function()
    vim.g.neovide_scale_factor = math.max(0.1, vim.g.neovide_scale_factor - 0.1)
  end, { desc = "Decrease Neovide font size" })

  vim.keymap.set({ "n", "i", "v" }, "<C-0>", function()
    vim.g.neovide_scale_factor = 1.0
  end, { desc = "Reset Neovide font size" })
end
