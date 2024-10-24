; Copyright (C) Noise Engineering 
; see LICENSE.md for details
;

			.cdecls C,LIST,"msp430.h"       ; Include device header file
			.sect ".const"
; CONST ------------------------------------------------------------------------------
; - ADC.0 A0
A0_BIT			.equ	BIT0
; - ADC.1 A1
A1_BIT			.equ	BIT1
; - ADC.2 A2
A2_BIT			.equ	BIT2
; - ADC.3 A3
A3_BIT			.equ	BIT3
; - ADC.4 A4
A4_BIT			.equ	BIT4
			
; - 1.5 OUT
OUT_BIT			.equ	BIT5
OUT_OUT			.equ	P1OUT
OUT_DIR			.equ	P1DIR
; - 3.1 O1
O1_BIT			.equ	BIT1
O1_OUT			.equ	P3OUT
O1_DIR			.equ	P3DIR
; - 3.0 O0
O0_BIT			.equ	BIT0
O0_OUT			.equ	P3OUT
O0_DIR			.equ	P3DIR
; - 3.2 O2
O2_BIT			.equ	BIT2
O2_OUT			.equ	P3OUT
O2_DIR			.equ	P3DIR
; - 3.3 O3
O3_BIT			.equ	BIT3
O3_OUT			.equ	P3OUT
O3_DIR			.equ	P3DIR
; - 3.4 O4
O4_BIT			.equ	BIT4
O4_OUT			.equ	P3OUT
O4_DIR			.equ	P3DIR
; - 2.0 SLE
SLE_BIT			.equ	BIT0
SLE_OUT			.equ	P2OUT
SLE_DIR			.equ	P2DIR
; - 2.1 SCLK
SCLK_BIT			.equ	BIT1
SCLK_OUT			.equ	P2OUT
SCLK_DIR			.equ	P2DIR
; - 2.2 SDI
SDI_BIT			.equ	BIT2
SDI_OUT			.equ	P2OUT
SDI_DIR			.equ	P2DIR
; - 2.4 MEASURE
MEASURE_BIT			.equ	BIT4
MEASURE_OUT			.equ	P2OUT
MEASURE_IN 			.equ	P2IN
MEASURE_DIR			.equ	P2DIR
MEASURE_REN			.equ	P2REN
MEASURE_IE 			.equ	P2IE
MEASURE_IES			.equ	P2IES
MEASURE_IFG			.equ	P2IFG
; - 2.3 BEAT
BEAT_BIT			.equ	BIT3
BEAT_OUT			.equ	P2OUT
BEAT_IN 			.equ	P2IN
BEAT_DIR			.equ	P2DIR
BEAT_REN			.equ	P2REN
BEAT_IE 			.equ	P2IE
BEAT_IES			.equ	P2IES
BEAT_IFG			.equ	P2IFG
; - 1.7 RESET
RESET_BIT			.equ	BIT7
RESET_OUT			.equ	P1OUT
RESET_IN 			.equ	P1IN
RESET_DIR			.equ	P1DIR
RESET_REN			.equ	P1REN
RESET_IE 			.equ	P1IE
RESET_IES			.equ	P1IES
RESET_IFG			.equ	P1IFG
; - 2.6 ONE
ONE_BIT			.equ	BIT6
ONE_OUT			.equ	P2OUT
ONE_IN 			.equ	P2IN
ONE_DIR			.equ	P2DIR
ONE_REN			.equ	P2REN
COUNT_MASK	.equ	15
DEAD_BOTTOM	.equ	64
DEAD_TOP	.equ	4032
FLASH_SEQ	.equ	0xFC00

; registers ----------------------------------------------------------------

R_DELAY		.equ R4
R_COUNT 	.equ R5
R_DISPLAY	.equ R6
R_BIT		.equ R7
R_QUANT		.equ R8
R_AVE		.equ R9
R_CMP		.equ R10
R_OFFSET	.equ R11
R_TMP		.equ R12
R_13		.equ R13
R_14		.equ R14
R_BITI 		.equ R15

; tables -------------------------------------------------------------------------------
CURSOR		.word	1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768,0

; DATA -------------------------------------------------------------------------------
	.data
