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

vim.keymap.set("n", "<leader>ft", function()
  local root = LazyVim.root()
  local project = vim.fn.fnamemodify(root, ":t")

  local function update_terminal_title(win)
    if not win:valid() or vim.api.nvim_get_current_win() ~= win.win then
      return
    end

    local mode = vim.api.nvim_get_mode().mode
    local label, highlight
    if mode:sub(1, 1) == "t" then
      label, highlight = "TERMINAL", "DiagnosticInfo"
    elseif mode:sub(1, 1) == "i" then
      label, highlight = "INSERT", "DiagnosticWarn"
    else
      label, highlight = "NORMAL", "DiagnosticHint"
    end

    win:set_title({
      { " 󰆍  ", "DiagnosticInfo" },
      { project .. "  ", "SnacksTitle" },
      { "● " .. label .. " ", highlight },
    }, "center")
  end

  Snacks.terminal(nil, {
    cwd = root,
    win = {
      position = "float",
      width = 0.84,
      height = 0.8,
      border = "rounded",
      backdrop = 60,
      title = " 󰆍  Terminal · " .. project .. " ",
      title_pos = "center",
      footer = " Ctrl-/ hide  ·  Esc ×2 normal ",
      footer_pos = "center",
      keys = {
        hide_slash_normal = {
          "<C-/>",
          "hide",
          mode = "n",
          desc = "Hide Terminal",
        },
        hide_underscore_normal = {
          "<C-_>",
          "hide",
          mode = "n",
          desc = "which_key_ignore",
        },
      },
      on_win = function(win)
        win:on({ "ModeChanged", "TermEnter", "TermLeave" }, update_terminal_title)
        update_terminal_title(win)
      end,
    },
  })
end, { desc = "Terminal (Root Dir, Float)" })

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
