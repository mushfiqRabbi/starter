return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
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
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
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
    opts = {
      window = {
        completion = require("cmp").config.window.bordered({
          border = "single",
        }),
        documentation = require("cmp").config.window.bordered({
          border = "single",
        }),
      },
    },
  },
}
