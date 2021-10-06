if exists('g:knobs_core_autoloaded')
  finish
endif
let g:knobs_core_autoloaded = 1

function! knobs#core#Init()
  if exists('g:knobs_core_initialised')
    return
  endif
  let g:knobs_core_initialised = 1

  " Apply all levels
  call knobs#core#InitLevels()
endfunction

" Init feature toggles based on knobs levels (called first time)
function! knobs#core#InitLevels()
  for [knob,level] in items(g:knobs_levels)
    if g:knobs_level >= level
      let g:knobs[knob] = 1
      let knob_name = "g:knob_" . knob 
      let {knob_name} = 1
    endif
  endfor
endfunction

" Function useful for plug package
function! knobs#core#RunIf(knob, ...)
  if knobs#(trim(a:knob,"'"))
    execute join(a:000)
  endif
endfunction

