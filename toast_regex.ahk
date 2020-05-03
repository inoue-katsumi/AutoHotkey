#Include Acc.ahk
;Class (NN) = Windows.UI.Core.CoreWindow
;Process = ShellExperienceHost.exe

F7::
all_ids =
;WinActivate, ahk_id 0x10114
;SendInput {LWin down}b{LWin up}{Up}
SendInput #b
SendInput {Up}
SendInput {Space}
sleep 1500

;Acc := Acc_ObjectFromPoint(child)
;hWnd := Acc_WindowFromObject(Acc)
;hWnd := Format("0x{:X}", hWnd)
WinGet, hWnd, ID, A

Loop, 4
{
  apps := A_index
  
  oAcc := Acc_Get("Object", "4.1." apps ".1", 0, "ahk_id " hWnd)
  app_name := oAcc.accName(0)
  if (app_name = "Slack")
  {
    Loop, 3
    {
    oAcc := Acc_Get("Object", "4.1." apps "." A_index+3 ".2", 0, "ahk_id " hWnd)
    message := oAcc.accName(0)

    ; This regex is for a ticketing system where ticket IDs are 6 digits.
    ; For JIRA, maybe someghing like [[:upper:]]{2,4}-[[:digit:]]{3,5}
    ; 
    RegExMatch(message,"^.*\b([[:lower:]]{6})[^[:lower:]].*$",identifier)
    ;        RegExMatch(message,"^.*\b([[:digit:]]{6})[^[:digit:]].*$",identifier)
    if identifier {
      ; %A_Space% at the end of the string didn't work.
      all_ids = %all_ids%%identifier1%,
    } else {
      RegExMatch(message,"^.*[^[:digit:]]([[:digit:]]{6})[^[:digit:]].*$",identifier)
      if identifier
        all_ids = %all_ids%%identifier1%,
    }
    ;oAcc := ""
    }
    ;msgbox %hWnd%`n%app_name%`n%apps%`n%all_ids%
    if all_ids {
      Clipboard := ""
      Clipboard := RTrim(all_ids, ",")
    }
    break
  }
;  sleep 1000
}

;ExitApp
