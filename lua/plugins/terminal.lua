return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-t>", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle right terminal" },
    },
    opts = {
      size = function(term)
        if term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.38)
        end
      end,
      direction = "vertical",
      shade_terminals = false,
      persist_size = true,
      close_on_exit = true,
    },
  },
}
