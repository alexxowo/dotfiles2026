return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("todo-comments").setup()

    -- Navegación de TODOs
    vim.keymap.set("n", "]t", function()
      require("todo-comments").jump_next()
    end, { desc = "Siguiente comentario TODO" })

    vim.keymap.set("n", "[t", function()
      require("todo-comments").jump_prev()
    end, { desc = "Anterior comentario TODO" })

    -- Buscar todos los TODOs del proyecto usando Telescope
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Telescope: Buscar TODOs" })
  end,
}
