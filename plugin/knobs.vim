if exists('g:knobs_loaded')
  finish
endif
let g:knobs_loaded = 1

command! -nargs=0 KnobLevel :echo knobs#Level()