DATA_START	
quant0		.word	0
quant1		.word	0
quant2		.word	0
quant3		.word	0
quant4		.word	0

off0		.word	0
off1		.word	0
off2		.word	0
off3		.word	0
off4		.word	0

adcBase		;address for continual conversions
adcIn4a		.word	0
adcIn3a		.word	0
adcIn2a		.word	0
adcIn1a		.word	0
adcIn0a		.word	0

adcIn4b		.word	0
adcIn3b		.word	0
adcIn2b 	.word	0
adcIn1b 	.word	0
adcIn0b 	.word	0

adcIn4c		.word	0
adcIn3c		.word	0
adcIn2c 	.word	0
adcIn1c 	.word	0
adcIn0c 	.word	0

adcIn4d		.word	0
adcIn3d		.word	0
adcIn2d 	.word	0
adcIn1d 	.word	0
adcIn0d 	.word	0

adcIn4e		.word	0
adcIn3e		.word	0
adcIn2e		.word	0
adcIn1e		.word	0
adcIn0e		.word	0

adcIn4f		.word	0
adcIn3f		.word	0
adcIn2f 	.word	0
adcIn1f 	.word	0
adcIn0f 	.word	0

adcIn4g		.word	0
adcIn3g		.word	0
adcIn2g 	.word	0
adcIn1g 	.word	0
adcIn0g 	.word	0

adcIn4h		.word	0
adcIn3h		.word	0
adcIn2h 	.word	0
adcIn1h 	.word	0
adcIn0h 	.word	0

adcAve4		.word	0
adcAve3		.word	0
adcAve2		.word	0
adcAve1		.word	0
adcAve0		.word	0

lastAve4	.word	0
lastAve3	.word	0
lastAve2	.word	0
lastAve1	.word	0
lastAve0	.word	0



count		.word	0

bit0cv		.word	0
bit0sw		.word	0
bit0		.word	0
bit1		.word	0
bit2		.word	0
bit3		.word	0
bit4		.word	0

cursor		.word	0
timeline	.word	0

relative	.word	0

DATA_END

; TEXT ------------------------------------------------------------------------------
			.text
			.retain
			.retainrefs
			.global RESET

; RESET ------------------------------------------------------------------------------
RESET       	mov.w   #__STACK_END,SP         ; Initialize stackpointer
NOWDT     		mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer
MEM				mov.w	#DATA_START, R5
ZERO_LOOP		mov.w 	#0, 0(R5)
				add.w	#2,	R5
				cmp.w	#DATA_END, R5
				jnz 	ZERO_LOOP
				call	#INIT_PORT_OUT
				call	#STARTDELAY
				call	#INIT_PORT_IN

				mov.w	#0xFFFF, R5
INSETTLE		dec.w	R5
				jnz		INSETTLE

DCO				mov.b	CALDCO_16MHZ, DCOCTL
				mov.b	CALBC1_16MHZ, BCSCTL1

				call	#LOAD_FLASH

				bit.b	#RESET_BIT, RESET_IN
				jnz		NO_MODE_CHANGE
				and.w	#BIT0, relative		; sanity, make sure only one bit is set
				xor.w	#BIT0, relative		; negate bit0

				call	#SAVE_FLASH
NO_MODE_CHANGE				


ADC_INIT       	mov.w   #INCH_4+CONSEQ_3,&ADC10CTL1 ; A2-A0, repeat multi channel
	            mov.w   #ADC10SHT_3+MSC+ADC10ON+REFON+SREF_1+REF2_5V,&ADC10CTL0 ; stuff
	            bis.b   #ADC10CT, &ADC10DTC0
	    		mov.b   #40,&ADC10DTC1
ADCBUSY     	bit     #BUSY,&ADC10CTL1
	            jnz     ADCBUSY
	            mov.w   #adcBase,&ADC10SA
	            bis.w   #ENC+ADC10SC,&ADC10CTL0

IRQON			bis.w	#GIE, SR
MAINLOOP		call	#ADC
				call	#DISPLAY_TIMELINE
				jmp		MAINLOOP


