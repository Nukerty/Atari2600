  processor 6502
 
  include "macro.asm"
  include "vcs.asm"

;--------------------------------------------------
PATTERN         = $80   ; storage location (1st byte)
TIMETOCHANGE    = 20    ; speed of "animation" change as desired
;--------------------------------------------------
 
  seg
  org $f000

Reset:
  ; Clear RAM and all TIA
  ldx #0
  lda #0

Clear:
  sta 0,x
  inx
  bne Clear

;--------------------------------------------------
; Once only initialization

  lda #0
  sta PATTERN

  lda #$45
  sta COLUPF

  ldy #0
;--------------------------------------------------

StartOfFrame:

  ; Start of new frame
  ; Start of vertical BLANK

  lda #0
  sta VBLANK

  lda #2
  sta VSYNC

  sta WSYNC
  sta WSYNC
  sta WSYNC

  lda #0
  sta VSYNC

;--------------------------------------------------
; 37 scanlines of VB
  ldx #0
VerticalBlank:
  sta WSYNC
  inx
  cpx #37
  bne VerticalBlank

;--------------------------------------------------
; Handle changes in pattern once 20 frames
; and write the pattern into the PF1 register
  iny                 ; Increment speed
  cpy #TIMETOCHANGE   ; reached our "change point"
  bne notyet          ; exit gate

  ldy #0              ; reset speed count
  inc PATTERN         ; switch to next pattern
notyet:
  lda PATTERN         ; use our saved pattern
  sta PF1             ; as the playfield shapes

;--------------------------------------------------
; Do 192 scanlines of color-changing (our picture)
  ldx #0
Picture:
  stx COLUBK          ; Change background color (rainbow effect)
  sta WSYNC           ; wait till end of scanline
  cpx #192            ; wait till end of scanline
  bne Picture

;--------------------------------------------------

  lda #%01000010
  sta VBLANK          ; end of screen - enter blanking
; 30 scanlines of overscan
  ldx #0
Overscan:
  sta WSYNC
  inx
  cpx #30
  bne Overscan

  jmp StartOfFrame

  org $fffa
InterruptVectors:
  .word Reset     ; NMI
  .word Reset     ; RESET
  .word Reset     ; IRQ

END
; sample code
; end sample code

