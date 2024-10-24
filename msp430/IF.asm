; Copyright (C) Noise Engineering 
; see LICENSE.md for details
;

    .cdecls C,LIST,"msp430.h"       ; Include device header file

	.sect ".const"


; - pin  1     VCC
; - pin  2 1.0 CV1
JI_CV1_BIT	.equ	BIT0
; - pin  3 1.1 CV2
JI_CV2_BIT	.equ	BIT1
; - pin  4 1.2 CV3
JI_CV3_BIT  .equ	BIT1
; - pin  5 1.3 CV4
JI_CV4_BIT  .equ	BIT1
; - pin  6 1.4 CV burn
JI_BURN_BIT			.equ	BIT4
; - pin  7 1.5 burn momentary
SM_BURN_BIT			.equ	BIT5
SM_BURN_OUT			.equ	P1OUT
SM_BURN_IN			.equ	P1IN
SM_BURN_DIR			.equ	P1DIR
SM_BURN_REN			.equ	P1REN
; - pin  8 2.0 MODEA
SM_MODEA_BIT		.equ	BIT0
SM_MODEA_OUT		.equ	P2OUT
SM_MODEA_IN			.equ	P2IN
SM_MODEA_DIR		.equ	P2DIR
SM_MODEA_REN		.equ	P2REN
; - pin  9 2.1 MODEB
SM_MODEB_BIT		.equ	BIT1
SM_MODEB_OUT		.equ	P2OUT
SM_MODEB_IN			.equ	P2IN
SM_MODEB_DIR		.equ	P2DIR
SM_MODEB_REN		.equ	P2REN
; - pin 10 2.2 OUT4
JO_OUT4_BIT			.equ	BIT2
JO_OUT4_OUT			.equ	P2OUT
JO_OUT4_DIR			.equ	P2DIR
; - pin 11 2.3 OUT1
JO_OUT1_BIT			.equ	BIT3
JO_OUT1_OUT			.equ	P2OUT
JO_OUT1_DIR			.equ	P2DIR
; - pin 12 2.4 OUT2
JO_OUT2_BIT			.equ	BIT4
JO_OUT2_OUT			.equ	P2OUT
JO_OUT2_DIR			.equ	P2DIR
; - pin 13 2.5 OUT3
JO_OUT3_BIT			.equ	BIT5
JO_OUT3_OUT			.equ	P2OUT
JO_OUT3_DIR			.equ	P2DIR
; - pin 14 1.6 IN1
JI_IN1_BIT			.equ	BIT6
JI_IN1_OUT			.equ	P1OUT
JI_IN1_IN			.equ	P1IN
JI_IN1_DIR			.equ	P1DIR
JI_IN1_IE			.equ	P1IE
JI_IN1_IES			.equ	P1IES
JI_IN1_IFG			.equ	P1IFG
; - pin 15 1.7 IN2
JI_IN2_BIT			.equ	BIT7
JI_IN2_OUT			.equ	P1OUT
JI_IN2_IN			.equ	P1IN
JI_IN2_DIR			.equ	P1DIR
JI_IN2_IE			.equ	P1IE
JI_IN2_IES			.equ	P1IES
JI_IN2_IFG			.equ	P1IFG
; - pin 16 RST
; - pin 17 TEST
; - pin 18 2.7 IN3
JI_IN3_BIT			.equ	BIT7
JI_IN3_OUT			.equ	P2OUT
JI_IN3_IN			.equ	P2IN
JI_IN3_DIR			.equ	P2DIR
JI_IN3_IE			.equ	P2IE
JI_IN3_IES			.equ	P2IES
JI_IN3_IFG			.equ	P2IFG
; - pin 19 2.6 IN4
JI_IN4_BIT			.equ	BIT6
JI_IN4_OUT			.equ	P2OUT
JI_IN4_IN			.equ	P2IN
JI_IN4_DIR			.equ	P2DIR
JI_IN4_IE			.equ	P2IE
JI_IN4_IES			.equ	P2IES
JI_IN4_IFG			.equ	P2IFG
; - pin 20 GND


