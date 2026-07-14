-- Atajos de teclado vinculados al LSP al adjuntarse a un buffer
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Acciones de LSP al abrir un archivo soportado",
  callback = function(event)
    -- Función auxiliar para no repetir código
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("gd", function()
      local has_laravel, laravel = pcall(function()
        return _G.Laravel or require("laravel")
      end)
      if has_laravel and laravel and (vim.bo[event.buf].filetype == "php" or vim.bo[event.buf].filetype == "blade") then
        if laravel.app("gf").cursorOnResource() then
          laravel.commands.run("gf")
          return
        end
      end
      vim.lsp.buf.definition()
    end, "Ir a la definición (o recurso Laravel)")
    map("gI", function()
      local clients = vim.lsp.get_clients({ bufnr = event.buf })
      local supports_impl = false
      for _, client in ipairs(clients) do
        if client.supports_method("textDocument/implementation") then
          supports_impl = true
          break
        end
      end
      if supports_impl then
        vim.lsp.buf.implementation()
      else
        vim.lsp.buf.definition()
      end
    end, "Ir a la implementación (o definición)")
    map("gr", vim.lsp.buf.references, "Ver referencias")
    map("K", vim.lsp.buf.hover, "Ver documentación / información del tipo")
    map("<leader>rn", vim.lsp.buf.rename, "Renombrar símbolo")
    map("<leader>ca", vim.lsp.buf.code_action, "Acciones de código sugeridas")
    map("<leader>d", vim.diagnostic.open_float, "Ver diagnóstico flotante")
    map("[d", vim.diagnostic.goto_prev, "Ir al diagnóstico anterior")
    map("]d", vim.diagnostic.goto_next, "Ir al siguiente diagnóstico")
  end,
})
