; Copyright (C) Noise Engineering 
; see LICENSE.md for details
;

    .cdecls C,LIST,"msp430.h"       ; Include device header file

    .sect ".const"


; PINOUT ----------------------------------------------------------------
; * pin  1 VCC
; - pin  2 1.0 JLFO
JI_LFO_BIT          .equ    BIT0
; - pin  3 1.1 CNT1
JI_CNT1_BIT         .equ    BIT1
; - pin  4 1.2 CNT2
JI_CNT2_BIT         .equ    BIT2
; - pin  5 1.3 JPAT
JI_PAT_BIT          .equ    BIT3
; - pin  6 1.4 KLFO
KI_LFO_BIT          .equ    BIT4
; - pin  7 1.5 JCH1
JI_CHK1_BIT         .equ    BIT5
JI_CHK1_OUT         .equ    P1OUT
JI_CHK1_IN          .equ    P1IN
JI_CHK1_DIR         .equ    P1DIR
JI_CHK1_IE          .equ    P1IE
JI_CHK1_IES         .equ    P1IES
JI_CHK1_IFG         .equ    P1IFG
; - pin  8 3.1 X
; - pin  9 3.0 X
; - pin 10 2.0 JCLK
JI_CLK_BIT          .equ    BIT0
JI_CLK_OUT          .equ    P2OUT
JI_CLK_IN           .equ    P2IN
JI_CLK_DIR          .equ    P2DIR
JI_CLK_IE           .equ    P2IE
JI_CLK_IES          .equ    P2IES
JI_CLK_IFG          .equ    P2IFG
; - pin 11 2.1 MCH2
TK_CHK2_BIT         .equ    BIT1
TK_CHK2_OUT         .equ    P2OUT
TK_CHK2_IN          .equ    P2IN
TK_CHK2_DIR         .equ    P2DIR
TK_CHK2_REN         .equ    P2REN
TK_CHK2_IE          .equ    P2IE
TK_CHK2_IES         .equ    P2IES
TK_CHK2_IFG         .equ    P2IFG
; - pin 12 2.2 MCH1
TK_CHK1_BIT         .equ    BIT2
TK_CHK1_OUT         .equ    P2OUT
TK_CHK1_IN          .equ    P2IN
TK_CHK1_DIR         .equ    P2DIR
TK_CHK1_REN         .equ    P2REN
TK_CHK1_IE          .equ    P2IE
TK_CHK1_IES         .equ    P2IES
TK_CHK1_IFG         .equ    P2IFG
; - pin 13 3.2 SRNG1
TG_RNG1_BIT         .equ    BIT2
TG_RNG1_OUT         .equ    P3OUT
TG_RNG1_IN          .equ    P3IN
TG_RNG1_DIR         .equ    P3DIR
TG_RNG1_REN         .equ    P3REN
; - pin 14 3.3 SRNG2
TG_RNG2_BIT         .equ    BIT3
TG_RNG2_OUT         .equ    P3OUT
TG_RNG2_IN          .equ    P3IN
TG_RNG2_DIR         .equ    P3DIR
TG_RNG2_REN         .equ    P3REN
; - pin 15 3.4 SLFO
TG_LFO_BIT          .equ    BIT4
TG_LFO_OUT          .equ    P3OUT
TG_LFO_IN           .equ    P3IN
TG_LFO_DIR          .equ    P3DIR
TG_LFO_REN          .equ    P3REN
; - pin 16 2.3 MHT1
TK_HIT1_BIT         .equ    BIT3
TK_HIT1_OUT         .equ    P2OUT
TK_HIT1_IN          .equ    P2IN
TK_HIT1_DIR         .equ    P2DIR
TK_HIT1_REN         .equ    P2REN
TK_HIT1_IE          .equ    P2IE
TK_HIT1_IES         .equ    P2IES
TK_HIT1_IFG         .equ    P2IFG
; - pin 17 2.4 MHT2
TK_HIT2_BIT         .equ    BIT4
TK_HIT2_OUT         .equ    P2OUT
TK_HIT2_IN          .equ    P2IN
TK_HIT2_DIR         .equ    P2DIR
TK_HIT2_REN         .equ    P2REN
TK_HIT2_IE          .equ    P2IE
TK_HIT2_IES         .equ    P2IES
TK_HIT2_IFG         .equ    P2IFG
; - pin 18 2.5 JCH2
JI_CHK2_BIT         .equ    BIT5
JI_CHK2_OUT         .equ    P2OUT
JI_CHK2_IN          .equ    P2IN
JI_CHK2_DIR         .equ    P2DIR
JI_CHK2_IE          .equ    P2IE
JI_CHK2_IES         .equ    P2IES
JI_CHK2_IFG         .equ    P2IFG
; - pin 19 3.5 JEN2
JO_JEN2_BIT         .equ    BIT5
JO_JEN2_OUT         .equ    P3OUT
JO_JEN2_DIR         .equ    P3DIR
; - pin 20 3.6 JEN1
JO_JEN1_BIT         .equ    BIT6
JO_JEN1_OUT         .equ    P3OUT
JO_JEN1_DIR         .equ    P3DIR
; - pin 21 3.7 JCLK
JO_CLK_BIT          .equ    BIT7
JO_CLK_OUT          .equ    P3OUT
JO_CLK_DIR          .equ    P3DIR
; - pin 22 1.6 JOUT1
JO_OUT1_BIT         .equ    BIT6
JO_OUT1_OUT         .equ    P1OUT
JO_OUT1_DIR         .equ    P1DIR
; - pin 23 1.7 JOUT2
JO_OUT2_BIT         .equ    BIT7
JO_OUT2_OUT         .equ    P1OUT
JO_OUT2_DIR         .equ    P1DIR
; - pin 24 RST X
; - pin 25 TST X
; - pin 26 2.7 JIN1
JI_HIT1_BIT         .equ    BIT7
JI_HIT1_OUT         .equ    P2OUT
JI_HIT1_IN          .equ    P2IN
JI_HIT1_DIR         .equ    P2DIR
JI_HIT1_IE          .equ    P2IE
JI_HIT1_IES         .equ    P2IES
JI_HIT1_IFG         .equ    P2IFG
; - pin 27 2.6 JIN2
JI_HIT2_BIT         .equ    BIT6
JI_HIT2_OUT         .equ    P2OUT
JI_HIT2_IN          .equ    P2IN
JI_HIT2_DIR         .equ    P2DIR
JI_HIT2_IE          .equ    P2IE
JI_HIT2_IES         .equ    P2IES
JI_HIT2_IFG         .equ    P2IFG
; - pin 27 GND


