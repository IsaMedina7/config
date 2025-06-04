return {

  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "html", "javascript", "typescript", "tsx" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
-- "nvim-treesitter/nvim-treesitter",
-- build = ":TSUpdate",
-- opts = {
--   ensure_installed = { "html", "javascript", "typescript", "tsx" }, -- por ejemplo
--   highlight = { enable = true },
--   indent = { enable = true },
-- },
