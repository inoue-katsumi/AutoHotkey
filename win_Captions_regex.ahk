^F6::
WinGet, windows, list
;Clipboard := ""
all_ids =

Loop, %windows%
{
    id := windows%A_Index%
    WinGet, process, ProcessName, ahk_id %id%
    WinGetTitle, title, ahk_id %id%

    ; This regex is for a ticketing system where ticket IDs are 6 digits.
    ; For JIRA, maybe someghing like [[:upper:]]{2,4}-[[:digit:]]{3,5}
    ;RegExMatch(title,"^.*\b([[:digit:]]{6})[^[:digit:]].*$",identifier)
    RegExMatch(title,"^.*\b([[:digit:]]{6})\b.*$",identifier)
    if identifier {
      ; %A_Space% at the end of the string didn't work.
      all_ids = %all_ids%%identifier1%,
    } else {
      RegExMatch(title,"^.*[^[:digit:]]([[:digit:]]{6})[^[:digit:]].*$",identifier)
      if identifier
        all_ids = %all_ids%%identifier1%,
    }
}
if all_ids {
  Clipboard := ""
  Clipboard := RTrim(all_ids, ",")
}
Return
;ExitApp