; registers ----------------------------------------------------------------
R_MODE	.equ R4
R_5 	.equ R5
R_RAND	.equ R6
R_RAND_KNOB		.equ R7
R_8 	.equ R8
R_DELAY	.equ R9
R_MASK	.equ R10
R_SUB	.equ R11
R_LAST	.equ R12
R_AVE	.equ R13
R_INPUT	.equ R14
R_BIT 	.equ R15


mask1	.byte 	0001b, 0011b, 0101b, 1001b, 0111b, 1011b, 1101b, 1111b, 0000b
mask2	.byte 	0010b, 0011b, 0110b, 1010b, 0111b, 1011b, 1110b, 1111b, 0000b
mask3	.byte 	0100b, 0101b, 0110b, 1100b, 0111b, 1101b, 1110b, 1111b, 0000b
mask4	.byte 	1000b, 1001b, 1010b, 1100b, 1011b, 1101b, 1110b, 1111b, 0000b


curve    .word      0x0474,   0x04F6,   0x0588,   0x062A,   0x06DE,   0x07A8,   0x0888,   0x0982
         .word      0x0A99,   0x0BCF,   0x0D29,   0x0EAB,   0x1058,   0x1237,   0x144D,   0x169F
         .word      0x1936,   0x1C18,   0x1F4F,   0x22E4,   0x26E2,   0x2B55,   0x304A,   0x35D0
         .word      0x3BF8,   0x42D4,   0x4A79,   0x52FE,   0x5C7C,   0x6711,   0x72DB,   0x7FFF
; DATA -------------------------------------------------------------------------------
	.data

adcBase     		;address for continual conversions

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

adcAve0 			.word   0
adcAve1				.word   0
adcAve2 			.word   0
adcAve3 			.word   0
adcAve4 			.word   0

adcLast0 			.word   0
adcLast1			.word   0
adcLast2 			.word   0
adcLast3 			.word   0
adcLast4 			.word   0

lknob0 				.word   0
lknob1				.word   0
lknob2 				.word   0
lknob3 				.word   0
lknob4 				.word   0

rknob0 				.word   0
rknob1				.word   0
rknob2 				.word   0
rknob3 				.word   0
rknob4 				.word   0

shiftw				.word	0

lastBurn			.word	0
thisBurn			.word	0

; TEXT ------------------------------------------------------------------------------
            .text
            .retain
            .retainrefs
            .global RESET

RESET       mov.w   #__STACK_END,SP
KILLWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL
OUTPORTS	mov.b   #0, P2SEL
			mov.b   #0, P1SEL
			mov.b   #0, P2IFG
            mov.b   #0, P1IFG
            mov.b	#0, P1OUT
            mov.b	#0, P2OUT
            mov.w	#0, P1DIR
			mov.w	#0, P2DIR
			mov.w	#0, P1IFG
			mov.w	#0, P2IFG
			mov.w	#0, P1IE
			mov.w	#0, P2IE
			mov.w	#0, P1IES
			mov.w	#0, P2IES
			bis.w	#JI_IN1_BIT, JI_IN1_DIR
			bis.w	#JI_IN2_BIT, JI_IN2_DIR
			bis.w	#JI_IN3_BIT, JI_IN3_DIR
			bis.w	#JI_IN4_BIT, JI_IN4_DIR
			bis.w	#JO_OUT1_BIT, JO_OUT1_DIR
			bis.w	#JO_OUT2_BIT, JO_OUT2_DIR
			bis.w	#JO_OUT3_BIT, JO_OUT3_DIR
			bis.w	#JO_OUT4_BIT, JO_OUT4_DIR
STARTDELAY  mov.w   #0xFF, R6
STARTLOOP1  mov.w  	#0xFFF, R5
STARTLOOP2	dec.w   R5
            jnz     STARTLOOP2
            mov.b	R6, P1OUT
            mov.b	R6, P2OUT
			dec.w   R6
            jnz 	STARTLOOP1
			mov.b	#0, P1OUT
            mov.b	#0, P2OUT

MEMORY		mov.w	#0, R_INPUT

IN1			bic.w	#JI_IN1_BIT,JI_IN1_DIR
			bis.b   #JI_IN1_BIT,JI_IN1_IE
            bic.b   #JI_IN1_BIT,JI_IN1_IES
            bic.b   #JI_IN1_BIT,JI_IN1_IFG

