local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local vimp = require('vimp')
opt.rtp:append('~/.fzf')  -- Active fzf
opt.shortmess:append('c') -- Don't pass messages to |ins-completion-menu|.
vimp.nnoremap('<A-c>', function() -- Lance FZF
	cmd[[silent! FZF]]
end)
