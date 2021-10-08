" 
" Vim configuration for container test
"

let g:knobs_levels = {
  \   "k1a":1,
  \   "k1b":1,
  \   "k2a":2,
  \   "k2b":2,
  \   "k3a":3,
  \   "k3b":3,
  \   "k4a":4,
  \   "k4b":4,
  \   "k5a":5,
  \   "k5b":5
  \ }

if knobs#("k1a")
  IfKnob 'k1a' noremap <space>a ak1a<ESC>
end

IfKnob 'k1b' noremap <space>b ak1b<ESC>

