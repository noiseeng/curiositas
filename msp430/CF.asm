; Copyright (C) Noise Engineering 
; see LICENSE.md for details
;

    .cdecls C,LIST,"msp430.h"      

	.sect ".const"

; - pin  1     VCC
; - pin  2 1.0 JFADE
JI_FADE_BIT			.equ	BIT0
; - pin  3 1.1
JI_BURN_BIT			.equ	BIT1
; - pin  4 1.2 JA4
JI_A4_BIT			.equ	BIT2
JI_A4_OUT			.equ	P1OUT
JI_A4_IN			.equ	P1IN
JI_A4_DIR			.equ	P1DIR
JI_A4_IE			.equ	P1IE
JI_A4_IES			.equ	P1IES
JI_A4_IFG			.equ	P1IFG
; - pin  5 1.3 JA3
JI_A3_BIT			.equ	BIT3
JI_A3_OUT			.equ	P1OUT
JI_A3_IN			.equ	P1IN
JI_A3_DIR			.equ	P1DIR
JI_A3_IE			.equ	P1IE
JI_A3_IES			.equ	P1IES
JI_A3_IFG			.equ	P1IFG
; - pin  6 1.4 JA2
JI_A2_BIT			.equ	BIT4
JI_A2_OUT			.equ	P1OUT
JI_A2_IN			.equ	P1IN
JI_A2_DIR			.equ	P1DIR
JI_A2_IE			.equ	P1IE
JI_A2_IES			.equ	P1IES
JI_A2_IFG			.equ	P1IFG
; - pin  7 1.5 JA1
JI_A1_BIT			.equ	BIT5
JI_A1_OUT			.equ	P1OUT
JI_A1_IN			.equ	P1IN
JI_A1_DIR			.equ	P1DIR
JI_A1_IE			.equ	P1IE
JI_A1_IES			.equ	P1IES
JI_A1_IFG			.equ	P1IFG
; - pin  8 3.1 C1
JO_C1_BIT			.equ	BIT1
JO_C1_OUT			.equ	P3OUT
JO_C1_DIR			.equ	P3DIR
; - pin  9 3.0 C2
JO_C2_BIT			.equ	BIT0
JO_C2_OUT			.equ	P3OUT
JO_C2_DIR			.equ	P3DIR
; - pin 10 2.0 MUTE1
TS_MUTE1_BIT		.equ	BIT0
TS_MUTE1_OUT		.equ	P2OUT
TS_MUTE1_IN			.equ	P2IN
TS_MUTE1_DIR		.equ	P2DIR
TS_MUTE1_REN		.equ	P2REN
; - pin 11 2.1 CENTER LED
LED_C_BIT			.equ	BIT1
LED_C_OUT			.equ	P2OUT
LED_C_DIR			.equ	P2DIR
; - pin 12 2.2 BURN
SM_BURN_BIT			.equ	BIT2
SM_BURN_OUT			.equ	P2OUT
SM_BURN_IN			.equ	P2IN
SM_BURN_DIR			.equ	P2DIR
SM_BURN_REN			.equ	P2REN
; - pin 13 3.2 C4
JO_C4_BIT			.equ	BIT2
JO_C4_OUT			.equ	P3OUT
JO_C4_DIR			.equ	P3DIR
; - pin 14 3.3 C3
JO_C3_BIT			.equ	BIT3
JO_C3_OUT			.equ	P3OUT
JO_C3_DIR			.equ	P3DIR
; - pin 15 3.4 MUTE4
TS_MUTE4_BIT		.equ	BIT4
TS_MUTE4_OUT		.equ	P3OUT
TS_MUTE4_IN			.equ	P3IN
TS_MUTE4_DIR		.equ	P3DIR
TS_MUTE4_REN		.equ	P3REN
; - pin 16 2.3 B4
JI_B4_BIT			.equ	BIT3
JI_B4_OUT			.equ	P2OUT
JI_B4_IN			.equ	P2IN
JI_B4_DIR			.equ	P2DIR
JI_B4_IE			.equ	P2IE
JI_B4_IES			.equ	P2IES
JI_B4_IFG			.equ	P2IFG
; - pin 17 2.4 B3
JI_B3_BIT			.equ	BIT4
JI_B3_OUT			.equ	P2OUT
JI_B3_IN			.equ	P2IN
JI_B3_DIR			.equ	P2DIR
JI_B3_IE			.equ	P2IE
JI_B3_IES			.equ	P2IES
JI_B3_IFG			.equ	P2IFG
; - pin 18 2.5 B2
JI_B2_BIT			.equ	BIT5
JI_B2_OUT			.equ	P2OUT
JI_B2_IN			.equ	P2IN
JI_B2_DIR			.equ	P2DIR
JI_B2_IE			.equ	P2IE
JI_B2_IES			.equ	P2IES
JI_B2_IFG			.equ	P2IFG
; - pin 19 3.5 MUTE3
TS_MUTE3_BIT		.equ	BIT5
TS_MUTE3_OUT		.equ	P3OUT
TS_MUTE3_IN			.equ	P3IN
TS_MUTE3_DIR		.equ	P3DIR
TS_MUTE3_REN		.equ	P3REN
; - pin 20 3.6 MUTE2
TS_MUTE2_BIT		.equ	BIT6
TS_MUTE2_OUT		.equ	P3OUT
TS_MUTE2_IN			.equ	P3IN
TS_MUTE2_DIR		.equ	P3DIR
TS_MUTE2_REN		.equ	P3REN
; - pin 21 3.7 NC
LED_F_BIT			.equ	BIT7
LED_F_OUT			.equ	P3OUT
LED_F_DIR			.equ	P3DIR
; - pin 22 1.6 CRVB
TS_CRVB_BIT			.equ	BIT6
TS_CRVB_OUT			.equ	P1OUT
TS_CRVB_IN			.equ	P1IN
TS_CRVB_DIR			.equ	P1DIR
TS_CRVB_REN			.equ	P1REN
; - pin 23 1.7 CRVA
TS_CRVA_BIT			.equ	BIT7
TS_CRVA_OUT			.equ	P1OUT
TS_CRVA_IN			.equ	P1IN
TS_CRVA_DIR			.equ	P1DIR
TS_CRVA_REN			.equ	P1REN
; - pin 24     RST
; - pin 25     TEST
; - pin 26 2.7 B1
JI_B1_BIT			.equ	BIT7
JI_B1_OUT			.equ	P2OUT
JI_B1_IN			.equ	P2IN
JI_B1_DIR			.equ	P2DIR
JI_B1_IE			.equ	P2IE
JI_B1_IES			.equ	P2IES
JI_B1_IFG			.equ	P2IFG
; - pin 27 2.6 SMODE