IN2			bic.w	#JI_IN2_BIT,JI_IN2_DIR
			bis.b   #JI_IN2_BIT,JI_IN2_IE
            bic.b   #JI_IN2_BIT,JI_IN2_IES
            bic.b   #JI_IN2_BIT,JI_IN2_IFG

IN3			bic.w	#JI_IN3_BIT,JI_IN3_DIR
			bis.b   #JI_IN3_BIT,JI_IN3_IE
            bic.b   #JI_IN3_BIT,JI_IN3_IES
            bic.b   #JI_IN3_BIT,JI_IN3_IFG

IN4			bic.w	#JI_IN4_BIT,JI_IN4_DIR
			bis.b   #JI_IN4_BIT,JI_IN4_IE
            bic.b   #JI_IN4_BIT,JI_IN4_IES
            bic.b   #JI_IN4_BIT,JI_IN4_IFG

BURNSM		bic.b  #SM_BURN_BIT, SM_BURN_DIR
			bis.b  #SM_BURN_BIT, SM_BURN_REN
			bis.b  #SM_BURN_BIT, SM_BURN_OUT

MODESW		bic.b  #SM_MODEA_BIT, SM_MODEA_DIR
			bis.b  #SM_MODEA_BIT, SM_MODEA_REN
			bis.b  #SM_MODEA_BIT, SM_MODEA_OUT

			bic.b  #SM_MODEB_BIT, SM_MODEB_DIR
			bis.b  #SM_MODEB_BIT, SM_MODEB_REN
			bis.b  #SM_MODEB_BIT, SM_MODEB_OUT

DCO			mov.b 	CALDCO_16MHZ, DCOCTL
			mov.b 	CALBC1_16MHZ, BCSCTL1

LFO			bis.b	#DIVA_3, BCSCTL1
			mov.b	#LFXT1S_2, BCSCTL3

ADC			mov.w   #INCH_4+CONSEQ_3,&ADC10CTL1 ; A3-A0, repeat multi channel
    		mov.w   #ADC10SHT_3+MSC+ADC10ON+REFON+REF2_5V+SREF_1,&ADC10CTL0
    			; /64 clk, multiple conversions, power on, interrupt enable, high sample rate,
    			; use internal reference,  reference set to 2.5V,  use internal VR, continuous transfer
			mov.b	#0, ADC10AE0
			bis.b   #JI_CV1_BIT,&ADC10AE0
    		bis.b   #JI_CV2_BIT,&ADC10AE0
    		bis.b   #JI_CV3_BIT,&ADC10AE0
    		bis.b   #JI_CV4_BIT,&ADC10AE0
    		bis.b   #JI_BURN_BIT,&ADC10AE0
			bis.b   #ADC10CT, &ADC10DTC0
    		mov.b   #20,&ADC10DTC1
busy_test   bit     #BUSY,&ADC10CTL1        	; ADC10 core inactive?
            jnz     busy_test
    		mov.w   #adcBase,&ADC10SA        	 ; Data buffer start
    		bis.w   #ENC+ADC10SC+ADC10DIV_7,&ADC10CTL0 ; Start sampling

IRQON		bis.w   #GIE, SR
MAINLOOP	bis.w   #CPUOFF+GIE,SR
			jmp		MAINLOOP

; RAND -----------------
RAND15		clr.b 	R_RAND 			; clear temp register
			bit.w 	#BITE,shiftw	; C is set if bit is set
			adc.b 	R_RAND			; temp is 1 if first bit was set
			bit.w 	#BITD,shiftw	; C is set if bit is set
			adc.b 	R_RAND			; temp is 0 if neither set, 1 if either set and 2 if both set (bit0 is xor)
			bit.b 	#BIT0, R_RAND
			rlc.w 	shiftw			; shift xored value in
			cmp.w 	#0, shiftw		; check for invalid shift register state
			jne   	LFSR_BYE
			mov.w 	#0x1,shiftw		; if register is invalid make it valid
LFSR_BYE	mov.w 	shiftw, R_RAND
			and.w	#0x7FFF, R_RAND
			ret


