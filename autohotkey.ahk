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

NumpadLeft::
	WinMove,A,, 10, 23, 425, 420
return

NumpadClear::
	WinMove,A,, 10, 443, 425, 620
return

NumpadRight::
	WinMove,A,, 435, 23, 1000, 505
return

NumpadEnd::
	WinMove,A,, 435, 528, 1000, 535
return

NumpadDown::
	WinMove,A,, 435, 23, 1000, 1040
return


#Up::
	WinMove,A,, 0, 13, 1920, 1070
return

#N:: Run firefox.exe
return

#A:: Run C:\Program Files (x86)\Anki\anki.exe
return

#D:: Run C:\Users\user\Downloads
return
