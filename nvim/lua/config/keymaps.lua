-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Типа 'Нажимает' на ESC при быстром нажатии jj, чтобы не тянутся
map("i", "jj", "<Esc>", { noremap = true })

-- Переключение вкладок с помощью TAB или shift-tab (akinsho/bufferline.nvim)
map("n", "<Tab>", ":BufferLineCycleNext<CR>", default_opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", default_opts)

-- Пролистнуть на страницу вниз / вверх (как в браузерах)
-- map('n', '<C-D>', '<PageDown> zz', default_opts)
-- map('n', '<C-U>', '<PageUp> zz', default_opts)
