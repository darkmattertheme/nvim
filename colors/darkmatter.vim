" darkmatter
" A colorscheme adapted from base16-black-metal-bathory
" URL: https://github.com/darkmattertheme/darkmatter.nvim
"
" Works in both Neovim and Vim 8+. Neovim is handed off to the Lua
" implementation, which adds Treesitter, LSP and plugin integrations. Vim gets
" the pure Vimscript definitions below.

hi clear
if exists('syntax_on')
  syntax reset
endif

set background=dark
let g:colors_name = 'darkmatter'

" Neovim gets the Lua implementation, which adds Treesitter, LSP and plugin
" integrations on top of these same colors. The palette lives in
" lua/colors/darkmatter.lua.
if has('nvim')
  lua require('darkmatter-colorscheme').setup(require('colors.darkmatter'))
  finish
endif

" ---------------------------------------------------------------------------
" Vim
" ---------------------------------------------------------------------------

" Line continuations below need Vim's default 'cpoptions'.
let s:save_cpo = &cpoptions
set cpoptions&vim

" Each entry is [gui hex, nearest xterm-256 index]. The cterm values are
" approximations so the scheme still reads correctly in a 256 color terminal
" without 'termguicolors'.
let s:p = {
      \ 'base00': ['#121113', '233'],
      \ 'base01': ['#121212', '233'],
      \ 'base02': ['#222222', '235'],
      \ 'base03': ['#333333', '236'],
      \ 'base04': ['#999999', '246'],
      \ 'base05': ['#c1c1c1', '250'],
      \ 'base06': ['#999999', '246'],
      \ 'base07': ['#c1c1c1', '250'],
      \ 'base08': ['#5f8787', '66'],
      \ 'base09': ['#aaaaaa', '248'],
      \ 'base0A': ['#e78a53', '173'],
      \ 'base0B': ['#fbcb97', '222'],
      \ 'base0C': ['#aaaaaa', '248'],
      \ 'base0D': ['#888888', '102'],
      \ 'base0E': ['#999999', '246'],
      \ 'base0F': ['#444444', '238'],
      \ }

" s:hi(group, fg, bg, attr, sp) -- an empty string means NONE.
"
" Every field is written out explicitly rather than skipped, so that Vim's
" built-in defaults for a group can never show through a partial definition
" (e.g. Visual's cterm=reverse, or SpellBad's bright ctermbg). This also
" mirrors Neovim's nvim_set_hl(), which replaces a group outright.
function! s:hi(group, fg, bg, attr, sp) abort
  let l:fg = empty(a:fg) ? ['NONE', 'NONE'] : s:p[a:fg]
  let l:bg = empty(a:bg) ? ['NONE', 'NONE'] : s:p[a:bg]
  let l:attr = empty(a:attr) ? 'NONE' : a:attr
  " undercurl needs a GUI or 'termguicolors'; degrade to underline in cterm
  let l:cattr = substitute(l:attr, 'undercurl', 'underline', 'g')

  execute 'highlight' a:group
        \ 'guifg=' . l:fg[0] 'ctermfg=' . l:fg[1]
        \ 'guibg=' . l:bg[0] 'ctermbg=' . l:bg[1]
        \ 'gui=' . l:attr 'cterm=' . l:cattr 'term=' . l:cattr
        \ 'guisp=' . (empty(a:sp) ? 'NONE' : s:p[a:sp][0])
endfunction

