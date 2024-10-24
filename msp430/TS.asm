; Copyright (C) Noise Engineering 
; see LICENSE.md for details
;

;-------------------------------------------------------------------------------
    .cdecls C,LIST,"msp430.h"       ; Include device header file

    .sect ".const"

; panel layout
; D  RS  T
; P   L  R

; PINOUT ----------------------------------------------------------------
;pin 2 1.0 knob offset analog
AIN_KOFS_BIT        .equ    BIT0
AIN_KOFS_IN         .equ    P1IN
;pin 3 1.1 knob group analog
AIN_JOFS_BIT        .equ    BIT1
AIN_JOFS_IN         .equ    P1IN
;pin 4 1.2 modulus switch
TS_MOD_BIT          .equ    BIT2
TS_MOD_OUT          .equ    P1OUT
TS_MOD_IN           .equ    P1IN
TS_MOD_DIR          .equ    P1DIR
TS_MOD_REN          .equ    P1REN
;pin 5 1.3 tune switch
TK_TUNE_BIT         .equ    BIT3
TK_TUNE_OUT         .equ    P1OUT
TK_TUNE_IN          .equ    P1IN
TK_TUNE_REN         .equ    P1REN
TK_TUNE_DIR         .equ    P1DIR
TK_TUNE_IFG         .equ    P1IFG
TK_TUNE_IE          .equ    P1IE
TK_TUNE_IES         .equ    P1IES
;pin 6 1.4 jack T in
IN_JT_BIT           .equ    BIT4
IN_JT_IN            .equ    P1IN
IN_JT_IFG           .equ    P1IFG
IN_JT_IE            .equ    P1IE
IN_JT_IES           .equ    P1IES
;pin 7 1.5 jack R in
IN_JR_BIT           .equ BIT5
IN_JR_IN            .equ P1IN
IN_JR_IFG           .equ P1IFG
IN_JR_IE            .equ P1IE
IN_JR_IES           .equ P1IES
;pin 8 3.1 gate out
OUT_GATE_BIT        .equ BIT1
OUT_GATE_OUT        .equ P3OUT
OUT_GATE_DIR        .equ P3DIR
;pin 9 3.0 LED-G
OUT_LEDG_BIT        .equ BIT0
OUT_LEDG_OUT        .equ P3OUT
OUT_LEDG_DIR        .equ P3DIR
;pin 10 2.0 jack RS in
IN_JRS_BIT          .equ BIT0
IN_JRS_IN           .equ P2IN
IN_JRS_IFG          .equ P2IFG
IN_JRS_IE           .equ P2IE
IN_JRS_IES          .equ P2IES
;pin 11 2.1 jack P in
IN_JP_BIT           .equ BIT1
IN_JP_IN            .equ P2IN
IN_JP_IFG           .equ P2IFG
IN_JP_IE            .equ P2IE
IN_JP_IES           .equ P2IES
;pin 12 2.2 jack L in
IN_JL_BIT           .equ BIT2
IN_JL_IN            .equ P2IN
IN_JL_IFG           .equ P2IFG
IN_JL_IE            .equ P2IE
IN_JL_IES           .equ P2IES
;pin 13 3.2 LED-B
OUT_LEDB_BIT        .equ BIT2
OUT_LEDB_OUT        .equ P3OUT
OUT_LEDB_DIR        .equ P3DIR
;pin 14 3.3 LED-R
OUT_LEDR_BIT        .equ BIT3
OUT_LEDR_OUT        .equ P3OUT
OUT_LEDR_DIR        .equ P3DIR
;pin 15 3.4 LED-Y
OUT_LEDY_BIT        .equ BIT4
OUT_LEDY_OUT        .equ P3OUT
OUT_LEDY_DIR        .equ P3DIR
;pin 16 2.3 toggle D
IN_TD_BIT           .equ BIT3
IN_TD_IN            .equ P2IN
IN_TD_IFG           .equ P2IFG
IN_TD_IE            .equ P2IE
IN_TD_IES           .equ P2IES
IN_TD_REN           .equ P2REN
IN_TD_OUT           .equ P2OUT
;pin 17 2.4 toggle RS
IN_TRS_BIT          .equ BIT4
IN_TRS_IN           .equ P2IN
IN_TRS_IFG          .equ P2IFG
IN_TRS_IE           .equ P2IE
IN_TRS_IES          .equ P2IES
IN_TRS_REN          .equ P2REN
IN_TRS_OUT          .equ P2OUT
;pin 18 2.5 toggle P
IN_TP_BIT           .equ BIT5
IN_TP_IN            .equ P2IN
IN_TP_IFG           .equ P2IFG
IN_TP_IE            .equ P2IE
IN_TP_IES           .equ P2IES
IN_TP_REN           .equ P2REN
IN_TP_OUT           .equ P2OUT
;pin 19 3.5 DAC CS
OUT_DCS_BIT         .equ BIT5
OUT_DCS_OUT         .equ P3OUT
OUT_DCS_DIR         .equ P3DIR
;pin 20 3.6 DAC CLK
OUT_DCLK_BIT        .equ BIT6
OUT_DCLK_OUT        .equ P3OUT
OUT_DCLK_DIR        .equ P3DIR
;pin 21 3.7 DAC IN
OUT_DIN_BIT         .equ BIT7
OUT_DIN_OUT         .equ P3OUT
OUT_DIN_DIR         .equ P3DIR
;pin 22 1.6 toggle T
IN_TT_BIT           .equ BIT6
IN_TT_IN            .equ P1IN
IN_TT_IFG           .equ P1IFG
IN_TT_IE            .equ P1IE
IN_TT_IES           .equ P1IES
IN_TT_REN           .equ P1REN
IN_TT_OUT           .equ P1OUT
;pin 23 1.7 toggle L
IN_TL_BIT           .equ BIT7
IN_TL_IN            .equ P1IN
IN_TL_IFG           .equ P1IFG
IN_TL_IE            .equ P1IE
IN_TL_IES           .equ P1IES
IN_TL_REN           .equ P1REN
IN_TL_OUT           .equ P1OUT
;pin 23 SBW IO
;pin 25 SBW CK
;pin 26 2.7 jack D
IN_JD_BIT           .equ BIT7
IN_JD_IN            .equ P2IN
IN_JD_IFG           .equ P2IFG
IN_JD_IE            .equ P2IE
IN_JD_IES           .equ P2IES
;pin 27 2.6 toggle R
IN_TR_BIT           .equ BIT6
IN_TR_IN            .equ P2IN
IN_TR_IFG           .equ P2IFG
IN_TR_IE            .equ P2IE
IN_TR_IES           .equ P2IES
IN_TR_REN           .equ P2REN
IN_TR_OUT           .equ P2OUT
;pin 28 GND
; REGISTERS ----------------------------------------------------------------
R_KAVE          .equ R4
R_KSUB          .equ R5
R_KLAST         .equ R6
R_KTMP          .equ R7
R_SET           .equ R8
R_WAIT          .equ R9
R_UN            .equ R10
R_ARRAY         .equ R11
R_XFORM         .equ R11
R_TRIAD         .equ R12
R_DAC_COUNT     .equ R13
R_DAC_DATA      .equ R14
R_DAC_CMD       .equ R15
; CONSTANTS ----------------------------------------------------------------
TIMER_DELAY .equ    2437
NOTES   .word   0,83,167,250,333,416,500,583,667,750,833,916,1000 ; millivolts
TRIADA  .byte   0,1,2,3,4,5,6,7,8,9,10,11 ;  0 major
        .byte   0,1,2,3,4,5,6,7,8,9,10,11 ; 12 minor
        .byte   0,1,2,3,4,5,6,7,8,9,10,11 ; 36 diminished
        .byte   0,1,2,3,4,5,6,7,8,9,10,11 ; 48 minor
        .byte   0,1,2,3,4,5,6,7,8,9,10,11 ; 60 major
        .byte   0,1,2,3,4,5,6,7,8,9,10,11 ; 72 augmented
        .byte   0,1,2,3,4,5,6,7,8,9,10,11 ; 84 major
