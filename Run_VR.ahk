#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;This script should be placed in the same folder that has PS_Move_Service as well as FreePIE
SetTitleMatchMode, 2

; Launch the PSMoveService 
run, %a_workingdir%\PS_Move_Service\psmoveservice.exe
Sleep, 1000

; Launch and configure the FreePIEBridge to 
; Select the controller for head detection
run, %a_workingdir%\Freepie\PSMoveFreepieBridge
sleep, 200
send, 1 {Enter}
send, 2 {Enter}
send, n {Enter}
sleep, 500

; Launch FreePIE and wait for it to load
IfExist, "C:\Program Files (x86)\FreePIE\FreePIE.exe"
	run, "C:\Program Files (x86)\FreePIE\FreePIE.exe"
IfNotExist, "C:\Program Files (x86)\FreePIE\FreePIE.exe"
	msgbox, FreePIE doesn't exist in the specified directory
WinActivate, - freepie, 
Sleep, 1000

; Once FreePIE is loaded, load the example script
send, !f
send, ^o
Send, "freepie example script"{enter}
sleep, 1000
send, {f5}
sleep, 500

; Minimize Everything to desktop
send, {LWin down}d{LWin up}

; Launch Riftcat
IfExist, "C:\Program Files (x86)\Riftcat\Riftcat.exe"
	run, "C:\Program Files (x86)\Riftcat\Riftcat.exe"
IfNotExist, "C:\Program Files (x86)\Riftcat\Riftcat.exe"
	msgbox, Riftcat doesn't exist in the specified directory
