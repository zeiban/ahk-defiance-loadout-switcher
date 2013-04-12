/*
  Copyright (C) 2013 Ryan "Zeiban" Stolle <me@zeiban.com>
  
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/

;========================================================================
; 
; Script:       DefianceLoadoutSwitcher
; Description:  Allows you to quickly switch loadouts in the game Defiance 
; Github: https://github.com/zeiban/ahk-defiance-loadout-switcher
;
; Last Update:  11/April/2013 18:45 EST
;
; Created by Zeiban
; - https://github.com/zeiban
; - http://zeiban.com
;
;========================================================================


#If WinActive("Defiance")

g_RefW := 1920
g_RefH := 1080

g_LoadoutCheckColor := 0x00BFFF
g_LoadoutCheckX := 92 / g_RefW
g_LoadoutCheckY := 41 / g_RefH

g_Loadout1NormX := 1308 / g_RefW
g_Loadout2NormX := 1345 / g_RefW
g_Loadout3NormX := 1380 / g_RefW
g_Loadout4NormX := 1415 / g_RefW
g_Loadout5NormX := 1448 / g_RefW
g_LoadoutNormY := 155 / g_RefH

g_Timeout := 5000

SelectLoadout(p_PosX, p_PosY) {
  global g_Timeout 
  global g_LoadoutCheckX 
  global g_LoadoutCheckY 
  global g_LoadoutCheckColor 

  WinGetPos l_WinX, l_WinX, l_WinW, l_WinH
  l_ClickX := p_PosX * l_WinW
  l_ClickY := p_PosY * l_WinH

  Send {l down}
  Sleep 50
  Send {l up}

  ; Wait for Loadout screen to appear
  l_Start := A_TickCount
  loop {
    PixelGetColor, l_Color, g_LoadoutCheckX * l_WinW, g_LoadoutCheckY * l_WinH
    If ErrorLevel {
      Return
    }
    
    If (l_Color == g_LoadoutCheckColor) {
      Break 
    }
    If ( g_TimeOut ) && ( A_TickCount - l_Start >= g_TimeOut) {
      Return
    }
  }
  MouseMove, l_ClickX, l_ClickY , 0
  MouseClick Left, l_ClickX, l_ClickY, 1, 0, D

  ;Delay needed between mouse up/down for fast computers
  Sleep 100 

  MouseClick Left, l_ClickX, l_ClickY, 1, 0, U

  Send {l down}
  Sleep 50
  Send {l up}
}

SelectLoadout1() {
  global g_Loadout1NormX
  global g_LoadoutNormY
  SelectLoadout(g_Loadout1NormX, g_LoadoutNormY)
}

SelectLoadout2() {
  global g_Loadout2NormX
  global g_LoadoutNormY
  SelectLoadout(g_Loadout2NormX, g_LoadoutNormY)
}

SelectLoadout3() {
  global g_Loadout3NormX
  global g_LoadoutNormY
  SelectLoadout(g_Loadout3NormX, g_LoadoutNormY)
}

SelectLoadout4() {
  global g_Loadout4NormX
  global g_LoadoutNormY
  SelectLoadout(g_Loadout4NormX, g_LoadoutNormY)
}

SelectLoadout5() {
  global g_Loadout5NormX
  global g_LoadoutNormY
  SelectLoadout(g_Loadout5NormX, g_LoadoutNormY)
}