TRIADB  .byte   4,5,6,7,8,9,10,11,0,1,2,3 ;  0 major
        .byte   3,4,5,6,7,8,9,10,11,0,1,2 ; 12 minor
        .byte   3,4,5,6,7,8,9,10,11,0,1,2 ; 24 diminished
        .byte   3,4,5,6,7,8,9,10,11,0,1,2 ; 48 minor
        .byte   4,5,6,7,8,9,10,11,0,1,2,3 ; 60 major
        .byte   4,5,6,7,8,9,10,11,0,1,2,3 ; 72 augmented
        .byte   4,5,6,7,8,9,10,11,0,1,2,3 ; 84 major
TRIADC  .byte   7,8,9,10,11,0,1,2,3,4,5,6 ;  0 major
        .byte   7,8,9,10,11,0,1,2,3,4,5,6 ; 12 minor
        .byte   6,7,8,9,10,11,0,1,2,3,4,5 ; 36 diminished
        .byte   7,8,9,10,11,0,1,2,3,4,5,6 ; 48 minor
        .byte   7,8,9,10,11,0,1,2,3,4,5,6 ; 60 major
        .byte   8,9,10,11,0,1,2,3,4,5,6,7 ; 72 augmented
        .byte   7,8,9,10,11,0,1,2,3,4,5,6 ; 84 major

