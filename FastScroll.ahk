; https://www.autohotkey.com/docs/v2/

#Requires AutoHotkey v2.0

; Set the interval between hotkey presses to 0 so that the error of the hotkey being pressed too quickly is not shown
A_HotkeyInterval := 0

; Array of windows to ignore
; ignoring vscode and minecraft
ignoredWindows := ["ahk_exe code.exe", "ahk_exe code_ignore.exe", "ahk_exe minecraftlauncher.exe", "ahk_exe minecraft.exe"]

; Function to check if any of the specified windows is active
IsIgnoredWindowActive() {
    for window in ignoredWindows {
        if (WinActive(window))
            return true
    }
    return false
}

; Special Keys: https://autohotkey.com/docs/Hotkeys.htm
; ! = alt
; + = shift
; ^ = ctrl
; # = win

; tested to work with:
; discord
; notepad
; in chrome and opera gx only mouse working

; context menu still shows up in discord and opera gx

; alt needs to be released when sending scroll, otherwise it will be zooming
*WheelUp::
{
    if (GetKeyState("Alt", "P") && !IsIgnoredWindowActive()) {
        Send("{Blind}{Alt up}")  ; Release Alt temporarily
        Send("{WheelUp 10}")
        Send("{Blind}{Alt down}")  ; Restore Alt
    } else {
        Send("{WheelUp}")
    }
    return
}

*WheelDown::
{
    if (GetKeyState("Alt", "P") && !IsIgnoredWindowActive()) {
        Send("{Blind}{Alt up}")  ; Release Alt temporarily
        Send("{WheelDown 10}")
        Send("{Blind}{Alt down}")  ; Restore Alt
    } else {
        Send("{WheelDown}")
    }
    return
}

; Below with the event being alt + scroll doesnt work as will cause zoom with alt pressed down
; !WheelUp::
; {
;     if (!IsIgnoredWindowActive()) {
;         Send("{Blind}{Alt up}")  ; Release Alt temporarily
;         Send("{WheelUp 10}")
;         Send("{Blind}{Alt down}")  ; Restore Alt
;     }
;     return
; }

; !WheelDown::
; {
;     if (!IsIgnoredWindowActive()) {
;         Send("{Blind}{Alt up}")  ; Release Alt temporarily
;         Send("{WheelDown 10}")
;         Send("{Blind}{Alt down}")  ; Restore Alt
;     }
;     return
; }