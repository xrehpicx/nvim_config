return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "lua", "typescript", "javascript","tsx","html" },
    autotag = {
      enable = true,
      filetypes = { "html", "xml", "tsx", "jsx" },
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "markdown" },
    },
  },
}
