if exists('g:knobs_loaded')
  finish
endif
let g:knobs_loaded = 1

"
" Toggle features and layers. Layers are typically triggered by the environment
" and can be used to toggle multiple features.
"
" Raise config level to enable more configuration, suggested levels are as
" follows, but each level can mean what you like.
"
" - 0 => vanilla config - close to empty
" - 1 => light config - low impact, very fast start up
" - 2 => light+ config
" - 3 => default config - fast startup for embedded commands
" - 4 => default+ config - config being considered for default
" - 5 => daily config - recommended when opening vim explicitly
" - 6 => daily config - config is occasionally needed
" - 7 => incubation config - new ideas
" - 8 => playground config - wild ideas
" - 9 => legacy config
"
" Config level can be used to reduce start up times, troubleshoot interactions
" between configurations and plugins. It can also be used to introduce new
" configuration and plugins with control.
"
"
command! -nargs=0 Knobs :echo knobs#runtime#Knobs()
command! -nargs=0 KnobsLevel :echo knobs#Level()