LED_A   .byte   OUT_LEDG_BIT
        .byte   OUT_LEDR_BIT
        .byte   OUT_LEDB_BIT
        .byte   OUT_LEDR_BIT
        .byte   OUT_LEDG_BIT
        .byte   OUT_LEDY_BIT

LED_B   .byte   OUT_LEDR_BIT
        .byte   OUT_LEDB_BIT
        .byte   OUT_LEDR_BIT
        .byte   OUT_LEDG_BIT
        .byte   OUT_LEDY_BIT
        .byte   OUT_LEDG_BIT

; VARIABLES -------------------------------------------------------------------------------
            .data
adcBase ;address for continual conversions
adcIn1a             .word   0
adcIn0a             .word   0
adcIn1b             .word   0
adcIn0b             .word   0
adcIn1c             .word   0
adcIn0c             .word   0
adcIn1d             .word   0
adcIn0d             .word   0

thisAdc0            .word   0
thisAdc1            .word   0

lastAdc0            .word   0 ; //offset knob
lastAdc1            .word   0 ; //offset jack

triad               .word   0
set                 .word   0
ofs                 .word   0
kofs                .word   0

tuning              .word   0

dacA                .word   0
dacB                .word   0
dacC                .word   0

send                .word   0
; CODE -------------------------------------------------------------------------------
            .text
            .retain
            .retainrefs
            .global RESET
RESET       mov.w   #__STACK_END,SP
KILLWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL
RAM         mov.w   #0, triad
            mov.w   #0, set
            mov.w   #0, ofs
            mov.w   #0, send
            mov.w   #0, tuning
            mov.w   #0x8805, lastAdc0
            mov.w   #0x8805, lastAdc1
OUTPORTS    mov.b   #0, P1IES
            mov.b   #0, P2IES
            mov.b   #0, P2SEL
            mov.b   #0, P1SEL
            mov.b   #0, P2IFG
            mov.b   #0, P1IFG
            bis.b   #OUT_DIN_BIT, OUT_DIN_DIR
            bis.b   #OUT_DCS_BIT, OUT_DCS_DIR
            bis.b   #OUT_DCLK_BIT, OUT_DCLK_DIR
            bis.b   #OUT_GATE_BIT, OUT_GATE_DIR
            bis.b   #OUT_LEDR_BIT, OUT_LEDR_DIR
            bis.b   #OUT_LEDG_BIT, OUT_LEDG_DIR
            bis.b   #OUT_LEDB_BIT, OUT_LEDB_DIR
            bis.b   #OUT_LEDY_BIT, OUT_LEDY_DIR
STARTDELAY  mov.w   #32, R6
STARTLOOP1  mov.w   #0x7FFF, R5
            mov.w   R6, P3OUT
STARTLOOP2  dec.w   R5
            jnz     STARTLOOP2
            dec.w   R6
            jnz     STARTLOOP1
            mov.w   #0, P3OUT
