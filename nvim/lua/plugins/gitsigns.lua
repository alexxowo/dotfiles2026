return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      current_line_blame = true, -- Mostrar autor y mensaje de commit en la línea activa
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- al final de la línea
        delay = 500,           -- retraso en milisegundos para mostrarlo
        ignore_whitespace = false,
      },
      current_line_blame_formatter = ' 👤 <author> • 📅 <author_time:%Y-%m-%d> • 💬 <summary>',
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navegación de cambios (hunks)
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "Git: Siguiente cambio" })

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "Git: Cambio anterior" })

        -- Acciones
        map("n", "<leader>gp", gs.preview_hunk, { desc = "Git: Previsualizar cambio" })
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "Git: Mostrar Blame de línea" })
        map("n", "<leader>gd", gs.diffthis, { desc = "Git: Diff de este archivo" })
      end,
    })
  end,
}
