if exists('g:knobs_loaded')
  finish
endif
let g:knobs_loaded = 1

command! -nargs=0 Knobs :echo knobs#runtime#Knobs()
command! -nargs=0 KnobsLevel :echo knobs#Level()


