" Author: https://github.com/arbitary

""""""""""""""""""""
" Function
""""""""""""""""""""
" GetCoord :: [Int] -> [Int, Int]
" GetCoord pos constructs a two element list from pos
let s:GetCoord = { pos -> "[" . pos[1] . "," . pos[2]. "]" }  

" GetCoords :: [[Int, Int]]
" GetCoords returns the corrds of top-left and bottom-right of a visual selection.
let s:GetCoords = { -> "[" . s:GetCoord(getpos("'<"))
                \ . "," . s:GetCoord(getpos("'>")) ."]" }

""""""""""""""""""""
" Interaction
""""""""""""""""""""
" BuildExCmd :: String -> Action
" BuildExCmd cmd constructs an Ex command and run it.
function! BuildExCmd(cmd) 
  if a:cmd ==# "haskell-comment toggle-block"
    let l:strCommand = "'<,'>" . " ! " . a:cmd . " --coords=" . s:GetCoords() 
  else 
    let l:strCommand = "'<,'>" . " ! " . a:cmd
  endif
  execute l:strCommand
endfunction

" let b:match_words = "{-:-}"
" let g:enable_hs_comment_bindings = 1
" key mappings for togglling Haskell comments
if  (g:enable_hs_comment_bindings ==# 1)
    vnoremap <silent><leader>ac <esc>:call    BuildExCmd ("haskell-comment toggle-section")<cr>
    vnoremap <silent><leader>tl <esc>:call    BuildExCmd ("haskell-comment toggle-line")<cr>
    nnoremap <silent><leader>tl V<esc>:call   BuildExCmd ("haskell-comment toggle-line")<cr>
    vnoremap <silent><leader>th <esc>:call    BuildExCmd ("haskell-comment toggle-haddock")<cr>
    nnoremap <silent><leader>th V<esc>:call   BuildExCmd ("haskell-comment toggle-haddock")<cr>
    vnoremap <silent><leader>tb <esc>:call    BuildExCmd("haskell-comment toggle-block")<cr>
    " tb in normal mode should only remove a block comment to avlid messing up
    " with any (), {} [], which has nothing to do with
    " haskell block comment. Solution: Add a flag indicating it should only remove
    " block comment. Solution 2: build a customized vim command which will
    " only select corrsponding {- -} pair like % does.
    nnoremap <silent><leader>tb v%<esc>:call  BuildExCmd("haskell-comment toggle-block")<cr>
endif
