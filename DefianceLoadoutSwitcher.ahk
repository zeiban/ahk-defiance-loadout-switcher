;loadout 1 1308 155
;loadout 2 1345 155
;loadout 3 1380 155
;loadout 4 1415 155
;loadout 5 1448 155

#Include WaitPixelColor.ahk

SelectLoadout(x,y) {
  color := 0x949418
  loop {
    Send {l down}
    Sleep 50
    Send {l up}
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
      MsgBox Error
      Return
    } Else If ( var = 2 ) {
      MsgBox Timeout
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