; input: R_RAND_KNOB output carry flag (set means no process)
TEST_RANDOM
			cmp.w	#0, R_RAND_KNOB ; always skip if knob is zero
			jz		SKIP
			add.w 	R_RAND_KNOB, R_RAND_KNOB	; load value to test random against
			add.w	#curve, R_RAND_KNOB
			mov.w	@R_RAND_KNOB, R_RAND_KNOB
			call	#RAND15
			call	#RAND15
			call	#RAND15
			cmp.w	R_RAND_KNOB, R_RAND
			jn		PLAY
			jmp 	SKIP
PLAY		call	#RAND15
			clrc
			ret
SKIP		setc
			ret

;------------------------------------------------------------------------------

;IN:  R_AVE is current average, R_LAST is last used value
;OUT: R_AVE current knob value, R_LAST value to save as last used
;DESTROYED: R_SUB
KNOB
			mov.w 	R_LAST, R_SUB
			sub.w  	R_AVE, R_SUB
			bit.w 	#0x8000, R_SUB ; abs? no
			jz		KNOBPOS
			inv.w 	R_SUB
			inc.w   R_SUB
KNOBPOS
			cmp.w 	#0x40,	R_SUB
			jge     KNOBNEWVAL
KNOBOLDVAL	mov.w 	R_LAST, R_AVE
			jmp 	KNOBROUND
KNOBNEWVAL	mov.w   R_AVE, R_LAST
KNOBROUND	add.w  	#64, R_AVE ; move value into center
			cmp.w   #0x1000, R_AVE
			jl 		SHIFTKNOB
			mov.w  #0xFFF, R_AVE
SHIFTKNOB	rra.w 	R_AVE ;11
			rra.w 	R_AVE ;10
			rra.w 	R_AVE ; 9
			rra.w 	R_AVE ; 8
			rra.w 	R_AVE ; 7
			rra.w 	R_AVE ; 6
			rra.w 	R_AVE ; 5
			ret
;------------------------------------------------------------------------------
; KNOBS
KNOBS
AVE4		mov.w 	#0, adcAve4
			add.w 	adcIn4a, adcAve4
			add.w 	adcIn4b, adcAve4
			add.w 	adcIn4c, adcAve4
			add.w 	adcIn4d, adcAve4
K4			mov.w 	adcAve4, R_AVE
			mov.w 	adcLast4, R_LAST
			call	#KNOB
			mov.w 	R_AVE, rknob4
			mov.w 	R_AVE, lknob4
			mov.w   R_LAST, adcLast4

AVE3		mov.w 	#0, adcAve3
			add.w 	adcIn3a, adcAve3
			add.w 	adcIn3b, adcAve3
			add.w 	adcIn3c, adcAve3
			add.w 	adcIn3d, adcAve3
K3			mov.w 	adcAve3, R_AVE
			mov.w 	adcLast3, R_LAST
			call	#KNOB
			mov.w 	R_AVE, rknob3
			mov.w 	R_AVE, lknob3
			mov.w   R_LAST, adcLast3

AVE2		mov.w 	#0, adcAve2
			add.w 	adcIn2a, adcAve2
			add.w 	adcIn2b, adcAve2
			add.w 	adcIn2c, adcAve2
			add.w 	adcIn2d, adcAve2
K2			mov.w 	adcAve2, R_AVE
			mov.w 	adcLast2, R_LAST
			call	#KNOB
			mov.w 	R_AVE, rknob2
			mov.w 	R_AVE, lknob2
			mov.w   R_LAST, adcLast2

AVE1		mov.w 	#0, adcAve1
			add.w 	adcIn1a, adcAve1
			add.w 	adcIn1b, adcAve1
			add.w 	adcIn1c, adcAve1
			add.w 	adcIn1d, adcAve1
K1			mov.w 	adcAve1, R_AVE
			mov.w 	adcLast1, R_LAST
			call	#KNOB
			mov.w 	R_AVE, rknob1
			mov.w 	R_AVE, lknob1
			mov.w   R_LAST, adcLast1

AVE0		mov.w 	#0, adcAve0
			add.w 	adcIn0a, adcAve0
			add.w 	adcIn0b, adcAve0
			add.w 	adcIn0c, adcAve0
			add.w 	adcIn0d, adcAve0
