; Copyright (C) Noise Engineering 
; see LICENSE.md for details
;


; MSP430F2013 pinout
;
; 1  VCC
; 2  A0+  pitch input
; 3  A4+  patch knob input
; 4  A1+  pitch knob input
; 5  SD16 VREF
; 6  P1.4 input mode select
; 7  P1.5 LED LE_DM1
; 8  P1.6 LED CLK
; 9  P1.7 LED SDI
; 10 JTAG
; 11 JTAG
; 12 P2.7 TP3
; 13 P2.6 output
; 14 GND


    .cdecls C,LIST,"msp430F2013.h"
    .retain

;------------------------------------------------------------------------------
;   Register Allocations
;------------------------------------------------------------------------------
;reserved for use in IRQ only (for speed)
R_IRQ_SHIFT         .equ R15
R_IRQ_POLY_0        .equ R14
R_IRQ_POLY_1        .equ R13
R_IRQ_POLY_2        .equ R12
R_IRQ_POLY_3        .equ R11

; used in main loop
R_U10           .equ R10
R_SETUP_COUNT   .equ R10
R_PITCH_CV      .equ R10
R_PITCH_CV_LOW  .equ R10
R_DISPLAY       .equ R10
R_PATCH         .equ R10
R_DELAY         .equ R10

R_U9            .equ R9
R_PITCH_OFS     .equ R9
R_PITCH_8VA     .equ R9
R_PITCH_CV_HIGH .equ R9
R_DISPLAY_COUNT .equ R9

R_U8                .equ R8
R_PITCH_DELAY_8VA   .equ R8

R_U7             .equ R7
R_PITCH_SUM_HIGH .equ R7

R_U6            .equ R6
R_PITCH_SUM_LOW .equ R6

R_U5            .equ R5
R_PITCH_MUL     .equ R5
R_PITCH_CMP     .equ R5
R_SETUP         .equ R5

; more in irq
R_U4            .equ R4
R_IRQ_POLY_TEMP .equ R4

R_U3            .equ R3 ;don't use
R_U2            .equ R2 ;don't use
R_U1            .equ R1 ;don't use
R_U0            .equ R0 ;don't use


;------------------------------------------------------------------------------
;   Defines
;------------------------------------------------------------------------------


; pins for seven segment display
DISPLAY_OUT_BIT     .equ BIT7
DISPLAY_CLK_BIT     .equ BIT6
DISPLAY_LE_BIT      .equ BIT5
DISPLAY_PORT        .equ P1OUT

; pin for audio output
AUDIO_OUT_BIT       .equ BIT6
AUDIO_OUT_PORT      .equ P2OUT

CLOCK_SELECT_BIT    .equ BIT4
CLOCK_SELECT_PORT   .equ P1IN

CLOCK_IN_BIT        .equ BIT7
CLOCK_IN_PORT       .equ P2OUT

VOLTAGE_REFERENCE_PIN       .equ BIT3

; combine pins to for port mask
MASK_P1DIR          .equ DISPLAY_OUT_BIT+DISPLAY_CLK_BIT+DISPLAY_LE_BIT
MASK_P1SEL          .equ VOLTAGE_REFERENCE_PIN
MASK_P1REN          .equ CLOCK_SELECT_BIT

MASK_P2DIR          .equ AUDIO_OUT_BIT
MASK_P2SEL          .equ 0
MASK_P2REN          .equ 0

ADC_MODE_PITCH      .equ 0
ADC_MODE_PATCH      .equ 2
ADC_MODE_OFFSET     .equ 4

PITCH_THRESHOLD     .equ 10

CLOCK_MODE_INTERNAL .equ    0
CLOCK_MODE_EXTERNAL .equ    1
CLOCK_MODE_INVALID  .equ    2

MIN_TIMER_DELAY .equ    100

;------------------------------------------------------------------------------
;   Constant memory
;------------------------------------------------------------------------------
    .sect ".const"


