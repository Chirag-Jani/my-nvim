return {
  {
    "folke/which-key.nvim",
    -- pinned: lazy otherwise tracks the branch head, which ships a broken
    -- Config.triggers shape (buf.lua indexes .modes on a list)
    version = "*",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>b", group = "buffers" },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "find/format" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = true })
        end,
        desc = "Show all keymaps",
      },
    },
  },
}
