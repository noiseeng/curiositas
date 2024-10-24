; Copyright (C) Noise Engineering 
; see LICENSE.md for details
;

    .cdecls C,LIST,"msp430.h"       ; Include device header file

	.sect ".const"

; PINOUT
; * pin  1 VCC
; - pin  2 1.0 JACK PITCH
; - pin  3 1.1 JACK PITCH
; - pin  4 1.2 JACK RANDOMIZE
; - pin  5 1.3 JACK PATTERN
; * pin  6 1.4 JACK BEAT
JK_BEAT_BIT 		.equ 	BIT4
JK_BEAT_IN 			.equ 	P1IN
JK_BEAT_IFG 		.equ 	P1IFG
JK_BEAT_IE 			.equ 	P1IE
JK_BEAT_IES			.equ	P1IES
; * pin  7 1.5 JACK MEASURE
JK_MEASURE_BIT 		.equ 	BIT5
JK_MEASURE_IN 		.equ 	P1IN
JK_MEASURE_IFG 		.equ 	P1IFG
JK_MEASURE_IE 		.equ 	P1IE
JK_MEASURE_IES		.equ 	P1IES
; - pin  8 3.1 SWITCH PAT1
SW_PAT1_BIT			.equ	BIT1
SW_PAT1_IN			.equ	P3IN
SW_PAT1_OUT			.equ	P3OUT
SW_PAT1_REN			.equ	P3REN
SW_PAT1_DIR			.equ	P3DIR
; - pin  9 3.0 SWITCH PAT2
SW_PAT0_BIT			.equ	BIT0
SW_PAT0_IN			.equ	P3IN
SW_PAT0_OUT			.equ	P3OUT
SW_PAT0_REN			.equ	P3REN
SW_PAT0_DIR			.equ	P3DIR
; * pin 10 2.0 MOMENTARY ADVANCE
MO_ADV_BIT 		.equ 	BIT0
MO_ADV_IN 		.equ 	P2IN
MO_ADV_IFG 		.equ 	P2IFG
MO_ADV_IE 		.equ 	P2IE
MO_ADV_IES		.equ 	P2IES
MO_ADV_OUT		.equ 	P2OUT
MO_ADV_REN		.equ 	P2REN
; * pin 11 2.1 RECB
SW_RECB_BIT 	.equ 	BIT1
SW_RECB_IN 		.equ 	P2IN
SW_RECB_IFG 	.equ 	P2IFG
SW_RECB_IE 		.equ 	P2IE
SW_RECB_IES		.equ 	P2IES
SW_RECB_OUT		.equ 	P2OUT
SW_RECB_REN		.equ 	P2REN
; * pin 12 2.2 Mode A
SW_MODEA_BIT		.equ	BIT2
SW_MODEA_IN			.equ	P2IN
SW_MODEA_OUT		.equ	P2OUT
SW_MODEA_REN		.equ	P2REN
SW_MODEA_DIR		.equ	P2DIR
; * pin 13 3.2 Mode B
SW_MODEB_BIT		.equ	BIT2
SW_MODEB_IN			.equ	P3IN
SW_MODEB_OUT		.equ	P3OUT
SW_MODEB_REN		.equ	P3REN
SW_MODEB_DIR		.equ	P3DIR
; - pin 14 3.3 SWITCH QUANTIZE
SW_QUANTIZE_BIT 	.equ 	BIT3
SW_QUANTIZE_IN 		.equ 	P3IN
SW_QUANTIZE_OUT		.equ 	P3OUT
SW_QUANTIZE_REN		.equ 	P3REN
; - pin 15 3.4 DAC CS
DAC_CS_BIT			.equ	BIT4
DAC_CS_OUT			.equ	P3OUT
DAC_CS_DIR			.equ	P3DIR
; - pin 16 2.3 DAC SCLK
DAC_CLK_BIT			.equ	BIT3
DAC_CLK_OUT			.equ	P2OUT
DAC_CLK_DIR			.equ	P2DIR
; - pin 17 2.4 DC DIN
DAC_DIN_BIT			.equ	BIT4
DAC_DIN_OUT			.equ	P2OUT
DAC_DIN_DIR			.equ	P2DIR
; * pin 18 2.5 MM P3
MM_G2_BIT			.equ	BIT5
MM_G2_OUT			.equ	P2OUT
MM_G2_DIR			.equ	P2DIR
; * pin 19 3.5 MM P7
MM_G3_BIT			.equ	BIT5
MM_G3_OUT			.equ	P3OUT
MM_G3_DIR			.equ	P3DIR
; * pin 20 3.6 MM P5
MM_G4_BIT			.equ	BIT6
MM_G4_OUT			.equ	P3OUT
MM_G4_DIR			.equ	P3DIR
; * pin 21 3.7 MM P1
MM_G1_BIT			.equ	BIT7
MM_G1_OUT			.equ	P3OUT
MM_G1_DIR			.equ	P3DIR
; - pin 22 1.6 MOMENTARY RESET
MO_RESET_BIT 		.equ 	BIT6
MO_RESET_IN 		.equ 	P1IN
MO_RESET_IFG 		.equ 	P1IFG
MO_RESET_IE 		.equ 	P1IE
MO_RESET_IES		.equ 	P1IES
MO_RESET_OUT		.equ 	P1OUT
MO_RESET_REN		.equ 	P1REN
; - pin 23 1.7 MOMENTARY COPY
MO_DUP_BIT 		.equ 	BIT7
MO_DUP_IN 		.equ 	P1IN
MO_DUP_IFG 		.equ 	P1IFG
MO_DUP_IE 		.equ 	P1IE
MO_DUP_IES		.equ 	P1IES
MO_DUP_OUT		.equ 	P1OUT
MO_DUP_REN		.equ 	P1REN
; * pin 24 X
; * pin 25 X
; - pin 26 2.7 RECA
SW_RECA_BIT 	.equ 	BIT7
SW_RECA_IN 		.equ 	P2IN
SW_RECA_IFG 	.equ 	P2IFG
SW_RECA_IE 		.equ 	P2IE
SW_RECA_IES		.equ 	P2IES
SW_RECA_OUT		.equ 	P2OUT
SW_RECA_REN		.equ 	P2REN
; * pin 27 2.6 LED RECORD
LED_RECORD_BIT		.equ	BIT6
LED_RECORD_OUT		.equ	P2OUT
LED_RECORD_DIR		.equ	P2DIR
; * pin 28 VSS

; REGISTERS ----------------------------------------------------------------
R_COUNT		.equ R4
R_KAVE		.equ R5
R_KLAST		.equ R6
R_KSUB		.equ R7
R_MAIN_TEMP	.equ R7
R_OFS		.equ R7
R_SEQ		.equ R8
R_FROM		.equ R8
R_CALA		.equ R8
R_RND		.equ R9
R_TO		.equ R9
R_RANDW		.equ R10
R_RAND 		.equ R11
R_DAC_COUNT	.equ R12
R_VAL		.equ R13
R_DAC_DATA	.equ R13
R_MAXVAL	.equ R14
R_DAC_CMD 	.equ R14
R_MINVAL	.equ R15
R_IRQ_TEMP	.equ R15

