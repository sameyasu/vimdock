" vim: et ts=2 sts=2 sw=2
set number
set tabstop=4
set expandtab
set shiftwidth=4
map <C-t> :tabnext<CR>
map <C-d> :q<CR>
map <C-h> :pop<CR>
map <C-]> g<C-]>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('joshdick/onedark.vim')
  call dein#add('gosukiwi/vim-atom-dark')

  call dein#add('nathanaelkane/vim-indent-guides')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  call dein#add('junegunn/fzf', { 'build': './install --bin'})
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  call dein#add('w0rp/ale')

  call dein#add('Shougo/deoplete.nvim')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

if (has("nvim"))
  set inccommand=split
endif

" set airline theme
let g:airline_theme = 'onedark'

set list
set listchars=trail:-

" Indent Guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444444 ctermbg=247
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#444444 ctermbg=247
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" fzf.vim
let g:fzf_layout = {'up':'~30%'}

set tags=.tags
map <C-p> :FZF<CR>
let g:fzf_tags_command = 'ctags -R -f .tags'
noremap <silent> <C-l> :call fzf#vim#tags(expand('<cword>'))<CR>
let g:fzf_buffers_jump = 1

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
map <C-a> :Rg<Space>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

noremap <C-i> :Rgword<CR>
command! -bang -nargs=0 Rgword
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.expand("<cword>"), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" linters
let g:ale_linters = {
  \ 'php': ['phpcs', 'php'],
  \}
" Fix files with phpcbf
let g:ale_fixers = {
  \ 'php': ['phpcbf'],
  \}
" uses PSR-12 standard
let g:ale_php_phpcs_standard = 'PSR12'
let g:ale_php_phpcbf_standard = 'PSR12'

noremap L :ALENext<CR>
noremap F :ALEFix<CR>

let g:deoplete#enable_at_startup = 1

" Theme
syntax enable
colorscheme atom-dark
