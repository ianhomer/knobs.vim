if exists('g:autoloaded_knobs')
  finish
endif
let g:autoloaded_knobs = 1

if !exists('g:knobs_levels')
  let g:knobs_levels={}
endif

if !exists("g:knobs_default_level")
  let g:knobs_default_level = 3
endif

if !exists("g:knobs_level_limit")
  let g:knobs_level_limit = 7
endif

if !exists('g:knobs_layers_map')
  let g:knobs_layers_map={}
endif

" Default state of layers
let g:knobs_layers = get(g:, "knobs_layers",{
  \   "debug": $VIM_KNOBS_DEBUG == "1" ? 1 : 0,
  \   "kitty": $TERM == 'xterm-kitty' ? 1 : 0,
  \   "mobile": $ANDROID_DATA == '/data' ? 1 : 0,
  \   "notes": $VIM_KNOBS_NOTES == "1" ? 1 : 0,
  \   "test": $VIM_KNOBS_TEST == "1" ? 1: 0,
  \   "wezterm": $TERM_PROGRAM == "WezTerm" ? 1: 0
  \ })

function! knobs#(knob)
  return exists("g:knob_" . a:knob)
endfunction

function! knobs#At(level)
  return g:knobs_level >= a:level
endfunction

function! knobs#Init()
  if exists('g:knobs_initialised')
    return
  endif
  let g:knobs_level = exists('$VIM_KNOBS' ) ?
    \ $VIM_KNOBS : 
    \ exists('g:knobs_default_level') ? g:knobs_default_level : 0
  let g:knobs_initialised = 1

  " Set default state of feature toggles
  if exists('g:knobs_defaults')
    let g:knobs = get(g:, "knobs", g:knobs_defaults)

    for [key,value] in items(g:knobs)
      if value > 0
        let {"g:knob_" . key} = value
      endif
    endfor
  else
    let g:knobs = {}
  endif

  call s:DefineCommands()

  call knobs#Refresh()
endfunction

function! knobs#Refresh()
  " Do full initialisation if config level greater than zero
  if knobs#At(1)
    call knobs#core#Init()
  endif
endfunction

"
" Commands and functions used in vimrc. Further commands used after spin up
" should be defined in plugin/knobs.vim.
"
function! s:DefineCommands()
  if !exists("*IfKnob")
    command! -nargs=+ -bar IfKnob call knobs#core#RunIf(<f-args>)
  endif
endfunction

function! knobs#Level()
  return g:knobs_level
endfunction

call knobs#Init()
