#Requires AutoHotkey v2.0.2
#SingleInstance Force

Komorebic("watch-configuration enable")

Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

#^r::
{
  Komorebic("stop")
	sleep 500
  Komorebic("start --ahk --ffm")
  return
}

#q::Komorebic("close")
#m::Komorebic("minimize")

; Focus windows
#h::
{
  Komorebic("focus left")
  return
}
#j::Komorebic("focus down")
#k::Komorebic("focus up")
#l::
{
  Komorebic("focus right")
  return
}

#+[::Komorebic("cycle-focus previous")
#+]::Komorebic("cycle-focus next")

; Move windows
#+h::Komorebic("move left")
#+j::Komorebic("move down")
#+k::Komorebic("move up")
#+l::Komorebic("move right")

; Stack windows
#Left::Komorebic("stack left")
#Down::Komorebic("stack down")
#Up::Komorebic("stack up")
#Right::Komorebic("stack right")
#;::Komorebic("unstack")
#[::Komorebic("cycle-stack previous")
#]::Komorebic("cycle-stack next")

; Resize
#=::Komorebic("resize-axis horizontal increase")
#'::Komorebic("resize-axis horizontal decrease")
#+=::Komorebic("resize-axis vertical increase")
#+"::Komorebic("resize-axis vertical decrease")

; Manipulate windows
#t::Komorebic("toggle-float")
#f::Komorebic("toggle-monocle")

; Window manager options
#^t::Komorebic("retile")
#p::Komorebic("toggle-pause")
#^m::Komorebic("manage")

; Layouts
#x::Komorebic("flip-layout horizontal")
#y::Komorebic("flip-layout vertical")

; Monitors
#w::Komorebic("focus-monitor 0")
#e::Komorebic("focus-monitor 1")
#r::Komorebic("focus-monitor 2")
#o::
{
  Komorebic("focus-monitor-workspace 0 1")
  Komorebic("focus-monitor 1")
  return
}

; Move windows acress monitors
#+w::Komorebic("move-to-monitor 0")
#+e::Komorebic("move-to-monitor 1")
#+r::Komorebic("move-to-monitor 2")

; Workspaces
#1::Komorebic("focus-workspace 0")
#2::Komorebic("focus-workspace 1")
#3::Komorebic("focus-workspace 2")
#4::Komorebic("focus-workspace 3")
#5::Komorebic("focus-workspace 4")
#6::Komorebic("focus-workspace 5")
#7::Komorebic("focus-workspace 6")
#8::Komorebic("focus-workspace 7")
#-::Komorebic("")

; Move windows across workspaces
#+1::Komorebic("move-to-workspace 0")
#+2::Komorebic("move-to-workspace 1")
#+3::Komorebic("move-to-workspace 2")
#+4::Komorebic("move-to-workspace 3")
#+5::Komorebic("move-to-workspace 4")
#+6::Komorebic("move-to-workspace 5")
#+7::Komorebic("move-to-workspace 6")
#+8::Komorebic("move-to-workspace 7")

#Warn All, Off
#+p:: 
{
  RegWrite "0", "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableLockWorkstation"
	DllCall("LockWorkStation")
	sleep 1000
  RegWrite "1", "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableLockWorkstation"

  return
}
