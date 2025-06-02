return {
  "brianhuster/autosave.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    enabled = false,
    execution_message = {
      enabled = true,
      message = function()
        return "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S")
      end,
      dim = 0.18,
      cleaning_interval = 1250,
    },
    trigger_events = {
      "InsertLeave",
      "TextChanged",
    },
    write_all_buffers = false,
    debounce_delay = 135,
    conditions = {
      exists = true,
      modifiable = true,
      filename_is_not = {},
      filetype_is_not = {
        "neo-tree",
        "lazy",
        "qf",
        "help",
        "terminal",
      },
    },
  },
}
