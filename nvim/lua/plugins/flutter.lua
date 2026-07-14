return {
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      require("flutter-tools").setup({
        lsp = {
          color_variables = true, -- Highlight color variables in code
          capabilities = capabilities,
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
          }
        }
      })
    end,
  }
}
