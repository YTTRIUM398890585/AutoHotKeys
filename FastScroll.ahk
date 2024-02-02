#Requires AutoHotkey v2.0

A_HotkeyInterval := 0

; Array of windows to ignore
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

; context mene still shows up in discord and opera gx

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

; *WheelUp::
; {
;     if (GetKeyState("Alt", "P") && !IsIgnoredWindowActive()) {
;         Send("{Blind}{Alt up}")  ; Release Alt temporarily
;         Loop 10 {
;             Send("{WheelUp}")
;             Sleep 10  ; Delay between each scroll event
;         }
;         Send("{Blind}{Alt down}")  ; Restore Alt
;     } else {
;         Send("{WheelUp}")
;     }
;     return
; }

; *WheelDown::
; {
;     if (GetKeyState("Alt", "P") && !IsIgnoredWindowActive()) {
;         Send("{Blind}{Alt up}")  ; Release Alt temporarily
;         Loop 10 {
;             Send("{WheelDown}")
;             Sleep 10  ; Delay between each scroll event
;         }
;         Send("{Blind}{Alt down}")  ; Restore Alt
;     } else {
;         Send("{WheelDown}")
;     }
;     return
; }