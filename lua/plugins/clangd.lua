return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          init_options = {
            fallbackFlags = {
              "-I../includes",
              "-I../libft/includes",
              "-I../minilibx-linux",
              "-I../../includes",
              "-I../../libft/includes",
              "-I../../minilibx-linux",
            },
          },
        },
      },
    },
  },
}
