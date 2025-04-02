return {
  "saghen/blink.cmp",
  dependencies = {
    "onsails/lspkind.nvim",
    "nvim-tree/nvim-web-devicons",
    "rafamadriz/friendly-snippets",
  },
  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {

    keymap = {
      preset = "enter",
      ["<C-y"] = { "select_and_accept" },
      -- ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      -- ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    },

    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },

    signature = {
      enabled = true,
    },

    completion = {

      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },

      documentation = {
        -- auto_show = true,
        -- auto_show_delay_ms = 0,
        treesitter_highlighting = true,
      },

      menu = {
        border = "none",
        draw = {
          treesitter = { "lsp" },
          columns = { { "kind_icon", "label", gap = 1 }, { "kind", gap = 1 } },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local lspkind = require("lspkind")
                local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then icon = dev_icon end
                else
                  icon = require("lspkind").symbolic(ctx.kind, {
                    mode = "symbol",
                  })
                end

                return icon .. ctx.icon_gap
              end,

              -- Optionally, use the highlight groups from nvim-web-devicons
              -- You can also add the same function for `kind.highlight` if you want to
              -- keep the highlight groups in sync with the icons.
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then hl = dev_hl end
                end
                return hl
              end,
            },
          },
        },
      },
    },
  },
}
