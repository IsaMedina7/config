return {
  "obsidian-nvim/obsidian.nvim",
  -- "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "mikaela-notes", -- Name of the workspace
        path = "/mnt/c/Users/isabe/OneDrive/Documentos/mikaela-notes/", -- Path to the vault
      },
    },
    completion = {
      blink = true,
      -- nvim_cmp = true, -- Use nvim-cmp for completion
      -- min_chars = 2, -- Minimum characters to trigger completion
    },
    notes_subdir = "limbo", -- Subdirectory for notes
    new_notes_location = "limbo",
    attachments = {
      img_folder = "files",
    },
    daily_notes = {
      template = "note",
    },
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = "snacks.pick",
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context: follow link, show notes with tag, toggle checkbox, or toggle heading fold
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },

    -- Function to generate note IDs
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    -- Settings for templates
    templates = {
      subdir = "templates", -- Subdirectory for templates
      date_format = "%Y-%m-%d-%a", -- Date format for templates
      gtime_format = "%H:%M", -- Time format for templates
      tags = "", -- Default tags for templates
    },
  },
}
