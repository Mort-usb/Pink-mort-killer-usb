; Hide the taskbar
HideTaskbar() {
    WinSet, Style, -0xC00000, ahk_class Shell_TrayWnd
}

; Hide desktop icons
HideDesktopIcons() {
    WinSet, Style, -0x400000, ahk_class Progman
}

; Run functions
HideTaskbar()
HideDesktopIcons()
