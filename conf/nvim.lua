local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local vimp = require('vimp')


require('coc-conf')
require('aurora-conf')
require('tree-sitter-conf')

-- Source un vimrc s'il existe
cmd [[
	try
	source .vimrc
	catch
	endtry
]]


cmd [[
function! JavaStartDebugCallback(err, port)
  execute "cexpr! 'Java debug started on port: " . a:port . "'"
  call vimspector#LaunchWithSettings({ "configuration": "Java Attach", "AdapterPort": a:port })
endfunction

function JavaStartDebug()
  call CocActionAsync('runCommand', 'vscode.java.startDebugSession', function('JavaStartDebugCallback'))
endfunction

]]


g.vimspector_enable_mappings = 'HUMAN' -- Enable vimspector mappings

g.workspace_autocreate=1
-- g.workspace_session_directory = '~/.vim/sessions/'
g.workspace_autosave_always = 1


opt.rtp:append('~/.fzf')  -- Active fzf
opt.shortmess:append('c') -- Don't pass messages to |ins-completion-menu|.

-- Active le debug
vimp.nnoremap('<leader>vd', function()
	cmd [[call JavaStartDebug()]]
	end)


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


vimp.nnoremap('<C-s>l', function() -- Source le fichier lua courant
  cmd[[luafile %]]
end)


vimp.nnoremap('<C-s>s', function() -- Source le fichier vim courant
  cmd[[source %]]
end)


vimp.nnoremap('<A-c>', function() -- Lance FZF
	cmd[[silent! FZF]]
end)

vimp.nnoremap('<C-t>', function() -- Lance telescope
       cmd[[silent! Telescope find_files]]
end)


vimp.nnoremap('<leader>sh', function() -- Montre les premieres lignes du fichier dans un split
cmd[[5split +1]]
end)

vimp.nnoremap('<leader>tb', function() -- Ouvre Tagbar
        cmd [[Tagbar]]
 end)
 
vimp.nnoremap('<leader>gb', function() -- Git blame
       cmd [[Git blame]]
end)

vimp.nnoremap('<leader>fe', function() -- Recharge le buffer courant
       cmd [[edit!]]
end)


vimp.nnoremap('<leader>tw', function() -- Toggle workspace
       cmd [[ToggleWorkspace]]
end)