SEGA    .equ    BIT6
SEGB    .equ    BIT7
SEGC    .equ    BIT1
SEGD    .equ    BIT2
SEGE    .equ    BIT3
SEGF    .equ    BIT5
SEGG    .equ    BIT4
SEGP    .equ    BIT0

;DIGITS     .byte   0xEE, 0x28, 0xCD, 0x6D, 0x2B, 0x67, 0xE7, 0x2C, 0xEF, 0x2F, 0xAF, 0xC6, 0xC7, 0x87, 0xAB, 0xFF
DIGITS  .byte   SEGA+SEGB+SEGC+SEGD+SEGE+SEGF   ; 0
        .byte   SEGB+SEGC                       ; 1
        .byte   SEGA+SEGB+SEGD+SEGE+SEGG        ; 2
        .byte   SEGA+SEGB+SEGC+SEGD+SEGG        ; 3
        .byte   SEGB+SEGC+SEGF+SEGG             ; 4
        .byte   SEGA+SEGC+SEGD+SEGF+SEGG        ; 5 
        .byte   SEGA+SEGC+SEGD+SEGE+SEGF+SEGG   ; 6
        .byte   SEGA+SEGB+SEGC                  ; 7
        .byte   SEGA+SEGB+SEGC+SEGD+SEGE+SEGF+SEGG ; 8
        .byte   SEGA+SEGB+SEGC+SEGF+SEGG        ; 9
        .byte   SEGA+SEGB+SEGC+SEGE+SEGF+SEGG   ; A
        .byte   SEGA+SEGD+SEGE+SEGF             ; C
        .byte   SEGA+SEGD+SEGE+SEGF+SEGG        ; E
        .byte   SEGA+SEGE+SEGF+SEGG             ; F
        .byte   SEGB+SEGC+SEGE+SEGF+SEGG        ; H
        .byte   SEGB+SEGC+SEGD+SEGE             ; J

; presets for patches
; 16*5*2 bytes (160)
;           clkdiv      mask0   mask1   mask2   mask3     patch     poly cycle
POLYS
      .word 0xFF00,     BIT0,   BIT1,   0,      0       ; 0  0      2    3
      .word 0x6d49,     BIT2,   BIT1,   0,      0       ; 1  1      3    7
      .word 0x3300,     BIT3,   BIT2,   0,      0       ; 2  2      4    15
      .word 0x18ad,     BIT4,   BIT2,   0,      0       ; 3  3      5    31
      .word 0x1849,     BIT5,   BIT4,   0,      0       ; 4  4      6    63
      .word 0x1818,     BIT6,   BIT5,   0,      0       ; 5  5      7    127
      .word 0x1818,     BIT6,   BIT3,   0,      0       ; 6  6      ?
      .word 0x1800,     BIT7,   BIT5,   BIT4,   BIT3    ; 7  7      8    255
      .word 0x17f3,     BIT8,   BIT4,   0,      0       ; 8  8      9    511
      .word 0x17ed,     BIT9,   BIT6,   0,      0       ; 9  9      10   1023
      .word 0x17ea,     BITA,   BIT8,   0,      0       ; A  A      11   2047
      .word 0x17e9,     BITB,   BITA,   BIT9,   BIT3    ; B  C      12   4095
      .word 0x1777,     BITD,   BITC,   BITA,   BIT2    ; C  E      ?

MAX_PATCH   .equ    0x0C

 ;scalar for sub octave tuning
 ; 512 * 2 (1024) bytes
