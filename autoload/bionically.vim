" Description: API to convert current buffer text into bionic mode
" Last Modified: July 12, 2022

function! g:bionically#Setup() abort
  execute "!firefox --new-tab https://rapidapi.com/bionic-reading-bionic-reading-default/api/bionic-reading1/"
  echo "After subscribing to the API, switch to Python->Requests, and copy \"url\" and \"headers\" in bionically/src/config.py"
endfunction

function! g:bionically#Convert() abort
  if !has('python3')
    echo "para: vim is not compiled with +python3. aborting!"
    finish
  endif

  if !filereadable("/home/neon/.vim/plugged/bionically/src/config.py")
    echo "First setup a config.py file with your personal API keys. Use :BionicallySetup"
    finish
  endif

  let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

  python3 << EOF
from os.path import normpath, join
import sys
import vim

plugin_root_dir = "/home/neon/.vim/plugged/bionically/"
python_root_dir = normpath(join(plugin_root_dir, "src"))
sys.path.insert(0, python_root_dir)

import bionically

bionically.init()
EOF

endfunction

