processor 6502
 
  include "macro.asm"
  include "vcs.asm"
 
  seg
  org $f000

Reset:
StartOfFrame:
; Longer and inefficient way

;   lda #0
;   sta $80
;   sta $81
;   sta $82
;   sta $83
;   sta $84
;   sta $85
;   sta $86
;   sta $87
;   sta $88
;   sta $89
;   sta $8a
;   sta $8b
;   sta $8c
;   sta $8d
;   sta $8e
;   sta $8f
;   sta $90
;   sta $91
;   sta $92
;   sta $93
;   sta $94
;   sta $95
;   sta $96
;   sta $97
;   sta $98
;   sta $99
;   sta $9a
;   sta $9b
;   sta $9c
;   sta $9d
;   sta $9e
;   sta $9f
;   sta $a0
;   sta $a1
;   sta $a2
;   sta $a3
;   sta $a4
;   sta $a5
;   sta $a6
;   sta $a7
;   sta $a8
;   sta $a9
;   sta $aa
;   sta $ab
;   sta $ac
;   sta $ad
;   sta $ae
;   sta $af
;   sta $b0
;   sta $b1
;   sta $b2
;   sta $b3
;   sta $b4
;   sta $b5
;   sta $b6
;   sta $b7
;   sta $b8
;   sta $b9
;   sta $ba
;   sta $bb
;   sta $bc
;   sta $bd
;   sta $be
;   sta $bf
;   sta $c0
;   sta $c1
;   sta $c2
;   sta $c3
;   sta $c4
;   sta $c5
;   sta $c6
;   sta $c7
;   sta $c8
;   sta $c9
;   sta $ca
;   sta $cb
;   sta $cc
;   sta $cd
;   sta $ce
;   sta $cf
;   sta $d0
;   sta $d1
;   sta $d2
;   sta $d3
;   sta $d4
;   sta $d5
;   sta $d6
;   sta $d7
;   sta $d8
;   sta $d9
;   sta $da
;   sta $db
;   sta $dc
;   sta $dd
;   sta $de
;   sta $df
;   sta $e0
;   sta $e1
;   sta $e2
;   sta $e3
;   sta $e4
;   sta $e5
;   sta $e6
;   sta $e7
;   sta $e8
;   sta $e9
;   sta $ea
;   sta $eb
;   sta $ec
;   sta $ed
;   sta $ee
;   sta $ef
;   sta $f0
;   sta $f1
;   sta $f2
;   sta $f3
;   sta $f4
;   sta $f5
;   sta $f6
;   sta $f7
;   sta $f8
;   sta $f9
;   sta $fa
;   sta $fb
;   sta $fc
;   sta $fd
;   sta $fe
;   sta $ff

; Another more plausible way ( 11 bytes )
;   ldx #0
;   lda #0
;   
; ClearRam:
;   
;   sta $80,x
;   inx
;   cpx #$80
;   bne ClearRam

; Another way ( 9 bytes )

;   ldx #$80
;   lda #0
;   
; ClearRam:
;   
;   sta 0,x
;   inx
;   bne ClearRam

; Initilalizing TIA & RAM (15 bytes) ~ Somewhat inefficient
;   ldx #0
;   lda #0
; Clear:
;   sta $80,x
;   sta 0,x
;   inx
;   cpx #$80
;   bne Clear

; Another efficient way of TIA & RAM init (9 bytes)
;   ldx #0
;   lda #0
; Clear
;   sta 0,x
;   inx
;   bne Clear

; Best way
; Clears all variables and stack and TIA registers
; Does this by wrapping the stack

  ldx #0  ; (2 cycles)
  txa     ; Transfer x to accumulator (2 cycles)
Clear:
  dex     ; (2 cycles)
  txs     ; Transfer x to stack pointer (2 cycles)
  pha     ; Push accumulator to stack  (3 cycle)
  bne Clear ; (3 cycles)


; Ending statements
  org $fffa

  .word Reset     ; NMI
  .word Reset     ; RESET
  .word Reset     ; IRQ

END