; INIT_PORT_OUT ------------------------------------------------------------------------------
INIT_PORT_OUT
				mov.b	#0, P1IFG
				mov.b	#0, P1SEL
				mov.b	#0, P1OUT
				mov.w	#0, P1DIR
				mov.w	#0, P1IFG
				mov.w	#0, P1IE
				mov.w	#0, P1IES
				mov.b	#0, P2IFG
				mov.b	#0, P2SEL
				mov.b	#0, P2OUT
				mov.w	#0, P2DIR
				mov.w	#0, P2IFG
				mov.w	#0, P2IE
				mov.w	#0, P2IES
				mov.b	#0, P3SEL
				mov.b	#0, P3OUT
				mov.w	#0, P3DIR
				bis.b	#OUT_BIT, OUT_DIR
				bis.b	#O0_BIT, O0_DIR
				bis.b	#O1_BIT, O1_DIR
				bis.b	#O2_BIT, O2_DIR
				bis.b	#O3_BIT, O3_DIR
				bis.b	#O4_BIT, O4_DIR
				bis.b	#SLE_BIT, SLE_DIR
				bis.b	#SCLK_BIT, SCLK_DIR
				bis.b	#SDI_BIT, SDI_DIR
				ret

; STARTDELAY ------------------------------------------------------------------------------			
STARTDELAY
				bis.b	#OUT_BIT, OUT_OUT
				bis.b	#O0_BIT, O0_OUT
				bis.b	#O1_BIT, O1_OUT
				bis.b	#O2_BIT, O2_OUT
				bis.b	#O3_BIT, O3_OUT
				bis.b	#O4_BIT, O4_OUT

				mov.w	#0, timeline

INIT_LOOP		setc
				rlc.w	timeline
				jc		DELAY_DONE
				call 	#DISPLAY_TIMELINE
				mov.w	#0x4FFF, R5
DISPLAYLOOP		dec.w	R5
				jnz		DISPLAYLOOP
				jmp 	INIT_LOOP
DELAY_DONE		call	#CLEAR_OUTPUTS
				mov.w	#0, timeline
				call	#DISPLAY_TIMELINE
				ret
; FLASH ------------------------------------------------------------------------------

LOAD_FLASH		;mov.w	#FLASH_SEQ, R_TMP
				;mov.w	0(R_TMP), R_TMP
				;mov.w	R_TMP, relative
				mov.w	&FLASH_SEQ, relative
				ret
SAVE_FLASH		mov.w	#FWKEY+FSSEL_1+40, FCTL2
FLASH_ERASE
L1 				bit.b 	#BUSY, &FCTL3 		; Test BUSY
				jnz 	L1 					; Loop while busy
				mov.w 	#FWKEY,&FCTL3		; Clear LOCK
				mov.w 	#FWKEY+ERASE, &FCTL1 ; Enable erase
				clr.w 	&FLASH_SEQ			; Dummy write, erase S1
L2 				bit.w 	#BUSY, &FCTL3 		; Test BUSY
				jnz 	L2 					; Loop while busy
				mov.w 	#FWKEY+LOCK,&FCTL3 	; Done, set LOCK
FLASH_WRITE		mov.w	#FLASH_SEQ, R_TMP
				mov.w 	#FWKEY,&FCTL3 		; Clear LOCK
				mov.w	#FWKEY+WRT,&FCTL1 	; Enable write
FLASH_LOOP		mov.w 	relative, 0(R_TMP)
L3 				bit.w 	#BUSY, &FCTL3 		; Test BUSY
				jnz 	L3 					; Loop while busy
				mov.w 	#FWKEY,&FCTL1 		; Done. Clear
FLASH_DONE		ret

; DISPLAY -----------------------------------------------------------------------------------
SEND_TIMELINE	
				bic.b	#SLE_BIT, SLE_OUT
				mov.b	#16, R_COUNT
ledShift		bic.b	#SCLK_BIT, SCLK_OUT
				rlc.w	R_DISPLAY
				jc 		ledSetBit
				bic.b	#SDI_BIT, SDI_OUT
				jmp 	ledClearBit
ledSetBit
				bis.b	#SDI_BIT, SDI_OUT