; - pin 28 GND

; registers ----------------------------------------------------------------
R_OUT	.equ R4
R_BITS 	.equ R5
R_MASK	.equ R6
R_TMP	.equ R7
R_KAVE 	.equ R8
R_PB	.equ R9
R_PA	.equ R10
R_BLEND	.equ R11
R_RAND	.equ R12
R_B		.equ R13
R_A 	.equ R14
R_BIT 	.equ R15

mask0	.byte 	0001b, 1001b, 1101b, 1111b
mask1	.byte 	0010b, 0011b, 1011b, 1111b
mask2	.byte 	0100b, 0110b, 0111b, 1111b
mask3	.byte 	1000b, 1100b, 1110b, 1111b


; RAM -------------------------------------------------------------------------------
            .data
pa					.word	0
pb					.word	0
shiftw				.word   0
swa					.word	0
swb					.word	0
adcBase     ;address for continual conversions
adcIn1a             .word   0
adcIn0a             .word   0
adcIn1b             .word   0
adcIn0b             .word   0
adcIn1c             .word   0
adcIn0c             .word   0
adcIn1d             .word   0
adcIn0d             .word   0

adcAve0				.word   0
adcAve1				.word   0

mute				.word	0
nmute				.word	0
burncv				.word	0
burnprobability		.word	0
burncombine			.word	0

