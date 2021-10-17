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

  " Apply all layers
  call knobs#core#ApplyLayers()
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

" Apply feature toggles for all layers
function! knobs#core#ApplyLayers()
  for [layer,enabled] in items(g:knobs_layers)
    if enabled
      call knobs#core#ApplyLayer(layer, enabled)
    endif
  endfor
endfunction

function! knobs#core#ApplyLayer(layer, enabled)
  if has_key(g:knobs_layers_map, a:layer)
    for [feature,value] in items(g:knobs_layers_map[a:layer])
      call knobs#core#SetKnob(feature, a:enabled ? value : 1 - value)
    endfor
  endif
endfunction

function! knobs#core#SetKnob(knob, value)
  let g:knobs[a:knob] = a:value
  " And set a global file since cheaper to check at run time
  let knob_name = "g:knob_" . a:knob
  if a:value > 0
    let {knob_name} = a:value
  elseif exists(knob_name)
    unlet {knob_name}
  endif
endfunction