; CONSTANT DEFINES ----------------------------------------------------------------
QUANTIZE_MASK 		.equ    0xFC00
OFFSET_MASK			.equ	0x9FFF ; +- 8 notes
SEMITONE_OFFSET		.equ	0x0400 ; 0x400 -> 1/12 v
OCTAVE_OFFSET		.equ	0x3000
FIFTH_OFFSET		.equ	0x1400
LIMIT 				.equ 	0xC000
LOW_MASK 			.equ    0x3FFF
NO_MASK 			.equ    0xFFFF
MODE_CV				.equ	2
MODE_FULL			.equ	1
MODE_REDUCED		.equ	0

; CONSTANT DATA ----------------------------------------------------------------
RANDOM
        .byte 128,64,32,16,8,4,2,1
        .byte 3,6,5,7,12,10,9,11
        .byte 14,13,15,24,20,18,17,19
        .byte 22,21,23,28,26,25,27,30
        .byte 29,31,48,40,36,34,33,35
        .byte 38,37,39,44,42,41,43,46
        .byte 45,47,56,52,50,49,51,54
        .byte 53,55,60,58,57,59,62,61
        .byte 63,96,80,72,68,66,65,67
        .byte 70,69,71,76,74,73,75,78
        .byte 77,79,88,84,82,81,83,86
        .byte 85,87,92,90,89,91,94,93
        .byte 95,112,104,100,98,97,99,102
        .byte 101,103,108,106,105,107,110,109
        .byte 111,120,116,114,113,115,118,117
        .byte 119,124,122,121,123,126,125,127
        .byte 192,160,144,136,132,130,129,131
        .byte 134,133,135,140,138,137,139,142
        .byte 141,143,152,148,146,145,147,150
        .byte 149,151,156,154,153,155,158,157
        .byte 159,176,168,164,162,161,163,166
        .byte 165,167,172,170,169,171,174,173
        .byte 175,184,180,178,177,179,182,181
        .byte 183,188,186,185,187,190,189,191
        .byte 224,208,200,196,194,193,195,198
        .byte 197,199,204,202,201,203,206,205
        .byte 207,216,212,210,209,211,214,213
        .byte 215,220,218,217,219,222,221,223
        .byte 240,232,228,226,225,227,230,229
        .byte 231,236,234,233,235,238,237,239
        .byte 248,244,242,241,243,246,245,247
        .byte 252,250,249,251,254,253,255,0

SEQ_LENGTH     	.equ 64
SEQ_SIZE     	.equ (2*SEQ_LENGTH)
SEQ_TOTAL     	.equ (3*SEQ_LENGTH)
SEQ_MASK		.equ (SEQ_LENGTH-1)
FLASH_SEQ		.equ 0xFC00
SAVE_LENGTH		.equ (SEQ_TOTAL+1)

;-------------------------------------------------------------------------------
    .data
;-------------------------------------------------------------------------------
DATA_START
seqTime 		.word 	0x0000
seqOfs 			.word 	0x0000
sequence
sequence1   	.word   0x0002,0x1000,0x2000,0x3000,0x4000,0x5000,0x6000,0x7000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
           		.word   0x0002,0x1000,0x2000,0x3000,0x4000,0x5000,0x6000,0x7000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
sequence2   	.word   0x0001,0x1000,0x2000,0x3000,0x4000,0x5000,0x6000,0x7000
            	.word   0xC000,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
            	.word   0x0002,0x1000,0x2000,0x3000,0x4000,0x5000,0x6000,0x7000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
sequence3   	.word   0x0002,0x1000,0x2000,0x3000,0x4000,0x5000,0x6000,0x7000
            	.word   0x0006,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
            	.word   0x0002,0x1000,0x2000,0x3000,0x4000,0x5000,0x6000,0x7000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
           		.word   0x0002,0x2000,0x4000,0x6000,0x8000,0x4000,0x6000,0x8000
offset			.word	0

dacA			.word	0
dacB			.word	0
dacC			.word	0
dacD			.word	0
randomAdc		.word	0
randomLast		.word	0
random			.word	0

pitchAdc		.word	0
rand1			.word	0
rand2			.word	0
noise			.word	0
patch 			.word	0
duplicate		.word	0
saved			.word	0

randomize		.word	0
lastTime		.word	0
patchAdc		.word	0
patchLast		.word	0
patchOffset		.word 	0
min1			.word	0
min2			.word	0
min3			.word	0
max1			.word	0
max2			.word	0
max3			.word	0
min				.word	0
max				.word	0
mask			.word	0
mode			.word	0
recCount	 	.word	0
recording		.word	0
recSaved		.word	0

cal1			.word 	0
cal2			.word 	0
cal3			.word 	0
calOfs			.word	0
ofsSum			.word	0
ofsPoint		.word	0
value1			.word	0
value2			.word	0
value3			.word	0
value4			.word	0


DATA_END

;-------------------------------------------------------------------------------
            .text
            .retain
            .retainrefs
;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP
            mov.w   #WDTPW|WDTHOLD,&WDTCTL
MEM			mov.w	#DATA_START, R5
ZERO_LOOP	mov.w 	#0, 0(R5)
			add.w	#2,	R5
			cmp.w	#DATA_END, R5
			jnz 	ZERO_LOOP
NZMEM		mov.w	#15, lastTime
			mov.w	#1, saved
			mov.w	#LOW_MASK, mask
			mov.w	#MODE_REDUCED, mode
PORTS 	 	mov.b   #0, P2SEL
			mov.b   #0, P1SEL
			mov.b   #0, P2IFG
            mov.b   #0, P1IFG
            mov.b	#0, P1OUT
            mov.b	#0, P2OUT
            mov.b	#0, P3OUT
OUTPORT     bis.b	#LED_RECORD_BIT, LED_RECORD_DIR
            bis.b	#MM_G1_BIT, MM_G1_DIR
            bis.b	#MM_G2_BIT, MM_G2_DIR
            bis.b	#MM_G3_BIT, MM_G3_DIR
            bis.b	#MM_G4_BIT, MM_G4_DIR
            bis.b	#DAC_CS_BIT, DAC_CS_DIR
            bis.b	#DAC_CLK_BIT, DAC_CLK_DIR
            bis.b	#DAC_DIN_BIT, DAC_DIN_DIR
DELAY 		mov.w 	#0x00FF, R5
DELAYL1  	mov.w 	#0x0FFF, R6
			mov.b	R5, P1OUT
			mov.b	R5, P2OUT
			mov.b	R5, P3OUT
DELAYL2  	dec.w 	R6
            jnz 	DELAYL2
            dec.w 	R5
            jnz 	DELAYL1
            mov.b	#0, P1OUT
            mov.b	#0, P2OUT
            mov.b	#0, P3OUT
SETUPCLOCK	mov.b   CALDCO_16MHZ, DCOCTL
            mov.b   CALBC1_16MHZ, BCSCTL1
            mov.b   #DIVS_3, BCSCTL2

FLASHLOAD  	call	#LOAD_ALL
			;mov.w	#0x54, offset
			;mov.w	#6, offset

