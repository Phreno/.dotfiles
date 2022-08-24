local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local vinp = require('vimp')

require('aurora-conf')      -- Gestion du thème et des couleurs
require('fzf-conf')         -- Gestion de la recherche par fzf
require('git-conf')         -- Gestion du git
require('global-conf')      -- Gestion des fonctions ne nécessitant pas de plugin
require('tagbar-conf')      -- Gestion de la barre de tags
require('telescope-conf')   -- Gestion de la recherche par telescope
require('tree-sitter-conf') -- Gestion de la coloration syntaxique
require('vimspector-conf')  -- Gestion du debug
require('workspace-conf')   -- Gestion des espaces de travail
require('coc-conf')         -- Gestion de l'éditeur de code
