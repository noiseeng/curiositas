
#pragma once

#include <stdint.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define NE_ARRAY_COUNT(x) (sizeof(x) / sizeof(x[0]))

#define SET(reg, name) (name##_##reg) |= (name##_BIT)
#define CLR(reg, name) (name##_##reg) &= (~(name##_BIT))

#define SETORCLR(b, reg, name)             \
	if(b)                                  \
	{                                      \
		(name##_##reg) |= (name##_BIT);    \
	}                                      \
	else                                   \
	{                                      \
		(name##_##reg) &= (~(name##_BIT)); \
	}

#define TOG(reg, name) (name##_##reg) ^= (name##_BIT)
#define TST(name) (name##_IN & name##_BIT)
#define TSTR(reg, name) (name##_##reg & name##_BIT)

#define SETREG(reg, name) (reg) ^= (name##_BIT)

#define INPUT(name) CLR(DIR, name);
#define OUTPUT(name) SET(DIR, name);
#define IRQDN(name) \
	CLR(DIR, name); \
	SET(IES, name); \
	CLR(IFG, name); \
	SET(IE, name);
#define IRQUP(name) \
	CLR(DIR, name); \
	CLR(IES, name); \
	CLR(IFG, name); \
	SET(IE, name);
#define PULLUP(name) \
	SET(REN, name);  \
	SET(OUT, name);

#define IRQ(port, lambda)           \
	if((port##_IFG) & (port##_BIT)) \
	{                               \
		CLR(IFG, port);             \
		lambda;                     \
	}

#define IRQUD(port, lambdaup, lambdadn) \
	if((port##_IFG) & (port##_BIT))     \
	{                                   \
		CLR(IFG, port);                 \
		if((port##_IES) & (port##_BIT)) \
		{                               \
			lambdadn;                   \
		}                               \
		else                            \
		{                               \
			lambdaup;                   \
		}                               \
		port##_IES ^= port##_BIT;       \
	}

#define DOIRQ(port) port##_IFG |= port##_BIT;

#define delay_1us() __delay_cycles(16)

#define delay_5us() __delay_cycles(80)

#define delay_10us() __delay_cycles(160)

#define delay_50us() __delay_cycles(800)

#define delay_100us() __delay_cycles(1600)

#define delay_200us() __delay_cycles(3200)

#define delay_400us() __delay_cycles(6400)

#define delay_1ms() __delay_cycles(16000)

#define DEBUG_BREAK _op_code(0x4343)

#define delay_100us() __delay_cycles(1600)

#define delay_400us() __delay_cycles(6400)

#define delay_1ms() __delay_cycles(16000)

#define delay_2ms() __delay_cycles(32000)

#define delay_4ms() \
	delay_2ms();    \
	delay_2ms()

#define delay_5ms() \
	delay_4ms();    \
	delay_1ms()

#define delay_10ms() \
	delay_4ms();     \
	delay_4ms();     \
	delay_2ms()

#define delay_25ms() \
	delay_10ms();    \
	delay_10ms();    \
	delay_5ms()

#define delay_50ms() \
	delay_25ms();    \
	delay_25ms();

#define delay_100ms() \
	delay_50ms();     \
	delay_50ms();

#define DEBUG_BREAK _op_code(0x4343)


#define HIST(threshold, value, last)               \
	if(value > last && value - last > (threshold)) \
		last = value;                              \
	if(value < last && last - value > (threshold)) \
		last = value;


#define SIGN(x) ((x) > 0 ? 1 : -1)
#define NEMAX(a, b) ((a) > (b) ? (a) : (b))
#define NEMIN(a, b) ((a) < (b) ? (a) : (b))

#define ENC_SAM 3
#define ENC_INV 0
#define ENC_CCW 1
#define ENC_CW 2

	inline uint8_t xorshift8(uint8_t y8)
	{
		y8 ^= (y8 << 7);
		y8 ^= (y8 >> 5);
		return y8 ^= (y8 << 3);
	}

	inline uint16_t xorshift16(uint16_t r)
	{
		r ^= (r << 13);
		r ^= (r >> 9);
		r ^= (r << 7);
		return r;
	}


	inline uint16_t random()
	{
		static uint16_t rand_state = 1234;
		rand_state				   = xorshift16(rand_state);
		return rand_state;
	}

	inline uint16_t rand3()
	{
		static uint16_t last;
		uint16_t		next;
		do
		{
			next = random();
		} while((next & 3) == last);

		last = next & 3;
		return last;
	}

	inline uint16_t rand7()
	{
		static uint16_t last;

		uint16_t next;
		do
		{
			next = random();
		} while((next & 7) == last);

		last = next & 7;

		return last;
	}

	inline uint16_t probability50() { return random() > 32768; }

	inline uint16_t probability25() { return random() > 16384; }

	inline uint16_t probability12() { return random() > 8192; }

	inline uint16_t probability6() { return random() > 4096; }

	inline void reset_ports()
	{
		P1DIR = 0;
		P1OUT = 0;
		P1REN = 0;
		P1SEL = 0;
		P1IE  = 0;
		P1IES = 0;
		P1IFG = 0;

		P2DIR = 0;
		P2OUT = 0;
		P2REN = 0;
		P2SEL = 0;
		P2IE  = 0;
		P2IES = 0;
		P2IFG = 0;

		P3DIR = 0;
		P3OUT = 0;
		P3REN = 0;
		P3SEL = 0;
	}


#ifdef NE_MSP430_USE_FLASH

#define FLASH_PAGE_BYTES 512
#define FLASH_PAGE_WORDS 256

	inline void flash_erase(uint16_t *addr) // 512 bytes
	{
		_disable_interrupt();
		while(BUSY & FCTL3)
			;						   // Check if Flash being used
		FCTL2 = FWKEY + FSSEL_1 + FN3; // Clk = SMCLK/4
		FCTL1 = FWKEY + ERASE;		   // Set Erase bit
		FCTL3 = FWKEY;				   // Clear Lock bit
		*addr = 0;					   // Dummy write to erase Flash segment
		while(BUSY & FCTL3)
			;				  // Check if Flash being used
		FCTL1 = FWKEY;		  // Clear WRT bit
		FCTL3 = FWKEY + LOCK; // Set LOCK bit
		_enable_interrupt();
	}


	inline void
	flash_write(const uint16_t *cdst, const uint16_t *src, uint16_t byte_count)
	{
		uint16_t *dst = (uint16_t *)cdst; // need to cast away the const

		while((((uint16_t)dst) & 511) != 0) {}

		int i	= byte_count;
		int ofs = 0;

		while(i > 0)
		{
			flash_erase(dst + ofs);
			ofs += 256; // words
			i -= 512;
		}

		_disable_interrupt();
		i	  = 0;
		FCTL2 = FWKEY + FSSEL_1 + 40; // Clk = SMCLK/4
		FCTL3 = FWKEY;				  // Clear Lock bit
		FCTL1 = FWKEY + WRT;		  // Set WRT bit for write operation

		for(i = 0; i < byte_count / 2; i += 1)
		{
			dst[i] = src[i]; // copy value to flash
		}

		FCTL1 = FWKEY;		  // Clear WRT bit
		FCTL3 = FWKEY + LOCK; // Set LOCK bit
		_enable_interrupt();
	}


#endif // NE_MSP430_USE_FLASH


#ifdef NE_MSP430_USE_MAX5715

	inline void max5715_cmd(uint8_t cmd, uint16_t data)
	{
#define DSTEP(val, bit) \
	if((val)&bit)       \
		SET(OUT, DDI);  \
	else                \
		CLR(OUT, DDI);  \
	SET(OUT, DCK);      \
	CLR(OUT, DCK);

		SET(OUT, DCS);
		CLR(OUT, DCS);
		CLR(OUT, DCK);

		DSTEP(cmd, BIT7);
		DSTEP(cmd, BIT6);
		DSTEP(cmd, BIT5);
		DSTEP(cmd, BIT4);
		DSTEP(cmd, BIT3);
		DSTEP(cmd, BIT2);
		DSTEP(cmd, BIT1);
		DSTEP(cmd, BIT0);

		DSTEP(data, BITF);
		DSTEP(data, BITE);
		DSTEP(data, BITD);
		DSTEP(data, BITC);
		DSTEP(data, BITB);
		DSTEP(data, BITA);
		DSTEP(data, BIT9);
		DSTEP(data, BIT8);
		DSTEP(data, BIT7);
		DSTEP(data, BIT6);
		DSTEP(data, BIT5);
		DSTEP(data, BIT4);
		DSTEP(data, BIT3);
		DSTEP(data, BIT2);
		DSTEP(data, BIT1);
		DSTEP(data, BIT0);

		SET(OUT, DCS);
	}

	inline void max5715_init() { max5715_cmd(0x77, 0); }

	inline void max5715_init_2v() { max5715_cmd(0x76, 0); }

	inline void max5715_init_2v5() { max5715_cmd(0x75, 0); }

	inline void max5715_init_4v() { max5715_cmd(0x77, 0); }

	inline void
	max5715_output(uint16_t d0, uint16_t d1, uint16_t d2, uint16_t d3)
	{
		static uint16_t last_outs[4];

		if(d0 != last_outs[0])
		{
			max5715_cmd(0, d0);
			last_outs[0] = d0;
		}
		if(d1 != last_outs[1])
		{
			max5715_cmd(1, d1);
			last_outs[1] = d1;
		}
		if(d2 != last_outs[2])
		{
			max5715_cmd(2, d2);
			last_outs[2] = d2;
		}
		if(d3 != last_outs[3])
		{
			max5715_cmd(3, d3);
			last_outs[3] = d3;
		}
		max5715_cmd(0x18, 0);
	}

#endif // NE_MSP430_USE_MAX5715


#ifdef NE_MSP430_USE_DAC8411
	void dac8411(uint16_t x)
	{
#define OUTSTEP(tst, bit)                 \
	SETORCLR((bit & tst) != 0, OUT, DDI); \
	CLR(OUT, DCK);                        \
	SET(OUT, DCK);

		x = (x >> 2) & 0x3FFF;
		SET(OUT, DCK);
		CLR(OUT, DCS);
		OUTSTEP(x, BITF);
		OUTSTEP(x, BITE);
		OUTSTEP(x, BITD);
		OUTSTEP(x, BITC);
		OUTSTEP(x, BITB);
		OUTSTEP(x, BITA);
		OUTSTEP(x, BIT9);
		OUTSTEP(x, BIT8);
		OUTSTEP(x, BIT7);
		OUTSTEP(x, BIT6);
		OUTSTEP(x, BIT5);
		OUTSTEP(x, BIT4);
		OUTSTEP(x, BIT3);
		OUTSTEP(x, BIT2);
		OUTSTEP(x, BIT1);
		OUTSTEP(x, BIT0);
		OUTSTEP(0, BIT0);
		OUTSTEP(0, BIT0);
		OUTSTEP(0, BIT0);
		OUTSTEP(0, BIT0);
		OUTSTEP(0, BIT0);
		OUTSTEP(0, BIT0);
		OUTSTEP(0, BIT0);
		OUTSTEP(0, BIT0);
		SET(OUT, DCS);
		CLR(OUT, DDI);
		CLR(OUT, DCK);
#undef OUTSTEP
	}
#endif // NE_MSP430_USE_DAC8411

	inline uint16_t clampadd(uint16_t x, uint16_t d)
	{
		if(0xFFFF - d < x)
		{
			return 0xFFFF;
		}
		else
		{
			return x + d;
		}
	}

	inline uint16_t clampsub(uint16_t x, uint16_t d)
	{
		if(x < d)
		{
			return 0;
		}
		else
		{
			return x - d;
		}
	}


	inline int crapmod(int a, int b)
	{
		if(!b)
			return 0;

		while(a >= b)
			a -= b;

		return a;
	}


	inline int32_t mul32(int16_t a, int16_t b)
	{
		return ((int32_t)a) * ((int32_t)b);
	}


	inline uint16_t satadd(uint16_t v, uint16_t p)
	{
		uint16_t c = v + p;
		return c < v ? 0xFFFF : c;
	}


#define SQ_COUNT 16
#define SQ_MASK 15

	struct serialq
	{
		uint8_t	 buffer[SQ_COUNT];
		uint16_t head;
		uint16_t tail;
	};

	inline void serialq_init(struct serialq *sq)
	{
		sq->tail = 0;
		sq->head = 0;
	}

	inline int serialq_empty(struct serialq *sq)
	{
		return sq->head == sq->tail;
	}

	inline void serialq_push(struct serialq *sq, uint8_t value)
	{
		uint16_t next_head = (sq->head + 1) & SQ_MASK;

		if(next_head != sq->tail)
		{
			sq->buffer[sq->head] = value;
			sq->head			 = next_head;
		}
	}

	inline uint8_t serialq_pop(struct serialq *sq)
	{
		uint8_t v = 0;

		if(sq->head != sq->tail)
		{
			v		 = sq->buffer[sq->tail];
			sq->tail = (sq->tail + 1) & SQ_MASK;
		}

		return v;
	}


#ifdef NE_MSP430_USE_ADC10
	inline uint16_t read_adc(uint8_t reps, uint16_t va)
	{
		uint16_t i	   = 0;
		uint16_t value = 0;

		while(ADC10BUSY & ADC10CTL1)
			;

		for(i = 0; i < reps; i++)
		{
			ADC10CTL0 = ADC10SHT_3 + ADC10ON + REFON + SREF_1;
			ADC10CTL1 = va * INCH_1;
			ADC10AE0 |= 1 << va;
			ADC10CTL0 |= ENC + ADC10SC;
			ADC10CTL0 |= ENC + ADC10SC;
			while(ADC10BUSY & ADC10CTL1)
				;
			value += ADC10MEM;
		}

		return value;
	}


	inline uint16_t read_adc2v5(uint8_t reps, uint16_t va)
	{
		uint16_t i	   = 0;
		uint16_t value = 0;

		while(ADC10BUSY & ADC10CTL1)
			;

		for(i = 0; i < reps; i++)
		{
			ADC10CTL0 = ADC10SHT_1 + ADC10ON + REFON + SREF_1 + REF2_5V;
			ADC10CTL1 = INCH_0 + va;
			ADC10AE0 |= 1 << va;
			ADC10CTL0 |= ENC + ADC10SC;
			while(ADC10BUSY & ADC10CTL1)
				;
			value += ADC10MEM;
		}

		return value;
	}
#endif //NE_MSP430_USE_ADC10


#ifdef __cplusplus
}
#endif