NOTE
    .word   65535,      65446,      65357,      65269,      65181,      65092,      65004,      64916
    .word   64829,      64741,      64653,      64566,      64478,      64391,      64304,      64217
    .word   64130,      64043,      63957,      63870,      63784,      63698,      63611,      63525
    .word   63439,      63354,      63268,      63182,      63097,      63011,      62926,      62841
    .word   62756,      62671,      62586,      62502,      62417,      62333,      62248,      62164
    .word   62080,      61996,      61912,      61828,      61745,      61661,      61578,      61494
    .word   61411,      61328,      61245,      61162,      61080,      60997,      60914,      60832
    .word   60750,      60668,      60585,      60504,      60422,      60340,      60258,      60177
    .word   60095,      60014,      59933,      59852,      59771,      59690,      59609,      59529
    .word   59448,      59368,      59287,      59207,      59127,      59047,      58967,      58887
    .word   58808,      58728,      58649,      58569,      58490,      58411,      58332,      58253
    .word   58174,      58095,      58017,      57938,      57860,      57782,      57704,      57625
    .word   57547,      57470,      57392,      57314,      57237,      57159,      57082,      57005
    .word   56928,      56851,      56774,      56697,      56620,      56544,      56467,      56391
    .word   56314,      56238,      56162,      56086,      56010,      55934,      55859,      55783
    .word   55708,      55632,      55557,      55482,      55407,      55332,      55257,      55182
    .word   55108,      55033,      54959,      54884,      54810,      54736,      54662,      54588
    .word   54514,      54440,      54367,      54293,      54220,      54146,      54073,      54000
    .word   53927,      53854,      53781,      53708,      53636,      53563,      53491,      53418
    .word   53346,      53274,      53202,      53130,      53058,      52986,      52914,      52843
    .word   52771,      52700,      52629,      52557,      52486,      52415,      52344,      52274
    .word   52203,      52132,      52062,      51991,      51921,      51851,      51780,      51710
    .word   51640,      51571,      51501,      51431,      51362,      51292,      51223,      51153
    .word   51084,      51015,      50946,      50877,      50808,      50740,      50671,      50602
    .word   50534,      50466,      50397,      50329,      50261,      50193,      50125,      50057
    .word   49990,      49922,      49854,      49787,      49720,      49652,      49585,      49518
    .word   49451,      49384,      49317,      49251,      49184,      49117,      49051,      48985
    .word   48918,      48852,      48786,      48720,      48654,      48588,      48523,      48457
    .word   48391,      48326,      48261,      48195,      48130,      48065,      48000,      47935
    .word   47870,      47805,      47741,      47676,      47612,      47547,      47483,      47419
    .word   47354,      47290,      47226,      47163,      47099,      47035,      46971,      46908
    .word   46844,      46781,      46718,      46654,      46591,      46528,      46465,      46403
    .word   46340,      46277,      46214,      46152,      46089,      46027,      45965,      45903
    .word   45841,      45779,      45717,      45655,      45593,      45531,      45470,      45408
    .word   45347,      45285,      45224,      45163,      45102,      45041,      44980,      44919
    .word   44858,      44798,      44737,      44676,      44616,      44556,      44495,      44435
    .word   44375,      44315,      44255,      44195,      44135,      44076,      44016,      43957
    .word   43897,      43838,      43778,      43719,      43660,      43601,      43542,      43483
    .word   43424,      43365,      43307,      43248,      43190,      43131,      43073,      43015
    .word   42956,      42898,      42840,      42782,      42724,      42667,      42609,      42551
    .word   42494,      42436,      42379,      42321,      42264,      42207,      42150,      42093
    .word   42036,      41979,      41922,      41866,      41809,      41752,      41696,      41639
    .word   41583,      41527,      41471,      41415,      41359,      41303,      41247,      41191
    .word   41135,      41080,      41024,      40968,      40913,      40858,      40802,      40747
    .word   40692,      40637,      40582,      40527,      40472,      40418,      40363,      40308
    .word   40254,      40199,      40145,      40091,      40036,      39982,      39928,      39874
    .word   39820,      39766,      39712,      39659,      39605,      39551,      39498,      39445
    .word   39391,      39338,      39285,      39232,      39178,      39125,      39072,      39020
    .word   38967,      38914,      38861,      38809,      38756,      38704,      38652,      38599
    .word   38547,      38495,      38443,      38391,      38339,      38287,      38235,      38184
    .word   38132,      38080,      38029,      37977,      37926,      37875,      37823,      37772
    .word   37721,      37670,      37619,      37568,      37517,      37467,      37416,      37365
    .word   37315,      37264,      37214,      37164,      37113,      37063,      37013,      36963
    .word   36913,      36863,      36813,      36763,      36713,      36664,      36614,      36565
    .word   36515,      36466,      36416,      36367,      36318,      36269,      36220,      36171
    .word   36122,      36073,      36024,      35975,      35927,      35878,      35830,      35781
    .word   35733,      35684,      35636,      35588,      35540,      35492,      35444,      35396
    .word   35348,      35300,      35252,      35205,      35157,      35109,      35062,      35014
    .word   34967,      34920,      34872,      34825,      34778,      34731,      34684,      34637
    .word   34590,      34544,      34497,      34450,      34404,      34357,      34311,      34264
    .word   34218,      34171,      34125,      34079,      34033,      33987,      33941,      33895
    .word   33849,      33803,      33758,      33712,      33666,      33621,      33575,      33530
    .word   33485,      33439,      33394,      33349,      33304,      33259,      33214,      33169
    .word   33124,      33079,      33034,      32990,      32945,      32900,      32856,      32811

