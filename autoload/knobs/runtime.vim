if exists('g:knobs_runtime_autoloaded')
  finish
endif
let g:knobs_runtime_autoloaded = 1

function! knobs#runtime#Knobs()
  return sort(filter(keys(g:knobs),'g:knobs[v:val]'))
endfunction

call knobs#Init()
