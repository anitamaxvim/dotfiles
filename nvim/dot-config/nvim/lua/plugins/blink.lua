return {
  "saghen/blink.cmp",
  dependencies = {
    "onsails/lspkind.nvim",
    "nvim-tree/nvim-web-devicons",
    --   "rafamadriz/friendly-snippets",
  },
  version = "*",
  opts = {
    keymap = {
      preset = "default",
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    cmdline = {
      enabled = true,
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

    completion = {
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },

      accept = { auto_brackets = { enabled = true } },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        treesitter_highlighting = true,
        window = { border = "rounded" },
      },

      menu = {
        -- border = "single",
        draw = {
          treesitter = { "lsp" },
          -- columns = { { "kind_icon", "label", gap = 1 }, { "kind", gap = 1 } },
          components = {
            kind = {
              highlight = function(ctx)
                local hl = "BlinkCmpKind" .. ctx.kind
                  or require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx)
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then hl = dev_hl end
                end
                return hl
              end,

              text = function(ctx)
                local len = 10 - string.len(ctx.kind)
                local space = string.rep(" ", len)
                return ctx.kind .. space .. "[" .. ctx.source_name .. "]"
              end,
            },

            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local lspkind = require("lspkind")
                local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then icon = dev_icon end
                else
                  icon = lspkind.symbolic(ctx.kind, {
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

    signature = {
      enabled = true,
      window = { border = "rounded" },
    },
  },
  opts_extend = { "sources.default" },
}
