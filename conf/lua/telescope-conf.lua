local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local vimp = require('vimp')
vimp.nnoremap('<C-t>', function() -- Lance telescope
       cmd[[silent! Telescope find_files]]
end)
