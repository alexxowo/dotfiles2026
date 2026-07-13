return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- Atajos de Harpoon
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon: Agregar archivo" })
    vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Ver menú" })

    -- Atajos rápidos para los primeros 4 archivos marcados
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Harpoon: Archivo 1" })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Harpoon: Archivo 2" })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Harpoon: Archivo 3" })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Harpoon: Archivo 4" })
  end,
}
