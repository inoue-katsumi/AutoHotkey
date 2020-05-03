# AutoHotkey

AutoHotkey is my .ahk scripts repository to make Windows10 life efficient one.

## Usage:

```bash
/mnt/c/Program\ Files/AutoHotkey/AutoHotkeyU64.exe c:\\bin\\win_Captions_regex.ahk &
```

## win_Captions_regex.ahk:

Scan all open windows(applications which have UI) and extracts regex match from caption. At my work, we use a system which assigns 6 digits tickets IDs. So , this script checkes for 6 consecutive digits string.

## toast_regex.ahk:

Scan notification area for 3 messages from Slack and extract regex match and store them on copy&paste buffer, aka clipboard. Requires Acc.ahk