burnprobabilitycv		.word	0
burncombinecv			.word	0

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
            mov.b	#0, P3OUT
            mov.w	#0, P1DIR
			mov.w	#0, P2DIR
			mov.w	#0, P3DIR
			mov.w	#0, P1IFG
			mov.w	#0, P2IFG
			mov.w	#0, P1IE
			mov.w	#0, P2IE
			mov.w	#0, P1IES
			mov.w	#0, P2IES

			bis.w	#JI_A1_BIT, JI_A1_DIR
			bis.w	#JI_A2_BIT, JI_A2_DIR
			bis.w	#JI_A3_BIT, JI_A3_DIR
			bis.w	#JI_A4_BIT, JI_A4_DIR
			bis.w	#JI_B1_BIT, JI_B1_DIR
			bis.w	#JI_B2_BIT, JI_B2_DIR
			bis.w	#JI_B3_BIT, JI_B3_DIR
			bis.w	#JI_B4_BIT, JI_B4_DIR
			bis.w	#JO_C1_BIT, JO_C1_DIR
			bis.w	#JO_C2_BIT, JO_C2_DIR
			bis.w	#JO_C3_BIT, JO_C3_DIR
			bis.w	#JO_C4_BIT, JO_C4_DIR
			bis.w	#LED_C_BIT, LED_C_DIR
			bis.w	#LED_F_BIT, LED_F_DIR
STARTDELAY  mov.w   #0xFF, R6
STARTLOOP1  mov.w  	#0xFFF, R5
STARTLOOP2	dec.w   R5
            jnz     STARTLOOP2
            mov.b	R6, P1OUT
            mov.b	R6, P2OUT
			mov.b 	R6, P3OUT
			dec.w   R6
            jnz 	STARTLOOP1
            mov.b	#0, P1OUT
            mov.b	#0, P2OUT
			mov.b 	#0, P3OUT
MEMORY		mov.w	#0, R_A
			mov.w	#0, R_B
			mov.w	#0x8F, R_PA
			mov.w	#0x8F, R_PB
			mov.w	#0x8F, pa
			mov.w	#0x8F, pb
			mov.w	#0, swa
			mov.w	#0, swb
			mov.w	#0, R_OUT
CLOCK       mov.b   CALDCO_16MHZ, DCOCTL
            mov.b   CALBC1_16MHZ, BCSCTL1
BURNSM		bic.b  #SM_BURN_BIT, SM_BURN_DIR
			bis.b  #SM_BURN_BIT, SM_BURN_REN
			bis.b  #SM_BURN_BIT, SM_BURN_OUT
			bis.w	#LED_C_BIT, LED_C_DIR
			bis.w	#LED_F_BIT, LED_F_DIR
JI_A1		bic.w	#JI_A1_BIT,JI_A1_DIR
			bis.b   #JI_A1_BIT,JI_A1_IE
            bic.b   #JI_A1_BIT,JI_A1_IES
            bic.b   #JI_A1_BIT,JI_A1_IFG
JI_A2		bic.w	#JI_A2_BIT,JI_A2_DIR
			bis.b   #JI_A2_BIT,JI_A2_IE
            bic.b   #JI_A2_BIT,JI_A2_IES
            bic.b   #JI_A2_BIT,JI_A2_IFG
JI_A3		bic.w	#JI_A3_BIT,JI_A3_DIR
			bis.b   #JI_A3_BIT,JI_A3_IE
            bic.b   #JI_A3_BIT,JI_A3_IES
            bic.b   #JI_A3_BIT,JI_A3_IFG
JI_A4		bic.w	#JI_A4_BIT,JI_A4_DIR
			bis.b   #JI_A4_BIT,JI_A4_IE
            bic.b   #JI_A4_BIT,JI_A4_IES
            bic.b   #JI_A4_BIT,JI_A4_IFG
JI_B1		bic.w	#JI_B1_BIT,JI_B1_DIR
			bis.b   #JI_B1_BIT,JI_B1_IE
            bic.b   #JI_B1_BIT,JI_B1_IES
            bic.b   #JI_B1_BIT,JI_B1_IFG
