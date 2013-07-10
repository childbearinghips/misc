; This script only works with numlock disabled

;# is the window key, #up and #down basically maximizes and minimizes the window but will still show the bblean bar

NumpadHome::
        WinMove,A,,     10, 23, 800, 1050
return

NumpadUp::
	WinMove,A,,	810,23, 670, 400
return

NumpadPgUp::
	WinMove,A,,	810,423, 670, 650
return

NumpadClear::
	WinMove,A,, 0, 13, 1410, 900
return

#Up::
	WinMove,A,, 	0, 13, 1920, 1070
return

#N:: Run firefox.exe
return

#A:: Run C:\Program Files (x86)\Anki\anki.exe
return
