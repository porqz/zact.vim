function! s:set_window_width(window, new_width)
    exec printf("vertical resize %f", a:new_width)
endfunction

function! s:set_window_height(window, new_height)
    exec printf("resize %f", a:new_height)
endfunction

function! s:zoom_active_window()
    let l:active_window = winnr()

    let l:active_window_width = winwidth(l:active_window)
    let l:active_window_height = winheight(l:active_window)

    let l:max_window_width = &columns
    let l:max_window_height = &lines

    call s:set_window_width(l:active_window, l:max_window_width / 1.618)
endfunction

au WinEnter,BufEnter * call <SID>zoom_active_window()
