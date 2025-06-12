return {
  "HakonHarnes/img-clip.nvim",
  event = "BufEnter",
  opts = {
    -- Default configuration
    default = {
      dir_path = "../files", -- Directory to save images to
      file_name = "%Y%m%d%H%M%S", -- Image file name format
      url_encode_path = false, -- URL encode file path when copying
      use_absolute_path = false, -- Use absolute path for image file
      relative_to_current_file = false, -- Do not make path relative to current file
      prompt_for_file_name = false, -- Prompt for file name when pasting
      show_notification = true, -- Show notification on paste
      insert_mode_after_paste = true, -- Enter insert mode after pasting image
    },

    -- Override by file type
    filetypes = {
      markdown = {
        url_encode_path = true,
        insert_only_markdown = true, -- Insert markdown image link only
        markdown_name_generator = function(_, file_path)
          return string.format("![%s](%s)", "image", file_path) -- Customize markdown image text
        end,
      },
    },
  },
  keys = {
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste Image" },
  },
}
