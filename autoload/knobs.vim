if exists('g:autoloaded_knobs')
  finish
endif
let g:autoloaded_knobs = 1

if !exists("g:knobs_default_level")
  let g:knobs_default_level = 3
endif

function! knobs#Level()
  return g:knobs_level
endfunction

function! knobs#Init()
  if exists('g:knobs_initialised')
    return
  endif
  let g:knobs_initialised = 1

  let g:knobs_level = exists('$VIM_KNOB' ) ?
    \ $VIM_KNOB : 
    \ exists('g:knobs_default_level') ? g:knobs_default_level : 0
endfunction

call knobs#Init()