K0			mov.w 	adcAve0, R_AVE
			mov.w 	adcLast0, R_LAST
			call	#KNOB
			mov.w 	R_AVE, lknob0
			mov.w 	R_AVE, rknob0
			mov.w   R_LAST, adcLast0
BURN		bit.b	#SM_BURN_BIT, SM_BURN_IN
			jnz		NO_SM_BURN
			mov.w	#0x1E, lknob0
			mov.w	#0x1E, lknob1
			mov.w	#0x1E, lknob2
			mov.w	#0x1E, lknob3
			mov.w	#0x1F, rknob0
			mov.w	#0x1F, rknob1
			mov.w	#0x1F, rknob2
			mov.w	#0x1F, rknob3
			mov.w	#1, thisBurn
			jmp		BURN_DONE
NO_SM_BURN  mov.w	#0,	thisBurn
			cmp.w	#1, lastBurn	;falling edge of burn
			jnz		BURN_DONE
			mov.w	#0, R_INPUT
BURN_DONE	mov.w	thisBurn, lastBurn



LBURN_CV	cmp.w	#0, lknob4
			jz		LBURN_NOCV
LBURN_CV_0	add.w	lknob4, lknob0		;this looks wrong
			and.w	#0x1F, lknob0
			cmp.w	#0x1f, lknob0
			jnz		LBURN_CV_1
			mov.w	#0x1E, lknob0

LBURN_CV_1	add.w	lknob4, lknob1
			and.w	#0x1F, lknob1
			cmp.w	#0x1f, lknob1
			jnz		LBURN_CV_2
			mov.w	#0x1E, lknob1

LBURN_CV_2	add.w	lknob4, lknob2
			and.w	#0x1F, lknob2
			cmp.w	#0x1f, lknob2
			jnz		LBURN_CV_3
			mov.w	#0x1E, lknob2

LBURN_CV_3	add.w	lknob4, lknob3
			and.w	#0x1F, lknob3
			cmp.w	#0x1f, lknob3
			jnz		LBURN_CV_4
			mov.w	#0x1E, lknob3
LBURN_CV_4
LBURN_NOCV

RBURN_CV	cmp.w	#0, rknob4
			jz		RBURN_NOCV
RBURN_CV_0	add.w	rknob4, rknob0
			cmp.w	#0x1F, rknob0
			jn		RBURN_CV_1
			mov.w	#0x1F, rknob0
RBURN_CV_1	add.w	rknob4, rknob1
			cmp.w	#0x1F, rknob1
			jn		RBURN_CV_2
			mov.w	#0x1F, rknob1
RBURN_CV_2	add.w	rknob4, rknob2
			cmp.w	#0x1F, rknob2
			jn		RBURN_CV_3
			mov.w	#0x1F, rknob2
RBURN_CV_3	add.w	rknob4, rknob3
			cmp.w	#0x1F, rknob3
			jn		RBURN_CV_4
			mov.w	#0x1F, rknob3
RBURN_CV_4
RBURN_NOCV
			ret

MODE		mov.w 	#0, R_MODE
			bit.b 	#SM_MODEA_BIT, SM_MODEA_IN
			jz		ZMODEA
			add.w	#2, R_MODE
ZMODEA		bit.b	#SM_MODEB_BIT, SM_MODEB_IN
			jz		ZMODEB
			inc.w	R_MODE
ZMODEB		dec.w	R_MODE
			ret




; output current bit state to outputs
OUTPUT_RANDOM

ROUT1		bit.w 	#BIT0, R_INPUT
			jz		ROUT1C
			bis.w 	#JO_OUT1_BIT, JO_OUT1_OUT
			jmp 	ROUT1S
ROUT1C		bic.w 	#JO_OUT1_BIT, JO_OUT1_OUT
ROUT1S
ROUT2		bit.w 	#BIT1, R_INPUT
			jz		ROUT2C
			bis.w 	#JO_OUT2_BIT, JO_OUT2_OUT
			jmp 	ROUT2S
ROUT2C		bic.w 	#JO_OUT2_BIT, JO_OUT2_OUT
ROUT2S
ROUT3		bit.w 	#BIT2, R_INPUT
			jz		ROUT3C
			bis.w 	#JO_OUT3_BIT, JO_OUT3_OUT
			jmp 	ROUT3S
