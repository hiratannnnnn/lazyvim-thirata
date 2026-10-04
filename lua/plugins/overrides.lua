return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = {},
      },
    },
  },
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<C-t>",
        function()
          Snacks.terminal.focus(nil, { cwd = LazyVim.root() })
        end,
        mode = { "n", "t" },
        desc = "Floating terminal (Root Dir)",
      },
    },
    opts = {
      explorer = { enabled = false },
      terminal = {
        win = {
          position = "float",
          border = "rounded",
          width = 0.8,
          height = 0.8,
          backdrop = 60,
        },
      },
    },
  },
}