;------------------------------------------------------------------------------
;   RAM
;------------------------------------------------------------------------------
    .data

adcMode         .word 0x0000

; adcRaw
adcRawPitch     .word 0x0000
adcRawPatch     .word 0x0000
adcRawOffset    .word 0x0000

adcRawTrash     .word 0x0000

adcLastPitch    .word 0x0000
adcLastOffset   .word 0x0000
adcLastPatch    .word 0x0000

adcCount        .word 0x0000
adcTotalCount   .word 0x0000
adcTemp         .word 0x0000

timerDelay      .word 0xFF00

patchBaseDelay  .word 62424
;patchClockDiv   .word 3
patchCurrent    .word 0xFF
octaveCurrent   .word 0x0000

noteHistory0    .word 0x1000
noteHistory1    .word 0x1000
noteHistory2    .word 0x1000
noteHistory3    .word 0x1000

noteAverage     .word 0x00

clockMode       .word CLOCK_MODE_INVALID


;------------------------------------------------------------------------------
;   Code
;------------------------------------------------------------------------------
    .text
    .global _main                   ; define entry point

_main
    mov.w   #0280h,SP               ; Initialize stackpointer
    mov.w   #WDTPW+WDTHOLD,&WDTCTL  ; disable wdt

STARTDELAY  mov.w   #0x0008, R5
STARTLOOP1  mov.w   #0xFFFF, R6
STARTLOOP2  dec.w   R6
            jnz     STARTLOOP2
            dec.w   R5
            jnz     STARTLOOP1

    mov.b   #MASK_P1SEL,&P1SEL
    mov.b   #MASK_P1DIR,&P1DIR
    mov.b   #MASK_P1REN,&P1REN
    mov.b   #MASK_P1REN,&P1OUT

    mov.b   #MASK_P2SEL,&P2SEL
    mov.b   #MASK_P2DIR,&P2DIR
    mov.b   #MASK_P2REN,&P2REN
    mov.b   #MASK_P2REN,&P2OUT

    ;call    #delay                     ; make sure power is stable
    ;call    #delay

    mov.b   CALDCO_16MHZ, DCOCTL
    mov.b   CALBC1_16MHZ, BCSCTL1
    mov.b   #DIVS_0, BCSCTL2        ; SMCLOCK is MCLOCK

    mov.b   #0x61,&0xBF             ; fix DCO tempo (per errata)

    mov.w   #SD16REFON+SD16SSEL_1+SD16XDIV_1+SD16DIV_0+SD16VMIDON,&SD16CTL  ; 1.2V ref, mclk, /3 /2
    mov.w   #SD16UNI+SD16IE+SD16OSR_1024,&SD16CCTL0                         ; unipolar, IRQ, 1024x oversample
    mov.b   #0, &SD16AE

    mov.w #0, patchCurrent
    call #updateDisplay
    mov.w  #0xFF, patchCurrent
    mov.w #0xFF00, timerDelay

    call    #adcSetupOffset

    bis.w   #GIE, SR        ; enable IRQ

