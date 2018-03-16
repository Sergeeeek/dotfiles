let mapleader = " "
set termguicolors
set nohlsearch
set nocompatible
set tabstop=4
set shiftwidth=4
set mouse=a
set relativenumber

call plug#begin('~/.local/share/nvim/plugged')
Plug 'yuttie/comfortable-motion.vim'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'Chiel92/vim-autoformat'
Plug 'w0rp/ale'
Plug 'derekwyatt/vim-scala'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'roxma/nvim-completion-manager'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'davidoc/taskpaper.vim'
call plug#end()

let g:airline_powerline_fonts = 1
colorscheme nord
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 20

set number
nnoremap <c-s> :w<CR>
nnoremap <c-p> :GFiles<CR>
nnoremap <c-]> :Buffers<CR>

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap s <Plug>(easymotion-s)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set cc=120 " highlights column 120
set hidden " allows switching from unsaved buffers
set list
set listchars+=space:␣

nnoremap <Leader>e :NERDTreeToggle<CR>

let g:scala_scaladoc_indent = 1

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

au FileType scala nnoremap <localleader>df :EnDeclaration<CR>
nnoremap <localleader>t :EnType<CR>

let g:ale_linters = {
\	'typescript': ['tslint'],
\}

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
	\ 'typescript': ['javascript-typescript-stdio'],
    \ }

" Changes dir in insert mode for relative file completion
:autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
:autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)

" MAPPINGS
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <c-space> :CtrlSpace<CR>
nnoremap <leader><TAB> <C-6><CR>
nnoremap <leader>ff :Ag<CR>

" Lang server mappings
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>mr :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>m= :Autoformat<CR>
nnoremap <silent> <leader>mf :call LanguageClient_textDocument_codeAction()<CR>

" Ale mappings
"
