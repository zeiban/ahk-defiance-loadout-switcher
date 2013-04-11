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


; 1920×1080 loadout button locations for reference
;
; loadout 1 1308 155
; loadout 2 1345 155
; loadout 3 1380 155
; loadout 4 1415 155
; loadout 5 1448 155

; Thanks Antonio França aka "MasterFocus"
#Include WaitPixelColor.ahk

SelectLoadout(x,y) {
  color := 0x949418
  loop {
    Send {l down}
    Sleep 50
    Send {l up}
    ; Wait for "Loadout" screen
    var := WaitPixelColor(color, 632, 41, 2000)
    If ( var = 0 ) {
      MouseMove x, y
      Sleep 50
      MouseClick Left, x, y, 1, 0, D
      Sleep 50
      MouseClick Left, x, y, 1, 0, U
      Send {l down}
      Sleep 50
      Send {l up}
      Return
    } Else If ( var = 1 ) {
      ;MsgBox Error
      Return
    } Else If ( var = 2 ) {
      ;MsgBox Timeout
      Return
    }
  }
}

SelectLoadout1() {
  SelectLoadout(1308,155)
}

SelectLoadout2() {
  SelectLoadout(1345,155)
}

SelectLoadout3() {
  SelectLoadout(1380,155)
}

SelectLoadout4() {
  SelectLoadout(1415,155)
}

SelectLoadout5() {
  SelectLoadout(1448,155)
}
