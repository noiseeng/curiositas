#define NE_MSP430_USE_FLASH

#define MD16 0

#include <msp430.h>
#include <stdint.h>
#include <ne.h>
#include "pins.h"


#define STEP_COUNT 16
#define STEP_MASK 15
#define SIDE_COUNT 4
#define SIDE_MASK 3
#define DAC_COUNT 4
#define PATCH_COUNT 16
#define PATCH_WORDS (STEP_COUNT * DAC_COUNT)
#define FLASH_WORDS (PATCH_WORDS * PATCH_COUNT)
#define PATCH_SHIFT 2
#define PATCH_MASK 63

#define MODE_PAUSE 0
#define MODE_RUN_NOCV 1
#define MODE_RUN 2

#define MODE_FLASH_NONE 0
#define MODE_FLASH_SAVE 1
#define MODE_FLASH_LOAD 2

#define ADC_COUNT 3
#define ADC_OVER 4

#define TIMER_DELAY 2437

#define ENC_SAM 3 //4
#define ENC_INV 0 //4
#define ENC_CCW 1 //4
#define ENC_CW 2  //4

uint8_t ENC_TABLE[16] = // BA(prev) BA(current)
	{
		ENC_SAM, // 00 00
		ENC_CW,  // 00 01
		ENC_CCW, // 00 10
		ENC_INV, // 00 11
		ENC_CCW, // 01 00
		ENC_SAM, // 01 01
		ENC_INV, // 01 10
		ENC_CW,  // 01 11
		ENC_CW,  // 10 00
		ENC_INV, // 10 01
		ENC_SAM, // 10 10
		ENC_CCW, // 10 11,
		ENC_INV, // 11 00
		ENC_CCW, // 11 01
		ENC_CW,  // 11 10
		ENC_SAM  // 11 11
};


//flash

#pragma DATA_SECTION(flash_values, ".const")
const static uint16_t flash_values[PATCH_COUNT * FLASH_PAGE_WORDS]
	__attribute__((aligned(FLASH_PAGE_BYTES)));

#pragma DATA_SECTION(flash_current, ".const")
const static uint16_t flash_current[FLASH_PAGE_WORDS]
	__attribute__((aligned(FLASH_PAGE_BYTES)));


uint16_t values[STEP_COUNT][DAC_COUNT];
uint16_t input_new;
uint16_t input_old;
uint16_t input_dif;
uint16_t pe;
uint16_t current_patch_enc;
uint16_t adcraw[ADC_OVER * ADC_COUNT];
uint16_t adcave[ADC_COUNT];
uint16_t adclast[ADC_COUNT];
uint16_t adcknob[ADC_COUNT];
uint16_t adccount;

uint8_t parts;
uint8_t mode;
uint8_t output_dirty = 0;
uint8_t patchsel_mode;
uint8_t last_flash_mode  = 0;
uint8_t last_patch_enc   = 0;
uint8_t delay_gate_reset = 0;
uint8_t copy_inhibit;

uint8_t ofsx;
uint8_t ofsy;
uint8_t ofsz;

uint8_t step_step;
uint8_t reset_switch = 0;

uint8_t delay_reset;
uint8_t force_trigger;

uint8_t step_gate;
uint8_t step_combined;
uint8_t step_current;
uint8_t step_previous;
uint8_t rotate_ofs;

uint16_t values_previous[4];

uint16_t parts_changed;
uint16_t parts_last_change;
uint16_t change_count;
#define CHANGE_TIMEOUT 0x0AFF


uint8_t load_state;
uint8_t combo_press;


int is_loadsave()
{
	return (input_new & MS_LOAD) || (input_new & MS_SAVE);
}


void step_update();

inline int step(int c, int x, int y, int z)
{
	int cx = c & 3;
	int cy = c >> 2;
	return (((x + cx) & 3) + (((y + cy) & 3) * 4) + z) & 15;
}


inline uint16_t noreprand(int x, int mask)
{
	int old = x & mask;
	int res;

	do
	{
		res = random() & mask;
	} while(res == old);

	return res;
}


