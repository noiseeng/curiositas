Curiositas
=============

A repository for source code Noise Engineering wants to share with the world.

[Ataraxic Translatron](https://noiseengineering.us/products/ataraxic-translatron/) - [Source Code](msp430/AT.asm)
-----

* Our first module!
* Released 2013
* Used the [MSP430F2013](https://www.ti.com/product/MSP430F2013) processor.
* uses a hardware timer that triggers an interrupt for timing/pitch generation. Between these interrupts the processor goes to sleep to reduce noise for the pitch ADC.
* This is the only product we released with this processor. It was chosen because it had an adc that had good enough precision for pitch.

[Confundo Funkitus](https://noiseengineering.us/products/confundo-funkitus/) - [Source Code](msp430/CF.asm)
-----

* Released 2016
* Used the [MSP430G2453](https://www.ti.com/product/MSP430G2453) processor.
* Shipped with some minor bugs!

[Integra Funkitus](https://noiseengineering.us/products/integra-funkitus) - [Source Code](msp430/IF.asm)
-----

* Released 2016
* Used the [MSP430G2453](https://www.ti.com/product/MSP430G2453) processor.

[Mimetic Sequent](https://noiseengineering.us/products/mimetic-sequent) - [Source Code](msp430/MS.asm)
-----

* Released 2017
* Uses 64x oversampling with a 10-bit converter to get resolution accurate enough for pitch recording. Barely..
* Used the [MSP430G2553](https://www.ti.com/product/MSP430G2553) processor.

[Tonnetz Sequent](https://noiseengineering.us/products/tonnetz-sequent) - [Source Code](msp430/TS.asm)
-----

* Released 2015
* Used the [MSP430G2553](https://www.ti.com/product/MSP430G2553) processor.

[Variatic Erumption](https://noiseengineering.us/products/variatic-erumption) - [Source Code](msp430/VE.asm)
-----

* Released 2015
* Used the [MSP430G2453](https://www.ti.com/product/MSP430G2453) processor.

[Variatic Sequent](https://noiseengineering.us/products/variatic-sequent) - [Source Code](msp430/VS.asm)
-----

* Released 2017
* Used the [MSP430G2453](https://www.ti.com/product/MSP430G2453) processor.

* Released 2018
* Used the [MSP430G2453](https://www.ti.com/product/MSP430G2453) processor.

[Mimetic Digitalis](https://noiseengineering.us/products/mimetic-digitalis) - [Source Code](msp430/MD.c)

FAQ
====

**Q: Why are you sharing this code?**

**A:**  Because we think some people will be interested and the bits we share no longer hold any value being held private. It is more of a curiosity than anything we think is viable code.

**Q: What license is this code released under?**

**A:** This repository is released into the public domain under the terms of the [Unlicense](LICENSE.md).

**Q: Are you going to open source any of the hardware?**

**A:** We have no plans to at this point.

**Q: How do I build this source and use it?**

**A:** It is almost certainly not worth your time. Our earlier modules used some less than common architectures (eg: MSP430) with some very clunky development tools by modern standards. A lot of the very early modules were written in bare-metal assembly. (maybe not the best choice but it was fun! really!). It is probably easier for you to write your own version from scratch. This is released as a curiosity, not a product.

**Q: Do you think this is great code?**

**A:** No. This was some of the first embedded code I had written. Most was written in assembly for fun (yea, i'm weird). It was absolutely hobbiest-level development. Looking back, the fact that any of these products was successful was nothing short of a miracle.
