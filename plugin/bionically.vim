" Description: API to convert current buffer text into bionic mode
" Last Modified: July 12, 2022

command! -nargs=0 BionicallySetup call g:bionically#Setup()
command! -nargs=0 Bionically call g:bionically#Convert()

