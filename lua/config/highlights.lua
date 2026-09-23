local function set_highlights()
  -- 背景・前景
  vim.api.nvim_set_hl(0, "Normal", { bg = "#1c1c1c", fg = "#e0e0e0" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#5a5a5a" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2d2e" })

  -- 関数 (#ffa66e オレンジ)
  vim.api.nvim_set_hl(0, "@function", { fg = "#ffa66e" })
  vim.api.nvim_set_hl(0, "@function.call", { fg = "#ffa66e" })
  vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#ffa66e" })
  vim.api.nvim_set_hl(0, "@method.call", { fg = "#ffa66e" })

  -- function ffcfb1 cream
  vim.api.nvim_set_hl(0, "@method", { fg = "#ffcfb1" })
  vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = "#ffcfb1" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#ffcfb1" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#ffcfb1" })

  -- 型・プロパティ (#98ffb6 ミントグリーン)
  vim.api.nvim_set_hl(0, "cTypedef", { fg = "#98ffb6" })
  vim.api.nvim_set_hl(0, "@type", { fg = "#98ffb6" })

  -- 神の色 d0f4d9
  vim.api.nvim_set_hl(0, "@property", { fg = "#d0f4d9" })
  vim.api.nvim_set_hl(0, "@lsp.type.macro", { fg = "#d0f4d9" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#98ffb6" })

  -- キーワード (#957595 パープル)
  vim.api.nvim_set_hl(0, "@keyword", { fg = "#957595" })
  vim.api.nvim_set_hl(0, "cStructure", { fg = "#957595" })
  vim.api.nvim_set_hl(0, "@keyword.control", { fg = "#957595" })
  vim.api.nvim_set_hl(0, "@keyword.modifier", { fg = "#957595" })
  vim.api.nvim_set_hl(0, "@type.qualifier", { fg = "#a4bdff" })
  vim.api.nvim_set_hl(0, "@storageclass", { fg = "#a4bdff" })
  vim.api.nvim_set_hl(0, "cStorageClass", { fg = "#a4bdff" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#957595" })

  -- 変数 (#c4c4d4 ライトグレー)
  vim.api.nvim_set_hl(0, "@variable", { fg = "#c4c4d4" })
  vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#c4c4d4" })
  vim.api.nvim_set_hl(0, "@variable.member", { fg = "#c4c4d4" })

  -- 演算子・bool (#db6040 レッドオレンジ)
  vim.api.nvim_set_hl(0, "@operator", { fg = "#db6040" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#db6040" })
  vim.api.nvim_set_hl(0, "@boolean", { fg = "#db6040" })
  vim.api.nvim_set_hl(0, "@constant.builtin", { fg = "#db6040" })

  -- コメント (#65737e グレー)
  vim.api.nvim_set_hl(0, "@comment", { fg = "#65737e" })
  vim.api.nvim_set_hl(0, "Comment", { fg = "#65737e" })

  -- pink EF92A3
  vim.api.nvim_set_hl(0, "cType", { fg = "#ef92a3" })
  vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#ef92a3" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#ef92a3" })
  vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = "#ef92a3" })
  vim.api.nvim_set_hl(0, "makeTarget", { fg = "#ef92a3" })

  -- Doxygen: コード本体と同じセマンティクスで色分け
  vim.api.nvim_set_hl(0, "@keyword.doxygen", { fg = "#957595" })
  vim.api.nvim_set_hl(0, "@variable.doxygen", { fg = "#c4c4d4" })
  vim.api.nvim_set_hl(0, "@variable.parameter.doxygen", { fg = "#c4c4d4" })
  vim.api.nvim_set_hl(0, "@function.doxygen", { fg = "#ffa66e" })
  vim.api.nvim_set_hl(0, "@keyword.modifier.doxygen", { fg = "#a4bdff" })
  vim.api.nvim_set_hl(0, "@tag.doxygen", { fg = "#d0f4d9" })
  vim.api.nvim_set_hl(0, "@label.doxygen", { fg = "#ef92a3" })
  vim.api.nvim_set_hl(0, "@operator.doxygen", { fg = "#db6040" })
  vim.api.nvim_set_hl(0, "@punctuation.delimiter.doxygen", { fg = "#65737e" })
  vim.api.nvim_set_hl(0, "@punctuation.bracket.doxygen", { fg = "#65737e" })
  vim.api.nvim_set_hl(0, "@markup.italic.doxygen", { fg = "#e0e0e0", italic = true })

  -- 型宣言キーワードは storage class と同じライトブルー
  vim.api.nvim_set_hl(0, "@keyword.declaration_type", { fg = "#a4bdff" })

  -- public / private / protected は組み込み型と同じ薄いピンク
  vim.api.nvim_set_hl(0, "@keyword.access_specifier", { fg = "#ef92a3" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_highlights,
})

set_highlights()