JI_B2		bic.w	#JI_B2_BIT,JI_B2_DIR
			bis.b   #JI_B2_BIT,JI_B2_IE
            bic.b   #JI_B2_BIT,JI_B2_IES
            bic.b   #JI_B2_BIT,JI_B2_IFG
JI_B3		bic.w	#JI_B3_BIT,JI_B3_DIR
			bis.b   #JI_B3_BIT,JI_B3_IE
            bic.b   #JI_B3_BIT,JI_B3_IES
            bic.b   #JI_B3_BIT,JI_B3_IFG
JI_B4		bic.w	#JI_B4_BIT,JI_B4_DIR
			bis.b   #JI_B4_BIT,JI_B4_IE
            bic.b   #JI_B4_BIT,JI_B4_IES
            bic.b   #JI_B4_BIT,JI_B4_IFG
TS_MUTE1	bic.b	#TS_MUTE1_BIT,TS_MUTE1_DIR
			bis.b	#TS_MUTE1_BIT,TS_MUTE1_OUT
			bis.b	#TS_MUTE1_BIT,TS_MUTE1_REN
TS_MUTE2	bic.b	#TS_MUTE2_BIT,TS_MUTE2_DIR
			bis.b	#TS_MUTE2_BIT,TS_MUTE2_OUT
			bis.b	#TS_MUTE2_BIT,TS_MUTE2_REN
TS_MUTE3	bic.b	#TS_MUTE3_BIT,TS_MUTE3_DIR
			bis.b	#TS_MUTE3_BIT,TS_MUTE3_OUT
			bis.b	#TS_MUTE3_BIT,TS_MUTE3_REN
TS_MUTE4	bic.b	#TS_MUTE4_BIT,TS_MUTE4_DIR
			bis.b	#TS_MUTE4_BIT,TS_MUTE4_OUT
			bis.b	#TS_MUTE4_BIT,TS_MUTE4_REN
TS_CRVA 	bic.w	#TS_CRVA_BIT,TS_CRVA_DIR
			bis.w	#TS_CRVA_BIT,TS_CRVA_REN
			bis.w	#TS_CRVA_BIT,TS_CRVA_OUT
TS_CRVB 	bic.w	#TS_CRVB_BIT,TS_CRVB_DIR
			bis.w	#TS_CRVB_BIT,TS_CRVB_REN
			bis.w	#TS_CRVB_BIT,TS_CRVB_OUT
ADC			mov.w   #INCH_1+CONSEQ_3,&ADC10CTL1 ; A0-A1, repeat multi channel
    		mov.w   #ADC10SHT_3+MSC+ADC10ON+REFON+REF2_5V+SREF_1,&ADC10CTL0
			bis.b   #JI_FADE_BIT,&ADC10AE0
			bis.b   #JI_BURN_BIT,&ADC10AE0
			bis.b   #ADC10CT, &ADC10DTC0
    		mov.b   #8,&ADC10DTC1
busy_test   bit     #BUSY,&ADC10CTL1        	; ADC10 core inactive?
            jnz     busy_test
    		mov.w   #adcBase,&ADC10SA        	 ; Data buffer start
    		bis.w   #ENC+ADC10SC,&ADC10CTL0 ; Start sampling

IRQON		bis.w   #GIE, SR
MAINLOOP	call	#KNOBS
NOT_CENTER	jmp		MAINLOOP

KNOBS
BURN0		mov.w	#0, R_KAVE
			add.w 	adcIn1a, R_KAVE
			add.w 	adcIn1b, R_KAVE
			add.w 	adcIn1c, R_KAVE
			add.w 	adcIn1d, R_KAVE
			mov.w	R_KAVE, adcAve1
