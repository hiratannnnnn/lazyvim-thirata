-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "clangd" then
      client.server_capabilities.documentFormattingProvider = false
    end
  end,
})

vim.api.nvim_create_autocmd({"FocusLost", "BufLeave"}, {
  pattern = "*",
  command = "silent! wa",
})

local function is_mozc_active()
  if vim.fn.executable("ibus") == 1 then
    local engine = vim.trim(vim.fn.system({ "ibus", "engine" })):lower()
    if vim.v.shell_error == 0 and engine:find("mozc", 1, true) then
      return true
    end
  end

  for _, command in ipairs({ "fcitx5-remote", "fcitx-remote" }) do
    if vim.fn.executable(command) == 1 then
      local engine = vim.trim(vim.fn.system({ command, "-n" })):lower()
      if vim.v.shell_error == 0 and engine:find("mozc", 1, true) then
        return true
      end
    end
  end

  return false
end

local last_mozc_notification = 0

vim.api.nvim_create_autocmd({ "FocusGained", "VimEnter" }, {
  group = vim.api.nvim_create_augroup("mozc_focus_notification", { clear = true }),
  callback = function()
    local now = vim.uv.hrtime()
    if now - last_mozc_notification < 1500000000 then
      return
    end

    if is_mozc_active() then
      last_mozc_notification = now
      vim.api.nvim_set_hl(0, "MozcNotificationBorder", { fg = "#ffd700" })
      vim.notify("今Mozcになってるよ！", vim.log.levels.INFO, {
        title = "IME",
        hl = { border = "MozcNotificationBorder" },
      })
    end
  end,
})

local function delete_empty_unnamed_buffers()
  local current = vim.api.nvim_get_current_buf()

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if
      bufnr ~= current
      and vim.api.nvim_buf_is_valid(bufnr)
      and vim.api.nvim_buf_is_loaded(bufnr)
      and vim.bo[bufnr].buftype == ""
      and vim.fn.buflisted(bufnr) == 1
      and not vim.bo[bufnr].modified
      and vim.api.nvim_buf_get_name(bufnr) == ""
      and vim.api.nvim_buf_line_count(bufnr) == 1
      and vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] == ""
    then
      vim.api.nvim_buf_delete(bufnr, { force = false })
    end
  end
end

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.api.nvim_buf_get_name(0) ~= "" then
      vim.schedule(delete_empty_unnamed_buffers)
    end
  end,
})