INPORT		bis.b	#SW_RECA_BIT,SW_RECA_REN
            bis.b	#SW_RECA_BIT,SW_RECA_OUT
            bis.b	#SW_RECB_BIT,SW_RECB_REN
            bis.b	#SW_RECB_BIT,SW_RECB_OUT
            bis.b	#SW_QUANTIZE_BIT,SW_QUANTIZE_REN
            bis.b	#SW_QUANTIZE_BIT,SW_QUANTIZE_OUT
IRQEN_M		bis.b   #JK_MEASURE_BIT,JK_MEASURE_IE
            bis.b   #JK_MEASURE_BIT,JK_MEASURE_IES
            bic.b   #JK_MEASURE_BIT,JK_MEASURE_IFG
IRQEN_B 	bis.b   #JK_BEAT_BIT,JK_BEAT_IE
            bic.b   #JK_BEAT_BIT,JK_BEAT_IES
            bic.b   #JK_BEAT_BIT,JK_BEAT_IFG
IRQEN_A 	bis.b	#MO_ADV_BIT,MO_ADV_OUT
			bis.b	#MO_ADV_BIT,MO_ADV_REN
			bis.b   #MO_ADV_BIT,MO_ADV_IE
            bis.b   #MO_ADV_BIT,MO_ADV_IES
            bic.b   #MO_ADV_BIT,MO_ADV_IFG
IRQEN_C		bis.b	#MO_DUP_BIT,MO_DUP_REN
			bis.b	#MO_DUP_BIT,MO_DUP_OUT
			bis.b   #MO_DUP_BIT,MO_DUP_IE
            bis.b   #MO_DUP_BIT,MO_DUP_IES
            bic.b   #MO_DUP_BIT,MO_DUP_IFG
IRQEN_R     bis.b	#MO_RESET_BIT,MO_RESET_REN
            bis.b	#MO_RESET_BIT,MO_RESET_OUT
            bis.b   #MO_RESET_BIT,MO_RESET_IE
            bis.b   #MO_RESET_BIT,MO_RESET_IES
            bic.b   #MO_RESET_BIT,MO_RESET_IFG
IN_MODEA	bic.b	#SW_MODEA_BIT, SW_MODEA_DIR
			bis.b	#SW_MODEA_BIT, SW_MODEA_REN
			bis.b	#SW_MODEA_BIT, SW_MODEA_OUT
IN_MODEB	bic.b	#SW_MODEB_BIT, SW_MODEB_DIR
			bis.b	#SW_MODEB_BIT, SW_MODEB_REN
			bis.b	#SW_MODEB_BIT, SW_MODEB_OUT
IN_PAT0		bic.b	#SW_PAT0_BIT, SW_PAT0_DIR
			bis.b	#SW_PAT0_BIT, SW_PAT0_REN
			bis.b	#SW_PAT0_BIT, SW_PAT0_OUT
IN_PAT1		bic.b	#SW_PAT1_BIT, SW_PAT1_DIR
			bis.b	#SW_PAT1_BIT, SW_PAT1_REN
			bis.b	#SW_PAT1_BIT, SW_PAT1_OUT
ADC			bic.b	#ADC10ON, ADC10CTL0
DAC_REF		mov.b 	#0x75,R_DAC_CMD
			mov.w 	#0,R_DAC_DATA
			call    #DAC_CMD
			mov.w	#OCTAVE_OFFSET, dacA
			mov.w	#3*OCTAVE_OFFSET, dacB
			mov.w	#3*OCTAVE_OFFSET, dacC
			mov.w	#3*OCTAVE_OFFSET, dacD
			call    #DAC_OUT
			mov.w 	#0xFFFF, R6
DELAYL3  	dec.w 	R6
INITRAND 	jnz 	DELAYL3
			call	#RANGES
			cmp.w	#0xFFFF, min
			jnz		TEST_CAL
			call	#ADC_SEED
			call	#ADC_SEED
			call	#ADC_SEED
			call	#ADC_SEED
			call	#ADC_SEED
			mov.w	noise, rand1
			and.w	#0xFF, rand1
			call	#ADC_SEED
			call	#ADC_SEED
			mov.w	noise, rand2
			and.w	#0xFF, rand2
			mov.w	#0, R5
RAND_LOOP	call	#RANDOM_WORD
			call	#ADC_SEED
			add.w	noise, R_RANDW
			and.w	mask, R_RANDW
			mov.w 	R_RANDW, sequence(R5)
			add.w	#2, R5
			cmp.w	#2*SEQ_TOTAL, R5
			jnz 	RAND_LOOP
TEST_CAL	bit.b	#MO_RESET_BIT, MO_RESET_IN
			jz		CAL_LOOP
NO_CALIBRATE
TEST_RND	bit.b	#MO_ADV_BIT, MO_ADV_IN
			jnz		NO_RND
			mov.w	#0, R_SEQ
			call 	#SEQ_RND
			mov.w	#SEQ_SIZE, R_SEQ
			call 	#SEQ_RND
			mov.w	#2*SEQ_SIZE, R_SEQ
			call 	#SEQ_RND
NO_RND
IRQEN		bis.w 	#GIE, SR
PLAY_LOOP	bis.w   #CPUOFF+GIE,SR
			bit.w 	#SW_MODEA_BIT, SW_MODEA_IN
			jnz		MODEB
			mov.w	#MODE_REDUCED, mode
			jmp 	MODEDONE
MODEB		bit.w 	#SW_MODEB_BIT, SW_MODEB_IN
			jnz		MODEC
			mov.w	#MODE_CV, mode
			jmp 	MODEDONE
MODEC		mov.w	#MODE_FULL, mode
MODEDONE
			call	#MODE_NRM
			jmp 	PLAY_LOOP

CAL_LOOP	call 	#ADC_PITCH
			call 	#ADC_PITCH
			bit.b	#SW_RECA_BIT, SW_RECA_IN
			jnz		CAL_3V
CAL_ITERATE bit.b	#MO_DUP_BIT, MO_DUP_IN
			jnz		CAL_NO_SAVE
			cmp.w	#0, saved
			jnz		CAL_SKIP_SAVE
			mov.w	#1, saved
			bis.b	#MM_G3_BIT,MM_G3_OUT
			bis.b	#MM_G4_BIT,MM_G4_OUT
			call	#FLASH_SAVE
			jmp 	CAL_SKIP_SAVE
CAL_NO_SAVE	mov.w	#0, saved
CAL_SKIP_SAVE
			;mov.w	#3*OCTAVE_OFFSET, dacA
			;call	#DAC_OUT
			;call	#DELAY_LONG
			;mov.w	offset, calOfs
			;mov.w	#0, offset
			;call 	#ADC_PITCH
			;call 	#ADC_PITCH
			;mov.w	pitchAdc, cal2
			;mov.w	calOfs, offset
			mov.w	#8, R_RAND
			mov.w	#0, ofsSum