; registers ----------------------------------------------------------------
R_PATTERN1  .equ R4
R_ISR_COUNT .equ R4
R_T1_COUNT  .equ R5
R_T2_COUNT  .equ R6
R_PATTERN2  .equ R7
R_8         .equ R8
R_KLAST     .equ R9
R_KSUB      .equ R10
R_KAVE      .equ R11
R_LOOP      .equ R12
R_PITCH_NOTE .equ R13
R_PITCH_8VA .equ R14
R_15        .equ R15

; constants ----------------------------------------------------------------

BURST_DONE  .equ 0x1FFF

    .word   65535   ;0
    .word   65535   ;1
PATTERNS
    .word 65535 ;0
    .word 65535 ;1
    .word 48371 ;2
    .word 61819 ;3
    .word 28447 ;4
    .word 32713 ;5
    .word 38891 ;6
    .word 38891 ;7
    .word 23801 ;8
    .word 38317 ;9
    .word 22133 ;10
    .word 57467 ;11
    .word 31771 ;12
    .word 31771 ;13
    .word 25013 ;14
    .word 19853 ;15
    .word 39619 ;16
    .word 25693 ;17
    .word 23603 ;18
    .word 19031 ;19
    .word 37561 ;20
    .word 53309 ;21
    .word 25253 ;22
    .word 18731 ;23
    .word 21617 ;24
    .word 19777 ;25
    .word 20749 ;26
    .word 49223 ;27
    .word 16651 ;28
    .word 49171 ;29
    .word 32993 ;30
    .word 10513 ;31
    .word 15361 ;32

