set number

let mapleader="\<Space>"
set number
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
" set guifont=Consolas-with-Yahei

" Combine the System clipboard and vim clipboard
set clipboard+=unnamed

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set modifiable

" write file to disk every 50 milliseconds.
set updatetime=50
map <leader>w :w<CR>

" Color config, type highlight to see color config
" set search color
set hlsearch
highlight Search ctermbg=248 guibg=Grey
highlight ColorColumn ctermfg=15 ctermbg=238 gui=underline guibg=DarkGrey
highlight link ctrlsfMatch StatusLineNC

" set vimdiff color
if &diff
    highlight DiffAdd    term=bold,reverse cterm=bold ctermfg=0 ctermbg=121 gui=bold guifg=bg guibg=LightGreen
    highlight DiffDelete term=reverse ctermfg=0 ctermbg=248 guifg=Black guibg=Grey
    highlight DiffChange ctermfg=192 ctermbg=238 guifg=#CAE682 guibg=#32322F
    highlight DiffText   term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
endif

" set coc suggestion, errorSign color
highlight Pmenu ctermfg=15 ctermbg=242 guibg=DarkGrey
"hi CocErrorSign ctermfg=203 ctermbg=238 guifg=#E5786D guibg=#32322F

set keywordprg=:help

" enable change buffers with text edit
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=number

let g:plug_url_format='https://git::@github.com/%s.git'
call plug#begin('~/.vimfiles/plugged')
"markdown previes in chrom"
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
"aligning up text
Plug 'godlygeek/tabular'
"syntax highlight features"
Plug 'sheerun/vim-polyglot'
" show indent with |
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" fuzzy search "
Plug 'Yggdroot/LeaderF', { 'do': './install.sh', 'on': 'Leaderf' }
" list all functions, variables"
Plug 'preservim/tagbar', {'on': 'Tagbar'}
" repeat
Plug 'tpope/vim-repeat'
" show file tree "
"Plug 'scrooloose/nerdtree', {'on': 'NERDTree'}

" kill current buffer
Plug 'qpkorr/vim-bufkill'

" auto format
Plug 'Chiel92/vim-autoformat'

" highlight
Plug 'lfv89/vim-interestingwords'

" Highlight trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" annotation code, config etc..
Plug 'scrooloose/nerdcommenter'

" show vim document with chinese
Plug 'yianwillis/vimcdoc'

" tmux theme
Plug 'edkolev/tmuxline.vim'

" markdown
Plug 'plasticboy/vim-markdown'

" highlight ahd airline theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" run linters
Plug 'dense-analysis/ale'

" find and replace
Plug 'dyng/ctrlsf.vim'

" git config
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" find and replace surround pair
Plug 'tpope/vim-surround'

" automatic completion
"Plug 'zxqfl/tabnine-vim'

" colorscheme
Plug 'sickill/vim-monokai'
call plug#end()

syntax enable
colorscheme monokai

" formatting by symboDCommenterComment
nnoremap <leader>ta :Tabularize /
xnoremap <leader>ta :Tabularize /

" airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
"let g:airline_left_sep='<'
let g:airline#extensions#tabline#enabled = 1

"change buffer
nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprevious<CR>

"buffer kill
nnoremap <C-c> :BD<cr>

" show functions, variables...
nnoremap <leader>tg :Tagbar<CR>

" Leaderf search logic
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
let g:Lf_WindowPosition = 'popup'

" search files, functions, any other...
nnoremap <leader>o :Leaderf function<CR>
nnoremap <leader>fe :Leaderf file<CR>
nnoremap <leader>fl :Leaderf line<CR>

" show file tree
nnoremap <leader>tr :CocCommand explorer<CR>

" git blame
nnoremap <leader>bl :Git blame<CR>

" off/on vim-gitgutter
nnoremap <leader>bg :GitGutterToggle<CR>

" auto format
nnoremap <leader>fo :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:autoformat_verbosemode = 0
let g:formatdef_black_isort = "'isort --profile=black -w 100 -| black -l 100 -'"
let g:formatters_python = ['black_isort']

let g:formatters_xml = ['prettydiff']
let g:formatdef_prettydiff = "'~/.vim/prettydiff.sh beautify ".
            \                "warp:100 indent_size:4 preserve:2 space_close:true'"

"normal
"let g:ale_python_flake8_options = '--max-line-length=100 --ignore=E203,W503,D105,D107,DAR203'

"for rpa
let g:ale_python_flake8_options = '--max-line-length=400 --ignore=E203,W503,D105,D107,DAR203,E251,E722'

let g:ale_python_pylint_options = join([
            \   '--good-names=i,j,k,x,y,z,w,fp,n',
            \   '--disable=bad-continuation',
            \   '--generated-members=torch.\*,cv2.\*',
            \   '--ignored-modules=tensorflow.compat.v1',
            \   '--notes=FIXME,XXX',
            \], ',')
let g:ale_python_mypy_options = join([
            \   '--cache-dir=/tmp/mypy_cache',
            \   '--ignore-missing-imports',
            \   '--follow-imports=silent',
            \   '--warn-unreachable',
            \   '--disallow-subclassing-any',
            \   '--show-error-codes',
            \   '--strict-equality',
            \   '--strict',
            \])
"let g:ale_linters = {'python': ['flake8', 'pylint', 'mypy']}
let g:ale_linters_explicit = 1
let g:ale_echo_msg_format = '[%linter%][%severity%][%code: %] %s'
let g:ale_sign_error = '?'
let g:ale_sign_warning = '?'
let g:ale_sign_info = '?'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str = 'I'