OFS_AVE		mov.w	#1*OCTAVE_OFFSET, dacA
			call	#CAL_OFFSET_POINT
			mov.w	pitchAdc, value1
			add.w	ofsPoint, ofsSum
			mov.w	#2*OCTAVE_OFFSET, dacA
			call	#CAL_OFFSET_POINT
			mov.w	pitchAdc, value2
			add.w	ofsPoint, ofsSum
			mov.w	#3*OCTAVE_OFFSET, dacA
			call	#CAL_OFFSET_POINT
			mov.w	pitchAdc, value3
			add.w	ofsPoint, ofsSum
			mov.w	#4*OCTAVE_OFFSET, dacA
			call	#CAL_OFFSET_POINT
			mov.w	pitchAdc, value4
			add.w	ofsPoint, ofsSum
			dec.w	R_RAND
			jnz		OFS_AVE
			rra.w	ofsSum				;average
			rra.w	ofsSum
			rra.w	ofsSum
			rra.w	ofsSum
			rra.w	ofsSum
			mov.w	ofsSum, offset

			mov.w	#2*OCTAVE_OFFSET, dacA
			call	#DAC_OUT
			call	#DELAY_LONG
			bis.b	#LED_RECORD_BIT, LED_RECORD_OUT
			call 	#ADC_PITCH
			call 	#ADC_PITCH
			bic.b	#LED_RECORD_BIT, LED_RECORD_OUT
			mov.w	pitchAdc, cal2
			mov.w	pitchAdc, value2

			mov.w	#1*OCTAVE_OFFSET, dacA
			call	#DAC_OUT
			call	#DELAY_LONG
			bis.b	#LED_RECORD_BIT, LED_RECORD_OUT
			call 	#ADC_PITCH
			call 	#ADC_PITCH
			bic.b	#LED_RECORD_BIT, LED_RECORD_OUT
			mov.w	pitchAdc, value1
			mov.w	dacA, cal1
			sub.w	pitchAdc, cal1

			mov.w	#3*OCTAVE_OFFSET, dacA
			call	#DAC_OUT
			call	#DELAY_LONG
			bis.b	#LED_RECORD_BIT, LED_RECORD_OUT
			call 	#ADC_PITCH
			call 	#ADC_PITCH
			bic.b	#LED_RECORD_BIT, LED_RECORD_OUT
			mov.w	dacA, cal3
			sub.w	pitchAdc, cal3
			mov.w	pitchAdc, value3

			cmp.w	cal3, cal1
			jge		CAL_ITER_UP
			bis.b	#MM_G1_BIT,MM_G1_OUT
			bic.b	#MM_G2_BIT,MM_G2_OUT
			jmp 	CAL_ITER_DONE
CAL_ITER_UP bic.b	#MM_G1_BIT,MM_G1_OUT
			bis.b	#MM_G2_BIT,MM_G2_OUT
CAL_ITER_DONE
			jmp 	CAL_LOOP
CAL_3V		bit.b	#SW_QUANTIZE_BIT, SW_QUANTIZE_IN
			jnz		CAL_REC
			mov.w	#3*OCTAVE_OFFSET, dacA
			mov.w	#3*OCTAVE_OFFSET, dacB
			mov.w	#3*OCTAVE_OFFSET, dacC
			mov.w	#3*OCTAVE_OFFSET, dacD
			call	#DAC_OUT
			jmp 	CAL_LOOP
CAL_REC		mov.w	pitchAdc, dacA
			mov.w	#3*OCTAVE_OFFSET, dacB
			mov.w	#3*OCTAVE_OFFSET, dacC
			mov.w	#3*OCTAVE_OFFSET, dacD
			call	#DAC_OUT
			jmp 	CAL_LOOP

CAL_OFFSET_POINT ; expects dacA to be set with the reference voltage
			call	#DAC_OUT
			call	#DELAY_LONG
			bis.b	#LED_RECORD_BIT, LED_RECORD_OUT
			mov.w	#0, offset
			call 	#ADC_PITCH
			call 	#ADC_PITCH
			bic.b	#LED_RECORD_BIT, LED_RECORD_OUT
			mov.w	dacA, ofsPoint
			sub.w	pitchAdc, ofsPoint
			ret

;-------------------------------------------------------------------------------
; normal mode
MODE_NRM	call	#SW_PATCH
DUP			cmp.w	#0, duplicate
			jz		NODUP
			call 	#ACTION_DUPLICATE
			mov.w	#0, duplicate
NODUP
RAND		cmp.w	#0, randomize
			jz		NORAND
			call 	#ACTION_RANDOMIZE
			mov.w	#0, randomize
NORAND

TIMECHECK	mov.w 	seqTime, R_SEQ
			cmp.w	lastTime, R_SEQ
			jnz 	TIMEPASSED
			ret
TIMEPASSED  mov.w	seqTime, lastTime

RECORD		bit.w   #SW_RECA_BIT, SW_RECA_IN
			jz		REC_LOOP
			bit.w   #SW_RECB_BIT, SW_RECB_IN
			jz		REC_OFF
			jmp 	REC_ONCE
REC_OFF		cmp.w	#0, recording
			jz		REC_RESET
			mov.w	#0, saved		; just finished recording so we need to save
REC_RESET	mov.w	#0, recCount
			mov.w	#0, recording
			jmp		REC_SKIP
REC_ONCE	cmp.w	#0, recording
			jz		REC_LOOP		; start recording as normal if we haven't been recording
			cmp.w	#0, recCount	; see if we are done with this cycle
			jnz		REC_ONESTEP
			cmp.w	#0, recSaved	; cycle has completed, do we need to save?
			jz		NOT_SAVED
			jmp		REC_SKIP
NOT_SAVED	mov.w	#0, saved		; mark for save
			mov.w	#1, recSaved	; mark as saved for this record
			jmp 	REC_SKIP
REC_ONESTEP dec.w	recCount
			jz		REC_SKIP
			jmp		REC_STEP
REC_LOOP	mov.w	#SEQ_LENGTH, recCount
			mov.w	#1, recording
			mov.w	#0, recSaved	; will eventually need saving
			jmp 	REC_STEP
REC_STEP	call 	#ADC_PITCH
			call 	#ADC_PITCH
SAVERECORD	mov.w 	seqTime, 	R_SEQ
            add.w 	R_SEQ, 		R_SEQ
            add.w   seqOfs, 	R_SEQ
            mov.w   pitchAdc, 	R_MAIN_TEMP
            mov.w   R_MAIN_TEMP, sequence(R_SEQ)
REC_SKIP	cmp.w	#0, recCount
			jz		REC_CLEAR
REC_SET     bis.b	#LED_RECORD_BIT, LED_RECORD_OUT
			jmp		REC_DONE
REC_CLEAR   bic.b	#LED_RECORD_BIT, LED_RECORD_OUT
REC_DONE

PLAYBACK	call	#RANGES
			call 	#ADC_RANDOM

MODE		cmp.w	#MODE_REDUCED, mode
			jz		M_REDUCED
			cmp.w	#MODE_FULL,mode
			jz		M_FULL
			cmp.w	#MODE_CV,mode
			jz		M_CV
M_CV	 	mov.w   #NO_MASK, mask
			call 	#RANDOMIZE_CV
			jmp		MODE_DONE
M_FULL 		mov.w   #NO_MASK, mask
			call 	#RANDOMIZE_PITCH
			jmp		MODE_DONE
M_REDUCED	mov.w   #LOW_MASK, mask
			call 	#RANDOMIZE_PITCH
			jmp		MODE_DONE
MODE_DONE

