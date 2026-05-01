" 検索ハイライト解除
nmap <Esc><Esc> :nohl<CR>

"  to Normal Mode
imap jk <Esc>

" クリップボード連携
set clipboard=unnamed

" Obsidianの戻る / 進む
exmap back obcommand app:go-back
nmap <C-o> :back<CR>
exmap forward obcommand app:go-forward
nmap <C-i> :forward<CR>

" リンク挿入
nmap <leader>l :obcommand editor:insert-link<CR>

" 折りたたみトグル
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold<CR>
nmap zc :togglefold<CR>
nmap za :togglefold<CR>