INPORTS     bis.b   #IN_TR_BIT,  IN_TR_REN
            bis.b   #IN_TR_BIT,  IN_TR_OUT
            bis.b   #IN_TR_BIT,  IN_TR_IES
            bis.b   #IN_TL_BIT,  IN_TL_REN
            bis.b   #IN_TL_BIT,  IN_TL_OUT
            bis.b   #IN_TL_BIT,  IN_TL_IES
            bis.b   #IN_TP_BIT,  IN_TP_REN
            bis.b   #IN_TP_BIT,  IN_TP_OUT
            bis.b   #IN_TP_BIT,  IN_TP_IES
            bis.b   #IN_TT_BIT,  IN_TT_REN
            bis.b   #IN_TT_BIT,  IN_TT_OUT
            bis.b   #IN_TT_BIT,  IN_TT_IES
            bis.b   #IN_TD_BIT,  IN_TD_REN
            bis.b   #IN_TD_BIT,  IN_TD_OUT
            bis.b   #IN_TD_BIT,  IN_TD_IES
            bis.b   #IN_TRS_BIT, IN_TRS_REN
            bis.b   #IN_TRS_BIT, IN_TRS_OUT
            bis.b   #IN_TRS_BIT, IN_TRS_IES
            bis.b   #TS_MOD_BIT, TS_MOD_REN
            bis.b   #TS_MOD_BIT, TS_MOD_OUT
            bis.b   #TK_TUNE_BIT, TK_TUNE_REN
            bis.b   #TK_TUNE_BIT, TK_TUNE_OUT
            bis.b   #TK_TUNE_BIT,  TK_TUNE_IES
CLOCK       mov.b   CALDCO_16MHZ, DCOCTL
            mov.b   CALBC1_16MHZ, BCSCTL1
            mov.b   #DIVS_2, BCSCTL2
ADC         mov.w   #INCH_1+CONSEQ_3,&ADC10CTL1 ; A1-A0, repeat multi channel
            mov.w   #ADC10SHT_3+MSC+ADC10ON+REFON+REF2_5V+SREF_1,&ADC10CTL0 ; stuff
ADCSEL      bis.b   #AIN_KOFS_BIT,&ADC10AE0     ; /64 clk, multiple conversions, power on,  high sample rate,
            bis.b   #AIN_JOFS_BIT,&ADC10AE0     ; use int ref,  ref  2.5V,  continuous transfer
            bis.b   #ADC10CT, &ADC10DTC0
ADCCOUNT    mov.b   #8,&ADC10DTC1
ADCBUSY     bit     #BUSY,&ADC10CTL1
            jnz     ADCBUSY
            mov.w   #adcBase,&ADC10SA
            bis.w   #ENC+ADC10SC,&ADC10CTL0
PIRQ_JP     bis.b   #IN_JP_BIT,&IN_JP_IE
            bic.b   #IN_JP_BIT,&IN_JP_IFG
PIRQ_JL     bis.b   #IN_JL_BIT,&IN_JL_IE
            bic.b   #IN_JL_BIT,&IN_JL_IFG
PIRQ_JR     bis.b   #IN_JR_BIT,&IN_JR_IE
            bic.b   #IN_JR_BIT,&IN_JR_IFG
PIRQ_JT     bis.b   #IN_JT_BIT,&IN_JT_IE
            bic.b   #IN_JT_BIT,&IN_JT_IFG
PIRQ_JD     bis.b   #IN_JD_BIT,&IN_JD_IE
            bic.b   #IN_JD_BIT,&IN_JD_IFG
PIRQ_JRS    bis.b   #IN_JRS_BIT,&IN_JRS_IE
            bic.b   #IN_JRS_BIT,&IN_JRS_IFG
PIRQ_TP     bis.b   #IN_TP_BIT,&IN_TP_IE
            bic.b   #IN_TP_BIT,&IN_TP_IFG
PIRQ_TL     bis.b   #IN_TL_BIT,&IN_TL_IE
            bic.b   #IN_TL_BIT,&IN_TL_IFG
PIRQ_TR     bis.b   #IN_TR_BIT,&IN_TR_IE
            bic.b   #IN_TR_BIT,&IN_TR_IFG
