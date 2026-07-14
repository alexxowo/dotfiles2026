-- Creamos un "alias" para no escribir vim.keymap.set tantas veces
local map = vim.keymap.set

-- Guardar archivo con Ctrl+s en modo normal e inserción
map({ 'n', 'i' }, '<C-s>', '<cmd>w<CR>', { desc = 'Guardar archivo' })

-- Salir rápido con <leader>q (Espacio + q)
map('n', '<leader>q', '<cmd>q<CR>', { desc = 'Salir de Neovim' })

-- Quitar el resaltado de búsqueda al presionar Esc
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Limpiar resaltado de búsqueda' })

-- Copiar rutas del archivo actual al portapapeles del sistema
map('n', '<leader>cr', function()
  local rel_path = vim.fn.expand('%:.')
  vim.fn.setreg('+', rel_path)
  vim.notify('Ruta relativa copiada: ' .. rel_path)
end, { desc = 'Copiar ruta relativa' })

map('n', '<leader>crr', function()
  local rel_path = vim.fn.expand('%:.')
  local line_num = vim.fn.line('.')
  local path_with_line = rel_path .. '#L' .. line_num
  vim.fn.setreg('+', path_with_line)
  vim.notify('Ruta con línea copiada: ' .. path_with_line)
end, { desc = 'Copiar ruta relativa con número de línea' })

map('v', '<leader>crr', function()
  local r_start = vim.fn.line("v")
  local r_end = vim.fn.line(".")
  local start_line = math.min(r_start, r_end)
  local end_line = math.max(r_start, r_end)
  local rel_path = vim.fn.expand('%:.')
  local path_with_line = rel_path .. '#L' .. start_line .. '-L' .. end_line
  vim.fn.setreg('+', path_with_line)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  vim.notify('Ruta con rango copiada: ' .. path_with_line)
end, { desc = 'Copiar ruta relativa con rango de líneas' })

map('n', '<leader>cp', function()
  local abs_path = vim.fn.expand('%:p')
  vim.fn.setreg('+', abs_path)
  vim.notify('Ruta absoluta copiada: ' .. abs_path)
end, { desc = 'Copiar ruta absoluta' })