;   mov.w #0, adcTotalCount
;adcDelay1
;   call    #updatePatch
;   call    #updatePitch
;   bis.w   #CPUOFF+GIE,SR
;   cmp.w   #16, adcTotalCount
;   jl      adcDelay1

    mov.w   #CCIE,&TACCTL0              ; CCR0 interrupt enabled
    mov.w   timerDelay,&CCR0                ; set timer count default (gets set by pitch computation eventually)
    mov.w   #TASSEL_2+MC_1+TAIE,&TACTL  ; configure timer to use smclk, up mode

mainLoop
    call    #updatePatch

    bit.b   #CLOCK_SELECT_BIT, CLOCK_SELECT_PORT
    jz      internalClock

externalClock
    cmp.w   #CLOCK_MODE_EXTERNAL, clockMode
    mov.w   #0,&TACTL
    jz      noClockExternalInit
    bis.b   #CLOCK_IN_BIT, P2IE
    mov.b   #0, P2IES
noClockExternalInit

    mov.w   #CLOCK_MODE_EXTERNAL, clockMode
    jmp     powerDown

internalClock
    cmp.w   #CLOCK_MODE_INTERNAL, clockMode
    jz      noClockInternalInit
    mov.b   #0, P2IE
    mov.w   #0xFFFF, patchCurrent
noClockInternalInit
    call    #updatePitch
    mov.w   #CLOCK_MODE_INTERNAL, clockMode
    jmp     powerDown   

powerDown   
    bis.w   #CPUOFF+GIE,SR          ; CPU off, enable interrupts
    jmp     mainLoop

;------------------------------------------------------------------------------
; updatePitch - update the timer delay based off of the adc pitch values

updatePitch
    mov.w   adcRawPitch, R_PITCH_CV
    mov.w   R_PITCH_CV,adcLastPitch
    mov.w   adcRawOffset, R_PITCH_OFS
    mov.w   R_PITCH_OFS,adcLastOffset

    clrc
    rrc.w   R_PITCH_OFS
    ;clrc
    ;rrc.w  R_PITCH_OFS
    rra.w   R_PITCH_OFS

    ; pitch cv is 0-8v, 1v / 8va
    ; top 3 bits is 8va

    add.w   R_PITCH_OFS, R_PITCH_CV     ; R_PITCH_CV is linear voltage top 3 bits 8va
    jnc     noOverflow
    mov.w   #0xFFFF, R_PITCH_CV           ; clamp pitch to 0xFFFF
noOverflow  

    ; remove lower 5 bits
    clrc
    rrc.w   R_PITCH_CV
    rra.w   R_PITCH_CV
    rra.w   R_PITCH_CV
    rra.w   R_PITCH_CV
    
    ; average last 4 events 
    mov.w   noteHistory2, noteHistory3    ; keep last 4 values
    mov.w   noteHistory1, noteHistory2  
    mov.w   noteHistory0, noteHistory1  
    mov.w   R_PITCH_CV,   noteHistory0
    add.w   noteHistory1, R_PITCH_CV      ; sum last 4 values
    add.w   noteHistory2, R_PITCH_CV
    add.w   noteHistory3, R_PITCH_CV
    rra.w   R_PITCH_CV                  ; /4 to average
    rra.w   R_PITCH_CV

    mov.w   R_PITCH_CV, R_PITCH_8VA     
    rra.w   R_PITCH_8VA
    
    and.w   #0xFF00, R_PITCH_8VA            ; mask out non octave
    swpb    R_PITCH_8VA

    mov.w   patchBaseDelay, R_PITCH_DELAY_8VA
    mov.w   R_PITCH_8VA, octaveCurrent

    and.w   #0x01FF, R_PITCH_CV         ; mask out octave, 9 bits remain

    rla.w   R_PITCH_CV                  ; mult by 2 for indexing words
    mov.w   R_PITCH_CV, noteAverage
    add.w   #NOTE, R_PITCH_CV               ; add in table offset
    mov.w   @R_PITCH_CV, R_PITCH_CV_LOW ; get note scalar from table

    mov.w   #0, R_PITCH_CV_HIGH         ; clear out high word of product
    mov.w   #0, R_PITCH_SUM_LOW
    mov.w   #0, R_PITCH_SUM_HIGH

    ; (R_PITCH_DELAY * R_PITCH_CV) >> 16

    mov.w   #16, R_PITCH_MUL