PIRQ_TT     bis.b   #IN_TT_BIT,&IN_TT_IE
            bic.b   #IN_TT_BIT,&IN_TT_IFG
PIRQ_TD     bis.b   #IN_TD_BIT,&IN_TD_IE
            bic.b   #IN_TD_BIT,&IN_TD_IFG
PIRQ_TRS    bis.b   #IN_TRS_BIT,&IN_TRS_IE
            bic.b   #IN_TRS_BIT,&IN_TRS_IFG
PIRQ_TUNE   bis.b   #TK_TUNE_BIT,&TK_TUNE_IE
            bic.b   #TK_TUNE_BIT,&TK_TUNE_IFG

DAC_REF     mov.b   #0x76,R_DAC_CMD
            mov.w   #0,R_DAC_DATA
            call    #DAC_OUT
TIMER       mov.w   #CCIE,&TACCTL0
            mov.w   #TIMER_DELAY,&CCR0
            mov.w   #TASSEL_2+MC_1+ID_3+TAIE,&TACTL
IRQENABLE   bis.w   #GIE, SR
            bis.b   #IN_TRS_BIT, IN_TRS_IFG
MAINLOOP    call    #KNOBS
            cmp.w   #0xF, kofs
            jz      TUNING
NOTTUNING   cmp.w   #0, tuning
            jz      MAINLOOP
            mov.w   #0, tuning
            jmp     FORCEIRQ
TUNING      cmp     #1, tuning ; already tuning
            jz      MAINLOOP
            mov.w   #1, tuning
FORCEIRQ    bis.b   #IN_TRS_BIT, IN_TRS_IFG
            jmp     MAINLOOP
;-------------------------------------------------------------------------------
; average + hysteresis knob adc values
KNOBS       ; offset
            mov.w   adcIn0a, R_KAVE
            add.w   adcIn0b, R_KAVE
            add.w   adcIn0c, R_KAVE
            add.w   adcIn0d, R_KAVE
            add.w   adcIn1a, R_KAVE
            add.w   adcIn1b, R_KAVE
            add.w   adcIn1c, R_KAVE
            add.w   adcIn1d, R_KAVE
            rra.w   R_KAVE  ; kill one bit
            mov.w   R_KAVE, thisAdc0
            mov.w   thisAdc0, R_KAVE
            mov.w   lastAdc0, R_KLAST
            call    #KNOB
            mov.w   R_KAVE, ofs
            mov.w   R_KLAST, lastAdc0
            ret
;IN:  R_KAVE is current average, R_KLAST is last used value
;OUT: R_KAVE current knob value, R_KLAST value to save as last used
;DESTROYED: R_KSUB
KNOB
            mov.w   R_KLAST, R_KSUB
            sub.w   R_KAVE, R_KSUB
            bit.w   #0x8000, R_KSUB ; abs? no
            jz      KNOBPOS
            inv.w   R_KSUB
            inc.w   R_KSUB
KNOBPOS
            cmp.w   #0x40,  R_KSUB
            jge     KNOBNEWVAL
KNOBOLDVAL  mov.w   R_KLAST, R_KAVE
            jmp     KNOBROUND
KNOBNEWVAL  mov.w   R_KAVE, R_KLAST
KNOBROUND   add.w   #64, R_KAVE ; move value into center
            cmp.w   #0x1000, R_KAVE
            jl      SHIFTKNOB
            mov.w   #0xFFF, R_KAVE
SHIFTKNOB   rra.w   R_KAVE ;11
            rra.w   R_KAVE ;10
            rra.w   R_KAVE ; 9
            rra.w   R_KAVE ; 8
            rra.w   R_KAVE ; 7
            rra.w   R_KAVE ; 6
            rra.w   R_KAVE ; 5
            rra.w   R_KAVE ; 5
            ret
;-------------------------------------------------------------------------------
; R_DAC_CMD 8 bit cmd field, R_DAC_DATA 16 bit data field, destroys R_DAC_COUNT
DAC_OUT     bis.b   #OUT_DCS_BIT, OUT_DCS_OUT
            bic.b   #OUT_DCLK_BIT, OUT_DCLK_OUT
            bic.b   #OUT_DCS_BIT, OUT_DCS_OUT