TUNE
    .word   62500,      62331,      62162,      61994,      61826,      61659,      61492,      61326
    .word   61160,      60995,      60830,      60665,      60501,      60338,      60175,      60012
    .word   59850,      59688,      59526,      59366,      59205,      59045,      58885,      58726
    .word   58567,      58409,      58251,      58093,      57936,      57780,      57623,      57468
    .word   57312,      57157,      57003,      56849,      56695,      56542,      56389,      56236
    .word   56084,      55933,      55781,      55630,      55480,      55330,      55180,      55031
    .word   54882,      54734,      54586,      54438,      54291,      54144,      53998,      53852
    .word   53706,      53561,      53416,      53272,      53128,      52984,      52841,      52698
    .word   52556,      52413,      52272,      52130,      51989,      51849,      51709,      51569
    .word   51429,      51290,      51152,      51013,      50875,      50738,      50601,      50464
    .word   50327,      50191,      50056,      49920,      49785,      49651,      49516,      49382
    .word   49249,      49116,      48983,      48850,      48718,      48587,      48455,      48324
    .word   48194,      48063,      47933,      47804,      47674,      47546,      47417,      47289
    .word   47161,      47033,      46906,      46779,      46653,      46527,      46401,      46275
    .word   46150,      46026,      45901,      45777,      45653,      45530,      45407,      45284
    .word   45161,      45039,      44917,      44796,      44675,      44554,      44434,      44313
    .word   44194,      44074,      43955,      43836,      43718,      43599,      43482,      43364
    .word   43247,      43130,      43013,      42897,      42781,      42665,      42550,      42435
    .word   42320,      42206,      42091,      41978,      41864,      41751,      41638,      41525
    .word   41413,      41301,      41189,      41078,      40967,      40856,      40746,      40636
    .word   40526,      40416,      40307,      40198,      40089,      39981,      39873,      39765
    .word   39657,      39550,      39443,      39337,      39230,      39124,      39018,      38913
    .word   38808,      38703,      38598,      38494,      38390,      38286,      38182,      38079
    .word   37976,      37873,      37771,      37669,      37567,      37465,      37364,      37263
    .word   37162,      37062,      36962,      36862,      36762,      36663,      36563,      36465
    .word   36366,      36268,      36170,      36072,      35974,      35877,      35780,      35683
    .word   35587,      35490,      35394,      35299,      35203,      35108,      35013,      34919
    .word   34824,      34730,      34636,      34542,      34449,      34356,      34263,      34170
    .word   34078,      33986,      33894,      33802,      33711,      33620,      33529,      33438
    .word   33348,      33257,      33168,      33078,      32988,      32899,      32810,      32722
    .word   32633,      32545,      32457,      32369,      32282,      32194,      32107,      32020
    .word   31934,      31847,      31761,      31675,      31590,      31504,      31419,      31334


; RAM -------------------------------------------------------------------------------
            .data
adcBase     ;address for continual conversions
adcIn4a             .word   0
adcIn3a             .word   0
adcIn2a             .word   0
adcIn1a             .word   0
adcIn0a             .word   0
adcIn4b             .word   0
adcIn3b             .word   0
adcIn2b             .word   0
adcIn1b             .word   0
adcIn0b             .word   0
adcIn4c             .word   0
adcIn3c             .word   0
adcIn2c             .word   0
adcIn1c             .word   0
adcIn0c             .word   0
adcIn4d             .word   0
adcIn3d             .word   0
adcIn2d             .word   0
adcIn1d             .word   0
adcIn0d             .word   0
adcAve4             .word   0
adcAve3             .word   0
adcAve2             .word   0
adcAve1             .word   0
adcAve0             .word   0
adcLast4            .word   0
adcLast3            .word   0
adcLast2            .word   0
adcLast1            .word   0
adcLast0            .word   0
adcKnob4            .word   0
adcKnob3            .word   0
adcKnob2            .word   0
adcKnob1            .word   0
adcKnob0            .word   0
timerDelay          .word   0
currentPattern      .word   0
end1                .word   0
end2                .word   0
div1                .word   0
div2                .word   0
currentDiv          .word   0
t1Base              .word   0
t2Base              .word   0
pitchAve            .word   0
longPattern         .word   0
lfoDiv              .word   0
LFO_DIV             .word   2
;-------------------------------------------------------------------------------
            .text
            .retain
            .retainrefs
            .global RESET
RESET       mov.w   #__STACK_END,SP
KILLWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL
OUTPORTS    mov.b   #0, P2SEL
            mov.b   #0, P1SEL
            mov.b   #0, P2IFG
            mov.b   #0, P1IFG
            mov.b   #0, P1OUT
            mov.b   #0, P2OUT
            mov.b   #0, P3OUT
            mov.w   #0, P1DIR
            mov.w   #0, P2DIR
            mov.w   #0, P3DIR
            mov.w   #0, P1IFG
            mov.w   #0, P2IFG
            mov.w   #0, P1IE
            mov.w   #0, P2IE
            mov.w   #0, P1IES
            mov.w   #0, P2IES
            mov.w   #2, LFO_DIV
            bis.w   #JO_JEN1_BIT, JO_JEN1_DIR
            bis.w   #JO_JEN2_BIT, JO_JEN2_DIR
            bis.w   #JO_OUT1_BIT, JO_OUT1_DIR
            bis.w   #JO_OUT2_BIT, JO_OUT2_DIR
            bis.w   #JO_CLK_BIT,  JO_CLK_DIR
            bis.w   #JI_HIT1_BIT,  JI_HIT1_DIR
            bis.w   #JI_HIT2_BIT,  JI_HIT2_DIR
