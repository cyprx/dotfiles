
""""""""""" PLUGINS """""""""
"""""""""""""""""""""""""""""""
call plug#begin()

" automake
Plug 'neomake/neomake'

" display indent
Plug 'Yggdroot/indentLine'

" support go
Plug 'fatih/vim-go'

" colorscheme
" Plug 'fenetikm/falcon'
" Plug 'sainnhe/vim-color-forest-night'
" Plug 'fxn/vim-monochrome'
" Plug 'relastle/bluewery.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'ayu-theme/ayu-vim'
" Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'

" go autocompletion
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" javascript js/jsx
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" support markdown
Plug 'plasticboy/vim-markdown'

" autocompletion
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

" support git
Plug 'tpope/vim-fugitive'

 " quick search fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" nerdtree explorer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" colorscheme
Plug 'morhetz/gruvbox'

" support devicons
Plug 'ryanoasis/vim-devicons'

" lightweight statusline
Plug 'itchyny/lightline.vim'

" startup page
Plug 'mhinz/vim-startify'

" auto pairs
Plug 'jiangmiao/auto-pairs'

call plug#end()

""""""""""" GENERAL OPTIONS """""""""""
"""""""""""""""""""""""""""""""""""""""

set number
" set relativenumber
set cursorline
set lazyredraw
set showmatch
set hlsearch
set clipboard+=unnamedplus
set laststatus=2
set noshowmode
set noshowcmd
set noswapfile
set nowrap
set completeopt-=preview
set encoding=utf-8

filetype on
filetype indent on
filetype plugin on

syntax enable

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set cindent

autocmd Filetype ruby set ts=2 sts=2 sw=2
autocmd Filetype html set ts=2 sts=2 sw=2
autocmd Filetype yaml set ts=2 sts=2 sw=2
autocmd Filetype javascript set ts=2 sts=2 sw=2
autocmd Filetype json set ts=2 sts=2 sw=2


""""""""""" THEMES AND COLORS """""""""""
"""""""""""""""""""""""""""""""""""""""""
" set t_Co=256
" colorscheme falcon
" set background=dark
" colorscheme bluewery-light
if exists('+termguicolors') && ($TERM == "st-256color" || $TERM == "tmux-256color")
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
" 
" let g:nord_italic = 1
" let g:nord_italic_comments = 1
" let g:nord_underline = 1
" let g:nord_uniform_status_lines = 1
" let g:nord_uniform_diff_background = 1
" let g:nord_cursor_line_number_background = 1
" colorscheme nord
set termguicolors     " enable true colors support
colorscheme PaperColor
set background=light


""""""""""" PLUGIN OPTIONS """""""""""
""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeChDirMode = 2

let g:indent_guides_enable_on_vim_startup = 1

let g:vim_markdown_folding_disabled = 1

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_cache_executable_check_failures = 1
let g:ale_python_flake8_use_global=0
let g:ale_python_flake8_executable = 'python3'

let g:python3_host_prog = 'python3'

let g:lightline = {
    \ 'colorscheme': 'PaperColor',
    \ 'active': {
    \   'left': [['mode', 'paste'], [ 'gitbranch' ], ['filename', 'modified']],
    \   'right': [ ['linter_warnings', 'linter_errors', 'linter_ok'], ['lineinfo'], ['percent'], ['readonly']]
    \ },
    \ 'component_function': {
    \     'gitbranch': 'fugitive#head'
    \ },
    \ 'component_expand': {
    \   'linter_warnings': 'LightlineLinterWarnings',
    \   'linter_errors': 'LightlineLinterErrors',
    \   'linter_ok': 'LightlineLinterOK'
    \ },
    \ 'component_type': {
    \   'readonly': 'error',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error'
    \ },
    \ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 || all_errors == 0 ? '' : printf('%d ✗', all_errors)
endfunction
function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

augroup _lightline
  autocmd!
  autocmd User ALELintPre call s:MaybeUpdateLightline()
  autocmd User ALELintPost call s:MaybeUpdateLightline()
"  autocmd ColorScheme * call s:UpdateLightlineColorScheme()
augroup END

""""""""""" KEY MAPPING """""""""""
"""""""""""""""""""""""""""""""""""
let mapleader="\\"
nmap <C-n> :NERDTreeToggle<CR>
nmap <leader><space> :FZF<CR>
nnoremap \d :bp<cr>:bd #<cr>
nnoremap <C-'> b^i'<esc>A'<esc>



""""""""""""""""""""""""""""""""""""""""
""""""""""" CUSTOM FUNCTIONS """""""""""
""""""""""""""""""""""""""""""""""""""""