mulBit
    clrc
    rrc.w   R_PITCH_DELAY_8VA
    jnc     skipBit
    add.w   R_PITCH_CV_LOW, R_PITCH_SUM_LOW
    addc.w  R_PITCH_CV_HIGH, R_PITCH_SUM_HIGH
skipBit
    clrc
    rlc.w   R_PITCH_CV_LOW
    rlc.w   R_PITCH_CV_HIGH
    dec.w   R_PITCH_MUL
    jnz     mulBit

    mov.w   octaveCurrent, R_PITCH_8VA
octaveShift                             ; divide delay by 2 for every octave
    cmp.w   #0,R_PITCH_8VA
    jz      octaveShiftDone
    clrc
    rrc.w   R_PITCH_SUM_HIGH
    dec.w   R_PITCH_8VA
    jmp     octaveShift
octaveShiftDone 

    bit.w #BITF, R_PITCH_SUM_HIGH
    jnz bigEnough
    cmp.w #MIN_TIMER_DELAY, R_PITCH_SUM_HIGH
    jge bigEnough
    mov.w #MIN_TIMER_DELAY, R_PITCH_SUM_HIGH
bigEnough   
    mov.w   R_PITCH_SUM_HIGH,timerDelay
    ret


;------------------------------------------------------------------------------
; updatePatch - update patch values based off of adc patch value
updatePatch
    ;cmp.w  adcRawPatch,adcLastPatch
    ;jz         return

    mov.w   adcRawPatch, R_PATCH
    mov.w   R_PATCH, adcLastPatch
    add.w   #2000, R_PATCH
    jnc patchBoundary
    mov.w #0xFFFF, R_PATCH
patchBoundary
    and.w   #0xF000, R_PATCH
    swpb    R_PATCH
    clrc
    rrc.w   R_PATCH
    rra.w   R_PATCH
    rra.w   R_PATCH
    rra.w   R_PATCH
    ;rra.w   R_PATCH

    cmp.w   #MAX_PATCH, R_PATCH
    jl      patchOk
    mov.w   #MAX_PATCH, R_PATCH
patchOk

    cmp.w   R_PATCH, patchCurrent
    jnz     needToSet
    ret
needToSet

    mov.w   R_PATCH, patchCurrent

    rla.w   R_PATCH                     ; mult by 10 (sizeof entry)
    rla.w   R_PATCH
    rla.w   R_PATCH
    add.w   patchCurrent,R_PATCH
    add.w   patchCurrent,R_PATCH
    ;add.w  patchCurrent,R_PATCH
    ;add.w  patchCurrent,R_PATCH

    add.w   #POLYS,R_PATCH          ;add address

    bic.w   #GIE, SR  ; must update these atomicly

    mov.w   @R_PATCH+, patchBaseDelay  ; load timer div
    ;mov.w  @R_PATCH+, patchClockDiv  ; load timer div
    mov.w   @R_PATCH+, R_IRQ_POLY_0 ; load masks
    mov.w   @R_PATCH+, R_IRQ_POLY_1
    mov.w   @R_PATCH+, R_IRQ_POLY_2
    mov.w   @R_PATCH+, R_IRQ_POLY_3


    mov.b   patchCurrent, R_PATCH
    rra.b R_PATCH
    rla.b R_PATCH
    cmp.b   #7, R_PATCH
    jl validPatch
    mov.b #7, R_PATCH
