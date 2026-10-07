return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["<S-CR>"] = "expand_all_subnodes",
        },
      },
      filesystem = {
        window = {
          fuzzy_finder_mappings = {
            ["<Tab>"] = "move_cursor_down",
            ["<S-Tab>"] = "move_cursor_up",
            ["<C-j>"] = "move_cursor_down",
            ["<C-k>"] = "move_cursor_up",
          },
        },
      },
    },
  },
}