" Vim editor colors
call s:hi('Normal',        'base05', 'base00', '',     '')
call s:hi('Bold',          '',       '',       'bold', '')
call s:hi('Debug',         'base08', '',       '',     '')
call s:hi('Directory',     'base0D', '',       '',     '')
call s:hi('Error',         'base08', 'base00', '',     '')
call s:hi('ErrorMsg',      'base08', 'base00', '',     '')
call s:hi('Exception',     'base08', '',       '',     '')
call s:hi('FoldColumn',    'base0C', 'base00', '',     '')
call s:hi('Folded',        'base03', 'base01', '',     '')
call s:hi('IncSearch',     'base01', 'base09', '',     '')
call s:hi('CurSearch',     'base01', 'base09', '',     '')
call s:hi('Italic',        '',       '',       'italic', '')
call s:hi('Macro',         'base08', '',       '',     '')
call s:hi('MatchParen',    '',       'base03', '',     '')
call s:hi('ModeMsg',       'base0B', '',       '',     '')
call s:hi('MoreMsg',       'base0B', '',       '',     '')
call s:hi('Question',      'base0D', '',       '',     '')
call s:hi('Search',        'base01', 'base0A', '',     '')
call s:hi('Substitute',    'base01', 'base0A', '',     '')
call s:hi('SpecialKey',    'base03', '',       '',     '')
call s:hi('TooLong',       'base08', '',       '',     '')
call s:hi('Underlined',    'base08', '',       '',     '')
call s:hi('Visual',        '',       'base02', '',     '')
call s:hi('VisualNOS',     'base08', '',       '',     '')
call s:hi('WarningMsg',    'base08', '',       '',     '')
call s:hi('WildMenu',      'base08', 'base0A', '',     '')
call s:hi('Title',         'base0D', '',       '',     '')
call s:hi('Conceal',       'base0D', 'base00', '',     '')
call s:hi('Cursor',        'base00', 'base05', '',     '')
call s:hi('NonText',       'base03', '',       '',     '')
call s:hi('Whitespace',    'base03', '',       '',     '')
call s:hi('LineNr',        'base04', 'base00', '',     '')
call s:hi('LineNrAbove',   'base04', 'base00', '',     '')
call s:hi('LineNrBelow',   'base04', 'base00', '',     '')
call s:hi('SignColumn',    'base04', 'base00', '',     '')
call s:hi('StatusLine',    'base05', 'base02', '',     '')
call s:hi('StatusLineNC',  'base04', 'base01', '',     '')
call s:hi('StatusLineTerm',   'base05', 'base02', '',     '')
call s:hi('StatusLineTermNC', 'base04', 'base01', '',     '')
call s:hi('VertSplit',     'base05', 'base00', '',     '')
call s:hi('ColorColumn',   '',       'base01', '',     '')
call s:hi('CursorColumn',  '',       'base01', '',     '')
call s:hi('CursorLine',    '',       'base01', '',     '')
call s:hi('CursorLineNr',  'base04', 'base01', '',     '')
call s:hi('QuickFixLine',  '',       'base01', '',     '')
call s:hi('Pmenu',         'base05', 'base01', '',     '')
call s:hi('PmenuSel',      'base01', 'base05', '',     '')
call s:hi('PmenuSbar',     '',       'base02', '',     '')
call s:hi('PmenuThumb',    '',       'base05', '',     '')
call s:hi('TabLine',       'base03', 'base01', '',     '')
call s:hi('TabLineFill',   'base03', 'base01', '',     '')
call s:hi('TabLineSel',    'base0B', 'base01', '',     '')
call s:hi('ToolbarLine',   '',       'base02', '',     '')
call s:hi('ToolbarButton', 'base05', 'base03', 'bold', '')
call s:hi('Terminal',      'base05', 'base00', '',     '')
call s:hi('debugPC',       '',       'base01', '',     '')
call s:hi('debugBreakpoint', 'base08', 'base00', '',   '')

" Standard syntax highlighting
call s:hi('Boolean',      'base09', '', '',     '')
call s:hi('Character',    'base08', '', '',     '')
call s:hi('Comment',      'base03', '', '',     '')
call s:hi('Conditional',  'base0E', '', '',     '')
call s:hi('Constant',     'base09', '', '',     '')
call s:hi('Define',       'base0E', '', '',     '')
call s:hi('Delimiter',    'base0F', '', '',     '')
call s:hi('Float',        'base09', '', '',     '')
call s:hi('Function',     'base0D', '', '',     '')
call s:hi('Identifier',   'base08', '', '',     '')
call s:hi('Include',      'base0D', '', '',     '')
call s:hi('Keyword',      'base0E', '', '',     '')
call s:hi('Label',        'base0A', '', '',     '')
call s:hi('Number',       'base09', '', '',     '')
call s:hi('Operator',     'base0E', '', '',     '')
call s:hi('PreProc',      'base0A', '', '',     '')
call s:hi('Repeat',       'base0A', '', '',     '')
call s:hi('Special',      'base0C', '', '',     '')
call s:hi('SpecialChar',  'base0F', '', '',     '')
call s:hi('Statement',    'base08', '', '',     '')
call s:hi('StorageClass', 'base0A', '', '',     '')
call s:hi('String',       'base0B', '', '',     '')
call s:hi('Structure',    'base0E', '', '',     '')
call s:hi('Tag',          'base0A', '', '',     '')
call s:hi('Type',         'base0A', '', '',     '')
call s:hi('Typedef',      'base0A', '', '',     '')
call s:hi('Todo',         'base0A', 'base01', '', '')
call s:hi('Ignore',       'base03', '', '',     '')