validPatch  
    ;rla.b  R_PATCH
    add     R_PATCH, PC
    jmp     clkDiv3 ; patch zero is / 8
    jmp     clkDiv2 ; patch zero is / 4
    jmp     clkDiv1 ; patch zero is / 2
    jmp     clkDiv0 ;other patches are /1

clkDiv0 
    mov.w   #TASSEL_2+MC_1+TAIE+ID_0,&TACTL
    jmp     clkDivDone
clkDiv1 
    mov.w   #TASSEL_2+MC_1+TAIE+ID_1,&TACTL
    jmp     clkDivDone
clkDiv2 
    mov.w   #TASSEL_2+MC_1+TAIE+ID_2,&TACTL
    jmp     clkDivDone
clkDiv3 
    mov.w   #TASSEL_2+MC_1+TAIE+ID_3,&TACTL
    jmp clkDivDone
clkDivDone  
    bis.w   #GIE, SR

    call    #updateDisplay
    ret

;------------------------------------------------------------------------------
; updateDisplay - output current patch to LED display
updateDisplay
    mov.w   #DIGITS, R_DISPLAY
    add.w   patchCurrent, R_DISPLAY
    mov.b   @R_DISPLAY, R_DISPLAY
    mov.b   #0x08, R_DISPLAY_COUNT

ledShift
    bic.b   #DISPLAY_CLK_BIT, DISPLAY_PORT
    rlc.b   R_DISPLAY
    jc      ledSetBit
    bic.b   #DISPLAY_OUT_BIT, DISPLAY_PORT
    jmp     ledClearBit
ledSetBit
    bis.b   #DISPLAY_OUT_BIT, DISPLAY_PORT
ledClearBit
    bis.b   #DISPLAY_CLK_BIT, DISPLAY_PORT
    dec.b   R_DISPLAY_COUNT
    jnz     ledShift

    bis.b   #DISPLAY_LE_BIT, DISPLAY_PORT
    bic.b   #DISPLAY_LE_BIT, DISPLAY_PORT

    ret


;------------------------------------------------------------------------------
; TA1_ISR - ISR for timers/clocks

PORT2_ISR
    mov.b   #0,P2IFG
    jmp lfsr16

TA1_ISR
    cmp.b   #10,TAIV ;we only care about TAIFG
    jnz     EMPTY_ISR
    mov.w   timerDelay, &CCR0

lfsr16
    clr.b   R_IRQ_POLY_TEMP             ; clear temp register
    bit.w   R_IRQ_POLY_0,R_IRQ_SHIFT    ; C is set if bit is set
    adc.b   R_IRQ_POLY_TEMP         ; temp is 1 if first bit was set
    bit.w   R_IRQ_POLY_1,R_IRQ_SHIFT    ; C is set if bit is set
    adc.b   R_IRQ_POLY_TEMP         ; temp is 0 if neither set, 1 if either set and 2 if both set (bit0 is xor)
    bit.w   R_IRQ_POLY_2,R_IRQ_SHIFT    ; rinse, repeat
    adc.b   R_IRQ_POLY_TEMP
    bit.w   R_IRQ_POLY_3,R_IRQ_SHIFT
    adc.b   R_IRQ_POLY_TEMP
    bit.b   #BIT0, R_IRQ_POLY_TEMP
    rlc.w   R_IRQ_SHIFT             ; shift xored value in
    cmp.w   #0, R_IRQ_SHIFT         ; check for invalid shift register state
    jne     bye_shift_a_4               ; if register is valid exit
    mov.w   #0x1,R_IRQ_SHIFT            ; if register is invalid make it valid
