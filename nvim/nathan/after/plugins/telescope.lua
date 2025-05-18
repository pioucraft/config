local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.git_files, { desc = 'Telescope find files' })
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {desc = "Grep search"})