ROUT3C		bic.w 	#JO_OUT3_BIT, JO_OUT3_OUT
ROUT3S
ROUT4		bit.w 	#BIT3, R_INPUT
			jz		ROUT4C
			bis.w 	#JO_OUT4_BIT, JO_OUT4_OUT
			jmp 	ROUT4S
ROUT4C		bic.w 	#JO_OUT4_BIT, JO_OUT4_OUT
ROUT4S
			ret


OUTPUT_LOGIC

OUT1		mov.w	lknob0, R_MASK
			rra.w	R_MASK
			rra.w	R_MASK
			cmp.w	#0x1F, lknob0
			jnz		OUT1Z
			inc.w	R_MASK
OUT1Z		mov.b   mask1(R_MASK), R_MASK
			bit.w 	R_MASK,R_INPUT
			jz 		OUT1C
OUT1S		bis.w 	#JO_OUT1_BIT, JO_OUT1_OUT
			jmp 	OUT1D
OUT1C		bic.w	#JO_OUT1_BIT, JO_OUT1_OUT
OUT1D


OUT2		mov.w	lknob1, R_MASK
			rra.w	R_MASK
			rra.w	R_MASK
			cmp.w	#0x1f, lknob1
			jnz		OUT2Z
			inc.w	R_MASK
OUT2Z		mov.b   mask2(R_MASK), R_MASK
			bit.b 	R_MASK,R_INPUT
			jz 		OUT2C
OUT2S		bis.b 	#JO_OUT2_BIT, JO_OUT2_OUT
			jmp 	OUT2D
OUT2C		bic.b	#JO_OUT2_BIT, JO_OUT2_OUT
OUT2D

OUT3		mov.w	lknob2, R_MASK
			rra.w	R_MASK
			rra.w	R_MASK
			cmp.w	#0x1f, lknob2
			jnz		OUT3Z
			inc.w	R_MASK
OUT3Z		mov.b   mask3(R_MASK), R_MASK
			bit.b 	R_MASK,R_INPUT
			jz 		OUT3C
OUT3S		bis.b 	#JO_OUT3_BIT, JO_OUT3_OUT
			jmp 	OUT3D
OUT3C		bic.b	#JO_OUT3_BIT, JO_OUT3_OUT
OUT3D

OUT4		mov.w	lknob3, R_MASK
			rra.w	R_MASK
			rra.w	R_MASK
			cmp.w	#0x1f, lknob3
			jnz		OUT4Z
			inc.w	R_MASK
OUT4Z		mov.b   mask4(R_MASK), R_MASK
			bit.b 	R_MASK,R_INPUT
			jz 		OUT4C
OUT4S		bis.b 	#JO_OUT4_BIT, JO_OUT4_OUT
			jmp 	OUT4D
OUT4C		bic.b	#JO_OUT4_BIT, JO_OUT4_OUT
OUT4D


OUTDONE 	ret

; INA
; R_BIT is bit that is changed
; c is bit state
INBIT		jc		IN_UP
			jmp		IN_DOWN
IN_UP		bic.w	R_BIT,R_INPUT
			jmp 	IN_DONE
IN_DOWN		bis.w	R_BIT,R_INPUT
			jmp 	IN_DONE
IN_DONE		;call	#OUTPUT
			ret

PISR		mov.w   #100, R_DELAY
P2DELAY		dec.w   R_DELAY
            jnz     P2DELAY
            call	#RAND15
            call	#RAND15
            call	#KNOBS
			call 	#MODE
			add.w	R_MODE, R_MODE
			add.w	R_MODE, PC
			jmp		MODE_LOGIC
			jmp		MODE_RANDOM_TRIGGER
			jmp		MODE_RANDOM_GATE
			jmp		MODE_FOOTFOOT

MODE_RANDOM_GATE
RI_1		bit.b   #JI_IN1_BIT,JI_IN1_IFG
			jz		RE_1
			mov.w	rknob0, R_RAND_KNOB
			call	#TEST_RANDOM
			jc		RI_1_SKIP
			mov.w	#BIT0, R_BIT
			bit.b 	#JI_IN1_BIT,JI_IN1_IES
			call	#INBIT
RI_1_SKIP	xor.b   #JI_IN1_BIT,JI_IN1_IES
			bic.b   #JI_IN1_BIT,JI_IN1_IFG