ledClearBit
				bis.b	#SCLK_BIT, SCLK_OUT
				dec.b 	R_COUNT
				jnz 	ledShift
				bis.b	#SLE_BIT, SLE_OUT
				nop
				nop
				nop
				nop
				bic.b	#SLE_BIT, SLE_OUT			
				ret

DISPLAY_TIMELINE
				mov.w	timeline, R_DISPLAY
				or.w	bit0sw, R_DISPLAY
				or.w	bit0cv, R_DISPLAY
				or.w	bit1, R_DISPLAY
				or.w	bit2, R_DISPLAY
				or.w	bit3, R_DISPLAY
				or.w	bit4, R_DISPLAY
				bit.b	#BEAT_BIT, BEAT_IN
				jz		CURSOR_OFF
				xor.w	cursor, R_DISPLAY
				jmp 	CURSOR_DONE
CURSOR_OFF		or.w	cursor, R_DISPLAY		
CURSOR_DONE		call	#SEND_TIMELINE
				ret

; INIT_PORT_IN ------------------------------------------------------------------------------
INIT_PORT_IN		
				bis.b	#A0_BIT, &ADC10AE0
				bis.b	#A1_BIT, &ADC10AE0
				bis.b	#A2_BIT, &ADC10AE0
				bis.b	#A3_BIT, &ADC10AE0
				bis.b	#A4_BIT, &ADC10AE0
				bic.b	#RESET_BIT, RESET_DIR
				bic.b	#RESET_BIT, RESET_REN
				bic.b	#RESET_BIT, RESET_OUT
				bis.b	#RESET_BIT, RESET_IE
				bic.b	#RESET_BIT, RESET_IES
				bic.b	#RESET_BIT, RESET_IFG
				bic.b	#RESET_BIT, RESET_DIR
				bis.b	#RESET_BIT, RESET_REN
				bis.b	#RESET_BIT, RESET_OUT
				bic.b	#BEAT_BIT, BEAT_DIR
				bic.b	#BEAT_BIT, BEAT_REN
				bic.b	#BEAT_BIT, BEAT_OUT
				bis.b	#BEAT_BIT, BEAT_IE
				bic.b	#BEAT_BIT, BEAT_IES
				bic.b	#BEAT_BIT, BEAT_IFG
				bic.b	#MEASURE_BIT, MEASURE_DIR
				bic.b	#MEASURE_BIT, MEASURE_REN
				bic.b	#MEASURE_BIT, MEASURE_OUT
				bis.b	#MEASURE_BIT, MEASURE_IE
				bic.b	#MEASURE_BIT, MEASURE_IES
				bic.b	#MEASURE_BIT, MEASURE_IFG
				bic.b	#ONE_BIT, ONE_DIR
				bis.b	#ONE_BIT, ONE_REN
				bis.b	#ONE_BIT, ONE_OUT
				bic.b	#ONE_BIT, ONE_DIR
				bis.b	#ONE_BIT, ONE_REN
				bis.b	#ONE_BIT, ONE_OUT
				ret




; ADC --------------------------------------


ADC				mov.w	#0, R_AVE
				add.w	adcIn0a, R_AVE
				add.w	adcIn0b, R_AVE
				add.w	adcIn0c, R_AVE
				add.w	adcIn0d, R_AVE
				add.w	adcIn0e, R_AVE
				add.w	adcIn0f, R_AVE
				add.w	adcIn0g, R_AVE
				add.w	adcIn0h, R_AVE
				mov.w	R_AVE, adcAve0
				mov.w	#0, R_AVE
				add.w	adcIn1a, R_AVE
				add.w	adcIn1b, R_AVE
				add.w	adcIn1c, R_AVE
				add.w	adcIn1d, R_AVE
				add.w	adcIn1e, R_AVE
				add.w	adcIn1f, R_AVE
				add.w	adcIn1g, R_AVE
				add.w	adcIn1h, R_AVE
				mov.w	R_AVE, adcAve1
				mov.w	#0, R_AVE
				add.w	adcIn2a, R_AVE
				add.w	adcIn2b, R_AVE
				add.w	adcIn2c, R_AVE
				add.w	adcIn2d, R_AVE
				add.w	adcIn2e, R_AVE
				add.w	adcIn2f, R_AVE
				add.w	adcIn2g, R_AVE
				add.w	adcIn2h, R_AVE
				mov.w	R_AVE, adcAve2
				mov.w	#0, R_AVE
				add.w	adcIn3a, R_AVE
				add.w	adcIn3b, R_AVE
				add.w	adcIn3c, R_AVE
				add.w	adcIn3d, R_AVE
				add.w	adcIn3e, R_AVE
				add.w	adcIn3f, R_AVE
				add.w	adcIn3g, R_AVE
				add.w	adcIn3h, R_AVE
				mov.w	R_AVE, adcAve3
				mov.w	#0, R_AVE
				add.w	adcIn4a, R_AVE
				add.w	adcIn4b, R_AVE
				add.w	adcIn4c, R_AVE
				add.w	adcIn4d, R_AVE
				add.w	adcIn4e, R_AVE
				add.w	adcIn4f, R_AVE
				add.w	adcIn4g, R_AVE
				add.w	adcIn4h, R_AVE
				mov.w	R_AVE, adcAve4