BURN1		rra.w	R_KAVE	; 11 bit
			rra.w	R_KAVE	; 10 bit
			rra.w	R_KAVE	;  9 bit
			rra.w	R_KAVE	;  8 bit
			rra.w	R_KAVE	;  7 bit
			rra.w	R_KAVE	;  6 bit
			rra.w	R_KAVE	;  5 bit
			mov.w	R_KAVE, burncv
			cmp.w	#0x10, R_KAVE
			jl		BURN_PROB ; less than 0x10, value affects probability only
			mov.w	#0x7F, burnprobabilitycv
			sub.w	#0x10, R_KAVE
			mov.w	R_KAVE, burncombinecv
			jmp	    BURN_DONE
BURN_PROB	rla.w	R_KAVE	;  6 bit
			rla.w	R_KAVE	;  7 bit
			;rla.w	R_KAVE	;  8 bit
			cmp.w	#16, R_KAVE
			jge		BURNLOW
			mov.w	#0, R_KAVE
BURNLOW
			mov.w	R_KAVE, burnprobabilitycv
			mov.w	#0, burncombinecv
BURN_DONE

AVE0		mov.w	#0, R_KAVE
			add.w 	adcIn0a, R_KAVE
			add.w 	adcIn0b, R_KAVE
			add.w 	adcIn0c, R_KAVE
			add.w 	adcIn0d, R_KAVE
			mov.w	R_KAVE, adcAve0
AVE1		rra.w	R_KAVE	; 11 bit
			rra.w	R_KAVE	; 10 bit
			rra.w	R_KAVE	;  9 bit
			rra.w	R_KAVE	;  8 bit

			; clamp value to 0-255
			cmp.w	#250, R_KAVE
			jl		AVEOK
			mov.w 	#255, R_KAVE
AVEOK
			cmp.w	#5, R_KAVE
			jge		AVELOW
			mov.w	#0, R_KAVE
AVELOW
			bic.b	#LED_C_BIT, LED_C_OUT
TS_C1		bit.w	#TS_CRVA_BIT,TS_CRVA_IN
			jc		TS_C3
; TOP CURVE, 100% of both in middle
C1
			cmp		#123, R_KAVE
			jl		C1_A
			cmp		#131, R_KAVE
			jge		C1_B
C1_C		mov.w	#255, R_PA
			mov.w	#255, R_PB
			bis.b	#LED_C_BIT, LED_C_OUT
			jmp 	C1_DONE
C1_A		rla.w	R_KAVE
			mov.w	R_KAVE, R_PB
			mov.w	#255, R_PA
			jmp		C1_DONE
C1_B		mov.w	#255, R_TMP
			sub.w	R_KAVE, R_TMP
			rla.w	R_TMP
			mov.w	R_TMP, R_PA
			mov.w	#255, R_PB
C1_DONE		jmp 	E_CURVE
; double R_PA than clamp value to 0-255
TS_C3		bit.w	#TS_CRVB_BIT,TS_CRVB_IN
			jc		C2
C3			; BOTTOM CURVE, 0% of both in middle
			cmp		#123, R_KAVE
			jl		C3_A
			cmp		#131, R_KAVE
			jge		C3_B
C3_C		mov.w	#0, R_PA
			mov.w	#0, R_PB
			bis.b	#LED_C_BIT, LED_C_OUT
			jmp 	C3_DONE
C3_A		rla.w	R_KAVE
			mov.w	#255, R_TMP
			sub.w	R_KAVE, R_TMP
			mov.w	R_TMP, R_PA
			mov.w	#0, R_PB
			jmp 	C3_DONE
C3_B		mov.w	#0, R_PA
			sub.w	#128, R_KAVE
			rla.w	R_KAVE
			mov.w	R_KAVE, R_PB
C3_DONE		jmp 	E_CURVE
; MIDDLE CURVE, 50% of both in middle
C2
			cmp		#123, R_KAVE
			jl		C2_AB
			cmp		#131, R_KAVE
			jge		C2_AB
			bis.b	#LED_C_BIT, LED_C_OUT
C2_AB		mov.w	R_KAVE, R_PB
			mov.w	#255, R_TMP
			sub.w	R_KAVE, R_TMP
			mov.w	R_TMP, R_PA
