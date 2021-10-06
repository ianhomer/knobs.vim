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

  let g:knobs_level = exists('$VIM_KNOB' ) ?
    \ $VIM_KNOB : 
    \ exists('g:knobs_default_level') ? g:knobs_default_level : 0

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
