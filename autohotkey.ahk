; This script only works with numlock disabled

;# is the window key, #up and #down basically maximizes and minimizes the window but will still show the bblean bar

NumpadHome::
        WinMove,A,,     0, 13, 1410, 900
return

NumpadLeft::
        WinMove,A,,	0,912, 1410, 170
return

#Up::
	WinMove,A,, 	0, 13, 1920, 1070
return

#Down::
	WinMove,A,, 	0, 13, 1410, 900
return
