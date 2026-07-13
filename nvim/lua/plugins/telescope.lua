return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    -- function config
    config = function()
        local builtin = require('telescope.builtin')
        local map = vim.keymap.set

        -- Aquí van tus atajos de Telescope
        map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: Buscar archivos' })
        map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: Buscar texto en el proyecto' })
        map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: Ver buffers abiertos' })
        map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: Buscar en la ayuda' })
        map('n', '<leader>gs', builtin.git_status, { desc = 'Telescope: Ver archivos modificados (Git)' })
    end
}