DAC_CMD     mov.w   #8, R_DAC_COUNT
CMD_SHIFT   bic.b   #OUT_DCLK_BIT, OUT_DCLK_OUT
            rlc.b   R_DAC_CMD
            jc      CMD_SET
            bic.b   #OUT_DIN_BIT, OUT_DIN_OUT
            jmp     CMD_LOOP
CMD_SET     bis.b   #OUT_DIN_BIT, OUT_DIN_OUT
CMD_LOOP    bis.b   #OUT_DCLK_BIT, OUT_DCLK_OUT
            dec.w   R_DAC_COUNT
            jnz     CMD_SHIFT
DAC_DATA    mov.w   #16, R_DAC_COUNT
DATA_SHIFT  bic.b   #OUT_DCLK_BIT, OUT_DCLK_OUT
            rlc.w   R_DAC_DATA
            jc      DATA_SET
            bic.b   #OUT_DIN_BIT, OUT_DIN_OUT
            jmp     DATA_LOOP
DATA_SET    bis.b   #OUT_DIN_BIT, OUT_DIN_OUT
DATA_LOOP   bis.b   #OUT_DCLK_BIT, OUT_DCLK_OUT
            dec.w   R_DAC_COUNT
            jnz     DATA_SHIFT
            bic.b   #OUT_DCLK_BIT, OUT_DCLK_OUT
            bis.b   #OUT_DCS_BIT, OUT_DCS_OUT
            ret
OUTPUT      ; send current DAC state to DAC
            mov.w   #0, R_TRIAD
GET_A       mov.w   #TRIADA, R_ARRAY
            call    #GET_OUT
            mov.w   R_ARRAY, dacA
DAC_A       mov.b   #0x00,R_DAC_CMD
            mov.w   dacA,R_DAC_DATA
            call    #DAC_OUT
GET_B       mov.w   #TRIADB, R_ARRAY
            call    #GET_OUT
            mov.w   R_ARRAY, dacB
DAC_B       mov.b   #0x01,R_DAC_CMD
            mov.w   dacB,R_DAC_DATA
            call    #DAC_OUT
GET_C       mov.w   #TRIADC, R_ARRAY
            call    #GET_OUT
            mov.w   R_ARRAY, dacC
DAC_C       mov.b   #0x02,R_DAC_CMD
            mov.w   dacC,R_DAC_DATA
            call    #DAC_OUT
DAC_LOAD    mov.b   #0x18,R_DAC_CMD
            mov.w   #0x0,R_DAC_DATA
            call    #DAC_OUT
DAC_DONE
            mov.w   triad, R_ARRAY
            cmp.w   #12, R_ARRAY
            jl      LED_MAJ
            mov.w   #6, R_ARRAY
            jmp     LED_OFS
LED_MAJ     mov.w   #0, R_ARRAY
LED_OFS     add.w   set, R_ARRAY
            add.w   #LED_A, R_ARRAY
            mov.b   @R_ARRAY, R_ARRAY
            bic.b   #OUT_LEDR_BIT, OUT_LEDR_OUT
            bic.b   #OUT_LEDG_BIT, OUT_LEDG_OUT
            bic.b   #OUT_LEDB_BIT, OUT_LEDB_OUT
            bic.b   #OUT_LEDY_BIT, OUT_LEDY_OUT
            bis.b   R_ARRAY, P3OUT
            ret
;-------------------------------------------------------------------------------
; input R_ARRAY note array, R_TRIAD previous note's value, output R_ARRAY DAC note value
GET_OUT     bit.b   #TK_TUNE_BIT, TK_TUNE_IN
            jnz     GET_VALUE
            mov.w   #0x7D00, R_ARRAY
            ret
GET_VALUE   mov.w   set, R_SET
TEST_SET    cmp.w   #0, R_SET
            jz      DONE_SET
            add.w   #12, R_ARRAY
            dec.w   R_SET
            jmp     TEST_SET
