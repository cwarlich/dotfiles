""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Configure NERDTree                                           "
"--------------------------------------------------------------------------------------------------------"
" NERDTree installation is done by cloning the NERDTree git repo to                                      "
" $HOME/.vim/pack/*/start, e.g. by running                                                               "
" git clone --depth 1 https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree        "
" See https://opensource.com/article/20/2/how-install-vim-plugin for details.                            "
" Use submodudes for perfect integration into yadm:                                                      "
" yadm -C $HOME submodule add  https://github.com/preservim/nerdtree.git .vim/pack/vendor/start/nerdtree "
" yadm -C §HOME submodule update --init --recursive                                                      "
" yadm commit -m 'Add NERDTree git repo as submodule.'                                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start with a NERDTree by default
autocmd VimEnter * NERDTree
" Show hidden files in NerdTree
let NERDTreeShowHidden=1
" Map ctrl-q to NERDTree toggle
map <C-q> :NERDTreeToggle<CR>
" Close vim, if no buffer is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Clone NERDTree to every tab
autocmd TabEnter * NERDTreeMirror
" Set focus to file window when opening a new tab ...
autocmd VimEnter * wincmd l
" ... and whenever leaving a tab, e.g. when pressing t in NERDTree window ...
autocmd TabLeave * wincmd l
" ... and for any additional tab loaded on vim startup, i.e. using vim's -p option
autocmd TabEnter * wincmd l
