return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "famiu/bufdelete.nvim",
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        show_buffer_close_icons = true,
        show_buffer_default_colors = true,
        show_close_icon = true,
        separator_style = "thick",
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        sort_by = "id",
        hover = {
          enabled = true,
          delay = 100,
          reveal = { "close" },
        },
        close_command = function(bufnr)
          require("bufdelete").bufdelete(bufnr, false)
        end,
      },
    })

    local map = vim.keymap.set

    map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Buffer anterior" })
    map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Buffer siguiente" })

    map("n", "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", { desc = "Buffer anterior" })
    map("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { desc = "Buffer siguiente" })
    map("n", "<leader>bb", "<cmd>BufferLinePick<cr>",      { desc = "Elegir buffer" })

    map("n", "<leader>bd", "<cmd>Bdelete<cr>",                 { desc = "Cerrar buffer" })
    map("n", "<leader>bD", "<cmd>Bdelete!<cr>",                { desc = "Forzar cierre de buffer" })
    map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>",   { desc = "Cerrar otros buffers" })

    map("n", "<leader>b<", "<cmd>BufferLineMovePrev<cr>", { desc = "Mover buffer a la izquierda" })
    map("n", "<leader>b>", "<cmd>BufferLineMoveNext<cr>", { desc = "Mover buffer a la derecha" })

    for i = 1, 9 do
      map("n", "<leader>b" .. i, function()
        require("bufferline").go_to_buffer(i, true)
      end, { desc = "Ir al buffer " .. i })
    end
  end,
}
