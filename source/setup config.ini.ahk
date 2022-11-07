#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

If A_IsCompiled != 1
	{
	SetWorkingDir C:\Users\Arnau\Desktop\Accentuator\Accentuator\test-sandbox
	sleep 10
	MsgBox, Accentuator setup script is running from AutoHotkey and isn't compiled. WorkingDir is set to %A_WorkingDir%`nTo change this, use the compiled script or set it in the line on top of this MsgBox.
	}

IniWrite, true, config.ini, Setup, isFirstTime
IniWrite, !+a, config.ini, Hotkey, accSelectedHotkey