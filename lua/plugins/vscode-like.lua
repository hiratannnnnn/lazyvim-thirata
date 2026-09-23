return {
  -- インデントガイド（VSCode風）
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = { "help", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      },
    },
  },

  -- neo-tree: VSCodeのサイドバーに近い操作感
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 30,
        mappings = {
          ["<space>"] = "none",
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },
    },
  },

  -- blink.cmp: VSCode風の補完UI
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = {},        -- EnterはNeovimデフォルト（改行）に戻す
        ["<Tab>"] = { "select_and_accept", "fallback" },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
        },
        menu = {
          draw = {
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
          },
        },
      },
    },
  },
}
