return {
  {
    -- {
    --   "xiyaowong/transparent.nvim",
    --   config = function()
    --     require("transparent").setup({
    --       extra_groups = { -- table/string: additional groups that should be cleared
    --         "Normal",
    --         "NormalNC",
    --         "Comment",
    --         "Constant",
    --         "Special",
    --         "Identifier",
    --         "Statement",
    --         "PreProc",
    --         "Type",
    --         "Underlined",
    --         "Todo",
    --         "String",
    --         "Function",
    --         "Conditional",
    --         "Repeat",
    --         "Operator",
    --         "Structure",
    --         "LineNr",
    --         "NonText",
    --         "SignColumn",
    --         "CursorLineNr",
    --         "EndOfBuffer",
    --       },
    --       exclude_groups = {}, -- table: groups you don't want to clear
    --     })
    --   end,
    -- },
    {
      "baliestri/aura-theme",
      lazy = false,
      priority = 1000,
      config = function(plugin)
        vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
        -- vim.cmd([[colorscheme aura-soft-dark]])
      end,
    },

    {
      "AlexvZyl/nordic.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("nordic").setup({
          transparent = {
            -- Enable transparent background.
            bg = true,
            -- Enable transparent background for floating windows.
            float = false,
          },
        })
        -- require("nordic").load() -- Carga el esquema de colores
      end,
    },

    {
      "nyoom-engineering/oxocarbon.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        -- vim.cmd([[colorscheme oxocarbon]])

        vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "*",
          callback = function()
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
          end,
        })
      end,
    },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      opts = {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true, -- disables setting the background color.
        term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      },
    },
    {
      --"Alan-TheGentleman/oldworld.nvim",
      "dgox16/oldworld.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        -- Aplicamos el tema
        --vim.cmd.colorscheme("oldworld")

        -- Usamos un autocmd para forzar la transparencia después de que todo esté listo
        vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "oldworld",
          callback = function()
            vim.cmd([[
          highlight Normal guibg=NONE ctermbg=NONE
          highlight NormalFloat guibg=NONE ctermbg=NONE
          highlight LineNr guibg=NONE ctermbg=NONE
          highlight SignColumn guibg=NONE ctermbg=NONE
        ]])
          end,
        })
      end,
    },
    {
      "rebelot/kanagawa.nvim",
      priority = 1000,
      lazy = true,
      config = function()
        require("kanagawa").setup({
          compile = false, -- enable compiling the colorscheme
          undercurl = true, -- enable undercurls
          commentStyle = { italic = true },
          functionStyle = {},
          keywordStyle = { italic = true },
          statementStyle = { bold = true },
          typeStyle = {},
          transparent = true, -- do not set background color
          dimInactive = false, -- dim inactive window `:h hl-NormalNC`
          terminalColors = true, -- define vim.g.terminal_color_{0,17}
          colors = { -- add/modify theme and palette colors
            palette = {},
            theme = {
              wave = {},
              lotus = {},
              dragon = {},
              all = {
                ui = {
                  bg_gutter = "none", -- set bg color for normal background
                  bg_sidebar = "none", -- set bg color for sidebar like nvim-tree
                  bg_float = "none", -- set bg color for floating windows
                },
              },
            },
          },
          overrides = function(colors) -- add/modify highlights
            return {
              LineNr = { bg = "none" },
              NormalFloat = { bg = "none" },
              FloatBorder = { bg = "none" },
              FloatTitle = { bg = "none" },
              TelescopeNormal = { bg = "none" },
              TelescopeBorder = { bg = "none" },
              LspInfoBorder = { bg = "none" },
            }
          end,
          theme = "wave", -- Load "wave" theme
          background = { -- map the value of 'background' option to a theme
            dark = "dragon", -- try "dragon" !
            light = "lotus",
          },
        })
      end,
    },
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {
        transparent = true,
        styles = {
          sidebars = "dark",
          floats = "dark",
        },
      },
    },
    {
      "tiagovla/tokyodark.nvim",
      opts = {
        -- custom options here
      },
      config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
        -- vim.cmd([[colorscheme tokyodark]])
      end,
    },
    {
      -- LazyVim configuration
      "LazyVim/LazyVim",
      opts = {
        -- Set the default color scheme
        --colorscheme = "kanagawa-dragon",
        colorscheme = "tokyodark",
        -- colorscheme = "nordic",
      },
    },
  },
}
