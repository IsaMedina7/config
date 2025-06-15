return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = ":call mkdp#util#install()",
  config = function()
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_refresh_slow = 0
    vim.g.mkdp_command_for_global = 0
    vim.g.mkdp_open_to_the_world = 0
    vim.g.mkdp_browser = ""
    vim.g.mkdp_echo_preview_url = 1
    vim.g.mkdp_page_title = "「${name}」"
  end,
  keys = {
    { "<leader>cp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" },
    -- { "<leader>cs", "<cmd>MarkdownPreviewStop<cr>", desc = "Stop Markdown Preview" },
    { "<leader>co", "<cmd>MarkdownPreviewStop<cr>", desc = "Stop Markdown Preview" },
  },
}
