local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "html",
    "css",
    "javascript",
    "json",
    "toml",
    "markdown",
    "c",
    "bash",
    "lua",
    "dockerfile",
    "go",
    "java",
    "json",
    "latex",
    "make",
    "python",
    "rust",
    "svelte",
    "solidity",
    "typescript"
  }
}

M.nvimtree = {
  git = {
    enable = true,
  }
}

return M