STARTDELAY  mov.w   #0xFF, R6
STARTLOOP1  mov.w   #0xFFF, R5
STARTLOOP2  dec.w   R5
            jnz     STARTLOOP2
            mov.b   R6, P1OUT
            mov.b   R6, P2OUT
            mov.b   R6, P3OUT
            xor.w   #JO_OUT1_BIT, JO_OUT1_OUT
            dec.w   R6
            jnz     STARTLOOP1
            mov.b   #0, P1OUT
            mov.b   #0, P2OUT
            mov.b   #0, P3OUT
CLOCK       mov.b   CALDCO_16MHZ, DCOCTL
            mov.b   CALBC1_16MHZ, BCSCTL1
RAM         mov.w   #0xF000, timerDelay
            mov.w   #0, currentPattern
            mov.w   #BURST_DONE, R_T1_COUNT
            mov.w   #BURST_DONE, R_T2_COUNT
            mov.w   LFO_DIV, lfoDiv
INPORTS
JI_IN1      bic.w   #JI_HIT1_BIT,JI_HIT1_DIR
            bis.b   #JI_HIT1_BIT,JI_HIT1_IE
            bic.b   #JI_HIT1_BIT,JI_HIT1_IES
            bic.b   #JI_HIT1_BIT,JI_HIT1_IFG
JI_IN2      bic.w   #JI_HIT2_BIT,JI_HIT2_DIR
            bis.b   #JI_HIT2_BIT,JI_HIT2_IE
            bic.b   #JI_HIT2_BIT,JI_HIT2_IES
            bic.b   #JI_HIT2_BIT,JI_HIT2_IFG
JI_CH1      bic.w   #JI_CHK1_BIT,JI_CHK1_DIR
            bis.b   #JI_CHK1_BIT,JI_CHK1_IE
            bic.b   #JI_CHK1_BIT,JI_CHK1_IES
            bic.b   #JI_CHK1_BIT,JI_CHK1_IFG
JI_CH2      bic.w   #JI_CHK2_BIT,JI_CHK2_DIR
            bis.b   #JI_CHK2_BIT,JI_CHK2_IE
            bic.b   #JI_CHK2_BIT,JI_CHK2_IES
            bic.b   #JI_CHK2_BIT,JI_CHK2_IFG
JI_CLK      bic.b   #JI_CLK_BIT,JI_CLK_DIR
            bis.b   #JI_CLK_BIT,JI_CLK_IE
            bic.b   #JI_CLK_BIT,JI_CLK_IES
            bic.b   #JI_CLK_BIT,JI_CLK_IFG
TK_HIT1     bis.b   #TK_HIT1_BIT,TK_HIT1_OUT
            bis.b   #TK_HIT1_BIT,TK_HIT1_REN
            bis.b   #TK_HIT1_BIT,TK_HIT1_IE
            bis.b   #TK_HIT1_BIT,TK_HIT1_IES
            bic.b   #TK_HIT1_BIT,TK_HIT1_IFG
TK_HIT2     bis.b   #TK_HIT2_BIT,TK_HIT2_OUT
            bis.b   #TK_HIT2_BIT,TK_HIT2_REN
            bis.b   #TK_HIT2_BIT,TK_HIT2_IE
            bis.b   #TK_HIT2_BIT,TK_HIT2_IES
            bic.b   #TK_HIT2_BIT,TK_HIT2_IFG
TK_CHK1     bis.b   #TK_CHK1_BIT,TK_CHK1_OUT
            bis.b   #TK_CHK1_BIT,TK_CHK1_REN
            bis.b   #TK_CHK1_BIT,TK_CHK1_IE
            bis.b   #TK_CHK1_BIT,TK_CHK1_IES
            bic.b   #TK_CHK1_BIT,TK_CHK1_IFG
TK_CHK2     bis.b   #TK_CHK2_BIT,TK_CHK2_OUT
            bis.b   #TK_CHK2_BIT,TK_CHK2_REN
            bis.b   #TK_CHK2_BIT,TK_CHK2_IE
            bis.b   #TK_CHK2_BIT,TK_CHK2_IES
            bic.b   #TK_CHK2_BIT,TK_CHK2_IFG
TG_RNG1     bis.b   #TG_RNG1_BIT,TG_RNG1_OUT
            bis.b   #TG_RNG1_BIT,TG_RNG1_REN
TG_RNG2     bis.b   #TG_RNG2_BIT,TG_RNG2_OUT
            bis.b   #TG_RNG2_BIT,TG_RNG2_REN
TG_LFO      bis.b   #TG_LFO_BIT,TG_LFO_OUT
            bis.b   #TG_LFO_BIT,TG_LFO_REN