QUANT0_START
				mov.w	adcAve0, R_QUANT ; scaled inputs 0-8192 -> 0-32
				clrc
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT

				and.w	#0x00FF, R_QUANT  ; kill top byte, not needed?
				mov.w	adcAve0, R_CMP
				sub.w	lastAve0, R_CMP
				bit.w	#0x8000, R_CMP
				jz		ABS_POSITIVE_$46$
				inv.w	R_CMP
				inc.w	R_CMP
ABS_POSITIVE_$46$
				cmp.w	#128, R_CMP
				jl		QUANT0_NOCHANGE
				mov.w   R_QUANT, off0
				rra.w   R_QUANT
				mov.w	R_QUANT, quant0
				mov.w	adcAve0, lastAve0
QUANT0_NOCHANGE
QUANT1_START
				mov.w	adcAve1, R_QUANT ; scaled inputs 0-8192 -> 0-32
				clrc
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT

				and.w	#0x00FF, R_QUANT  ; kill top byte, not needed?
				mov.w	adcAve1, R_CMP
				sub.w	lastAve1, R_CMP
				bit.w	#0x8000, R_CMP
				jz		ABS_POSITIVE_$48$
				inv.w	R_CMP
				inc.w	R_CMP
ABS_POSITIVE_$48$
				cmp.w	#128, R_CMP
				jl		QUANT1_NOCHANGE
				mov.w   R_QUANT, off1
				rra.w   R_QUANT
				mov.w	R_QUANT, quant1
				mov.w	adcAve1, lastAve1
QUANT1_NOCHANGE
QUANT2_START
				mov.w	adcAve2, R_QUANT ; scaled inputs 0-8192 -> 0-32
				clrc
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT

				and.w	#0x00FF, R_QUANT  ; kill top byte, not needed?
				mov.w	adcAve2, R_CMP
				sub.w	lastAve2, R_CMP
				bit.w	#0x8000, R_CMP
				jz		ABS_POSITIVE_$50$
				inv.w	R_CMP
				inc.w	R_CMP
ABS_POSITIVE_$50$
				cmp.w	#128, R_CMP
				jl		QUANT2_NOCHANGE
				mov.w   R_QUANT, off2
				rra.w   R_QUANT
				mov.w	R_QUANT, quant2
				mov.w	adcAve2, lastAve2
QUANT2_NOCHANGE
QUANT3_START
				mov.w	adcAve3, R_QUANT ; scaled inputs 0-8192 -> 0-32
				clrc
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT

				and.w	#0x00FF, R_QUANT  ; kill top byte, not needed?
				mov.w	adcAve3, R_CMP
				sub.w	lastAve3, R_CMP
				bit.w	#0x8000, R_CMP
				jz		ABS_POSITIVE_$52$
				inv.w	R_CMP
				inc.w	R_CMP
ABS_POSITIVE_$52$
				cmp.w	#128, R_CMP
				jl		QUANT3_NOCHANGE
				mov.w   R_QUANT, off3
				rra.w   R_QUANT
				mov.w	R_QUANT, quant3
				mov.w	adcAve3, lastAve3
