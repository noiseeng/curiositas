Aperi Fontem (open the source)
=============

A repository for source code Noise Engineering wants to share with the world.

## [Ataraxic Translatron](https://noiseengineering.us/products/ataraxic-translatron/) - [Source Code](msp430/AT.asm)

Our first module. Used the [MSP430F2013](https://www.ti.com/product/MSP430F2013) processor.

Interesting Anecdotes:

* uses a hardware timer that triggers an interrupt for timing/pitch generation. Between these interrupts the processor goes to sleep to reduce noise for the pitch ADC.
* This is the only product we ever released with this processor.

## [Confundo Funkitus](https://noiseengineering.us/products/confundo-funkitus/) - [Source Code](msp430/CF.asm)

## [Integra Funkitus](https://noiseengineering.us/products/integra-funkitus) - [Source Code](msp430/IF.asm)

## [Mimetic Sequent](https://noiseengineering.us/products/mimetic-sequent) - [Source Code](msp430/MS.asm)

## [Tonnetz Sequent](https://noiseengineering.us/products/tonnetz-sequent) - [Source Code](msp430/TS.asm)

## [Variatic Erumption](https://noiseengineering.us/products/variatic-erumption) - [Source Code](msp430/VE.asm)

## [Variatic Sequent](https://noiseengineering.us/products/variatic-sequent) - [Source Code](msp430/VS.asm)

## FAQ

**Q: Why are you sharing this code?**

**A:**  Because we think some people will be interested and the bits we share no longer hold any value being held private.

**Q: What license is the content of this repository released under?**

**A:** We have two license options:

* [GPL3](LICENSE_GPL3.md) (only for non-comercial use)
* Commercial License ([contact](https://noiseengineering.us/support) us for details)

**Q: Are you going to open source any of the hardware?**

**A:** We have no plans to at this point.

**Q: How do I build this source and use it?**

**A:** For much of this content.. Good Luck.. Our earlier modules used some less than common architectures (eg: MSP430) with some very clunky development tools by modern standards. A lot of the very early modules were written in assembly. (yea, maybe not the best choice but it was fun! really!). I'm not even sure how i would go about trying to rebuild some of these firmwares as they havent been built in many, many years. For most of these modules if you have a working knowledge of a hardware platform it would probably be easier to develop your own version rather than using this source. This is released as a curiosity more than anything.

**Q: Do you think this is great code?**

**A:** No. This was some of the first embedded code I had written. It was written in assembly for fun (yea, i'm weird). It was absolutly hobbiest level development. Looking back, the fact that any of these products was successful was nothing short of a miracle.
