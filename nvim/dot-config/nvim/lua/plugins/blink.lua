return {
  "saghen/blink.cmp",
  -- dependencies = {
  --   "rafamadriz/friendly-snippets",
  -- },

  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    },
    appearance = {
      use_nvim_cmp_as_default = false,
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
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },

    completion = {
      accept = { auto_brackets = { enabled = true } },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        treesitter_highlighting = true,
        window = { border = "rounded" },
      },

      menu = {
        -- border = "rounded",
        draw = {
          treesitter = { "lsp" },
          columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind", gap = 1 } },
          components = {
            kind = {
              text = function(ctx)
                local len = 10 - string.len(ctx.kind)
                local space = string.rep(" ", len)
                return ctx.kind .. space .. "[" .. ctx.source_name .. "]"
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