QUANT3_NOCHANGE
QUANT4_START
				mov.w	adcAve4, R_QUANT ; scaled inputs 0-8192 -> 0-32
				clrc
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT
 				rrc R_QUANT

				and.w	#0x00FF, R_QUANT  ; kill top byte, not needed?
				mov.w	adcAve4, R_CMP
				sub.w	lastAve4, R_CMP
				bit.w	#0x8000, R_CMP
				jz		ABS_POSITIVE_$54$
				inv.w	R_CMP
				inc.w	R_CMP
ABS_POSITIVE_$54$
				cmp.w	#128, R_CMP
				jl		QUANT4_NOCHANGE
				mov.w   R_QUANT, off4
				rra.w   R_QUANT
				mov.w	R_QUANT, quant4
				mov.w	adcAve4, lastAve4
QUANT4_NOCHANGE
				
				mov.w	#0, R_BIT
				cmp.w	#1024, adcAve0
				jl		IN0CVOFF
				mov.w	#0, R_BIT
				call	#GET_BIT
IN0CVOFF		mov.w	R_BIT, bit0cv		

				mov.w	#0, R_BIT
				bit.w	#ONE_BIT, ONE_IN
				jnz		IN0SWOFF
				mov.w	#0, R_BIT
				call	#GET_BIT
IN0SWOFF		mov.w	R_BIT, bit0sw	

				mov.w	bit0sw, R_BIT
				or.w	bit0cv, R_BIT
				mov.w	R_BIT, bit0

				cmp.w	#0, relative
				jz		ABSOLUTE

				mov.w	#0, R_OFFSET
BIT_START_1_407
				cmp.w	#0, off1
				jz		BIT_Z_1_407
				cmp.w	#31, off1
				jz		BIT_Z_1_407
				mov.w	quant1, R_BIT
				add.w	R_OFFSET, R_BIT
				cmp.w	#16, R_BIT
				jge		BIT_Z_1_407
				call	#GET_BIT
				mov.w	R_BIT, bit1
				jmp 	BIT_DONE1407
BIT_Z_1_407	mov.w	#0, bit1
				jmp 	BIT_DONE1407
BIT_DONE1407
				mov.w	quant1, R_OFFSET
BIT_START_2_409
				cmp.w	#0, off2
				jz		BIT_Z_2_409
				cmp.w	#31, off2
				jz		BIT_Z_2_409
				mov.w	quant2, R_BIT
				add.w	R_OFFSET, R_BIT
				cmp.w	#16, R_BIT
				jge		BIT_Z_2_409
				call	#GET_BIT
				mov.w	R_BIT, bit2
				jmp 	BIT_DONE2409
BIT_Z_2_409	mov.w	#0, bit2
				jmp 	BIT_DONE2409
BIT_DONE2409
				mov.w	quant1, R_OFFSET
				add.w	quant2, R_OFFSET
BIT_START_3_412
				cmp.w	#0, off3
				jz		BIT_Z_3_412
				cmp.w	#31, off3
				jz		BIT_Z_3_412
				mov.w	quant3, R_BIT
				add.w	R_OFFSET, R_BIT
				cmp.w	#16, R_BIT
				jge		BIT_Z_3_412
				call	#GET_BIT
				mov.w	R_BIT, bit3
				jmp 	BIT_DONE3412
BIT_Z_3_412	mov.w	#0, bit3
				jmp 	BIT_DONE3412
BIT_DONE3412
				mov.w	quant1, R_OFFSET
				add.w	quant2, R_OFFSET
				add.w	quant3, R_OFFSET
BIT_START_4_416
				cmp.w	#0, off4
				jz		BIT_Z_4_416
				cmp.w	#31, off4
				jz		BIT_Z_4_416
				mov.w	quant4, R_BIT
				add.w	R_OFFSET, R_BIT
				cmp.w	#16, R_BIT
				jge		BIT_Z_4_416
				call	#GET_BIT
				mov.w	R_BIT, bit4
				jmp 	BIT_DONE4416
BIT_Z_4_416	mov.w	#0, bit4
				jmp 	BIT_DONE4416