ADC         mov.w   #ADC10SSEL_3+INCH_4+CONSEQ_3,&ADC10CTL1 ; A4-A0, repeat multi channel
            mov.w   #ADC10SHT_3+MSC+ADC10ON+REFON+REF2_5V+SREF_1,&ADC10CTL0
            bis.b   #JI_LFO_BIT,&ADC10AE0
            bis.b   #JI_CNT1_BIT,&ADC10AE0
            bis.b   #JI_CNT2_BIT,&ADC10AE0
            bis.b   #JI_PAT_BIT,&ADC10AE0
            bis.b   #KI_LFO_BIT,&ADC10AE0
            bis.b   #ADC10CT, &ADC10DTC0
            mov.b   #20,&ADC10DTC1
busy_test   bit     #BUSY,&ADC10CTL1            ; ADC10 core inactive?
            jnz     busy_test
            mov.w   #adcBase,&ADC10SA            ; Data buffer start
            bis.w   #ENC+ADC10SC,&ADC10CTL0 ; Start sampling
TIMER       mov.b   #DIVS_1, BCSCTL2
            mov.w   #CCIE,&TACCTL0
            mov.w   timerDelay,&CCR0
            mov.w   #TASSEL_2+MC_1+ID_3+TAIE,&TACTL
IRQON       bis.w   #GIE, SR
MAINLOOP    call    #KNOBS
            call    #LFOPITCH

KPAT        mov.w   #0, longPattern
            mov.w   adcKnob3, R_KAVE
            cmp.w   #0x1F, R_KAVE
            jnz     KPATNORM
            mov.w   #-2, R_KAVE
            mov.w   #1, longPattern
KPATNORM    mov.w   R_KAVE, currentPattern

KCNT1       cmp.w   #0x1F, adcKnob1
            jnz     K1LOW
            cmp.w   #0xFF0, adcAve1
            jl      K1LOW
            mov.w   #0x20, adcKnob1
K1LOW       mov.w   adcKnob1, R_KAVE
            cmp.w   #0, longPattern
            jz      K1SET
            rla.w   R_KAVE
K1SET       mov.w   R_KAVE, t1Base
KCNT2       cmp.w   #0x1F, adcKnob2
            jnz     K2LOW
            cmp.w   #0xFF0, adcAve2
            jl      K2LOW
            mov.w   #0x20, adcKnob2
K2LOW       mov.w   adcKnob2, R_KAVE
            cmp.w   #0, longPattern
            jz      K2SET
            rla.w   R_KAVE
K2SET       mov.w   R_KAVE, t2Base
LFODIV      bit.w   #TG_LFO_BIT,TG_LFO_IN
            jz      NOLFODIV
            mov.w   adcKnob4, currentDiv
            jmp     DIVDONE
NOLFODIV    mov.w   #0, currentDiv
DIVDONE
            jmp     MAINLOOP
; LFOPITCH compute timerDelay from 1v/8va cv input
; R_PITCH_NOTE is 12bit unsigned input 3.10
LFOPITCH
K0          ; if 2*adcAve0 within 2 bits of pitchAve don't change
            mov.w   adcAve0, R_PITCH_NOTE
            add.w   adcAve0, R_PITCH_NOTE
            sub.w   pitchAve, R_PITCH_NOTE
            bit.w   #0x8000, R_PITCH_NOTE
            jz      LFOPOS
            inv.w   R_PITCH_NOTE
            inc.w   R_PITCH_NOTE
LFOPOS      cmp.w   #0x16, R_PITCH_NOTE
            jl      LFOSKIPAVE
            mov.w   adcAve0, R_PITCH_NOTE
            add.w   adcAve0, R_PITCH_NOTE
            add.w   pitchAve, R_PITCH_NOTE
            add.w   pitchAve, R_PITCH_NOTE
            add.w   pitchAve, R_PITCH_NOTE
            add.w   pitchAve, R_PITCH_NOTE
            add.w   pitchAve, R_PITCH_NOTE
            add.w   pitchAve, R_PITCH_NOTE
            add.w   pitchAve, R_PITCH_NOTE
            clrc
            rrc.w   R_PITCH_NOTE
            rra.w   R_PITCH_NOTE
            rra.w   R_PITCH_NOTE
            mov.w   R_PITCH_NOTE, pitchAve