inline void led_4094x3(uint16_t beat, uint8_t status)
{
	beat   = ~beat;
	status = ~status;

#define LSTEP(val, bit) \
	if((val)&bit)       \
		SET(OUT, LDI);  \
	else                \
		CLR(OUT, LDI);  \
	SET(OUT, LCK);      \
	CLR(OUT, LCK);
	LSTEP(status, BIT7);
	LSTEP(status, BIT6);
	LSTEP(status, BIT5);
	LSTEP(status, BIT4);
	LSTEP(status, BIT3);
	LSTEP(status, BIT2);
	LSTEP(status, BIT1);
	LSTEP(status, BIT0);
	LSTEP(beat, BITF);
	LSTEP(beat, BITE);
	LSTEP(beat, BITD);
	LSTEP(beat, BITC);
	LSTEP(beat, BITB);
	LSTEP(beat, BITA);
	LSTEP(beat, BIT9);
	LSTEP(beat, BIT8);
	LSTEP(beat, BIT7);
	LSTEP(beat, BIT6);
	LSTEP(beat, BIT5);
	LSTEP(beat, BIT4);
	LSTEP(beat, BIT3);
	LSTEP(beat, BIT2);
	LSTEP(beat, BIT1);
	LSTEP(beat, BIT0);
	SET(OUT, LLE);
	CLR(OUT, LLE);
}


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


inline void max5715_init()
{
	max5715_cmd(0x77, 0);
}