C2_DONE

E_CURVE

BURN		bit.b  	#SM_BURN_BIT, SM_BURN_IN
			jc		NOBURNBUTTON
			mov.w	#255, burnprobability
			mov.w	#0xF, burncombine
			jmp 	BUTTONDONE
NOBURNBUTTON
			mov.w	burnprobabilitycv, burnprobability
			mov.w	burncombinecv, burncombine
BUTTONDONE
			; add curveprobability to R_PA, R_PB clamp to 255
			add.w	burnprobability, R_PA
			cmp.w	#255, R_PA
			jl		BURN_AOK
			mov.w	#255, R_PA
BURN_AOK
			add.w	burnprobability, R_PB
			cmp.w	#255, R_PB
			jl		BURN_BOK
			mov.w	#255, R_PB
BURN_BOK

NOBURN		mov.w R_PA, pa
			mov.w R_PB, pb
SANITYOK	ret




; RAND
RAND		call #RAND_STEP
			call #RAND_STEP
			call #RAND_STEP
			ret

; RAND_STEP
RAND_STEP	clr.b 	R_RAND 				; clear temp register
			bit.w 	#BITE,shiftw		; C is set if bit is set
			adc.b 	R_RAND				; temp is 1 if first bit was set
			bit.w 	#BITD,shiftw		; C is set if bit is set
			adc.b 	R_RAND				; temp is 0 if neither set, 1 if either set and 2 if both set (bit0 is xor)
			bit.b 	#BIT0, R_RAND
			rlc.w 	shiftw				; shift xored value in
			cmp.w 	#0, shiftw			; check for invalid shift register state
			jne   	LFSR_BYE
			mov.w 	#0x1,shiftw			; if register is invalid make it valid
LFSR_BYE	mov.w 	shiftw, R_RAND
			ret

; R_BIT is bit that changed
; R_BLEND is output state
BLEND		mov.w	R_A, R_BITS
			or.w	R_B, R_BITS

POSTCOMBINE
			mov.w	#0, R_BLEND
BBIT0		mov.w	burncombine, R_MASK
			rra.w	R_MASK
			rra.w	R_MASK
			mov.b   mask0(R_MASK), R_MASK
			bit.w	R_MASK, R_BITS
			jz		NO0
			bis.w 	#BIT0, R_BLEND
NO0
BBIT1		mov.w	burncombine, R_MASK
			rra.w	R_MASK
			rra.w	R_MASK
			mov.b   mask1(R_MASK), R_MASK
			bit.w	R_MASK, R_BITS
			jz		NO1
			bis.w 	#BIT1, R_BLEND
NO1
BBIT2		mov.w	burncombine, R_MASK
			rra.w	R_MASK
			rra.w	R_MASK
			mov.b   mask2(R_MASK), R_MASK
			bit.w	R_MASK, R_BITS
			jz		NO2
			bis.w 	#BIT2, R_BLEND
NO2
BBIT3		mov.w	burncombine, R_MASK
			rra.w	R_MASK
			rra.w	R_MASK
			mov.b   mask3(R_MASK), R_MASK
			bit.w	R_MASK, R_BITS
			jz		NO3
			bis.w 	#BIT3, R_BLEND
NO3
			bic.w	mute, R_BLEND

			bit.w	#BIT3, R_BLEND
			jnz		ON3
			cmp.w	#0, R_BITS
			jz		ON3
			nop
ON3
			ret

; SET_OUT
SET_OUT		call 	#BLEND
			bit.w	#BIT0, R_BLEND
			jc		A_SET0
A_CLEAR0	;bic.b	#JO_C1_BIT, JO_C1_OUT
			bic.b	#BIT0, R_OUT
			jmp		A_DONE0
A_SET0		;bis.b	#JO_C1_BIT, JO_C1_OUT
			bis.b	#BIT0, R_OUT
A_DONE0
			bit.w	#BIT1, R_BLEND
			jc		A_SET1
			;bic.b	#JO_C2_BIT, JO_C2_OUT
			bic.b	#BIT1, R_OUT
			jmp		A_DONE1