GET_BCD     mov.w 	seqTime, 	R_SEQ
            add.w 	R_SEQ, 		R_SEQ	; word size
			add.w 	#sequence, 	R_SEQ
			mov.w 	@R_SEQ, 	dacD

			add.w   #SEQ_SIZE, 	R_SEQ
			mov.w 	@R_SEQ, 	dacC

			add.w   #SEQ_SIZE, 	R_SEQ
			mov.w 	@R_SEQ, 	dacB

GET_A       mov.w 	seqTime, 	R_SEQ
            add.w 	R_SEQ, 		R_SEQ ; word size
            add.w   seqOfs, 	R_SEQ
            add.w 	#sequence, 	R_SEQ
            mov.w   @R_SEQ,		R_SEQ
            mov.w   R_SEQ,		dacA

            rrc.w	R_SEQ
            rrc.w	R_SEQ
            jnc		NOG0
            bis.b	#MM_G1_BIT,MM_G1_OUT
NOG0        rrc.w	R_SEQ
            jnc		NOG1
            bis.b	#MM_G2_BIT,MM_G2_OUT
NOG1        rrc.w	R_SEQ
            jnc		NOG2
            bis.b	#MM_G3_BIT,MM_G3_OUT
NOG2        rrc.w	R_SEQ
            jnc		NOG3
            bis.b	#MM_G4_BIT,MM_G4_OUT
NOG3		;
			bit.w	#SW_QUANTIZE_BIT, SW_QUANTIZE_IN
			jnz		NOQUANTIZE
			and.w   #QUANTIZE_MASK,dacA
			and.w   #QUANTIZE_MASK,dacB
			and.w   #QUANTIZE_MASK,dacC
			and.w   #QUANTIZE_MASK,dacD
NOQUANTIZE
			call    #DAC_OUT
			cmp.w	#1, saved
			jz		NOSAVE
			cmp.w 	#0, random
			jnz		NOSAVE
			call	#FLASH_SAVE
NOSAVE		ret

;-------------------------------------------------------------------------------
; arguments:
;   R_SEQ is sequence
; returns:
;   R_FROM minimum
;   R_TO maximum
; uses:
;	R_MAIN_TEMP
RANGE_SEQ	mov.w 	#SEQ_LENGTH, R_COUNT
			mov.w   @R_SEQ, R_MINVAL
			mov.w   R_MINVAL, R_MAXVAL
RANGE_LOOP	mov.w	@R_SEQ+, R_VAL
			cmp.w	R_VAL, R_MAXVAL
			jc		NOPEMIN
			mov.w	R_VAL, R_MAXVAL
NOPEMIN		cmp.w	R_MINVAL, R_VAL
			jc		NOPEMAX
			mov.w	R_VAL, R_MINVAL
NOPEMAX		dec.w	R_COUNT
			jnz		RANGE_LOOP
			ret

; destroys R_SEQ, R_MAXVAL, R_MINVAL
RANGES
RANGE1		mov.w	#sequence1, R_SEQ
			call	#RANGE_SEQ
			mov.w	R_MINVAL, min1
			mov.w	R_MAXVAL, max1
RANGE2		mov.w	#sequence2, R_SEQ
			call	#RANGE_SEQ
			mov.w	R_MINVAL, min2
			mov.w	R_MAXVAL, max2
RANGE3		call	#RANGE_SEQ
			mov.w	R_MINVAL, min3
			mov.w	R_MAXVAL, max3

			mov.w	min1, R_MINVAL
			cmp.w 	R_MINVAL, min2
			jc		NOTMIN2
			mov.w	min2, R_MINVAL
NOTMIN2		cmp.w 	R_MINVAL, min3
			jc		NOTMIN3
			mov.w	min3, R_MINVAL
NOTMIN3		mov.w	R_MINVAL, min

			mov.w	max1, R_MAXVAL
			cmp.w 	max2, R_MAXVAL
			jc		NOTMAX2
			mov.w	max2, R_MAXVAL
NOTMAX2		cmp.w 	max3, R_MAXVAL
			jc		NOTMAX3
			mov.w	max3, R_MAXVAL
NOTMAX3		mov.w	R_MAXVAL, max

			ret

;-------------------------------------------------------------------------------
; save action
ACTION_SAVE
			ret
;-------------------------------------------------------------------------------
; randomize action
ACTION_RANDOMIZE
			mov.w	seqOfs, R_SEQ
			call 	#SEQ_RND
			ret

; R_SEQ contains sequence offset
SEQ_RND		mov.w	#SEQ_LENGTH+1, R_RND
			add.w 	#sequence, R_SEQ
SEQ_LOOP	dec.w	R_RND
			jz		SEQ_RND_DONE
			call 	#ADC_SEED
			call 	#RANDOM_WORD
			add.w   noise, R_RANDW
			and.w   mask, R_RANDW
			mov.w   R_RANDW, 0(R_SEQ)
			add.w	#2, R_SEQ
			jmp 	SEQ_LOOP
SEQ_RND_DONE
			ret

;-------------------------------------------------------------------------------
; duplicate action
ACTION_DUPLICATE
			cmp.w	#0,	patch
			jz		NOTP0
			mov.w	#sequence, R_FROM
			add.w	seqOfs, R_FROM
			mov.w	#sequence, R_TO
			add.w	#0, R_TO
			call	#COPY_SEQ
NOTP0		cmp.w	#1,	patch
			jz		NOTP1
			mov.w	#sequence, R_FROM
			add.w	seqOfs, R_FROM
			mov.w	#sequence, R_TO
			add.w	#2*SEQ_LENGTH, R_TO
			call	#COPY_SEQ
NOTP1		cmp.w	#2,	patch
			jz		NOTP2
			mov.w	#sequence, R_FROM
			add.w	seqOfs, R_FROM
			mov.w	#sequence, R_TO
			add.w	#4*SEQ_LENGTH, R_TO
			call	#COPY_SEQ
NOTP2		ret
; R_FROM is from address
; R_SEQ is to address
COPY_SEQ	mov.w	#SEQ_LENGTH, R_COUNT
COPY_LOOP	mov.w	0(R_FROM), R_RANDW
			mov.w	R_RANDW, 0(R_TO)
			add.w	#2, R_FROM
			add.w	#2, R_TO
			dec.w	R_COUNT
			jnz		COPY_LOOP
COPY_DONE	ret


; R_FROM is from address
; R_SEQ is to address
LOAD_ALL	mov.w	#SAVE_LENGTH, R_COUNT
			mov.w	#FLASH_SEQ, R_FROM
			mov.w	#sequence, R_TO
LOAD_LOOP	mov.w	0(R_FROM), R_RANDW
			mov.w	R_RANDW, 0(R_TO)
			add.w	#2, R_FROM
			add.w	#2, R_TO
			dec.w	R_COUNT
			jnz		LOAD_LOOP
LOAD_DONE	ret

;-------------------------------------------------------------------------------
; save sequences to flash, takes about 20ms
FLASH_SAVE	mov.w	#FWKEY+FSSEL_1+40, FCTL2
			;bic.w 	#GIE, SR
 			call	#FLASH_ERASE
            mov.w	#sequence, R_FROM
            mov.w	#FLASH_SEQ, R_TO
            mov.w	#SAVE_LENGTH, R_COUNT
            call	#FLASH_WRITE
            mov.w	#1, saved
            ;bis.w 	#GIE, SR
            ret