nmap <silent> ak <Plug>(ale_previous_wrap)
nmap <silent> aj <Plug>(ale_next_wrap)

" 设置使用markdown插件的类型以及不自动折叠代码
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_conceal_code_blocks = 0
au FileType markdown let g:indentLine_setConceal= 0

" set markdown not collapse
set conceallevel=0
let g:xml_syntax_folding = 1

" coc-Plug
let g:coc_global_extensions = [
            \   'coc-word',
            \   'coc-highlight',
            \   'coc-snippets',
            \   'coc-json',
            \   'coc-pyright',
            \   'coc-vimlsp',
            \   'coc-translator',
            \   'coc-explorer',
            \   'coc-yank',
            \   'coc-yaml',
            \   'coc-tabnine',
            \]

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Manage coc extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>

" Use tab for trigger completion with characters ahead and navigate.
inorem <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> coc#pum#visible() ? "\<C-y>" : "\<C-g>u\<CR>\"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() :
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" popup tracslator "
nmap <leader>t <Plug>(coc-translator-p)
vmap <leader>t <Plug>(coc-translator-pv)


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" open help document at left
cnoreabbrev help vertical help

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" autoformat json file
nnoremap <leader>jq :exec PyDictToJson()<CR>
xnoremap <leader>jq :!jq -M -r --indent 4<CR>
nnoremap <leader>jw :%!jq -M -c<CR>
xnoremap <leader>jw :!jq -M -c<CR>
nnoremap <leader>qj :exec JsonToPyDict()<CR>

" convert pydict to json format
function PyDictToJson()
    :%s/None/null/ge
    :%s/False/false/ge
    :%s/True/true/ge
    :%s/'/"/ge
    :%!jq -M -r --indent 4
endfunction

" convert json to pydict format
function JsonToPyDict()
    :%s/null/None/ge
    :%s/false/False/ge
    :%s/true/True/ge
endfunction

nnoremap <leader>nh :noh<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" search
vnoremap // y/<c-r>"<cr>

" ctrlsf config
if executable('rg')
    let g:ctrlsf_ackprg = 'rg'
endif

let g:ctrlsf_position = 'right'
let g:ctrlsf_default_root = 'project+fw'
let g:ctrlsf_winsize = '45%'
let g:ctrlsf_ignore_dir = ['bazel-*', 'build', 'devel', 'install']
let g:ctrlsf_auto_focus = {
            \   'at' : 'done',
            \   'duration_less_than': 1000
            \}

function s:AutoCmdCtrlSF() abort
    setlocal colorcolumn=107
    nnoremap <silent><buffer> <leader>q :CtrlSFClose<CR>
endfunction
nmap <leader>s<Space> <Plug>CtrlSFPrompt

" xml, json
set foldtext=FoldText()
function FoldText()
    let l:line = s:GetText(v:foldstart, v:foldend) .' '
    let l:info = printf('--- lines:%3d', v:foldend - v:foldstart + 1)

    let l:colorcolumn = empty(&l:colorcolumn) ? 200 : &l:colorcolumn
    let l:text_width = l:colorcolumn - len(l:info) - 1
    let l:space = l:text_width - len(l:line)
    if l:space > 0
        let l:text = l:line . repeat('-', l:space)
    else
        let l:text = l:line[: l:space - 3] .'? '
    endif

    return l:text . l:info
endfunction

function s:GetText(foldstart, foldend) abort
    let l:line = getline(a:foldstart)

    if &l:foldmethod ==# 'marker'
        let [l:start_marker, l:end_marker] = split(&l:foldmarker, ',')
        let l:regex = '"\?\s*'. l:start_marker .'\d*\s*$'
        let l:text = substitute(l:line, l:regex, '' , '')
        if match(l:text, '^\s*$') != -1
            let l:next_line = getline(a:foldstart + 1)
            if match(l:next_line, l:start_marker . '\|' . l:end_marker) != -1
                return l:line
            else
                return l:next_line
            endif
        endif
        return l:text
    elseif &l:foldmethod ==# 'syntax'
        if &l:filetype ==# 'json'
            let [l:pair_start, l:start, l:end] =
                        \ matchstrpos(l:line, '\v^%([^"]|"%([^"]|\")*"){-}\zs[{[]')
            let l:pair_end = l:pair_start ==# '[' ? ']' : '}'

            let l:endline = getline(a:foldend)
            let l:comma = matchstr(l:endline, l:pair_end .'\s\{-}\zs,\ze.\{-}$')

            let l:text = l:line[: l:start] .'?'. l:pair_end . l:comma
            return l:text
        endif
    endif

    return substitute(l:line, '	', repeat(' ', &l:tabstop), 'g')
endfunction

scriptencoding utf-8
augroup myGroup
    " cocConfig
    " Highlight symboDCommenterNestedn CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    " vimConfig
    " set fillchars=fold:\ ,vert:?
    autocmd FileType python setlocal colorcolumn=100
    autocmd FileType xml,json setlocal foldmethod=syntax

    " source vimrc after writen
    autocmd BufWritePost vimrc source %

    " ctrlsfConfig
    autocmd FileType ctrlsf call s:AutoCmdCtrlSF()
augroup end

nnoremap <leader>ca :exec CopyCurrentFile()<CR>

" copy all content of current file.
function CopyCurrentFile()
    gg
    0
    v
    G
    $
    y
endfunction



let g:syntastic_python_python_exec = 'python3'