LFOSKIPAVE  mov.w   adcAve4, R_PITCH_NOTE
            add.w   pitchAve, R_PITCH_NOTE
            clrc
            rrc.w   R_PITCH_NOTE ; 3.9
            clrc
            rrc.w   R_PITCH_NOTE ; 3.8
            mov.w   R_PITCH_NOTE, R_PITCH_8VA
            and.w   #0xFF00, R_PITCH_8VA
            swpb    R_PITCH_8VA
            and.w   #0x00FF, R_PITCH_NOTE
            add.w   R_PITCH_NOTE,R_PITCH_NOTE ; word offset
            add.w   #TUNE, R_PITCH_NOTE,
            mov.w   @R_PITCH_NOTE, R_PITCH_NOTE

SHIFT8VA    cmp.w   #0, R_PITCH_8VA
            jz      SHIFTDONE
            dec.w   R_PITCH_8VA
            clrc
            rrc.w   R_PITCH_NOTE
            jmp     SHIFT8VA
SHIFTDONE
            bit.w   #0x8000, R_PITCH_NOTE
            jnz     SAVEDELAY
            cmp.w   #0x100, R_PITCH_NOTE
            jge     SAVEDELAY
            mov.w   #0x100, R_PITCH_NOTE
SAVEDELAY   mov.w   R_PITCH_NOTE, timerDelay
            ret
; KNOBS - adc input de-noise all knobs
KNOBS
AVEZERO     mov.w   #0, adcAve3
            mov.w   #0, adcAve2
            mov.w   #0, adcAve1
AVE4        mov.w   #0, R_KAVE
            add.w   adcIn4a, R_KAVE
            add.w   adcIn4b, R_KAVE
            add.w   adcIn4c, R_KAVE
            add.w   adcIn4d, R_KAVE
            mov.w   R_KAVE, adcAve4
AVE3        add.w   adcIn3a, adcAve3
            add.w   adcIn3b, adcAve3
            add.w   adcIn3c, adcAve3
            add.w   adcIn3d, adcAve3
AVE2        add.w   adcIn2a, adcAve2
            add.w   adcIn2b, adcAve2
            add.w   adcIn2c, adcAve2
            add.w   adcIn2d, adcAve2
AVE1        add.w   adcIn1a, adcAve1
            add.w   adcIn1b, adcAve1
            add.w   adcIn1c, adcAve1
            add.w   adcIn1d, adcAve1
AVE0        mov.w   #0, R_KAVE
            add.w   adcIn0a, R_KAVE
            add.w   adcIn0b, R_KAVE
            add.w   adcIn0c, R_KAVE
            add.w   adcIn0d, R_KAVE
            mov.w   R_KAVE, adcAve0

K4          mov.w   adcAve4, R_KAVE
            mov.w   adcLast4, R_KLAST
            call    #KNOB
            mov.w   R_KAVE, adcKnob4
            mov.w   R_KLAST, adcLast4
K3          mov.w   adcAve3, R_KAVE
            mov.w   adcLast3, R_KLAST
            call    #KNOB
            mov.w   R_KAVE, adcKnob3
            mov.w   R_KLAST, adcLast3
K2          mov.w   adcAve2, R_KAVE
            mov.w   adcLast2, R_KLAST
            call    #KNOB
            mov.w   R_KAVE, adcKnob2
            mov.w   R_KLAST, adcLast2
K1          mov.w   adcAve1, R_KAVE
            mov.w   adcLast1, R_KLAST
            call    #KNOB
            mov.w   R_KAVE, adcKnob1
            mov.w   R_KLAST, adcLast1

            ret
; KNOB - adc input de-noise a knob
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
            ret
; --------------

HIT1        mov.w   #0, R_T1_COUNT
            mov.w   #0, end1
            cmp.w   #0, t1Base
            jnz     HIT1_NOEND
            mov.w   #1, end1
            mov.w   #BURST_DONE, R_T1_COUNT
HIT1_NOEND  mov.w   #0xFF, div1
            call    #LFORESET
            ret
HIT2        mov.w   #0, R_T2_COUNT
            mov.w   #0, end2
            cmp.w   #0, t2Base
            jnz     HIT2_NOEND
            mov.w   #1, end2
            mov.w   #BURST_DONE, R_T2_COUNT
HIT2_NOEND  mov.w   #0xFF, div2
            call    #LFORESET
            ret
CHK1        mov.w   #BURST_DONE, R_T1_COUNT
            mov.w   #1, end1
            ret
CHK2        mov.w   #BURST_DONE, R_T2_COUNT
            mov.w   #1, end2
            ret
CLKIN       bit.b   #TG_LFO_BIT, TG_LFO_IN
            jz      CLKDONE
            bit.b   #JI_CLK_BIT, JI_CLK_IN
            jz      CLKZERO
            call    #CLKUP
            bis.b   #JO_CLK_BIT, JO_CLK_OUT
            jmp     CLKDONE
