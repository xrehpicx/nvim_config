return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    'charkuils/nvim-whisky'
  },

  {
    'Alexis12119/nightly.nvim',
    config = function()
      require("nightly").setup({
        color = "black", -- blue, green or red
        transparent = false,
        styles = {
          comments = { italic = true },
          functions = { italic = false },
          keywords = { italic = false },
          variables = { italic = false },
        },
        highlights = {
          -- add or override highlights
          -- Normal = { bg = "#000000" }
        },
      })
    end
  }
}
