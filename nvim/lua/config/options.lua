-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local cmd = vim.cmd -- execute Vim commands
-- local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options
--
-- -----------------------------------------------------------
-- -- Главные
-- -----------------------------------------------------------
opt.wrap = true -- включить визуальный перенос
opt.linebreak = true -- переносить по словам, не по символам
opt.breakindent = true -- сохранять отступ у перенесённой строки
opt.textwidth = 0 -- НЕ вставлять реальные переносы
opt.colorcolumn = "80" -- вертикальная линия-ориентир на 80
-- opt.cursorline = true -- Подсветка строки с курсором
-- opt.spelllang = { "en_us", "ru" } -- Словари рус eng
-- opt.number = true -- Включаем нумерацию строк
-- opt.relativenumber = true -- Вкл. относительную нумерацию строк
opt.so = 999 -- Курсор всегда в центре экрана
-- opt.clipboard = 'unnamed'           -- Системный буффер, регистр *
-- opt.clipboard = 'unnamedplus'    -- Системный буффер, регистр +
-- opt.incsearch = true -- Подсвечивать совпадения при наборе поискового запроса
-- opt.hlsearch = true -- Подсвечивать все совпадения после поиска
-- opt.ignorecase = true -- Игнорировать регистр при поиске
-- opt.smartcase = true -- Не игнорировать регистр, если в запросе есть заглавные буквы
-- -----------------------------------------------------------
-- -- Табы и отступы
-- -----------------------------------------------------------
-- cmd([[
-- filetype indent plugin on
-- syntax enable
-- ]])
-- opt.expandtab = true      -- use spaces instead of tabs
-- opt.shiftwidth = 4        -- shift 4 spaces when tab
-- opt.tabstop = 4           -- 1 tab == 4 spaces
-- opt.smartindent = true    -- autoindent new lines
-- -- -- don't auto commenting new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])
-- -- -- remove line lenght marker for selected filetypes
-- cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- -- -- 2 spaces for selected filetypes
-- cmd [[
-- autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja,json,sh,bash,tex setlocal shiftwidth=2 tabstop=2
-- ]]
-- -- -- С этой строкой отлично форматирует html файл, который содержит jinja2
-- cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]
