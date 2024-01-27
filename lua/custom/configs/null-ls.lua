local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with {
    filetypes = { "html", "markdown", "css", "astro", "javascript", "typescript", "javascriptreact", "typescriptreact", "scss", "less", "json"},
  }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- go
  null_ls.builtins.formatting.gofumpt,
  null_ls.builtins.formatting.goimports_reviser,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
