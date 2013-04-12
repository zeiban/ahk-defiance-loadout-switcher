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

g_Timeout := 2500

SelectLoadout(p_Loadout) {
  global g_Timeout 

  WinGetPos l_WinX, l_WinX, l_WinW, l_WinH

  l_HalfWinW :=  l_WinW * 0.5	
  l_HalfWinH :=  l_WinH * 0.5	

  Send {l down}
  Sleep 50
  Send {l up}

  ; Wait for Loadout screen to appear by checking the icon
  l_Start := A_TickCount
  loop {

    ; Search the top left quadrant
    ImageSearch l_FoundX, l_FoundY, 0,0, l_HalfWinW , l_HalfWinH, *50 loadout.png

    If (ErrorLevel = 2) {
      Return 
    } Else If (ErrorLevel = 1) {
      If ( g_TimeOut ) && ( A_TickCount - l_Start >= g_TimeOut) {
        Return
      }
    } Else {
      Break 
    }    
  }

  ; Move to the center just in case the cursor has the loadout button armed
  MouseMove l_WinW * 0.5, l_WinH * 0.5, 0

  ; Find loadout button in top right quadrant
  ImageSearch l_FoundX, l_FoundY, l_HalfWinW, 0, l_WinW, l_WinH, *50 loadout-%p_Loadout%.png
  If ErrorLevel {
    ; Should not be here. The loadout screne is not up or something in the UI changed
  } Else {
;    MouseMove, l_FoundX, l_FoundY, 0
    MouseClick Left, l_FoundX, l_FoundY, 1, 0, D

    ;Delay needed between mouse up/down for fast computers
    Sleep 25 

    MouseClick Left, l_FoundX, l_FoundY, 1, 0, U
  }
  Send {l down}
  Sleep 50
  Send {l up}  
}