BIT_DONE4416
				jmp		ADCDONE
ABSOLUTE
				mov.w	#0, R_OFFSET
BIT_START_1_420
				cmp.w	#0, off1
				jz		BIT_Z_1_420
				cmp.w	#31, off1
				jz		BIT_Z_1_420
				mov.w	quant1, R_BIT
				add.w	R_OFFSET, R_BIT
				cmp.w	#16, R_BIT
				jge		BIT_Z_1_420
				call	#GET_BIT
				mov.w	R_BIT, bit1
				jmp 	BIT_DONE1420
BIT_Z_1_420	mov.w	#0, bit1
				jmp 	BIT_DONE1420
BIT_DONE1420
BIT_START_2_421
				cmp.w	#0, off2
				jz		BIT_Z_2_421
				cmp.w	#31, off2
				jz		BIT_Z_2_421
				mov.w	quant2, R_BIT
				add.w	R_OFFSET, R_BIT
				cmp.w	#16, R_BIT
				jge		BIT_Z_2_421
				call	#GET_BIT
				mov.w	R_BIT, bit2
				jmp 	BIT_DONE2421
BIT_Z_2_421	mov.w	#0, bit2
				jmp 	BIT_DONE2421
BIT_DONE2421
BIT_START_3_422
				cmp.w	#0, off3
				jz		BIT_Z_3_422
				cmp.w	#31, off3
				jz		BIT_Z_3_422
				mov.w	quant3, R_BIT
				add.w	R_OFFSET, R_BIT
				cmp.w	#16, R_BIT
				jge		BIT_Z_3_422
				call	#GET_BIT
				mov.w	R_BIT, bit3
				jmp 	BIT_DONE3422
BIT_Z_3_422	mov.w	#0, bit3
				jmp 	BIT_DONE3422
BIT_DONE3422
BIT_START_4_423
				cmp.w	#0, off4
				jz		BIT_Z_4_423
				cmp.w	#31, off4
				jz		BIT_Z_4_423
				mov.w	quant4, R_BIT
				add.w	R_OFFSET, R_BIT
				cmp.w	#16, R_BIT
				jge		BIT_Z_4_423
				call	#GET_BIT
				mov.w	R_BIT, bit4
				jmp 	BIT_DONE4423
BIT_Z_4_423	mov.w	#0, bit4
				jmp 	BIT_DONE4423
BIT_DONE4423
ADCDONE
				ret		


; IRQ BEHAVIORS -----------------------------------------------------------------------------

GET_CURSORI		mov.w	count, R_BITI
				call	#GET_BITI
				ret
				
GET_BIT			add.w	R_BIT,R_BIT ; word size
				add.w	#CURSOR, R_BIT
				mov.w	0(R_BIT), R_BIT
				ret

GET_BITI		add.w	R_BITI,R_BITI ; word size
				add.w	#CURSOR, R_BITI
				mov.w	0(R_BITI), R_BITI
				ret

CLEAR_OUTPUTS	call	#GET_CURSORI
				mov.w	R_BITI, cursor
				bic.b	#OUT_BIT, OUT_OUT
				bic.b	#O0_BIT, O0_OUT
				bic.b	#O1_BIT, O1_OUT
				bic.b	#O2_BIT, O2_OUT
				bic.b	#O3_BIT, O3_OUT
				bic.b	#O4_BIT, O4_OUT
				ret

UPDATE_OUTPUTS	call	#GET_CURSORI
				mov.w	R_BITI, cursor
				bit.w	R_BITI, bit0
				jz		NOBIT0
				bis.b	#O0_BIT, O0_OUT
				bis.b	#OUT_BIT, OUT_OUT
NOBIT0
				bit.w	R_BITI, bit1
				jz		NOBIT1
				bis.b	#O1_BIT, O1_OUT
				bis.b	#OUT_BIT, OUT_OUT
NOBIT1
				bit.w	R_BITI, bit2
				jz		NOBIT2
				bis.b	#O2_BIT, O2_OUT
				bis.b	#OUT_BIT, OUT_OUT