A_SET1		;bis.b	#JO_C2_BIT, JO_C2_OUT
			bis.b	#BIT1, R_OUT
A_DONE1
			bit.w	#BIT2, R_BLEND
			jc		A_SET2
			;bic.b	#JO_C3_BIT, JO_C3_OUT
			bic.b	#BIT2, R_OUT
			jmp		A_DONE2
A_SET2		;bis.b	#JO_C3_BIT, JO_C3_OUT
			bis.b	#BIT2, R_OUT
A_DONE2
			bit.w	#BIT3, R_BLEND
			jc		A_SET3
			;bic.b	#JO_C4_BIT, JO_C4_OUT
			bic.b	#BIT3, R_OUT
			jmp		A_DONE3
A_SET3		;bis.b	#JO_C4_BIT, JO_C4_OUT
			bis.b	#BIT3, R_OUT
A_DONE3

			ret

OUTPUT
OUT_0		bit.w	#BIT0, R_OUT
			jz		OUT_CLR0
			bis.b	#JO_C1_BIT, JO_C1_OUT
			jmp 	OUT_1
OUT_CLR0	bic.b	#JO_C1_BIT, JO_C1_OUT
			jmp 	OUT_1

OUT_1		bit.w	#BIT1, R_OUT
			jz		OUT_CLR1
			bis.b	#JO_C2_BIT, JO_C2_OUT
			jmp 	OUT_2
OUT_CLR1	bic.b	#JO_C2_BIT, JO_C2_OUT
			jmp 	OUT_2

OUT_2		bit.w	#BIT2, R_OUT
			jz		OUT_CLR2
			bis.b	#JO_C3_BIT, JO_C3_OUT
			jmp 	OUT_3
OUT_CLR2	bic.b	#JO_C3_BIT, JO_C3_OUT
			jmp 	OUT_3

OUT_3		bit.w	#BIT3, R_OUT
			jz		OUT_CLR3
			bis.b	#JO_C4_BIT, JO_C4_OUT
			jmp 	OUT_DONE
OUT_CLR3	bic.b	#JO_C4_BIT, JO_C4_OUT
			jmp 	OUT_DONE
OUT_DONE
			cmp.w	#0, R_OUT
			jz		LED_CLEAR
LED_SET		bis.b	#LED_F_BIT, LED_F_OUT
			jmp		LED_DONE
LED_CLEAR	bic.b	#LED_F_BIT, LED_F_OUT
			jmp		LED_DONE
LED_DONE
			ret

; CHANCEA
CHANCEA		cmp.w	#0, pa
			jz		NOCHANCEA
			call	#RAND
			and.w	#0xFF, R_RAND
			cmp.w	R_RAND, pa
			ret
NOCHANCEA	cmp.w	#1, pa
			ret


; CHANCEB
CHANCEB		cmp.w	#0, pb
			jz		NOCHANCEB
			call	#RAND
			and.w	#0xFF, R_RAND
			cmp.w	R_RAND, pb
			ret
NOCHANCEB	cmp.w	#1, pb
			ret

MUTE_BITS	mov.w	#0, mute
			bit.w	#TS_MUTE1_BIT,TS_MUTE1_IN
			jnz		MUTE1_NOPE
			bis.w	#BIT0, mute
MUTE1_NOPE	bit.w	#TS_MUTE2_BIT,TS_MUTE2_IN
			jnz		MUTE2_NOPE
			bis.w	#BIT1, mute
MUTE2_NOPE	bit.w	#TS_MUTE3_BIT,TS_MUTE3_IN
			jnz		MUTE3_NOPE
			bis.w	#BIT2, mute
MUTE3_NOPE 	bit.w	#TS_MUTE4_BIT,TS_MUTE4_IN
			jnz		MUTE4_NOPE
			bis.w	#BIT3, mute
MUTE4_NOPE	mov.w	mute,nmute
			inv.w 	nmute
			ret

; INA
; R_BIT is bit that is changed
; c is bit state
INA			jc		INA_UP
			jmp		INA_DOWN