bye_shift_a_4

    bit.w   #BITF, R_IRQ_SHIFT      ;output of shift register in C
    jc      outOn
    bic.b   #AUDIO_OUT_BIT, AUDIO_OUT_PORT
    reti
outOn   
    bis.b   #AUDIO_OUT_BIT, AUDIO_OUT_PORT

    reti


;------------------------------------------------------------------------------
; adcSetupOffset - enable ADC to read offset cv
adcSetupOffset ; pitch knob A1+ P1.2 pin 4 A1- p1.3
     mov.w  #ADC_MODE_OFFSET, adcMode
     mov.b  #SD16AE2, &SD16AE
     mov.b   #SD16INCH_1+SD16INTDLY_0,&SD16INCTL0           ; A1+/-, 4 samples / IRQ
     jmp    adcSetupCommon

;------------------------------------------------------------------------------
; adcSetupPatch - enable ADC to read patch cv
adcSetupPatch ; patch knob is A4+, P1.1 pin 3 s4- P1.2
    mov.w   #ADC_MODE_PATCH, adcMode
    mov.b   #SD16AE1, &SD16AE
    mov.b   #SD16INCH_4+SD16INTDLY_0,&SD16INCTL0        ; A4+/-, 4 samples / IRQ
    jmp     adcSetupCommon

;------------------------------------------------------------------------------
; adcSetupPitch - enable ADC to read pitch cv
adcSetupPitch ; pitch is A0+ P1.0 pin 2
    mov.w   #ADC_MODE_PITCH, adcMode
    mov.b   #SD16AE0, &SD16AE
    mov.b   #SD16INCH_0+SD16INTDLY_0,&SD16INCTL0        ; A0+/-, 4 samples / IRQ

adcSetupCommon
    mov.w   #0,adcCount
    mov.w   &SD16MEM0,adcRawTrash
    bis.w   #SD16SC,&SD16CCTL0
    ret

SD16_ISR_pitch
    mov.w   &SD16MEM0,adcTemp
    add.w   #200,adcTemp
    jnc     savePitch
    mov.w   #0xFFFF, adcTemp
savePitch
    mov.w   adcTemp, adcRawPitch
    call    #adcSetupOffset
    reti

SD16_ISR_offset
    mov.w   &SD16MEM0,adcRawOffset
    call    #adcSetupPatch
    bic.w   #LPM0,0(SP)
    reti

SD16_ISR_patch
    mov.w   &SD16MEM0,adcRawPatch
    call    #adcSetupPitch
    reti

returnReadAdcIrq
    mov.w   &SD16MEM0,adcRawTrash
returnIrq
    reti

SD16_ISR
    inc.w   adcCount

    mov.w   adcCount, adcTemp
    rrc.w   adcTemp
    rrc.w   adcTemp
    jnc     skipAdc
    
    inc.w   adcTotalCount

    bic.w   #SD16SC,&SD16CCTL0

    add     adcMode, PC
    jmp     SD16_ISR_pitch
    jmp     SD16_ISR_patch
    jmp     SD16_ISR_offset

skipAdc
    mov.w   &SD16MEM0,adcRawTrash
EMPTY_ISR
    reti

;------------------------------------------------------------------------------
;   Interrupt Vectors
;------------------------------------------------------------------------------
    .sect   ".reset"
    .short  _main

    .sect   ".int02" ; port1
    .short EMPTY_ISR

    .sect   ".int03" ; port2
    .short PORT2_ISR

    .sect   ".int04" ; usi
    .short EMPTY_ISR

    .sect   ".int05" ; sd16
SD16_ISR_VECTOR
    .short SD16_ISR

    .sect   ".int08" ; timera1
    .short TA1_ISR

    .sect   ".int09" ; timera0
    .short  EMPTY_ISR

    .sect   ".int10" ; wdt
    .short EMPTY_ISR

    .sect   ".int14" ; nmi
    .short EMPTY_ISR

    .end