CLKZERO     call    #CLKDN
            bic.b   #JO_CLK_BIT, JO_CLK_OUT
CLKDONE     ret

CLKUP       cmp.w   #0, end1
            jz      NOEND1
            bis.b   #JO_JEN1_BIT, JO_JEN1_OUT
            mov.w   #0, end1
NOEND1      cmp.w   #0, end2
            jz      NOEND2
            bis.b   #JO_JEN2_BIT, JO_JEN2_OUT
            mov.w   #0, end2
NOEND2
            call    #T1BURST
            call    #T2BURST
            ret
CLKDN       bic.b   #JO_JEN1_BIT, JO_JEN1_OUT
            bic.b   #JO_JEN2_BIT, JO_JEN2_OUT
            bic.b   #JO_OUT1_BIT, JO_OUT1_OUT
            bic.b   #JO_OUT2_BIT, JO_OUT2_OUT
            ret
T1BURST     cmp.w   currentDiv, div1
            jge     T1NODIV
            inc.w   div1
            ret
T1NODIV     mov.w   #0, div1
            cmp.w   #BURST_DONE, R_T1_COUNT
            jz      T1BURSTDONE
T1GO        mov.w   R_T1_COUNT, R_LOOP  ;save old value for later bit shifting
            inc.w   R_T1_COUNT
            cmp.w   t1Base, R_T1_COUNT
            jl      T1NOTEND
            mov.w   #BURST_DONE, R_T1_COUNT
            mov.w   #1, end1
T1NOTEND    mov.w   currentPattern, R_PATTERN2
            rla.w   R_PATTERN2 ; word size
            add.w   #PATTERNS, R_PATTERN2
            mov.w   @R_PATTERN2+, R_PATTERN1
            mov.w   @R_PATTERN2+, R_PATTERN2
T1PATLOOP   cmp.w   #0, R_LOOP
            jz      T1LOOPDONE
            rrc.w   R_PATTERN2
            rrc.w   R_PATTERN1
            dec.w   R_LOOP
            jmp     T1PATLOOP
T1LOOPDONE  rrc.w   R_PATTERN1
            jnc     T1BURSTDONE
            bis.b   #JO_OUT1_BIT, JO_OUT1_OUT
T1BURSTDONE ret

T2BURST     cmp.w   currentDiv, div2
            jge     T2NODIV
            inc.w   div2
            ret
T2NODIV     mov.w   #0, div2
            cmp.w   #BURST_DONE, R_T2_COUNT
            jz      T2BURSTDONE
T2GO        mov.w   R_T2_COUNT, R_LOOP  ;save old value for later bit shifting
            inc.w   R_T2_COUNT
            cmp.w   t2Base, R_T2_COUNT
            jl      T2NOTEND
            mov.w   #BURST_DONE, R_T2_COUNT
            mov.w   #1, end2
T2NOTEND    mov.w   currentPattern, R_PATTERN2
            rla.w   R_PATTERN2 ; word size
            add.w   #PATTERNS, R_PATTERN2
            mov.w   @R_PATTERN2+, R_PATTERN1
            mov.w   @R_PATTERN2+, R_PATTERN2
T2PATLOOP   cmp.w   #0, R_LOOP
            jz      T2LOOPDONE
            rrc.w   R_PATTERN2
            rrc.w   R_PATTERN1
            dec.w   R_LOOP
            jmp     T2PATLOOP
T2LOOPDONE  rrc.w   R_PATTERN1
            jnc     T2BURSTDONE
            bis.b   #JO_OUT2_BIT, JO_OUT2_OUT
T2BURSTDONE ret
; PORT ISR ------------------------------------------------------------------
PISR        mov.w   #5000, R_ISR_COUNT
PDELAY      dec.w   R_ISR_COUNT
            jnz     PDELAY
I_JI_IN1    bit.b   #JI_HIT1_BIT,JI_HIT1_IFG
            jz      E_JI_IN1
            call    #HIT1
            bic.b   #JI_HIT1_BIT,JI_HIT1_IFG
E_JI_IN1
I_TK_HIT1   bit.b   #TK_HIT1_BIT, TK_HIT1_IFG
            jz      E_TK_HIT1
            call    #HIT1
            bic.b   #TK_HIT1_BIT, TK_HIT1_IFG
E_TK_HIT1
I_JI_IN2    bit.b   #JI_HIT2_BIT,JI_HIT2_IFG
            jz      E_JI_IN2
            call    #HIT2
            bic.b   #JI_HIT2_BIT,JI_HIT2_IFG
