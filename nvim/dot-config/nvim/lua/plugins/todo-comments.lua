return {
  "folke/todo-comments.nvim",
  optional = true,
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    { "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" },
  },
}