FLASH_ERASE
L1 			bit.b 	#BUSY, &FCTL3 	; Test BUSY
			jnz 	L1 				; Loop while busy
			mov.w 	#FWKEY,&FCTL3	; Clear LOCK
			mov.w 	#FWKEY+ERASE, &FCTL1 ; Enable erase
			clr.w 	&FLASH_SEQ		; Dummy write, erase S1
L2 			bit.w 	#BUSY, &FCTL3 	; Test BUSY
			jnz 	L2 				; Loop while busy
			mov.w 	#FWKEY+LOCK,&FCTL3 ; Done, set LOCK
			ret
; R_FROM is from address
; R_TO is to address
; R_COUNT is count
FLASH_WRITE
			mov.w 	#FWKEY,&FCTL3 ; Clear LOCK
			mov.w	#FWKEY+WRT,&FCTL1 ; Enable write

FLASH_LOOP	mov.w	0(R_FROM), R_MAIN_TEMP
			mov.w 	R_MAIN_TEMP, 0(R_TO)
			add.w	#2, R_FROM
			add.w	#2, R_TO
			dec.w	R_COUNT
			jnz 	FLASH_LOOP
			mov.w 	#FWKEY,&FCTL1 ; Done. Clear
FLASH_DONE	ret

;-------------------------------------------------------------------------------
; read patch switch value, store in patch, set value in seqOfs
SW_PATCH	call	#ADC_PATCH
			mov.w	#1, patch
			bit.b	#SW_PAT1_BIT, SW_PAT1_IN
			jnz		NOT0
			mov.w	#0, patch
			jmp		SEQOFS
NOT0		bit.b	#SW_PAT0_BIT, SW_PAT0_IN
			jnz 	SEQOFS
			mov.w 	#2, patch
SEQOFS		add.w	patchOffset, patch
SEQRED		cmp.w	#3, patch
			jl		VALIDOFS
			sub.w	#3, patch
			jmp		SEQRED
VALIDOFS	mov 	patch, seqOfs
			rla.w   seqOfs ; * 2
			rla.w   seqOfs ; * 4
			rla.w   seqOfs ; * 8
			rla.w   seqOfs ; * 16
			rla.w   seqOfs ; * 32
			rla.w   seqOfs ; * 64 32 length plus word offset
			rla.w   seqOfs ; * 128  64 length plus word offset
			ret
;-------------------------------------------------------------------------------
; read temp CV in
; no oversample
; really fast
ADC_SEED	bit.w 	#ADC10BUSY, ADC10CTL1
			jnz		ADC_SEED
			mov.w	#4, R_COUNT
			mov.w   #ADC10SHT_1+ADC10ON+REFON+REF2_5V+SREF_1,&ADC10CTL0
            mov.w   #INCH_10, &ADC10CTL1
			bis.w   #ENC+ADC10SC,&ADC10CTL0
ADC_S_WAIT  bit.w 	#ADC10BUSY, ADC10CTL1
			jnz		ADC_S_WAIT
			add.w	ADC10MEM, R_COUNT
			rrc.w   R_COUNT
			rlc.w   noise
			rrc.w   R_COUNT
			rlc.w   noise
			ret
;-------------------------------------------------------------------------------
; read randomize CV in
; oversample by 4 so 12 bitish
; takes about 30 us
ADC_RANDOM	bit.w 	#ADC10BUSY, ADC10CTL1
			jnz		ADC_RANDOM
			mov.w	#0, randomAdc
			mov.w	#4, R_COUNT
			mov.w   #ADC10SHT_1+ADC10ON+REFON+REF2_5V+SREF_1,&ADC10CTL0
            mov.w   #INCH_2, &ADC10CTL1
            bis.b   #BIT2,&ADC10AE0
ADC_R_LOOP  bis.w   #ENC+ADC10SC,&ADC10CTL0
ADC_R_WAIT  bit.w 	#ADC10BUSY, ADC10CTL1
			jnz		ADC_R_WAIT
			add.w	ADC10MEM, randomAdc
			dec.w 	R_COUNT
			jnz		ADC_R_LOOP
			mov.w	randomAdc, R_KAVE
			mov.w	randomLast, R_KLAST
			call	#KNOB
			rra.w	R_KAVE
			mov.w	R_KAVE, random
			mov.w	R_KLAST, randomLast
			ret

;-------------------------------------------------------------------------------
; read patch CV in
; oversample by 4 so 12 bitish
; takes about 30 us
ADC_PATCH	bit.w 	#ADC10BUSY, ADC10CTL1
			jnz		ADC_PATCH
			mov.w	#0, patchAdc
			mov.w	#4, R_COUNT
			mov.w   #ADC10SHT_1+ADC10ON+REFON+REF2_5V+SREF_1,&ADC10CTL0
            mov.w   #INCH_3, &ADC10CTL1
            bis.b   #BIT3,&ADC10AE0
ADC_A_LOOP  bis.w   #ENC+ADC10SC,&ADC10CTL0
ADC_A_WAIT  bit.w 	#ADC10BUSY, ADC10CTL1
			jnz		ADC_A_WAIT
			add.w	ADC10MEM, patchAdc
			dec.w 	R_COUNT
			jnz		ADC_A_LOOP
			mov.w	patchAdc, R_KAVE
			mov.w	patchLast, R_KLAST
			call	#KNOB
			rra.w	R_KAVE
			rra.w	R_KAVE
			rra.w	R_KAVE
			cmp.w	#3, R_KAVE
			jnz		OFSOK
			mov.w	#2, R_KAVE
OFSOK		mov.w	R_KAVE, patchOffset
			mov.w	R_KLAST, patchLast
			ret

;-------------------------------------------------------------------------------
; read pitch CV in
; 10 bit 64x oversample (16 bitsish)
; takes about 400us
ADC_PITCH	bit.w 	#ADC10BUSY, ADC10CTL1
			jnz		ADC_PITCH
			mov.w	#0, pitchAdc
			mov.w	#32, R_COUNT
			mov.w   #ADC10SHT_3+ADC10ON+REFON+REF2_5V+SREF_1,&ADC10CTL0

            bis.b   #BIT0,&ADC10AE0
            bis.b   #BIT1,&ADC10AE0

ADC_P_LOOP  mov.w   #ADC10SSEL_3+INCH_0+ADC10DIV_3, &ADC10CTL1
			bis.w   #ENC+ADC10SC,&ADC10CTL0
ADC_P_WAIT0 bit.w 	#ADC10BUSY, ADC10CTL1
			nop
			nop
			jnz		ADC_P_WAIT0
			add.w	ADC10MEM, pitchAdc
            mov.w   #ADC10SSEL_3+INCH_1+ADC10DIV_3, &ADC10CTL1
 			bis.w   #ENC+ADC10SC,&ADC10CTL0
ADC_P_WAIT1 bit.w 	#ADC10BUSY, ADC10CTL1
			nop
			nop
			jnz		ADC_P_WAIT1
			add.w	ADC10MEM, pitchAdc
			dec.w 	R_COUNT
			jnz		ADC_P_LOOP

			bit.w	#0x8000, offset
			jz		ADC_P_POS