E_JI_IN2
I_TK_HIT2   bit.b   #TK_HIT2_BIT, TK_HIT2_IFG
            jz      E_TK_HIT2
            call    #HIT2
            bic.b   #TK_HIT2_BIT, TK_HIT2_IFG
E_TK_HIT2
I_JI_CHK1   bit.b   #JI_CHK1_BIT,JI_CHK1_IFG
            jz      E_JI_CHK1
            call    #CHK1
            bic.b   #JI_CHK1_BIT,JI_CHK1_IFG
E_JI_CHK1
I_TK_CHK1   bit.b   #TK_CHK1_BIT, TK_CHK1_IFG
            jz      E_TK_CHK1
            call    #CHK1
            bic.b   #TK_CHK1_BIT, TK_CHK1_IFG
E_TK_CHK1
I_JI_CHK2   bit.b   #JI_CHK2_BIT, JI_CHK2_IFG
            jz      E_JI_CHK2
            call    #CHK2
            bic.b   #JI_CHK2_BIT, JI_CHK2_IFG
E_JI_CHK2
I_TK_CHK2   bit.b   #TK_CHK2_BIT, TK_CHK2_IFG
            jz      E_TK_CHK2
            call    #CHK2
            bic.b   #TK_CHK2_BIT, TK_CHK2_IFG
E_TK_CHK2
I_JI_CLK    bit.b   #JI_CLK_BIT, JI_CLK_IFG
            jz      E_JI_CLK
            call    #CLKIN
            xor.b   #JI_CLK_BIT, JI_CLK_IES
            bic.b   #JI_CLK_BIT, JI_CLK_IFG
E_JI_CLK
PISRDONE    reti
; TIMER ISR ------------------------------------------------------------------
TA0_ISR
            cmp.b   #10,TAIV ;we only care about TAIFG
            jne     TA0DONE
            bit.b   #TG_LFO_BIT, TG_LFO_IN
            jz      CVLFO
            bit.b   #JI_CLK_BIT,JI_CLK_IN
            jnz     NOCLEAR
            bic.b   #JO_CLK_BIT, JO_CLK_OUT
NOCLEAR     jmp     TA0DONE
CVLFO
RANGE       bit.b   #TG_RNG2_BIT, TG_RNG2_IN
            jz      LFO_BOT
            bit.b   #TG_RNG1_BIT, TG_RNG1_IN
            jz      LFO_TOP
            jmp     LFO_MID
LFO_TOP     mov.b   #DIVS_1, BCSCTL2
            mov.w   #1, LFO_DIV
            jmp RANGEDONE
LFO_MID     mov.b   #DIVS_2, BCSCTL2
            mov.w   #2, LFO_DIV
            jmp RANGEDONE
LFO_BOT     mov.b   #DIVS_3, BCSCTL2
            mov.w   #4, LFO_DIV
            jmp RANGEDONE
RANGEDONE
            mov.w   timerDelay, &CCR0
            dec.w   lfoDiv
            jz      CLOCK_ADV
            jmp     TA0DONE
CLOCK_ADV   mov.w   LFO_DIV, lfoDiv
            bit.b   #JO_CLK_BIT, JO_CLK_OUT
            jnz     OUTZERO
            bis.b   #JO_CLK_BIT, JO_CLK_OUT
            call    #CLKUP
            jmp     TA0DONE
OUTZERO     call    #CLKDN
            bic.b   #JO_CLK_BIT, JO_CLK_OUT
TA0DONE     reti

LFORESET    bit.b   #TG_LFO_BIT, TG_LFO_IN ; dont reset clock if in cv mode
            jnz     LFOBYE
            bic.b   #JO_CLK_BIT, JO_CLK_OUT
            mov.w   #1000, R_ISR_COUNT
RSTDELAY    dec.w   R_ISR_COUNT
            jnz     RSTDELAY
            mov.w   #100, CCR0
LFOBYE      ret
EMPTY_ISR   reti
; STACK -------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack

; IRQ -------------------------------------------------------------------------------
    .sect   ".reset"
    .short  RESET

    .sect   ".int01" ; port1
    .short EMPTY_ISR

    .sect   ".int02" ; port1
    .short PISR

    .sect   ".int03" ; port2
    .short PISR

    .sect   ".int04" ; usi
    .short EMPTY_ISR

    .sect   ".int05" ; adc10
    .short EMPTY_ISR

    .sect   ".int06" ; wdt
    .short EMPTY_ISR

    .sect   ".int07" ; wdt
    .short EMPTY_ISR

    .sect   ".int08" ; timera1
    .short TA0_ISR

    .sect   ".int09" ; timera0
    .short EMPTY_ISR

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