DONE_SET    add.w   triad, R_ARRAY
            mov.b   @R_ARRAY, R_ARRAY
            and.w   #0x00FF, R_ARRAY
            add.w   R_ARRAY,R_ARRAY
            add.w   #NOTES, R_ARRAY
            mov.w   @R_ARRAY, R_ARRAY
            bit.b   #TS_MOD_BIT, TS_MOD_IN
            jz      MODULAR_OFF
            cmp.w   R_ARRAY, R_TRIAD
            jl      DONE_MOD
MODULAR_OFF add.w   #1000, R_ARRAY
DONE_MOD    mov.w   R_ARRAY, R_TRIAD
            rla.w   R_ARRAY     ; notes are in mv, dac is in 1/2 mv
            rla.w   R_ARRAY     ; dac has 4 bits of zeros
            rla.w   R_ARRAY
            rla.w   R_ARRAY
            rla.w   R_ARRAY
            ret
;-------------------------------------------------------------------------------
NORM_TRIAD  cmp.w   #12, R_TRIAD
            jl      NORMT_DONE
            sub.w   #12,R_TRIAD
            jmp     NORM_TRIAD
NORMT_DONE  ret

NORM_SET    cmp.w   #6, set
            jl      NORMS_DONE
            sub.w   #6,set
            jmp     NORM_SET
NORMS_DONE  ret

TRANSFORM_N ; R_OFS transform offset, R_TRIAD current triad
            cmp.w   #12, R_TRIAD
            jl      TRIAD_MAJ
TRIAD_MIN   add.w   #24, R_TRIAD
            sub.w   R_XFORM, R_TRIAD
            sub.w   ofs, R_TRIAD
            call    #NORM_TRIAD
            ret
TRIAD_MAJ   add.w   R_XFORM, R_TRIAD
            add.w   ofs, R_TRIAD
            call    #NORM_TRIAD
            add.w   #12, R_TRIAD
            ret
;-------------------------------------------------------------------------------
TRANSORM_P  mov.w   triad, R_TRIAD
            mov.w   #0, R_XFORM
            call    #TRANSFORM_N
            mov.w   R_TRIAD, triad
            ret
;-------------------------------------------------------------------------------
TRANSORM_L  mov.w   triad, R_TRIAD
            mov.w   #4, R_XFORM
            call    #TRANSFORM_N
            mov.w   R_TRIAD, triad
            ret
;-------------------------------------------------------------------------------
TRANSORM_R  cmp.w   #4, set
            jl      NORMAL_R
AUG_R       mov.w   triad, R_TRIAD
            mov.w   #8, R_XFORM
            call    #TRANSFORM_N
            mov.w   R_TRIAD, triad
            ret
NORMAL_R    mov.w   triad, R_TRIAD
            mov.w   #9, R_XFORM
            call    #TRANSFORM_N
            mov.w   R_TRIAD, triad
            ret
;-------------------------------------------------------------------------------
TRANSORM_T  mov.w   triad, R_TRIAD
            cmp.w   #12, R_TRIAD
            jl      T_MAJ
T_MIN       dec.w   R_TRIAD
            call    #NORM_TRIAD
            add.w   #12, R_TRIAD
            mov.w   R_TRIAD, triad
            ret
T_MAJ       inc.w   R_TRIAD
            call    #NORM_TRIAD
            mov.w   R_TRIAD, triad
            ret

;-------------------------------------------------------------------------------
TRANSORM_D  add.w   #1, set
            call    #NORM_SET
            ret
;-------------------------------------------------------------------------------
TRANSORM_RS mov.w   #0, triad
            mov.w   #0, set
            ret
;-------------------------------------------------------------------------------
EMPTY_ISR   reti
;-------------------------------------------------------------------------------
TA0_ISR     cmp.b   #10,TAIV                ;we only care about TAIFG
            jnz     EMPTY_ISR
            bic.b   #OUT_GATE_BIT, OUT_GATE_OUT
            mov.w   #TIMER_DELAY, &CCR0
            reti
;-------------------------------------------------------------------------------
P1_ISR
P2_ISR      mov.w   #TIMER_DELAY, &CCR0
            mov.w   #0,TA0R
            mov.w   #500, R_WAIT
