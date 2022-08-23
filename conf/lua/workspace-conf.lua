local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local vimp = require('vimp')
g.workspace_autocreate=1
-- g.workspace_session_directory = '~/.vim/sessions/'
g.workspace_autosave_always = 1

vimp.nnoremap('<leader>tw', function() -- Toggle workspace
       cmd [[ToggleWorkspace]]
end)
