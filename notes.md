# Atari 2600

- [ ] Need to remember the scanline process (NTSC/PAL)
- [ ] Need to understand the actual TIA and 6507 interaction
- [ ] Need to chart out the OPCodes
- [ ] Need to understand more about the 6502/6507

## Coloring schemes for atari

Taking an original picture of a parrot.

![Parrot Original](./.images/parrot_og.jpg)
![Original Spectrum](./.images/actual_spec.png)

### NTSC

The NTSC scheme has a total of 128 unique colors

![Parrot NTSC Spectrum](./.images/parrot_ntsc.jpg)
![NTSC Spectrum](./.images/Atari2600_NTSC_palette_color_test_chart.png)
![Parrot in NTSC](./.images/parrot_to_ntsc.png)


### PAL

The PAL scheme has a total of 104 unique colors

![Parrot PAL Spectrum](./.images/parrot_pal.png)
![PAL Spectrum](./.images/Atari2600_PAL_palette_color_test_chart.png)
![Parrot in PAL](./.images/parrot_to_pal.png)


### SECAM 

The SECAM scheme has 8 unique colors

![Parrot SECAM Spectrum](./.images/parrot_secam.png)
![SECAM Spectrum](./.images/RGB_3bits_palette_color_test_chart.png)

You really wouldn't want to see the parrot in SECAM scheme

**Enocuntered a strange bug in stella I think where I actually have to input in
an extra whopping 46 commands just to stabilize the image in Stella.**

I might have to try out some other emulators to fix that