RE_1
RI_2		bit.b   #JI_IN2_BIT,JI_IN2_IFG
			jz		RE_2
			mov.w	rknob1, R_RAND_KNOB
			call	#TEST_RANDOM
			jc		RI_2_SKIP
			mov.w	#BIT1, R_BIT
			bit.b 	#JI_IN2_BIT,JI_IN2_IES
			call	#INBIT
RI_2_SKIP	xor.b   #JI_IN2_BIT,JI_IN2_IES
			bic.b   #JI_IN2_BIT,JI_IN2_IFG
RE_2
RI_3		bit.b   #JI_IN3_BIT,JI_IN3_IFG
			jz		RE_3
			mov.w	rknob2, R_RAND_KNOB
			call	#TEST_RANDOM
			jc		RI_3_SKIP
			mov.w	#BIT2, R_BIT
			bit.b 	#JI_IN3_BIT,JI_IN3_IES
			call	#INBIT
RI_3_SKIP	xor.b   #JI_IN3_BIT,JI_IN3_IES
			bic.b   #JI_IN3_BIT,JI_IN3_IFG
RE_3
RI_4		bit.b   #JI_IN4_BIT,JI_IN4_IFG
			jz		RE_4
			mov.w	rknob3, R_RAND_KNOB
			call	#TEST_RANDOM
			jc		RI_4_SKIP
			mov.w	#BIT3, R_BIT
			bit.b 	#JI_IN4_BIT,JI_IN4_IES
			call	#INBIT
RI_4_SKIP	xor.b   #JI_IN4_BIT,JI_IN4_IES
			bic.b   #JI_IN4_BIT,JI_IN4_IFG
RE_4		call	#OUTPUT_RANDOM
			reti

MODE_RANDOM_TRIGGER
TI_1		bit.b   #JI_IN1_BIT,JI_IN1_IFG
			jz		TE_1
			bit.b 	#JI_IN1_BIT,JI_IN1_IES
			jnz		TD_1
			mov.w	rknob0, R_RAND_KNOB
			call	#TEST_RANDOM
			jc		TI_1_SKIP
TD_1		mov.w	#BIT0, R_BIT
			bit.b 	#JI_IN1_BIT,JI_IN1_IES
			call	#INBIT
TI_1_SKIP	xor.b   #JI_IN1_BIT,JI_IN1_IES
			bic.b   #JI_IN1_BIT,JI_IN1_IFG
TE_1
TI_2		bit.b   #JI_IN2_BIT,JI_IN2_IFG
			jz		TE_2
			bit.b 	#JI_IN2_BIT,JI_IN2_IES
			jnz		TD_2
			mov.w	rknob1, R_RAND_KNOB
			call	#TEST_RANDOM
			jc		TI_2_SKIP
TD_2		mov.w	#BIT1, R_BIT
			bit.b 	#JI_IN2_BIT,JI_IN2_IES
			call	#INBIT
TI_2_SKIP	xor.b   #JI_IN2_BIT,JI_IN2_IES
			bic.b   #JI_IN2_BIT,JI_IN2_IFG
TE_2
TI_3		bit.b   #JI_IN3_BIT,JI_IN3_IFG
			jz		TE_3
			bit.b 	#JI_IN3_BIT,JI_IN3_IES
			jnz		TD_3
			mov.w	rknob2, R_RAND_KNOB
			call	#TEST_RANDOM
			jc		TI_3_SKIP
TD_3		mov.w	#BIT2, R_BIT
			bit.b 	#JI_IN3_BIT,JI_IN3_IES
			call	#INBIT
TI_3_SKIP	xor.b   #JI_IN3_BIT,JI_IN3_IES
			bic.b   #JI_IN3_BIT,JI_IN3_IFG
TE_3
TI_4		bit.b   #JI_IN4_BIT,JI_IN4_IFG
			jz		TE_4
			bit.b 	#JI_IN4_BIT,JI_IN4_IES
			jnz		TD_4
			mov.w	rknob3, R_RAND_KNOB
			call	#TEST_RANDOM
			jc		TI_4_SKIP
