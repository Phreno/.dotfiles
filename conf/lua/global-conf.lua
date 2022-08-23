local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local vimp = require('vimp')

g.mapleader               = ','     -- Redefine the leader key
opt.termguicolors         = true
opt.cmdheight             = 2       -- Give more space for displaying messages.
opt.encoding              = 'utf-8' -- unicode characters in the file autoload/float.vim
opt.hidden                = true    -- TextEdit might fail if hidden is not set.
opt.list                  = true    -- Affichage des whitespaces
opt.listchars["eol"]      = '⤶'
opt.listchars["extends"]  = '◀'
opt.listchars["nbsp"]     = '␣'
opt.listchars["precedes"] = '▶'
opt.listchars["space"]    = '·'
opt.listchars["tab"]      = '⇥'
opt.listchars["tabstop"]  = '⇥'
opt.listchars["trail"]    = '✚'
opt.number                = true    -- Display line numbers
opt.shiftwidth            = 2
opt.softtabstop           = 2
opt.tabstop               = 2       -- Set the behavior of tab

-- Source un vimrc s'il existe
cmd [[
	try
	source .vimrc
	catch
	endtry
]]

vimp.nnoremap('<space>r', function() -- Active / Desactive les nombres relatifs
  vim.wo.relativenumber = not vim.wo.relativenumber
end)

vimp.nnoremap('<leader>vn', function() -- Édite le fichier de configuration
  cmd[[vsplit ~/.dotfiles/conf/nvim.lua]]
end)

vimp.nnoremap('<leader>vc', function() -- Édite la configuration de dotfiles
  cmd[[vsplit ~/.dotfiles/install.conf.yaml]]
end)

vimp.nnoremap('<leader>vz', function()-- Édite le fichier de configuration
  cmd[[vsplit ~/.dotfiles/conf/zsh]]
end)

vimp.nnoremap('<leader>sf', function() -- Source le fichier vim courant
  cmd[[source %]]
end)

vimp.nnoremap('<leader>rf', function() -- Recharge le buffer courant
       cmd [[edit!]]
end)
