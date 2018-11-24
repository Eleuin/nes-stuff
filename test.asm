.include "nesdefs.inc"

; iNES Header
; should maybe change to NES2.0 header
.segment "INESHDR"
    .byt "NES", $1A
    .byt 1
    .byt 1

.segment "VECTORS"
    .addr reset, irq_isr

.segment "CODE"
    ; handle IRQ/BRK here
    .proc irq_isr
        rti
    .endproc

    .proc reset
        sei
        cld
        ldx #$40
        stx APU_FRAME
        ldx #$ff

        txs
        inx
        stx PPU_CTRL
        stx PPU_MASK
        stx APU_DMC_CTRL
    .endproc
