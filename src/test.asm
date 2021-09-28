  processor 6502
 
  include "macro.asm"
  include "vcs.asm"
 
  SEG
  ORG $F000

Reset:

StartOfFrame:

  ; Start of vertical blank processing
  lda #0
  sta VBLANK

  lda #2
  sta VSYNC

  ; 3 scanlines of VSYNCH signal
  sta WSYNC
  sta WSYNC
  sta WSYNC

  lda #0
  sta WSYNC

  ; 37 scanlines of vertical blanks
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC

  ; 192 scanlines of picture ..

  ldx #0
  ldy #0

  REPEAT 192  ; scanlines
    
    REPEAT 6
      nop
    REPEND

    inx
    stx COLUBK

    nop
    nop
    nop

    dey
    sty COLUBK

    sta WSYNC

  REPEND

  lda #%01000010
  sta VBLANK  ; end of screen

  ; 30 scanlines of overscan
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC

  ; I have no idea why I need to put in these extra 47 lines of 85 02 just to
  ; stabilize my screen on stella (NTSC). Future self please help

  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC



  jmp StartOfFrame

  ORG $FFFA

  .word Reset     ; NMI
  .word Reset     ; RESET
  .word Reset     ; IRQ

END
; sample code
; end sample code

