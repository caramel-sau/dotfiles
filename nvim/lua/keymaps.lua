local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- move window
map('n', '<Leader>j', '<C-w>j', opts)
map('n', '<Leader>k', '<C-w>k', opts)
map('n', '<Leader>l', '<C-w>l', opts)
map('n', '<Leader>h', '<C-w>h', opts)

-- Normal Mode
map("n", "<ESC><ESC>", ":nohlsearch<CR>", opts)
map("n", "gx", ":tabclose<CR>", opts)
map("n", "gt", ":tabnew<CR>", opts)
map("n", "gn", "gt", opts)
map("n", "gp", "gT", opts)
map("n", "H", "0", opts)
map("n", "L", "$", opts)
map("n", "<C-c>", "<Cmd>quit<CR>", { buffer = bufnr, noremap = true, silent = true })

-- Insert Mode
map('i', 'jk', '<ESC>', opts)
map('s', 'jk', '<ESC>', opts)

-- show diagnostics
map('n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>', opts)

