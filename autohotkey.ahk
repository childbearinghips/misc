    ; Uncomment this if you want a hotkey to set it for every
    ; !+r::GoSub, AdjustAllWindows
     
    ; Initalise the hook
    GoSub, HookWindow
    ; Run it once for every window
    GoSub, AdjustAllWindows
    Return
     
    HookWindow:
       ; New Window Hook
        Gui +LastFound
        hWnd := WinExist()
     
        DllCall( "RegisterShellHookWindow", UInt,hWnd )
        MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
        OnMessage( MsgNum, "ShellMessage" )
     
        ShellMessage(wParam,lParam) {
            If (wParam = 1) ;  HSHELL_WINDOWCREATED := 1
            {
                Sleep, 10
                AdjustWindow(lParam)
            }
        }
    Return
     
    ; Adjust Window
    AdjustWindow(id)
    {
        WinId := id
        WinTitle := id = "A" ? "A" : "ahk_id " . id
     
        ; This is to check if the window is shown in the alt-tab menu, you don't want to do it on every single frame
        WinGet, WinExStyle, ExStyle, %WinTitle%
        If (WinExStyle & 0x80)
        {
            Return
        }
     
        ; This is to match classes and/or processes
        WinGetClass, WinClass, %WinTitle%
        WinGet, WinProcess, ProcessName, %WinTitle%
     
        ; Explorer
        If WinClass In % "CabinetWClass"
        If WinProcess In % "explorer.exe"
        {
            WinSet, Style, -0xC00000, %WinTitle%
        }
     
        ; uTorrent
        If WinProcess In % "uTorrent.exe"
        {
            WinSet, Style, -0xC00000, %WinTitle%
        }
		
		; Notepad++
        If WinProcess In % "notepad++.exe"
        {
            WinSet, Style, -0xC00000, %WinTitle%
        }
		
		; Skype
        If WinProcess In % "skype.exe"
        {
            WinSet, Style, -0xC00000, %WinTitle%
        }
		
		; Microsoft Security Essentials
		
        If WinProcess In % "msseces.exe"
        {
	   WinSet, Style, -0xC00000, %WinTitle%
        }
		
		; Gimp
        If WinProcess In % "gimp-2.8.exe"
        {
        	   WinSet, Style, -0xC00000, %WinTitle%
        }
		
		; Adobe Reader
        If WinProcess In % "AcroRd32.exe"
        {
              WinSet, Style, -0xC00000, %WinTitle%
        }
		
		; OpenOffice
        If WinProcess In % "soffice.exe"
        {
    	   WinSet, Style, -0xC00000, %WinTitle%
        }

		; MPC-HC
        If WinProcess In % "mpc-hc.exe"
        {
	   WinSet, Style, -0xC00000, %WinTitle%
        }
		
		; Nexus File
        If WinProcess In % "NexusFile.exe"
        {
	   WinSet, Style, -0xC00000, %WinTitle%
        }
		
		; Anki
        If WinProcess In % "anki.exe"
        {
        	   WinSet, Style, -0xC00000, %WinTitle%
        }
	
		; Eclipse
        If WinProcess In % "eclipse.exe"
        {
	   WinSet, Style, -0xC00000, %WinTitle%
        }
	
		; sublime text 2
        	If WinProcess In % "sublime_text.exe"
        	{
            		WinSet, Style, -0xC00000, %WinTitle%
        	}

		; Notepad
        	If WinProcess In % "notepad.exe"
        	{
            		WinSet, Style, -0xC00000, %WinTitle%
        	}	
		;mupdf
		If WinProcess In % "mupdf-v8.exe"
        	{
            		WinSet, Style, -0xC00000, %WinTitle%
        	}	
		
		;Cygwin
			If WinProcess In % "mintty.exe"
        	{
            		WinSet, Style, -0xC00000, %WinTitle%
        	}
     
        ; Uncomment this and comment the above if you don't want it to work on every window
        ; WinSet, Style, -0xC00000, %WinTitle%
    }
     
    AdjustAllWindows:
       WinGet, id, list,,, Program Manager
        Loop, %id%
        {
            AdjustWindow(id%A_Index%)
        }
    Return

^!f::
WinGetTitle, currentWindow, A
IfWinExist %currentWindow%
{
    WinSet, Style, ^0xC00000 ; toggle title bar
}
return

; This script modified from the original: http://www.autohotkey.com/docs/scripts/EasyWindowDrag.htm
; by The How-To Geek
; http://www.howtogeek.com 

Alt & LButton::
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
if EWD_WinState = 0  ; Only if the window isn't maximized 
    SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U  ; Button has been released, so drag is complete.
{
    SetTimer, EWD_WatchMouse, off
    return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
{
    SetTimer, EWD_WatchMouse, off
    WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
    return
}
; Otherwise, reposition the window to match the change in mouse coordinates
; caused by the user having dragged the mouse:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1   ; Makes the below move faster/smoother.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY
return

Volume_Up::
run nircmd.exe changesysvolume 2000
return
Volume_Down::
run nircmd.exe changesysvolume -2000
return
Volume_Mute::
run nircmd.exe mutesysvolume 2
return

NumpadHome::
        WinMove,A,,8, 21,350, 200
return

NumpadUp::
        WinMove,A,,8, 226,350,350
return

NumpadPgUp::
        WinMove,A,,8,581,350, 492
return

NumpadLeft::
        WinMove,A,, 363,21,1012,1052
return

NumpadClear::
        WinMove,A,, 690, 21,298,408
return

NumpadRight::
        WinMove,A,, 10, 431, 978, 640
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

#T::Run C:\Program Files (x86)\uTorrent\uTorrent.exe
return

#F::Run C:\Program Files (x86)\foobar2000\foobar2000.exe