NOBIT2
				bit.w	R_BITI, bit3
				jz		NOBIT3
				bis.b	#O3_BIT, O3_OUT
				bis.b	#OUT_BIT, OUT_OUT
NOBIT3
				bit.w	R_BITI, bit4
				jz		NOBIT4
				bis.b	#O4_BIT, O4_OUT
				bis.b	#OUT_BIT, OUT_OUT
NOBIT4
				ret

IRQ_BEAT_UP		bit.b	#RESET_BIT, RESET_IN
				jz		IGNORE_BEAT_UP
				inc.w	count
				and.w	#COUNT_MASK,count
				call	#UPDATE_OUTPUTS
IGNORE_BEAT_UP			
				ret

IRQ_BEAT_DN		bit.b	#RESET_BIT, RESET_IN
				jz		IGNORE_BEAT_DN
				call	#CLEAR_OUTPUTS
IGNORE_BEAT_DN				
				ret

IRQ_RESET_UP	mov.w	#COUNT_MASK, count
				ret

IRQ_RESET_DN	ret  ; paused

IRQ_MEASURE		mov.w	#COUNT_MASK, count
				ret

; IRQ PORT ------------------------------------------------------------------------------
				
IRQ_PORT		
IRQ_DELAY		mov.w 	#256, R_DELAY
IRQ_DELAY_LOOP	dec.w	R_DELAY
				jnz		IRQ_DELAY_LOOP
_IRQ_MEASURE_START
				bit.b	#MEASURE_BIT, MEASURE_IFG
				jz		_IRQ_MEASURE_DONE
				call	#IRQ_MEASURE
				bic.b	#MEASURE_BIT, MEASURE_IFG
_IRQ_MEASURE_DONE
_IRQ_RESET_START
				bit.b	#RESET_BIT, RESET_IFG
				jz		_IRQ_RESET_DONE
				bit.b 	#RESET_BIT, RESET_IES
				jz  	_IRQ_RESET_UP
				call	#IRQ_RESET_DN
				jmp     _IRQ_RESET_DN
_IRQ_RESET_UP
				call 	#IRQ_RESET_UP
_IRQ_RESET_DN
				xor.b	#RESET_BIT, RESET_IES
				bic.b	#RESET_BIT, RESET_IFG
_IRQ_RESET_DONE
_IRQ_BEAT_START
				bit.b	#BEAT_BIT, BEAT_IFG
				jz		_IRQ_BEAT_DONE
				bit.b 	#BEAT_BIT, BEAT_IES
				jz  	_IRQ_BEAT_UP
				call	#IRQ_BEAT_DN
				jmp     _IRQ_BEAT_DN
_IRQ_BEAT_UP
				call 	#IRQ_BEAT_UP
_IRQ_BEAT_DN
				xor.b	#BEAT_BIT, BEAT_IES
				bic.b	#BEAT_BIT, BEAT_IFG
_IRQ_BEAT_DONE
				reti				
IRQ_EMPTY		reti

; STACK --------------------------------------------------------------------------
			.global __STACK_END
			.sect 	.stack


; IRQ TABLE -------------------------------------------------------------------------------
	.sect   ".reset"
	.short  RESET

	.sect   ".int01" ; port1
	.short IRQ_EMPTY

	.sect   ".int02" ; port1
	.short IRQ_PORT

	.sect   ".int03" ; port2
	.short IRQ_PORT

	.sect   ".int04" ; usi
	.short IRQ_EMPTY

	.sect   ".int05" ; adc10
	.short IRQ_EMPTY

	.sect   ".int06" ; wdt
	.short IRQ_EMPTY

	.sect   ".int07" ; wdt
	.short IRQ_EMPTY

	.sect   ".int08" ; timera1
	.short IRQ_EMPTY

	.sect   ".int09" ; timera0
	.short IRQ_EMPTY

	.sect   ".int10" ; wdt
	.short IRQ_EMPTY

	.sect   ".int11" ; wdt
	.short IRQ_EMPTY

	.sect   ".int12" ; wdt
	.short IRQ_EMPTY

	.sect   ".int13" ; wdt
	.short IRQ_EMPTY

	.sect   ".int14" ; nmi
	.short IRQ_EMPTY

	.end
