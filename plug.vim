
function! ConvertParagraphToNumberedList()
  echo 'convert paragraph to numbered list'
  echo 'current line: ' line('.')
  normal! }
  let l:endline = line('.')
  echo 'end line:' line('.')
  normal! {
  echo 'start line:' line('.')
  let l:startline = line('.')

  let l:index = 0
  let l:currentline = l:startline

  while l:currentline <= l:endline
    echo getline(l:currentline)
    if getline(l:currentline) =~ "^$"
      echo 'line ' l:currentline ' is empty'
    else
      execute "normal! :\<c-r>=l:currentline\<cr>\<cr>"
      execute "normal! i\<c-r>=index\<cr>)\<space>\e"
    endif 
    let l:index += 1
    let l:currentline += 1
  endwhile
endfunction

function! ConvertParagraphToBulletList()
  echo 'convert paragraph to numbered list'
  echo 'current line: ' line('.')
  normal! }
  let l:endline = line('.')
  echo 'end line:' line('.')
  normal! {
  echo 'start line:' line('.')
  let l:startline = line('.')

  let l:currentline = l:startline

  while l:currentline <= l:endline
    echo getline(l:currentline)
    if getline(l:currentline) =~ "^$"
      echo 'line ' l:currentline ' is empty'
    else
      execute "normal! :\<c-r>=l:currentline\<cr>\<cr>"
      execute "normal! i*)\<space>\e"
    endif 
    let l:currentline += 1
  endwhile
endfunction



nnoremap §nl :call ConvertParagraphToNumberedList()<CR><CR>
nnoremap §bl :call ConvertParagraphToBulletList()<CR><CR>

nnoremap §sop :source ~/github/vim_playground/plug.vim<CR>

