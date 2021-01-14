"                                   
"                    ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄  
"                   ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█  
"                    ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄ 
"                     ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
"                      ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
"                      ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
"                      ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒   
"                        ░░   ▒ ░░      ░     ░░   ░ ░        
"                         ░   ░         ░      ░     ░ ░      
"                        ░                           ░        

"             .vimrc configuration by FoxMaccloud for FoxMaccloud


" See this link for more info.
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

    " Usefull stuff
	Plug 'scrooloose/syntastic'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/nerdcommenter'
	Plug 'valloric/youcompleteme'
	Plug 'xuhdev/singlecompile'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'airblade/vim-gitgutter'

	" Colorschemes
	Plug 'chriskempson/base16-vim'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'kristijanhusak/vim-hybrid-material'
	
	" LaTeX
"	plug 'lervag/vimtex'
"	plug 'xuhdev/vim-latex-live-preview'
	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }	

    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }


call plug#end()


set number
syntax on 
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set showcmd
set encoding=utf-8
set showmatch
set mouse=a
"set relativenumber
"filetype plugin indent on

"let g:livepreview_previewer = 'okular'


"bind for daw
imap <A-BS> <C-W>daw
"imap <A-BS> daw<cr>






"##########################
"# Table of contents      #
"#	                      # 
"#  1. Syntastic          #
"#	2. Nerdtree           #
"#	3. Nerdcommenter      #
"#	4. SingleCompile      #
"#  5. latex-live-preview #
"#	6. Colors & Fonts     #
"##########################

"~~~~~~~~~~~~~~~~~~~~~~~~
"	1. Syntastic
"~~~~~~~~~~~~~~~~~~~~~~~~
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_quiet_messages = {
    \ "level":  "warnings",
    \ "regex": [
        \ '\m\[C03\d\d\]',
        \ '\mpossible unwanted space at "{"'
        \]}

" File assosiations "

autocmd BufNewFile,BufRead *.asm set filetype=nasm


"~~~~~~~~~~~~~~~~~~~~~~~~
"	2. Nerdtree
"~~~~~~~~~~~~~~~~~~~~~~~~
map <F3> :NERDTreeToggle<CR>
map <F4> :Hex<CR>

let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

let NERDTreeChDirMode = 2
let NERDTreeShowBookmarks = 1

let NERDTreeIgnore=[
    \ 'node_modules$[[dir]]',
    \ '.git$[[dir]]',
    \ '.vscode$[[dir]]',
    \ '.idea$[[dir]]',
    \ '.DS_Store$[[file]]',
    \ '.swp$[[file]]',
    \ 'hdevtools.sock$[[file]]',
    \ '.synctex.gz[[file]]',
    \ '.fls[[file]]',
    \ '.fdb_latexmk[[file]]',
    \ '.aux[[file]]'
\ ]

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction


"~~~~~~~~~~~~~~~~~~~~~~~~
"   3 Nerdcommenter   
"~~~~~~~~~~~~~~~~~~~~~~~~
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1 " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting


"~~~~~~~~~~~~~~~~~~~~~~~~
"	4. SingleCompile
"~~~~~~~~~~~~~~~~~~~~~~~~

nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

"~~~~~~~~~~~~~~~~~~~~~~~~
"   5. latex-live-preview
"~~~~~~~~~~~~~~~~~~~~~~~~
"
let g:livepreview_previewer = 'zathura'
let g:livepreview_use_biber = 1

"~~~~~~~~~~~~~~~~~~~~~~~~
"     6. Colors and Fonts     
"~~~~~~~~~~~~~~~~~~~~~~~~
"set termguicolors
set background=dark






" General colours
" --------------------------------------------------------------------------
hi Normal	ctermfg=251	ctermbg=NONE	cterm=NONE
hi NonText	ctermfg=36	ctermbg=NONE	cterm=NONE

hi Cursor	ctermfg=0	ctermbg=255	cterm=REVERSE
hi LineNr	ctermfg=242	ctermbg=NONE	cterm=NONE
hi CursorLineNr	ctermfg=247	ctermbg=NONE	cterm=BOLD

hi VertSplit	ctermfg=233	ctermbg=233	cterm=NONE
hi StatusLine	ctermfg=85	ctermbg=233	cterm=NONE
hi StatusLineNC	ctermfg=242	ctermbg=233	cterm=BOLD

hi FoldColumn	ctermfg=244	ctermbg=235	cterm=NONE
hi Folded	ctermfg=244	ctermbg=235	cterm=BOLD