P2DELAY     dec.w   R_WAIT
            jnz     P2DELAY
P_JP        bit.b   #IN_JP_BIT, IN_JP_IFG
            jz      P_JL
            call    #TRANSORM_P
            bic.b   #IN_JP_BIT, IN_JP_IFG
P_JL        bit.b   #IN_JL_BIT, IN_JL_IFG
            jz      P_JR
            call    #TRANSORM_L
            bic.b   #IN_JL_BIT, IN_JL_IFG
P_JR        bit.b   #IN_JR_BIT, IN_JR_IFG
            jz      P_JT
            call    #TRANSORM_R
            bic.b   #IN_JR_BIT, IN_JR_IFG
P_JT        bit.b   #IN_JT_BIT, IN_JT_IFG
            jz      P_JD
            call    #TRANSORM_T
            bic.b   #IN_JT_BIT, IN_JT_IFG
P_JD        bit.b   #IN_JD_BIT, IN_JD_IFG
            jz      P_TP
            call    #TRANSORM_D
            bic.b   #IN_JD_BIT, IN_JD_IFG
P_TP        bit.b   #IN_TP_BIT, IN_TP_IFG
            jz      P_TL
            call    #TRANSORM_P
            bic.b   #IN_TP_BIT, IN_TP_IFG
P_TL        bit.b   #IN_TL_BIT, IN_TL_IFG
            jz      P_TR
            call    #TRANSORM_L
            bic.b   #IN_TL_BIT, IN_TL_IFG
P_TR        bit.b   #IN_TR_BIT, IN_TR_IFG
            jz      P_TT
            call    #TRANSORM_R
            bic.b   #IN_TR_BIT, IN_TR_IFG
P_TT        bit.b   #IN_TT_BIT, IN_TT_IFG
            jz      P_TD
            call    #TRANSORM_T
            bic.b   #IN_TT_BIT, IN_TT_IFG
P_TD        bit.b   #IN_TD_BIT, IN_TD_IFG
            jz      P_TRS
            call    #TRANSORM_D
            bic.b   #IN_TD_BIT, IN_TD_IFG
P_TRS       bit.b   #IN_TRS_BIT, IN_TRS_IFG
            jz      P_JRS
            call    #TRANSORM_RS
            bic.b   #IN_TRS_BIT, IN_TRS_IFG
P_JRS       bit.b   #IN_JRS_BIT, IN_JRS_IFG
            jz      P_TUNE
            call    #TRANSORM_RS
            bic.b   #IN_JRS_BIT, IN_JRS_IFG
P_TUNE      bit.b   #TK_TUNE_BIT, TK_TUNE_IFG
            jz      P_DONE
            bic.b   #TK_TUNE_BIT, TK_TUNE_IFG
P_DONE      call    #OUTPUT
            bis.b   #OUT_GATE_BIT, OUT_GATE_OUT
            reti
;-------------------------------------------------------------------------------
;           Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
;-------------------------------------------------------------------------------
;           Interrupt Vectors
;-------------------------------------------------------------------------------
    .sect   ".reset"                ; MSP430 RESET Vector
    .short  RESET

    .sect   ".int01" ;
    .short  EMPTY_ISR

    .sect   ".int02" ; port1
    .short  P1_ISR

    .sect   ".int03" ; port2
    .short  P2_ISR

    .sect   ".int04" ; usi
    .short EMPTY_ISR

    .sect   ".int05" ; adc10
    .short EMPTY_ISR

    .sect   ".int06" ;
    .short EMPTY_ISR

    .sect   ".int07" ;
    .short EMPTY_ISR

    .sect   ".int08" ; timera1
    .short  TA0_ISR

    .sect   ".int09" ; timera0
    .short  EMPTY_ISR

    .sect   ".int10" ; wdt
    .short EMPTY_ISR

    .sect   ".int11" ; wdt
    .short EMPTY_ISR

    .sect   ".int12" ; wdt
    .short EMPTY_ISR

    .sect   ".int13" ; wdt
    .short EMPTY_ISR


    .sect   ".int14" ; nmi
    .short EMPTY_ISR

    .end

