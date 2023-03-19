local o = vim.o
local g = vim.g
local w = vim.wo
local opt = vim.opt
local cmd = vim.cmd

-- key
g.mapleader = ' '
g.maplocalleader = ' '

-- definições básicas
opt.mouse = 'a'	-- ativa mouse
opt.tabstop = 4	-- quantidade de espaços
opt.number = true	-- númeração das linhas
opt.shiftwidth = 4	-- Quantidade de caracteres que o Neovim usará para recuar uma linha
opt.cursorline = true	-- destaca a linha atual do cursor
opt.smartindent = true	-- auto indentação do code
opt.termguicolors = true	--  melhor suporte a cores
o.syntax = 'on'	-- ativa a sintaxe
o.updatetime = 250
o.undofile = true	-- ativa o desfazer
o.smartcase = true 	-- diferência letras maiúsculas e minúsculas
o.ignorecase = true	-- ignorar letras maiúsculas ao executar uma pesquisa
o.splitright = true	-- move o cursor para o splitright
o.splitbelow = true	-- move o cursor para o splitbelow
w.wrap = false 	-- desativa a quebra de linha
cmd [[ set fillchars=eob:\ ,fold:\ ,vert:\│ ]]	-- desativa o ~
cmd [[ set noshowmode ]]	-- oculta o modo na barra inferior
cmd [[ set clipboard+=unnamedplus ]]	-- suporte à área de tranferência
cmd [[ au InsertEnter * :setlocal nohlsearch | au InsertLeave * :setlocal hlsearch ]]	-- desativa/ativa cor da pesquisa