TD_4		mov.w	#BIT3, R_BIT
			bit.b 	#JI_IN4_BIT,JI_IN4_IES
			call	#INBIT
TI_4_SKIP	xor.b   #JI_IN4_BIT,JI_IN4_IES
			bic.b   #JI_IN4_BIT,JI_IN4_IFG
TE_4		call	#OUTPUT_RANDOM
			reti

MODE_LOGIC
LI_1		bit.b   #JI_IN1_BIT,JI_IN1_IFG
			jz		LE_1
			mov.w	#BIT0, R_BIT
			bit.b 	#JI_IN1_BIT,JI_IN1_IES
			call	#INBIT
			xor.b   #JI_IN1_BIT,JI_IN1_IES
			bic.b   #JI_IN1_BIT,JI_IN1_IFG
LE_1
LI_2		bit.b   #JI_IN2_BIT,JI_IN2_IFG
			jz		LE_2
			mov.w	#BIT1, R_BIT
			bit.b 	#JI_IN2_BIT,JI_IN2_IES
			call	#INBIT
			xor.b   #JI_IN2_BIT,JI_IN2_IES
			bic.b   #JI_IN2_BIT,JI_IN2_IFG
LE_2
LI_3		bit.b   #JI_IN3_BIT,JI_IN3_IFG
			jz		LE_3
			mov.w	#BIT2, R_BIT
			bit.b 	#JI_IN3_BIT,JI_IN3_IES
			call	#INBIT
			xor.b   #JI_IN3_BIT,JI_IN3_IES
			bic.b   #JI_IN3_BIT,JI_IN3_IFG
LE_3
LI_4		bit.b   #JI_IN4_BIT,JI_IN4_IFG
			jz		LE_4
			mov.w	#BIT3, R_BIT
			bit.b 	#JI_IN4_BIT,JI_IN4_IES
			call	#INBIT
			xor.b   #JI_IN4_BIT,JI_IN4_IES
			bic.b   #JI_IN4_BIT,JI_IN4_IFG
LE_4		call	#OUTPUT_LOGIC
			reti

	;
; INA
; R_BIT is bit that is changed
; z is bit state
FFBIT		jz		IN_UP
			jmp		IN_DOWN
FF_UP		bis.w	R_BIT,R_INPUT
			jmp 	IN_DONE
FF_DOWN		bic.w	R_BIT,R_INPUT
			jmp 	IN_DONE
FF_DONE		;call	#OUTPUT
			ret

MODE_FOOTFOOT
FI_1		bit.b   #JI_IN1_BIT,JI_IN1_IFG
			jz		FE_1
			mov.w	#BIT0, R_BIT
			bit.b 	#JI_IN1_BIT,JI_IN1_IES
			call	#FFBIT
			xor.b   #JI_IN1_BIT,JI_IN1_IES
			bic.b   #JI_IN1_BIT,JI_IN1_IFG
FE_1
FI_2		bit.b   #JI_IN2_BIT,JI_IN2_IFG
			jz		FE_2
			mov.w	#BIT1, R_BIT
			bit.b 	#JI_IN2_BIT,JI_IN2_IES
			call	#FFBIT
			xor.b   #JI_IN2_BIT,JI_IN2_IES
			bic.b   #JI_IN2_BIT,JI_IN2_IFG
FE_2
FI_3		bit.b   #JI_IN3_BIT,JI_IN3_IFG
			jz		FE_3
			mov.w	#BIT2, R_BIT
			bit.b 	#JI_IN3_BIT,JI_IN3_IES
			call	#FFBIT
			xor.b   #JI_IN3_BIT,JI_IN3_IES
			bic.b   #JI_IN3_BIT,JI_IN3_IFG
FE_3
FI_4		bit.b   #JI_IN4_BIT,JI_IN4_IFG
			jz		FE_4
			mov.w	#BIT3, R_BIT
			bit.b 	#JI_IN4_BIT,JI_IN4_IES
			call	#FFBIT
			xor.b   #JI_IN4_BIT,JI_IN4_IES
			bic.b   #JI_IN4_BIT,JI_IN4_IFG
FE_4		;call	#OUTPUT
			reti


EMPTY_ISR	reti

; STACK --------------------------------------------------------------------------
            .global __STACK_END
            .sect 	.stack

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

