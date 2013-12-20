" Vim syntax for log files

if exists("b:current_syntax")
  finish
endif

"Color Error header of log message
syn keyword logError ERROR
hi link logError Error

"Color Header of log message
syn keyword logHeader PARALLEL PORTEVENT ACTION USER DEBUG WARNING
hi link logHeader Type

"Color timestamp of the log message
syn match timeStamp "\d*:\d*:\d*.\d*"
hi timeStamp ctermfg=Blue 

"Color 'parameter := assigment
syn match assigment /:=/ 
hi assigment ctermfg=Brown

"Color 'parameter := value' type values  
syn match value /:=.*$/hs=s+2
syn match value /:=.*,/hs=s+2,he=e-1
hi value ctermfg=Red

"Color function calls
syn match funct /(function.*)/hs=s+1,he=e-1
syn match funct /(altstep.*)/hs=s+1,he=e-1
syn match funct /(test.*)/hs=s+1,he=e-1
syn match funct /(control.*)/hs=s+1,he=e-1
hi funct ctermfg=Red

"Color source file in stack
syn match sourceFile "[a-zA-Z0-9_]*\.ttcn[p]*" 
hi sourceFile ctermfg=Brown  

"Color line numbers in stack 
syn match num  ":\d\+"hs=s+1
hi num  ctermfg=DarkGreen

"Define current syntax
let b:current_syntax = "log"
