local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "vue",
    "c",
    "markdown",
    "markdown_inline",
    "asm",
    "python"
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    -- web dev stuff
    "css-lsp",
    "stylelint",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettierd",
    "eslint_d",
    -- c/cpp stuff
    "clangd",
    "clang-format",
    "asmfmt",
    -- python stuff
    "jedi-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
