return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- This repository uses an old Ant layout.  Prefer its build.xml over
      -- a .git directory belonging to a parent directory.
      opts.root_dir = function(path)
        return vim.fs.root(path, { "build.xml", "pom.xml", "settings.gradle", "settings.gradle.kts", ".git" })
      end
      opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
        java = {
          project = {
            sourcePaths = { "." },
          },
        },
      })
      return opts
    end,
  },
}
