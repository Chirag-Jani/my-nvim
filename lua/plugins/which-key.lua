return {
  {
    "folke/which-key.nvim",
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
