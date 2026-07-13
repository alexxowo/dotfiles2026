return {
  "AlexvZyl/nordic.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nordic").setup({
      -- Under leadership of Nord palette
      -- Options can be configured here
      bold_keywords = true,
      italic_comments = true,
      transparent = {
        bg = false,
      },
    })
  end,
}
