local vim = vim
-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Configuración para el formateo automático de Markdown
local augroup = vim.api.nvim_create_augroup("markdown_formatting", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "markdown.mdx" },
  callback = function()
    -- Establece opciones locales para archivos markdown
    vim.opt_local.textwidth = 80
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end,
  group = augroup,
})

-- Formateo automático al guardar
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.md", "*.mdx" },
  callback = function()
    require("conform").format({ bufnr = 0 })
  end,
  group = augroup,
})