ADC_P_NEG
			bit.w	#0x8000, pitchAdc
			jnz		ADC_P_N_AD
			mov.w	offset, R_KAVE
			inv.w	R_KAVE
			inc.w	R_KAVE
			cmp.w	R_KAVE, pitchAdc
			jl		ADC_P_N_CL
ADC_P_N_AD	add.w	offset, pitchAdc
			jmp		ADC_P_DONE
ADC_P_N_CL	mov.w	#0, pitchAdc
			jmp		ADC_P_DONE

ADC_P_POS	add.w	offset, pitchAdc ; if offset is positive and pitchAdc carries (overflow) than pitchAdc is zero
			jnc		ADC_P_DONE
			mov.w	#0xFFFF, pitchAdc
			jmp		ADC_P_DONE
ADC_P_DONE
			ret

;-------------------------------------------------------------------------------
;IN:  R_KAVE is current average, R_KLAST is last used value
;OUT: R_KAVE current knob value, R_KLAST value to save as last used
;DESTROYED: R_KSUB
KNOB
			mov.w 	R_KLAST, R_KSUB
			sub.w  	R_KAVE, R_KSUB
			bit.w 	#0x8000, R_KSUB ; abs? no
			jz		KNOBPOS
			inv.w 	R_KSUB
			inc.w   R_KSUB
KNOBPOS
			cmp.w 	#0x40,	R_KSUB
			jge     KNOBNEWVAL
KNOBOLDVAL	mov.w 	R_KLAST, R_KAVE
			jmp 	KNOBROUND
KNOBNEWVAL	mov.w   R_KAVE, R_KLAST
KNOBROUND	add.w  	#64, R_KAVE ; move value into center
			cmp.w   #0x1000, R_KAVE
			jl 		SHIFTKNOB
			mov.w  	#0xFFF, R_KAVE
SHIFTKNOB	rra.w 	R_KAVE ;11
			rra.w 	R_KAVE ;10
			rra.w 	R_KAVE ; 9
			rra.w 	R_KAVE ; 8
			rra.w 	R_KAVE ; 7
			rra.w 	R_KAVE ; 6
			rra.w 	R_KAVE ; 5
			ret
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
; R_DAC_CMD 8 bit cmd field, R_DAC_DATA 16 bit data field, destroys R_DAC_COUNT
DAC_CMD		bis.b 	#DAC_CS_BIT, DAC_CS_OUT
			bic.b 	#DAC_CLK_BIT, DAC_CLK_OUT
			bic.b 	#DAC_CS_BIT, DAC_CS_OUT
			mov.w 	#8, R_DAC_COUNT
CMD_SHIFT 	bic.b 	#DAC_CLK_BIT, DAC_CLK_OUT
			rlc.b	R_DAC_CMD
			jc		CMD_SET
			bic.b   #DAC_DIN_BIT, DAC_DIN_OUT
			jmp 	CMD_LOOP
CMD_SET		bis.b   #DAC_DIN_BIT, DAC_DIN_OUT
CMD_LOOP	bis.b 	#DAC_CLK_BIT, DAC_CLK_OUT
			dec.w 	R_DAC_COUNT
			jnz 	CMD_SHIFT
DAC_DATA	mov.w 	#16, R_DAC_COUNT
DATA_SHIFT 	bic.b 	#DAC_CLK_BIT, DAC_CLK_OUT
			rlc.w	R_DAC_DATA
			jc		DATA_SET
			bic.b   #DAC_DIN_BIT, DAC_DIN_OUT
			jmp 	DATA_LOOP
DATA_SET	bis.b   #DAC_DIN_BIT, DAC_DIN_OUT
DATA_LOOP	bis.b 	#DAC_CLK_BIT, DAC_CLK_OUT
			dec.w 	R_DAC_COUNT
			jnz 	DATA_SHIFT
			bic.b 	#DAC_CLK_BIT, DAC_CLK_OUT
			bis.b 	#DAC_CS_BIT, DAC_CS_OUT
			ret
; DAC_OUT -------------------------------------------------------------------------------
; send current DAC state to DAC
DAC_OUT
DAC_A		mov.b 	#0x00,R_DAC_CMD
			mov.w 	dacA,R_DAC_DATA
			call    #DAC_CMD
DAC_B		mov.b 	#0x01,R_DAC_CMD
			mov.w 	dacB,R_DAC_DATA
			call    #DAC_CMD
DAC_C		mov.b 	#0x02,R_DAC_CMD
			mov.w 	dacC,R_DAC_DATA
			call    #DAC_CMD
DAC_D		mov.b 	#0x03,R_DAC_CMD
			mov.w 	dacD,R_DAC_DATA
			call    #DAC_CMD
DAC_LOAD	mov.b 	#0x18,R_DAC_CMD
			mov.w 	#0x0,R_DAC_DATA
			call    #DAC_CMD
DAC_DONE	ret
; RANDOMIZE_PITCH ------------------------------------------------------------------------------
;
RANDOMIZE_CV
			call 	#RANDOM_BYTE
			and.w 	#0xF,R_RAND
			mov.w	random, R_RANDW
			cmp.b 	R_RANDW, R_RAND
			jc 		RANDOM_DONE
			mov.w	#0, saved

			call 	#ADC_SEED
			call 	#RANDOM_WORD
			add.w   noise, R_RANDW
			mov.w  	randomLast, R_RAND
			add.w	#0x0F, R_RAND
			clrc
			rlc.w	R_RAND ;clear zeros
			rlc.w	R_RAND
			rlc.w	R_RAND
REDUCE_CV	clrc
			rlc.w	R_RAND
			jc 		RANDOM_SAVE
			rra.w	R_RANDW
			jmp		REDUCE_CV

RANDOMIZE_PITCH
			call 	#RANDOM_BYTE
			and.w 	#0xF,R_RAND
			mov.w	random, R_RANDW
			cmp.b 	R_RANDW, R_RAND
			jc 		RANDOM_DONE
			mov.w	#0, saved
			rra.b 	R_RANDW 			; randw has knob 0-7
 			call 	#RANDOM_BYTE
			and.w 	#0x7,R_RAND
			add.w   R_RANDW, R_RAND 	; R_RAND 0-14
			rla.w 	R_RAND 				; word size
RANDOM_LOAD	mov 	seqTime, R_RANDW 	;R_RANDW has current seq value
			rla.w 	R_RANDW
			add.w 	seqOfs, R_RANDW
			mov.w 	sequence(R_RAND), R_RANDW
			add.w 	R_RAND, PC
			jmp 	RANDOM_5TH
			jmp 	RANDOM_8VA
			jmp 	RANDOM_5TH
			jmp 	RANDOM_5TH
			jmp 	RANDOM_8VA
			jmp 	RANDOM_AVE
			jmp 	RANDOM_5TH
			jmp 	RANDOM_8VA
			jmp 	RANDOM_OFS
			jmp 	RANDOM_5TH
			jmp 	RANDOM_AVE
			jmp 	RANDOM_RND
			jmp 	RANDOM_OFS
			jmp 	RANDOM_AVE
			jmp 	RANDOM_OFS
			jmp 	RANDOM_OFS ; 15
