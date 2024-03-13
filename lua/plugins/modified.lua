return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
        sort_by = "insert_after_current",
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      on_open = function(win)
        vim.api.nvim_win_set_config(win, {
          focusable = false,
          border = "single",
        })
      end,
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
        char = "▏",
        tab_char = "▏",
      },
    },
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "▏",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = {
        "bash",
        "c",
        "diff",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "vim",
        "vimdoc",
      }
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".root" },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    -- TODO: Have to remove this url
    url = "https://github.com/GustawXYZ/nvim-cmp",
    opts = {
      window = {
        completion = require("cmp").config.window.bordered({
          border = "single",
        }),
        documentation = require("cmp").config.window.bordered({
          border = "single",
        }),
      },
      view = {
        entries = { name = "custom", selection_order = "near_cursor" },
      },
      mapping = require("cmp").mapping.preset.insert({
        ["<C-Space>"] = require("cmp").mapping({
          i = function(fallback)
            if require("cmp").visible() then
              require("cmp").close()
            elseif not require("cmp").visible() then
              require("cmp").complete()
            else
              fallback()
            end
          end,
        }),
        ["<down>"] = require("cmp").mapping({
          i = function(fallback)
            if require("cmp").visible() then
              require("cmp").select_next_item({
                behavior = require("cmp").SelectBehavior.Select,
                preserve_mapping_verticality = true,
              })
            else
              fallback()
            end
          end,
        }),
        ["<up>"] = require("cmp").mapping({
          i = function(fallback)
            if require("cmp").visible() then
              require("cmp").select_prev_item({
                behavior = require("cmp").SelectBehavior.Select,
                preserve_mapping_verticality = true,
              })
            else
              fallback()
            end
          end,
        }),
      }),
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.component_separators = "|"
      opts.options.section_separators = ""
      opts.sections.lualine_y = {
        { "progress" },
      }
      opts.sections.lualine_z = {
        { "location" },
      }
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        signature = {
          auto_open = {
            enabled = false,
          },
        },
      },
      views = {
        popupmenu = {
          border = {
            style = "single",
          },
        },
        cmdline_popupmenu = {
          border = {
            style = "single",
          },
        },
        popup = {
          border = {
            style = "single",
          },
        },
        cmdline_popup = {
          border = {
            style = "single",
          },
        },
        hover = {
          border = {
            style = "single",
          },
        },
        confirm = {
          border = {
            style = "single",
          },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")
      local open_with_trouble = function(...)
        return require("trouble.providers.telescope").open_with_trouble(...)
      end
      local open_selected_with_trouble = function(...)
        return require("trouble.providers.telescope").open_selected_with_trouble(...)
      end
      opts.defaults.borderchars = {
        "─",
        "│",
        "─",
        "│",
        "┌",
        "┐",
        "┘",
        "└",
      }
      opts.defaults.mappings.i["<c-K>"] = false
      opts.defaults.mappings.n["<c-K>"] = false
      opts.defaults.mappings.i["<a-t>"] = false
      opts.defaults.mappings.i["<c-x>"] = false
      opts.defaults.mappings.n["<c-x>"] = false
      opts.defaults.mappings.i["<c-t>"] = actions.select_tab
      opts.defaults.mappings.i["<C-f>"] = actions.preview_scrolling_right
      opts.defaults.mappings.n["<c-f>"] = actions.preview_scrolling_right
      opts.defaults.mappings.i["<c-b>"] = actions.preview_scrolling_left
      opts.defaults.mappings.n["<c-b>"] = actions.preview_scrolling_left
      opts.defaults.mappings.i["<c-q>"] = open_with_trouble
      opts.defaults.mappings.n["<c-q>"] = open_with_trouble
      opts.defaults.mappings.i["<a-q>"] = open_selected_with_trouble
      opts.defaults.mappings.n["<a-q>"] = open_selected_with_trouble
      opts.defaults.mappings.i["<c-s>"] = actions.select_horizontal
      opts.defaults.mappings.n["<c-s>"] = actions.select_horizontal
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    opts = {
      config = {
        center = {
          {
            action = require("lazyvim.util").telescope("files"),
            desc = " Find file",
            icon = " ",
            key = "f",
          },
          {
            action = "Telescope oldfiles",
            desc = " Recent files",
            icon = " ",
            key = "r",
          },
          {
            action = [[lua require("lazyvim.util").telescope.config_files()()]],
            desc = " Config",
            icon = " ",
            key = "c",
          },
          {
            action = 'lua require("persistence").load()',
            desc = " Restore Session",
            icon = " ",
            key = "s",
          },
          {
            action = "Lazy",
            desc = " Lazy",
            icon = "󰒲 ",
            key = "l",
          },
          {
            action = "Mason",
            desc = " Mason",
            icon = " ",
            key = "m",
          },
          {
            action = "qa",
            desc = " Quit",
            icon = " ",
            key = "q",
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "cspell",
        "codespell",
        "rustywind",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = { "rustywind", "prettier" },
        javascriptreact = { "rustywind", "prettier" },
        typescriptreact = { "rustywind", "prettier" },
        zsh = { "shfmt" },

        -- ["*"] = { "codespell" },
        ["_"] = { "trim_whitespace" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        ["*"] = { "cspell", "codespell" },
      },
      linters = {
        cspell = {
          condition = function(ctx)
            return not vim.fs.find({ ".cspell-ignore" }, { path = ctx.filename, upward = true })[1]
          end,
        },
        codespell = {
          condition = function(ctx)
            return not vim.fs.find({ ".codespell-ignore" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },
}
