-- Atajos de teclado vinculados al LSP al adjuntarse a un buffer
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Acciones de LSP al abrir un archivo soportado",
  callback = function(event)
    -- Función auxiliar para no repetir código
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("gd", vim.lsp.buf.definition, "Ir a la definición")
    map("gI", vim.lsp.buf.implementation, "Ir a la implementación")
    map("gr", vim.lsp.buf.references, "Ver referencias")
    map("K", vim.lsp.buf.hover, "Ver documentación / información del tipo")
    map("<leader>rn", vim.lsp.buf.rename, "Renombrar símbolo")
    map("<leader>ca", vim.lsp.buf.code_action, "Acciones de código sugeridas")
    map("<leader>d", vim.diagnostic.open_float, "Ver diagnóstico flotante")
    map("[d", vim.diagnostic.goto_prev, "Ir al diagnóstico anterior")
    map("]d", vim.diagnostic.goto_next, "Ir al siguiente diagnóstico")
  end,
})
