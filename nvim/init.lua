-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.api.nvim_set_hl(0, "CustomHeaderHighlight", { fg = "#ff79c6", bg = "NONE", bold = true })
