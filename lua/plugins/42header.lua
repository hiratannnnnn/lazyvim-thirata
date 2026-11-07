return {
  "42Paris/42header",
  cmd = "Stdheader",
  init = function()
    vim.g.user42 = "thirata"
    vim.g.mail42 = "thirata@student.42tokyo.jp"
  end,
  keys = {
    { "<F1>", "<cmd>Stdheader<cr>", desc = "42 Header" },
  },
}