" Diff highlighting
call s:hi('DiffAdd',      'base0B', 'base00', '', '')
call s:hi('DiffChange',   'base03', 'base00', '', '')
call s:hi('DiffDelete',   'base08', 'base00', '', '')
call s:hi('DiffText',     'base0D', 'base00', '', '')
call s:hi('DiffAdded',    'base0B', 'base00', '', '')
call s:hi('DiffFile',     'base08', 'base00', '', '')
call s:hi('DiffNewFile',  'base0B', 'base00', '', '')
call s:hi('DiffLine',     'base0D', 'base00', '', '')
call s:hi('DiffRemoved',  'base08', 'base00', '', '')

" Git highlighting
call s:hi('gitcommitOverflow',      'base08', '', '',     '')
call s:hi('gitcommitSummary',       'base0B', '', '',     '')
call s:hi('gitcommitComment',       'base03', '', '',     '')
call s:hi('gitcommitUntracked',     'base03', '', '',     '')
call s:hi('gitcommitDiscarded',     'base03', '', '',     '')
call s:hi('gitcommitSelected',      'base03', '', '',     '')
call s:hi('gitcommitHeader',        'base0E', '', '',     '')
call s:hi('gitcommitSelectedType',  'base0D', '', '',     '')
call s:hi('gitcommitUnmergedType',  'base0D', '', '',     '')
call s:hi('gitcommitDiscardedType', 'base0D', '', '',     '')
call s:hi('gitcommitBranch',        'base09', '', 'bold', '')
call s:hi('gitcommitUntrackedFile', 'base0A', '', '',     '')
call s:hi('gitcommitUnmergedFile',  'base08', '', 'bold', '')
call s:hi('gitcommitDiscardedFile', 'base08', '', 'bold', '')
call s:hi('gitcommitSelectedFile',  'base0B', '', 'bold', '')

" GitGutter highlighting
call s:hi('GitGutterAdd',          'base0B', 'base00', '', '')
call s:hi('GitGutterChange',       'base0D', 'base00', '', '')
call s:hi('GitGutterDelete',       'base08', 'base00', '', '')
call s:hi('GitGutterChangeDelete', 'base0E', 'base00', '', '')

" Spelling highlighting
call s:hi('SpellBad',   '', '', 'undercurl', 'base08')
call s:hi('SpellLocal', '', '', 'undercurl', 'base0C')
call s:hi('SpellCap',   '', '', 'undercurl', 'base0D')
call s:hi('SpellRare',  '', '', 'undercurl', 'base0E')

" Statusline user groups
call s:hi('User1', 'base08', 'base02', '',     '')
call s:hi('User2', 'base0E', 'base02', '',     '')
call s:hi('User3', 'base05', 'base02', '',     '')
call s:hi('User4', 'base0C', 'base02', '',     '')
call s:hi('User5', 'base05', 'base02', '',     '')
call s:hi('User6', 'base05', 'base01', '',     '')
call s:hi('User7', 'base05', 'base02', '',     '')
call s:hi('User8', 'base00', 'base02', '',     '')
call s:hi('User9', 'base00', 'base02', '',     '')

" Colors for :terminal
let g:terminal_ansi_colors = [
      \ s:p['base00'][0], s:p['base08'][0], s:p['base0B'][0], s:p['base0A'][0],
      \ s:p['base0D'][0], s:p['base0E'][0], s:p['base0C'][0], s:p['base05'][0],
      \ s:p['base03'][0], s:p['base08'][0], s:p['base0B'][0], s:p['base0A'][0],
      \ s:p['base0D'][0], s:p['base0E'][0], s:p['base0C'][0], s:p['base07'][0],
      \ ]

delfunction s:hi
unlet s:p

let &cpoptions = s:save_cpo
unlet s:save_cpo