hi Title	ctermfg=NONE	ctermbg=NONE	cterm=NONE
hi TabLine	ctermfg=247	ctermbg=NONE	cterm=NONE
hi TabLineFill	ctermfg=0	ctermbg=NONE	cterm=NONE
hi TabLineSel	ctermfg=85	ctermbg=236	cterm=NONE

hi Visual	ctermfg=NONE	ctermbg=238	cterm=NONE

hi SpecialKey	ctermfg=239	ctermbg=0	cterm=NONE

hi WildMenu	ctermfg=85	ctermbg=235	cterm=BOLD
hi PmenuSbar	ctermfg=0	ctermbg=240	cterm=NONE

hi Error	ctermfg=15	ctermbg=88	cterm=NONE
hi ErrorMsg	ctermfg=15	ctermbg=88	cterm=BOLD
hi WarningMsg	ctermfg=15	ctermbg=88	cterm=BOLD

hi IncSearch	ctermfg=234	ctermbg=6	cterm=NONE
hi Search	ctermfg=176	ctermbg=53	cterm=UNDERLINE

hi ModeMsg	ctermfg=246	ctermbg=NONE	cterm=BOLD

hi CursorLine	ctermfg=NONE	ctermbg=NONE	cterm=NONE
hi CursorColumn	ctermfg=NONE	ctermbg=NONE	cterm=NONE

hi MathParen	ctermfg=NONE	ctermbg=240	cterm=NONE

hi Pmenu	ctermfg=7	ctermbg=238	cterm=NONE
hi PmenuSel	ctermfg=7	ctermbg=186	cterm=NONE

hi MatchParen	ctermfg=9	ctermbg=245	cterm=BOLD



" Syntax
hi Comment	ctermfg=248	ctermbg=NONE	cterm=NONE
hi String	ctermfg=143	ctermbg=NONE	cterm=NONE
hi Character	ctermfg=210	ctermbg=NONE	cterm=NONE
hi Number	ctermfg=166	ctermbg=NONE	cterm=NONE
hi link Float Number
hi Boolean	ctermfg=77	ctermbg=NONE	cterm=NONE
hi Constant	ctermfg=131	ctermbg=NONE	cterm=BOLD

hi Keyword	ctermfg=172	ctermbg=NONE	cterm=NONE
hi PreProc	ctermfg=78	ctermbg=NONE	cterm=NONE
hi Conditional	ctermfg=136	ctermbg=NONE	cterm=BOLD
hi Repeat	ctermfg=166	ctermbg=NONE	cterm=BOLD

hi Identifier	ctermfg=65	ctermbg=NONE	cterm=NONE
hi Type		ctermfg=208	ctermbg=NONE	cterm=NONE
hi TypeDef	ctermfg=166	ctermbg=NONE	cterm=NONE
hi Special	ctermfg=210	ctermbg=NONE	cterm=NONE
" Don't know what parts use Delimiter, so yellow for now.
hi Delimiter	ctermfg=11	ctermbg=NONE	cterm=NONE

hi Function	ctermfg=208	ctermbg=NONE	cterm=NONE
hi Statement	ctermfg=166	ctermbg=NONE	cterm=NONE
hi Operator	ctermfg=160	ctermbg=NONE	cterm=NONE
hi Exception	ctermfg=130	ctermbg=NONE	cterm=UNDERLINE

hi ToDo		ctermfg=14	ctermbg=238	cterm=BOLD,UNDERLINE


" VimDiff
hi DiffAdd	ctermfg=251	ctermbg=22	cterm=NONE
hi DiffChange	ctermfg=251	ctermbg=98	cterm=NONE
hi DiffDelete	ctermfg=88	ctermbg=88	cterm=NONE
hi DiffText	ctermfg=251	ctermbg=NONE	cterm=NONE


" Special for Java
hi link javaScopeDecl         Identifier
hi link javaCommentTitle      javaDocSeeTag
hi link javaDocTags           javaDocSeeTag
hi link javaDocParam          javaDocSeeTag
hi link javaDocSeeTagParam    javaDocSeeTag

hi  javaDocSeeTag ctermfg=229 ctermbg=NONE cterm=NONE


" Special for Python
hi link python3Statement Identifier
hi python3Builtin	ctermfg=42	ctermbg=NONE	cterm=UNDERLINE
hi python3Operator	ctermfg=166	ctermbg=NONE	cterm=NONE
" --------------------------------------------------------------------------


