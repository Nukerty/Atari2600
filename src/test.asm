  processor 6502
 
  include "vcs.asm"
  include "macro.asm"

; ----------------------------------------
 PATTERN      =  $80 ;
 TIMETOCHANGE =   20 ;
; ----------------------------------------
  SEG
  ORG $F000

Reset:

  ; Clear RAM and all TIA registers
  ldx #0
  lda #0

Clear:
  sta 0,x
  inx
  bne Clear

; ----------------------------------------
; Once only init

  lda #0
  sta PATTERN
  lda #45
  sta COLUPF
  ldy #0
; ----------------------------------------

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
  sta VSYNC

; ----------------------------------------
  ; 37 scanlines of vertical blanks
  ldx #0
VerticalBlank:
  sta WSYNC
  inx
  cpx #37
  bne VerticalBlank


  iny
  cpy #TIMETOCHANGE
  bne notyet

  ldy #0

  inc PATTERN

notyet:
  lda PATTERN
  sta PF1

; ----------------------------------------
  ; 192 scanlines of picture ..
  ldx #0
Picture:
  stx COLUBK
  sta WSYNC
  inx
  cpx #192
  bne Picture

; ----------------------------------------

  lda #%01000010
  sta VBLANK  ; end of screen

  ; 30 scanlines of overscan
  lda #0
Overscan:
  sta WSYNC
  inx
  cpx #30
  bne Overscan


  jmp StartOfFrame

  ORG $FFFA

  .word Reset     ; NMI
  .word Reset     ; RESET
  .word Reset     ; IRQ

END
; sample code
; end sample code

