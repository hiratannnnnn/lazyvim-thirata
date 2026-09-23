-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  {
    "windwp/nvim-ts-autotag",
    opts = {
      opts = {
        enable_close = false,
      },
      per_filetype = {
        typescript = { enable_close = true },
        typescriptreact = { enable_close = true },
      },
    },
  },
}
