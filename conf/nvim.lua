local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- Redefine map functions
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

-- Redefine the leader key
g.mapleader = ','

-- Set the behavior of tab
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2


-- Affichage des whitespaces
opt.list = true
opt.listchars["eol"]= '⤶'
opt.listchars["trail"]= '✚'
opt.listchars["extends"]= '◀'
opt.listchars["precedes"]= '▶'
opt.listchars["tab"]= '⇥'
opt.listchars["tabstop"]= '⇥'
opt.listchars["nbsp"]= '␣'
opt.listchars["space"]= '·'

-- Source un vimrc s'il existe
cmd [[
	try
	source .vimrc
	catch
	endtry
]]

-- Set internal encoding of vim, not needed on neovim, since coc.nvim using some
-- unicode characters in the file autoload/float.vim
opt.encoding='utf-8'

-- TextEdit might fail if hidden is not set.
opt.hidden = true


-- Some servers have issues with backup files, see #649.
cmd [[
  set nobackup
  set nowritebackup
]]


