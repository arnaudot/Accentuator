#SingleInstance Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
accSelectedHotkey = !+a
accIsOpenedAccents = false
CoordMode Mouse, Screen

If A_IsCompiled != 1
	{
	SetWorkingDir C:\Users\Arnau\Desktop\Accentuator\Accentuator\test-sandbox
	sleep 10
	MsgBox, Accentuator is running from AutoHotkey and isn't compiled. WorkingDir is set to %A_WorkingDir%`nTo change this, use the compiled script or set it in the line on top of this MsgBox.
	}

Hotkey, %accSelectedHotkey%, accOpenAccents
IniRead, isFirstTime, config.ini, Setup, isFirstTime
if isFirstTime = "true"
	{
	MsgBox, Welcome to Accentuator. To start typing with accents, press Alt+Shift+A.
	}

Gui, acc:New
Gui, acc:+ToolWindow +DPIScale +AlwaysOnTop
Gui, acc:add, button, gAccOpen, ´
Gui, acc:add, button, ym, ``
Gui, acc:add, button, ym, ^
Gui, acc:add, button, ym, ¨
return

accOpenAccents:
if accIsOpenedAccents = false
	{
	MouseGetPos, CursorPosX, CursorPosY
	Gui, acc:Show, X%CursorPosX% Y%CursorPosY%
	accIsOpenedAccents = true
	return
	}
else
	{
	goto AccHide
	return
	}

AccHide:
Gui, acc:Hide
accIsOpenedAccents = false
return

AccOpen:
ControlSendRaw,, ´
goto AccHide
return