RANDOM_RND	call  	#RANDOM_WORD
			jmp 	RANDOM_SAVE
RANDOM_5TH	call 	#RANDOM_BYTE
			rrc.w 	R_RAND
			rrc.w 	R_RAND
			rrc.w 	R_RAND
			mov.w 	#FIFTH_OFFSET, R_RAND
			jnc 	RANDOM_5UP
RANDOM_5DN  inv.w   R_RAND
			inc.w   R_RAND
RANDOM_5UP  add.w 	R_RAND, R_RANDW
			jmp 	RANDOM_SAVE
RANDOM_AVE  call 	#RANDOM_BYTE
			and.w 	#SEQ_MASK, R_RAND
			rla.w 	R_RAND
			add.w 	seqOfs, R_RAND
			mov.w 	sequence(R_RAND), R_RANDW
			call 	#RANDOM_BYTE
			and.w 	#SEQ_MASK, R_RAND
			rla.w 	R_RAND
			add.w 	seqOfs, R_RAND
			mov.w 	sequence(R_RAND), R_RAND
			clrc
			rrc 	R_RAND
			clrc
			rrc 	R_RANDW
			add.w 	R_RAND, R_RANDW
			jmp 	RANDOM_SAVE
RANDOM_8VA  nop
			call 	#RANDOM_BYTE
			rrc.w 	R_RAND ; lowest bit is not very random
			rrc.w 	R_RAND
			mov.w 	#OCTAVE_OFFSET, R_RAND
			jnc 	RANDOM_8UP
RANDOM_8DN  inv.w   R_RAND
			inc.w   R_RAND
RANDOM_8UP  add.w 	R_RAND, R_RANDW
			and.w   mask, R_RANDW
			jmp 	RANDOM_SAVE
RANDOM_OFS  call 	#RANDOM_BYTE
			;mov.w 	noise, R_RAND
			and.w 	#OFFSET_MASK, R_RAND
			add.w 	R_RAND, R_RANDW
			jmp 	RANDOM_SAVE
RANDOM_SAVE and.w   mask, R_RANDW
			mov 	seqTime, R_RAND
			rla.w 	R_RAND
			add.w 	seqOfs, R_RAND
			mov.w 	R_RANDW, sequence(R_RAND)
RANDOM_DONE	ret
RANDOM_BYTE	; result in R_RAND
			mov.w 	rand1, R_RAND
			mov.b   RANDOM(R_RAND), R_RAND
			inc.w   rand1
			and.w	#0xFF, rand1
			ret
RANDOM_WORD ; result in R_RANDW, trashes R_RAND
			mov.w 	rand1, R_RAND
			mov.b   RANDOM(R_RAND), R_RAND
			mov.w 	#0, R_RANDW
			mov.w 	rand2, R_RANDW
			mov.b   RANDOM(R_RANDW), R_RANDW
			swpb 	R_RANDW
			or.w 	R_RAND, R_RANDW
			inc.w   rand1
			and.w	#0xFF, rand1
			inc.w   rand2
			and.w	#0xFF, rand2
			ret
;-------------------------------------------------------------------------------

DELAY_SHORT
			mov.w   #8000, R_IRQ_TEMP
DELAYL		dec.w   R_IRQ_TEMP
            jnz     DELAYL
            ret

DELAY_LONG
			call	#DELAY_SHORT
			call	#DELAY_SHORT
			call	#DELAY_SHORT
			call	#DELAY_SHORT
            ret


;-------------------------------------------------------------------------------
; IRQ
;-------------------------------------------------------------------------------

PISR
			mov.w   #2500, R_IRQ_TEMP
P2DELAY		dec.w   R_IRQ_TEMP
            jnz     P2DELAY

I_MO_DUP	bit.b   #MO_DUP_BIT,MO_DUP_IFG
			jz		E_MO_DUP
			mov.w	#1, duplicate
			bic.b   #MO_DUP_BIT,MO_DUP_IFG
E_MO_DUP

I_MO_RST	bit.b	#MO_RESET_BIT, MO_RESET_IFG
			jz 		E_MO_RST
			mov.w	#0, seqTime
			mov.w	#0, recCount
			bic.b	#MO_RESET_BIT, MO_RESET_IFG
E_MO_RST

I_MO_ADV	bit.b	#MO_ADV_BIT,MO_ADV_IFG
			jz 		E_MO_ADV
			bit.b	#MO_ADV_BIT, MO_ADV_IN
			jz		ADV_DOWN
ADV_UP		bic.b	#MM_G1_BIT,MM_G1_OUT
			bic.b	#MM_G2_BIT,MM_G2_OUT
			bic.b	#MM_G3_BIT,MM_G3_OUT
			bic.b	#MM_G4_BIT,MM_G4_OUT
			jmp		E_MO_ADV
ADV_DOWN	call 	#TIMEADV
			bic.w   #LPM0,0(SP)
			bic.b   #MO_ADV_BIT,MO_ADV_IFG
E_MO_ADV	xor.b   #MO_ADV_BIT,MO_ADV_IES
			bic.b   #MO_ADV_BIT,MO_ADV_IFG

I_JK_MES	bit.b	#JK_MEASURE_BIT,JK_MEASURE_IFG
			jz 		E_JK_MES
			mov.w 	#0, seqTime
			mov.w	#0, recCount
			bic.b   #JK_MEASURE_BIT,JK_MEASURE_IFG
E_JK_MES

ISRBEAT		bit.b	#JK_BEAT_BIT,JK_BEAT_IFG
			jz 		BEAT_NOPE
			bit.b	#MO_DUP_BIT, MO_DUP_IN
			jz		BEAT_NORST
			bit.b	#MO_RESET_BIT, MO_RESET_IN
			jz		BEAT_NOPE
BEAT_NORST	bit.b	#JK_BEAT_BIT, JK_BEAT_IN
			jz		BEAT_DOWN
			call 	#TIMEADV
			bic.w   #LPM0,0(SP)
			jmp 	BEAT_DONE
BEAT_DOWN	bic.b	#MM_G1_BIT,MM_G1_OUT
			bic.b	#MM_G2_BIT,MM_G2_OUT
			bic.b	#MM_G3_BIT,MM_G3_OUT
			bic.b	#MM_G4_BIT,MM_G4_OUT
BEAT_DONE	xor.b   #JK_BEAT_BIT,JK_BEAT_IES
			bic.b   #JK_BEAT_BIT,JK_BEAT_IFG
BEAT_NOPE
ISRDONE		reti
TIMEADV 	inc.w 	seqTime
            cmp.w 	#SEQ_LENGTH,  seqTime
            jnc 	TIMEADVDONE
            mov.w 	#0, seqTime
TIMEADVDONE ret



ADC10_ISR	reti
EMPTY_ISR	reti
;-------------------------------------------------------------------------------
;           Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect 	.stack

;-------------------------------------------------------------------------------
;           Interrupt Vectors
;-------------------------------------------------------------------------------
	.sect   ".reset"                ; MSP430 RESET Vector
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
	.short ADC10_ISR

	.sect   ".int06" ; wdt
	.short EMPTY_ISR

	.sect   ".int07" ; wdt
	.short EMPTY_ISR

	.sect   ".int08" ; timera1
	.short EMPTY_ISR

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
