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
  \   "k5b":5,
  \   "k6a":6,
  \   "k6b":6,
  \   "k7a":7,
  \   "k7b":7,
  \   "k8a":8,
  \   "k8b":8
  \ }

" Feature toggles triggered by each layer
let g:knobs_layers_map = {
  \    "test":{
  \      "test_a":1,
  \    }
  \  }

if knobs#("k1a")
  IfKnob 'k1a' noremap <space>a ak1a<ESC>
end

IfKnob 'k1b' noremap <space>b ak1b<ESC>

