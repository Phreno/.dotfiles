local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local vimp = require('vimp')


require('coc-settings')


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


g.mapleader               = ','     -- Redefine the leader key
g.vimspector_enable_mappings = 'HUMAN' -- Enable vimspector mappings
g.aurora_transparent = true
g.aurora_italic=true
g.aurora_bold=true

g.workspace_autocreate=1
-- g.workspace_session_directory = '~/.vim/sessions/'
g.workspace_autosave_always = 1
g.coc_disable_transparent_cursor = 1


opt.rtp:append('~/.fzf')  -- Active fzf
opt.shortmess:append('c') -- Don't pass messages to |ins-completion-menu|.

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
-- Configure TreeSitter

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "java", "javascript", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    --  disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Active le debug
vimp.nnoremap('<leader>vd', function()
	cmd [[call JavaStartDebug()]]
	end)


vimp.nnoremap('<leader>r', function() -- Active / Desactive les nombres relatifs
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