void max5715_output(uint16_t d0, uint16_t d1, uint16_t d2, uint16_t d3)
{
	static uint32_t last_outs[4];

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


void randomize_values()
{
	int j, k;
	for(j = 0; j < STEP_COUNT; j++)
	{
		for(k = 0; k < DAC_COUNT; k++)
		{
			values[j][k] = random() & (~0x03FF);
		}
	}
}

void flash_save_current()
{
	flash_write(flash_current, &current_patch_enc, sizeof(current_patch_enc));
}

void flash_save_values(int dest)
{
	flash_write(flash_values + (dest * FLASH_PAGE_WORDS),
				(uint16_t*)values,
				sizeof(values));
}

void flash_initialize()
{
	int p;

	for(p = PATCH_COUNT - 1; p >= 0; p--)
	{
		led_4094x3(1 << p, 0);
		randomize_values();
		flash_save_values(p);
		delay_10ms();
		delay_10ms();
		delay_10ms();
		delay_10ms();
		delay_10ms();
	}

	current_patch_enc = 0;

	flash_save_current();
}


int trig	   = 0;
int trig_count = 0;

inline void start_trigger()
{
	CLR(OUT, TRIGGER);
	delay_1ms();
	delay_1ms();
	SET(OUT, TRIGGER);
	trig	   = 1;
	trig_count = 0;
}


inline void clear_trigger()
{
	CLR(OUT, TRIGGER);
	trig = 0;
}

int16_t v[4];

uint16_t get_ave(int i)
{
	uint16_t value = adcraw[0 * ADC_COUNT + i] + adcraw[1 * ADC_COUNT + i]
					 + adcraw[2 * ADC_COUNT + i] + adcraw[3 * ADC_COUNT + i];
	int16_t ave = value >> 2;

	v[0] = abs(ave - (int16_t)adcraw[0 * ADC_COUNT + i]);
	v[1] = abs(ave - (int16_t)adcraw[1 * ADC_COUNT + i]);
	v[2] = abs(ave - (int16_t)adcraw[2 * ADC_COUNT + i]);
	v[3] = abs(ave - (int16_t)adcraw[3 * ADC_COUNT + i]);

	const int threshold = 16;

	if(v[0] < threshold && v[1] < threshold && v[2] < threshold
	   && v[3] < threshold)
	{
		return value;
	}
	else
	{
		return adclast[i];
	}
}

void knobs()
{
	HIST(1 << 7, get_ave(2), adclast[2]);
	HIST(1 << 9, get_ave(1), adclast[1]);
	HIST(1 << 9, get_ave(0), adclast[0]);

	adcknob[2] = adclast[2] >> 8;
	adcknob[1] = adclast[1] >> 10;
	adcknob[0] = adclast[0] >> 10;
}

uint16_t input()
{
#define ISTEP(bit)    \
	if(TST(IDO))      \
		value |= bit; \
	SET(OUT, ICK);    \
	CLR(OUT, ICK);
	uint16_t value = 0;

	//load
	CLR(OUT, ILD);
	SET(OUT, ILD);

	//data
	ISTEP(BIT0);
	ISTEP(BIT1);
	ISTEP(BIT2);
	ISTEP(BIT3);
	ISTEP(BIT4);
	ISTEP(BIT5);
	ISTEP(BIT6);
	ISTEP(BIT7);
	ISTEP(BIT8);
	ISTEP(BIT9);
	ISTEP(BITA);
	ISTEP(BITB);
	ISTEP(BITC);
	ISTEP(BITD);
	ISTEP(BITE);
	ISTEP(BITF);

	return ~value;
}

uint16_t get_enc_from_patch(int enc)
{
	return (enc << PATCH_SHIFT) + 1;
}

uint8_t get_current_patch()
{
	return current_patch_enc >> PATCH_SHIFT;
}

void update_display()
{
	uint8_t run = 0;
	switch(mode)
	{
		case MODE_PAUSE: run = 0x20; break;
		case MODE_RUN_NOCV: run = 0x10; break;
		case MODE_RUN: run = 0x10; break;
	}

	if(patchsel_mode)
	{
		led_4094x3(1 << get_current_patch(), run | (parts & 15));
	}
	else if(rotate_ofs)
	{
		led_4094x3(1 << (rotate_ofs & 15), run | (parts & 15));
	}
	else
	{
		led_4094x3(1 << step_current, run | (parts & 15));
	}
}

inline void gate_advance(int x, int y, int z)
{
	if(mode == MODE_RUN)
	{
		step_combined = step(step_combined, x, y, z);
	}
	else
	{
		step_gate = step(step_gate, x, y, z);
	}
}

inline void gate_random()
{
	if(mode == MODE_RUN)
	{
		step_combined = noreprand(step_combined, 15);
	}
	else
	{
		step_gate = noreprand(step_gate, 15);
	}
}

inline void gate_reset()
{
	if(mode == MODE_RUN)
	{
		step_combined = 0;
	}
	else
	{
		step_gate = 0;
	}
}

inline void process_delays()
{
	if(delay_reset)
	{
		delay_reset = 0;
		gate_reset();
	}
}


inline void switch_advance(int x, int y, int z)
{
	step_combined = step(step_combined, x, y, z);
}


inline void switch_random()
{
	step_combined = noreprand(step_combined, 15);
}


inline void switch_reset()
{
	if(mode == MODE_RUN)
	{
		step_combined = 0;
	}
	else
	{
		step_combined = 0;
	}
}


inline void ms_save(uint16_t state)
{
	patchsel_mode = state;
	output_dirty  = 1;

	if(state)
	{
		last_flash_mode = MODE_FLASH_SAVE;
		last_patch_enc  = current_patch_enc;
		copy_inhibit	= 1;
	}
	else if(
		!patchsel_mode) //state is empty but we are still in patchsel mode (reset to before)
	{
		current_patch_enc = last_patch_enc;
	}
}

inline void ms_load(uint16_t state)
{
	load_state	= state != 0;
	patchsel_mode = state;
	output_dirty  = 1;

	if(state)
	{
		copy_inhibit	= 1;
		last_flash_mode = MODE_FLASH_LOAD;
		last_patch_enc  = current_patch_enc;
	}
	else if(
		!patchsel_mode) //state is empty but we are still in patchsel mode (reset to before)
	{
		current_patch_enc = last_patch_enc;
	}
}


inline uint16_t readenc()
{
	uint16_t enca;
	uint16_t encb;
	uint16_t enc;

	enca = TST(ENCA);
	encb = TST(ENCB);

	enc = 0;
	enc += (enca) ? 1 : 0;
	enc += (encb) ? 2 : 0;

	return enc;
}


inline uint16_t step_size()
{
	return TST(ENCS) ? 0x020 : 0x0400;
}

int enc_value = 0;

inline void stepup(uint16_t* cur)
{
	uint16_t inc  = step_size();
	uint16_t mask = inc - 1;

	if(0xFFFF - inc < *cur)
		*cur = 0xFFFF;
	else
		*cur = *cur + inc;

	if((*cur) & mask)
	{
		*cur -= (*cur) & mask;
	}
	output_dirty = 1;
}


inline void stepdn(uint16_t* cur)
{
	uint16_t inc  = step_size();
	uint16_t mask = inc - 1;

	if(inc > *cur)
		*cur = 0;
	else
		*cur = *cur - inc;

	if((*cur) & mask)
	{
		*cur -= (*cur) & mask;
	}
	output_dirty = 1;
}


void values_update()
{
	int i;

	if(!TST(ENCS))
	{
		if(enc_value > -4 && enc_value < 4)
			return;
	}
	else if(enc_value == 0)
		return;

	int step = step_size();

	_disable_interrupt();

	if(enc_value < 0)
	{
		for(i = 0; i < 4; i++)
		{
			if(parts & (1 << i))
			{
				stepdn(&values[step_current][i]);
			}
		}
	}
	else
	{
		for(i = 0; i < 4; i++)
		{
			if(parts & (1 << i))
			{
				stepup(&values[step_current][i]);
			}
		}
	}

	enc_value = 0;

	_enable_interrupt();
}

int8_t rotate_debounce;

void rotate_left()
{
	if(rotate_debounce > 0)
	{
		rotate_debounce = 0;
	}

	rotate_debounce -= 1;

	if(rotate_debounce > -4)
	{
		return;
	}

	rotate_debounce = 0;


	int s;
	int i;

	for(i = 0; i < 4; i++)
	{
		if(parts & (1 << i))
		{
			output_dirty = 1;
			uint16_t tmp = values[0][i];

			for(s = 0; s < 15; s++)
			{
				values[s][i] = values[s + 1][i];
			}
			values[15][i] = tmp;
		}
	}

	output_dirty  = 1;
	force_trigger = 1;
	rotate_ofs -= 1;
}

inline void rotate_right()
{
	if(rotate_debounce < 0)
	{
		rotate_debounce = 0;
	}

	rotate_debounce += 1;

	if(rotate_debounce < 4)
	{
		return;
	}

	rotate_debounce = 0;

	int s;
	int i;

	for(i = 0; i < 4; i++)
	{
		if(parts & (1 << i))
		{
			output_dirty = 1;
			uint16_t tmp = values[15][i];

			for(s = 14; s >= 0; s--)
			{
				values[s + 1][i] = values[s][i];
			}
			values[0][i] = tmp;
		}
	}

	output_dirty  = 1;
	force_trigger = 1;
	rotate_ofs += 1;
}

inline void encup()
{
	if(patchsel_mode)
	{
		current_patch_enc = (current_patch_enc + 1) & PATCH_MASK;
		output_dirty	  = 1;
	}
	else if(reset_switch)
	{
		rotate_right();
	}
	else
	{
		enc_value += 1;
		values_update();
	}
}


inline void encdn()
{
	if(patchsel_mode)
	{
		current_patch_enc = (current_patch_enc - 1) & PATCH_MASK;
		output_dirty	  = 1;
	}
	else if(reset_switch)
	{
		rotate_left();
	}
	else
	{
		enc_value -= 1;
		values_update();
	}
}


inline void encoder()
{
	uint32_t e, te;

	te = readenc();
	e  = te + 1;

	if(te != pe)
	{
		while(te != e)
		{
			te = e;

			delay_1ms();

			e = readenc();
		}

		if(e != pe)
		{
			int dir = ENC_TABLE[(pe << 2) | e];

			if(dir == ENC_CW)
			{
				encdn();
				delay_1ms();
			}
			else if(dir == ENC_CCW)
			{
				encup();
				delay_1ms();
			}

			pe = e;
		}
	}
}

void doloadsave()
{
	if(last_flash_mode == MODE_FLASH_SAVE)
	{
		flash_save_values(get_current_patch());
		flash_save_current();
		patchsel_mode  = 0;
		last_patch_enc = current_patch_enc;
	}
	else if(last_flash_mode == MODE_FLASH_LOAD)
	{
		memcpy(values,
			   flash_values + (get_current_patch() * FLASH_PAGE_WORDS),
			   sizeof(values));
		flash_save_current();
		last_patch_enc = current_patch_enc;
		patchsel_mode  = 0;
	}
}

inline void encs()
{
	if(patchsel_mode)
	{
		doloadsave();
	}
	else
	{
		_disable_interrupt();
		int i;
		for(i = 0; i < 4; i++)
		{
			if(parts & (1 << i))
			{
				const int mask = 0x400 - 1;
				if(values[step_current][i] & mask)
				{
					values[step_current][i] -= values[step_current][i] & mask;
				}
			}
		}
		output_dirty = 1;
		_enable_interrupt();
	}
}


void vegas()
{
	uint16_t led = 0;
	uint16_t i, j;
	uint16_t dac	= 0;
	uint8_t  status = 0;
	uint8_t  run	= 0;

	for(i = 0; i < 16; i++)
	{
		if(led == 0)
			led = 1;
		else
			led = led << 1;

		status = (status << 1) & 15;
		if(status == 0)
			status = 1;

		if(i & 1)
			run = 1;
		else
			run = 2;

		led_4094x3(led, (status & 15) | (run << 4));

		for(j = 0; j < 64; j++)
		{
			dac += 64;
			max5715_output(dac, dac + 0x2000, dac + 0x4000, dac + 0x8000);
		}

		SETORCLR(i & 1, OUT, TRIGGER);
	}

	for(i = 0; i < STEP_COUNT; i++)
	{
		for(j = 0; j < DAC_COUNT; j++)
		{
			values[i][j] = random();
		}
	}

	CLR(OUT, TRIGGER);

	max5715_output(0, 0, 0, 0);
}


inline void step_copy()
{
	int i;
	for(i = 0; i < 4; i++)
	{
		if(parts & (1 << i))
		{
			values[step_current][i] = values_previous[i];
			output_dirty			= 1;
		}
	}
}

void all_zero()
{
	int s;
	int i;

	for(s = 0; s < 16; s++)
	{
		for(i = 0; i < 4; i++)
		{
			if(parts & (1 << i))
			{
				values[s][i] = 0;
				output_dirty = 1;
			}
		}
	}
}


inline void step_zero()
{
	int i;

	for(i = 0; i < 4; i++)
	{
		if(parts & (1 << i))
		{
			values[step_current][i] = 0;
			output_dirty			= 1;
		}
	}
}


void all_shred()
{
	int s;
	int i;

	for(s = 0; s < 16; s++)
	{
		for(i = 0; i < 4; i++)
		{
			if(parts & (1 << i))
			{
				if(combo_press)
				{
					values[s][i] = (random() & 0x3C00) + 1228;
				}
				else
				{
					values[s][i] = random() & (~0x03FF);
				}
				output_dirty = 1;
			}
		}
	}
}

inline void step_shred()
{
	int i;

	for(i = 0; i < 4; i++)
	{
		if(parts & (1 << i))
		{
			if(input_new & MS_ZER || !TST(ENCS))
			{
				values[step_current][i] = (random() & 0x3C00) + 1228;
			}
			else
			{
				values[step_current][i] = random() & (~0x03FF);
			}
			output_dirty = 1;
		}
	}
}


inline void step_undo()
{
	memcpy(values,
		   flash_values + (get_current_patch() * FLASH_PAGE_WORDS),
		   sizeof(values));
	output_dirty = 1;
}

void step_update()
{
	if(mode == MODE_RUN)
	{
		step_current = step(step_combined, ofsx, ofsy, ofsz);
	}
	else
	{
		step_current = step_combined;
	}

	int step_changed = step_current != step_previous;

	if(step_changed)
	{
		if(!load_state)
		{
			if(combo_press)
			{
				if((input_new & MS_SHR) && (input_new & MS_ZER))
				{
					step_shred();
				}
			}
			else if(input_new & MS_SHR)
			{
				step_shred(); //zero next step if zero down
			}
			else if(input_new & MS_ZER)
			{
				step_zero(); //zero next step if zero down
			}
			else if(!TST(ENCS) && !copy_inhibit)
			{
				step_copy(); //copy previous values if encoder down
			}
		}

		output_dirty = 1;
	}

	if(output_dirty)
	{
		max5715_output(values[step_current][0],
					   values[step_current][1],
					   values[step_current][2],
					   values[step_current][3]);
	}

	if(step_changed || force_trigger)
	{
		force_trigger = 0;
		start_trigger();
	}

	if(output_dirty)
	{
		values_previous[0] = values[step_current][0];
		values_previous[1] = values[step_current][1];
		values_previous[2] = values[step_current][2];
		values_previous[3] = values[step_current][3];
	}

	step_previous = step_current;
	output_dirty  = 0;
}

void init()
{
	P1DIR = 0;
	P2DIR = 0;
	P3DIR = 0;
	P1OUT = 0;
	P2OUT = 0;
	P3OUT = 0;
	P1REN = 0;
	P2REN = 0;
	P3REN = 0;
	P1SEL = 0;
	P2SEL = 0;
	P3SEL = 0;
	P1IE  = 0;
	P2IE  = 0;
	P1IES = 0;
	P2IES = 0;
	P1IFG = 0;
	P2IFG = 0;

	SET(DIR, LLE);
	SET(DIR, LDI);
	SET(DIR, LCK);

	SET(DIR, DCS);
	SET(DIR, DCK);
	SET(DIR, DDI);

	SET(DIR, ICK);
	SET(DIR, ILD);

	SET(DIR, TRIGGER);

	IRQUP(GG);
	IRQUP(GX);
	IRQUP(GY);
	IRQUP(GRST);
	IRQUP(GRND);

	IRQDN(ENCS);

	delay_4ms();
	delay_4ms();
	delay_4ms();
	delay_4ms();

	max5715_init();

	vegas();

	input_old = input_new = input();

	current_patch_enc = 0;
	step_current	  = 0;
	step_gate		  = 0;
	step_combined	 = 0;

	parts		   = 0;
	mode		   = 0;
	patchsel_mode  = 0;
	last_patch_enc = 0;
	load_state	 = 0;

	//ADC
	adccount = 0;
#if MD16
	ADC10AE0 = APAT_BIT | AX_BIT;
#else
	ADC10AE0 = APAT_BIT | AX_BIT | AY_BIT;
#endif

	ADC10CTL1 = INCH_2 | CONSEQ_3;
	ADC10CTL0 = ADC10SHT_2 + MSC + ADC10ON + REFON + SREF_1;
	ADC10DTC0 = ADC10CT;
	ADC10DTC1 = ADC_OVER * ADC_COUNT;
	while(BUSY & ADC10CTL1)
		;
	ADC10SA = (uint16_t)&adcraw;

	DCOCTL  = CALDCO_16MHZ;
	BCSCTL1 = CALBC1_16MHZ;

	if(flash_current[0] >= (16<<PATCH_SHIFT)) //new flash
	{
		flash_initialize();
	}

	current_patch_enc = flash_current[0];

	memcpy(values,
		   flash_values + (get_current_patch() * FLASH_PAGE_WORDS),
		   sizeof(values));

	ADC10CTL0 |= ADC10IE + ENC + ADC10SC;

	rotate_debounce = 0;
	step_current	= 0;
	step_previous   = 1;
	step_update();

	_enable_interrupt();
}

uint8_t xold;
uint8_t yold;

inline void mode_change(int m, int nm)
{
	if(nm == MODE_PAUSE) //entering pause
	{
		step_gate = step_combined;
	}
	else if(m == MODE_PAUSE) //leaving pause
	{
		step_combined = step_gate;
	}
}


#define BUTTON(NAME, FUNC) \
	if(NAME & input_dif)   \
		FUNC(input_new& NAME);
#define BUTTON_DN(NAME, FUNC)                    \
	if((NAME & input_dif) && (NAME & input_new)) \
	FUNC


void ms_x()
{
	if(is_loadsave())
	{
		current_patch_enc = get_enc_from_patch(5);
		doloadsave();
	}
	else
	{
		switch_advance(1, 0, 0);
	}
}


void ms_y()
{
	if(is_loadsave())
	{
		current_patch_enc = get_enc_from_patch(6);
		doloadsave();
	}
	else
	{
		switch_advance(0, 1, 0);
	}
}

void ms_g()
{
	if(is_loadsave())
	{
		current_patch_enc = get_enc_from_patch(4);
		doloadsave();
	}
	else
	{
		switch_advance(0, 0, 1);
	}
}

void ms_rnd()
{
	if(is_loadsave())
	{
		current_patch_enc = get_enc_from_patch(7);
		doloadsave();
	}
	else
	{
		switch_random();
	}
}


void ms_undo()
{
	step_undo();
}


void all_shred_zero()
{
	if(combo_press && (input_new & MS_ZER) && (input_new & MS_SHR))
	{
		all_shred();
	}
	else if(input_new & MS_ZER)
	{
		all_zero();
	}
	else if(input_new & MS_SHR)
	{
		all_shred();
	}
}


void ms_zero()
{
	if(is_loadsave())
	{
		all_shred_zero();
	}
	else
	{
		step_zero();
	}
}


void ms_shred()
{
	if(is_loadsave())
	{
		all_shred_zero();
	}
	else
	{
		step_shred();
	}
}


void ms_rst()
{
	rotate_ofs = 0;
	switch_reset();
}


void ms_c1()
{
	if(is_loadsave())
	{
		current_patch_enc = get_enc_from_patch(0);
		doloadsave();
	}
	else
	{
		parts_changed |= BIT0;
	}
}

void ms_c2()
{
	if(is_loadsave())
	{
		current_patch_enc = get_enc_from_patch(1);
		doloadsave();
	}
	else
	{
		parts_changed |= BIT1;
	}
}

void ms_c3()
{
	if(is_loadsave())
	{
		current_patch_enc = get_enc_from_patch(2);
		doloadsave();
	}
	else
	{
		parts_changed |= BIT2;
	}
}

void ms_c4()
{
	if(is_loadsave())
	{
		current_patch_enc = get_enc_from_patch(3);
		doloadsave();
	}
	else
	{
		parts_changed |= BIT3;
	}
}


int main(void)
{
	int toggle = 0;

	WDTCTL = WDTPW | WDTHOLD;

	init();

	for(;;)
	{
		encoder();

		input_new = input();
		input_dif = input_new ^ input_old;

		BUTTON(MS_SAVE, ms_save);
		BUTTON(MS_LOAD, ms_load);

		parts_changed = 0;
		BUTTON_DN(MS_C1, ms_c1());
		BUTTON_DN(MS_C2, ms_c2());
		BUTTON_DN(MS_C3, ms_c3());
		BUTTON_DN(MS_C4, ms_c4());

		if(change_count)
			change_count -= 1;

		if(parts_changed != 0)
		{
			if(parts_changed != parts_last_change || change_count == 0)
			{
				parts ^= parts_changed;
			}
			else
			{
				if(parts == parts_changed
				   && change_count == 0) //only one lit so turn off
				{
					parts_changed = 0;
				}

				parts		  = parts_changed;
				parts_changed = 0;
			}
			parts_last_change = parts_changed;
			change_count	  = CHANGE_TIMEOUT;
		}

		_disable_interrupt();

		if((input_new & MS_ZER) && (input_new & MS_SHR))
		{
			combo_press = 1;
		}

		if(combo_press && !(input_new & MS_ZER) && !(input_new & MS_SHR))
		{
			combo_press = 0;
		}

		BUTTON_DN(MS_ZER, ms_zero());
		BUTTON_DN(MS_SHR, ms_shred());
		BUTTON_DN(MS_RST, ms_rst());
		BUTTON_DN(MS_X, ms_x());
		BUTTON_DN(MS_Y, ms_y());
		BUTTON_DN(MS_G, ms_g());
		BUTTON_DN(MS_RND, ms_rnd());
		BUTTON_DN(MS_BRN, ms_undo());

		reset_switch = input_new & MS_RST ? 1 : 0;

		if(!reset_switch)
			rotate_ofs = 0;

		if(!patchsel_mode && TST(ENCS))
			copy_inhibit = 0;

		step_update();

		_enable_interrupt();

		input_old = input_new;

		int new_mode;
		if(input_new & SW_PA)
			new_mode = MODE_RUN;
		else if(input_new & SW_PB)
			new_mode = MODE_PAUSE;
		else
			new_mode = MODE_RUN_NOCV;

		if(new_mode != mode)
		{
			mode_change(mode, new_mode);
			mode = new_mode;
		}

		toggle += 1;

		update_display();

		if(trig)
		{
			trig_count += 1;

			if(trig_count > 40)
			{
				clear_trigger();
			}
		}
	}
}


int _system_pre_init()
{
	WDTCTL = WDTPW | WDTHOLD;
	return 1;
}


void gate_input()
{
	delay_100us();

	IRQ(GG, gate_advance(0, 0, 1));
	IRQ(GX, gate_advance(1, 0, 0));
	IRQ(GY, gate_advance(0, 1, 0));

	IRQ(GRST, gate_reset());
	IRQ(GRND, gate_random());
	process_delays(); //delayed commands will override previous on first step after they occur

	step_update();
}


#pragma vector = PORT1_VECTOR
__interrupt void P1_ISR(void)
{
	gate_input();
}

#pragma vector = PORT2_VECTOR
__interrupt void P2_ISR(void)
{
	IRQ(ENCS, encs());

	gate_input();
}


int update_ofs(uint8_t*  ofs,
			   uint16_t* newofs,
			   uint16_t* ofscount,
			   uint16_t  value)
{
	if(*ofs != value)
	{
		if(*newofs == value)
		{
			if(*ofscount > 0)
			{
				*ofs = *newofs;
			}
			else
			{
				*ofscount += 1;
			}
		}
		else
		{
			*newofs   = value;
			*ofscount = 0;
			return 1;
		}
	}

	return 0;
}

uint16_t newofsx;
uint16_t newofsy;
uint16_t newofsz;
uint16_t ofscountx;
uint16_t ofscounty;
uint16_t ofscountz;

#pragma vector = ADC10_VECTOR
__interrupt void ADC_ISR(void)
{
	adccount += 1;

	if(adccount != ADC_OVER * ADC_COUNT)
	{
		return;
	}

	adccount = 0;

	knobs();

	int update = 0;
	update |= update_ofs(&ofsz, &newofsz, &ofscountz, adcknob[2]);
	update |= update_ofs(&ofsx, &newofsx, &ofscountx, adcknob[1]);
#if !MD16
	update |= update_ofs(&ofsy, &newofsy, &ofscounty, adcknob[0]);
#endif

	if(update)
	{
		if(mode == MODE_RUN)
		{
			step_update();
		}
	}
}

#pragma vector = TIMER0_A1_VECTOR
__interrupt void TA1_ISR(void) {}


#pragma vector = TIMER0_A0_VECTOR
__interrupt void TA0_ISR(void) {}