INA_UP		call 	#CHANCEA
			jl 		INA_NOPE
INA_SET		bis.w	R_BIT,R_A
			jmp 	INA_DONE
INA_DOWN	bic.w	R_BIT,R_A
			jmp 	INA_DONE
INA_NOPE	nop
INA_DONE	call	#SET_OUT
			ret

; INB
; R_BIT is bit that is changed
; c is bit state
INB			jc		INB_UP
			jmp		INB_DOWN
INB_UP		call 	#CHANCEB
			jl		INB_NOPE
INB_SET		bis.w	R_BIT,R_B
			jmp 	INB_DONE
INB_DOWN	bic.w	R_BIT,R_B
			jmp 	INB_DONE
INB_NOPE	nop
INB_DONE	call	#SET_OUT
			ret

PISR		;call	#KNOBS
			call	#MUTE_BITS
I_A1		bit.b   #JI_A1_BIT,JI_A1_IFG
			jz		E_A1
			mov.w	#BIT0, R_BIT
			bit.b 	#JI_A1_BIT,&JI_A1_IN
			call	#INA
			xor.b   #JI_A1_BIT,&JI_A1_IES
			bic.b   #JI_A1_BIT,JI_A1_IFG
E_A1
I_A2		bit.b   #JI_A2_BIT,JI_A2_IFG
			jz		E_A2
			mov.w	#BIT1, R_BIT
			bit.b 	#JI_A2_BIT,&JI_A2_IN
			call	#INA
			xor.b   #JI_A2_BIT,&JI_A2_IES
			bic.b   #JI_A2_BIT,JI_A2_IFG
E_A2
I_A3		bit.b   #JI_A3_BIT,JI_A3_IFG
			jz		E_A3
			mov.w	#BIT2, R_BIT
			bit.b 	#JI_A3_BIT,&JI_A3_IN
			call	#INA
			xor.b   #JI_A3_BIT,&JI_A3_IES
			bic.b   #JI_A3_BIT,JI_A3_IFG
E_A3
I_A4		bit.b   #JI_A4_BIT,JI_A4_IFG
			jz		E_A4
			mov.w	#BIT3, R_BIT
			bit.b 	#JI_A4_BIT,&JI_A4_IN
			call	#INA
			xor.b   #JI_A4_BIT,&JI_A4_IES
			bic.b   #JI_A4_BIT,&JI_A4_IFG
E_A4

I_B1		bit.b   #JI_B1_BIT,JI_B1_IFG
			jz		E_B1
			mov.w	#BIT0, R_BIT
			bit.b 	#JI_B1_BIT,&JI_B1_IN
			call	#INB
			xor.b   #JI_B1_BIT,&JI_B1_IES
			bic.b   #JI_B1_BIT,JI_B1_IFG
E_B1
I_B2		bit.b   #JI_B2_BIT,JI_B2_IFG
			jz		E_B2
			mov.w	#BIT1, R_BIT
			bit.b 	#JI_B2_BIT,&JI_B2_IN
			call	#INB
			xor.b   #JI_B2_BIT,&JI_B2_IES
			bic.b   #JI_B2_BIT,JI_B2_IFG
E_B2
I_B3		bit.b   #JI_B3_BIT,JI_B3_IFG
			jz		E_B3
			mov.w	#BIT2, R_BIT
			bit.b 	#JI_B3_BIT,&JI_B3_IN
			call	#INB
			xor.b   #JI_B3_BIT,&JI_B3_IES
			bic.b   #JI_B3_BIT,JI_B3_IFG
E_B3
I_B4		bit.b   #JI_B4_BIT,JI_B4_IFG
			jz		E_B4
			mov.w	#BIT3, R_BIT
			bit.b 	#JI_B4_BIT,&JI_B4_IN
			call	#INB
			xor.b   #JI_B4_BIT,&JI_B4_IES
			bic.b   #JI_B4_BIT,&JI_B4_IFG
E_B4
			call 	#OUTPUT

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
