--  Redistribution and use in source and binary forms, with or without modification,
--  are permitted provided that the following conditions are met:
--  o Redistributions of source code must retain the above copyright notice, this list
--  of conditions and the following disclaimer.
--  o Redistributions in binary form must reproduce the above copyright notice, this
--  list of conditions and the following disclaimer in the documentation and/or
--  other materials provided with the distribution.
--  o Neither the name of the copyright holder nor the names of its
--  contributors may be used to endorse or promote products derived from this
--  software without specific prior written permission.
--  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
--  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
--  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
--  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
--  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
--  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
--  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
--  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
--  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from MK21F12.xml

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

--  System Integration Module
package NRF_SVD.SIM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  RAM size
   type SOPT1_RAMSIZE_Field is
     (
      --  Reset value for the field
      Sopt1_Ramsize_Field_Reset,
      --  8 KB
      SOPT1_RAMSIZE_Field_0001,
      --  16 KB
      SOPT1_RAMSIZE_Field_0011,
      --  24 KB
      SOPT1_RAMSIZE_Field_0100,
      --  32 KB
      SOPT1_RAMSIZE_Field_0101,
      --  48 KB
      SOPT1_RAMSIZE_Field_0110,
      --  64 KB
      SOPT1_RAMSIZE_Field_0111,
      --  96 KB
      SOPT1_RAMSIZE_Field_1000,
      --  128 KB
      SOPT1_RAMSIZE_Field_1001)
     with Size => 4;
   for SOPT1_RAMSIZE_Field use
     (Sopt1_Ramsize_Field_Reset => 0,
      SOPT1_RAMSIZE_Field_0001 => 1,
      SOPT1_RAMSIZE_Field_0011 => 3,
      SOPT1_RAMSIZE_Field_0100 => 4,
      SOPT1_RAMSIZE_Field_0101 => 5,
      SOPT1_RAMSIZE_Field_0110 => 6,
      SOPT1_RAMSIZE_Field_0111 => 7,
      SOPT1_RAMSIZE_Field_1000 => 8,
      SOPT1_RAMSIZE_Field_1001 => 9);

   --  32K oscillator clock select
   type SOPT1_OSC32KSEL_Field is
     (
      --  System oscillator (OSC32KCLK)
      SOPT1_OSC32KSEL_Field_00,
      --  RTC 32.768kHz oscillator
      SOPT1_OSC32KSEL_Field_10,
      --  LPO 1 kHz
      SOPT1_OSC32KSEL_Field_11)
     with Size => 2;
   for SOPT1_OSC32KSEL_Field use
     (SOPT1_OSC32KSEL_Field_00 => 0,
      SOPT1_OSC32KSEL_Field_10 => 2,
      SOPT1_OSC32KSEL_Field_11 => 3);

   --  USB voltage regulator in standby mode during VLPR and VLPW modes
   type SOPT1_USBVSTBY_Field is
     (
      --  USB voltage regulator not in standby during VLPR and VLPW modes.
      SOPT1_USBVSTBY_Field_0,
      --  USB voltage regulator in standby during VLPR and VLPW modes.
      SOPT1_USBVSTBY_Field_1)
     with Size => 1;
   for SOPT1_USBVSTBY_Field use
     (SOPT1_USBVSTBY_Field_0 => 0,
      SOPT1_USBVSTBY_Field_1 => 1);

   --  USB voltage regulator in standby mode during Stop, VLPS, LLS and VLLS
   --  modes.
   type SOPT1_USBSSTBY_Field is
     (
      --  USB voltage regulator not in standby during Stop, VLPS, LLS and VLLS
      --  modes.
      SOPT1_USBSSTBY_Field_0,
      --  USB voltage regulator in standby during Stop, VLPS, LLS and VLLS
      --  modes.
      SOPT1_USBSSTBY_Field_1)
     with Size => 1;
   for SOPT1_USBSSTBY_Field use
     (SOPT1_USBSSTBY_Field_0 => 0,
      SOPT1_USBSSTBY_Field_1 => 1);

   --  USB voltage regulator enable
   type SOPT1_USBREGEN_Field is
     (
      --  USB voltage regulator is disabled.
      SOPT1_USBREGEN_Field_0,
      --  USB voltage regulator is enabled.
      SOPT1_USBREGEN_Field_1)
     with Size => 1;
   for SOPT1_USBREGEN_Field use
     (SOPT1_USBREGEN_Field_0 => 0,
      SOPT1_USBREGEN_Field_1 => 1);

   --  System Options Register 1
   type SIM_SOPT1_Register is record
      --  unspecified
      Reserved_0_11  : HAL.UInt12 := 16#0#;
      --  Read-only. RAM size
      RAMSIZE        : SOPT1_RAMSIZE_Field := Sopt1_Ramsize_Field_Reset;
      --  unspecified
      Reserved_16_17 : HAL.UInt2 := 16#0#;
      --  32K oscillator clock select
      OSC32KSEL      : SOPT1_OSC32KSEL_Field :=
                        NRF_SVD.SIM.SOPT1_OSC32KSEL_Field_00;
      --  unspecified
      Reserved_20_28 : HAL.UInt9 := 16#0#;
      --  USB voltage regulator in standby mode during VLPR and VLPW modes
      USBVSTBY       : SOPT1_USBVSTBY_Field :=
                        NRF_SVD.SIM.SOPT1_USBVSTBY_Field_0;
      --  USB voltage regulator in standby mode during Stop, VLPS, LLS and VLLS
      --  modes.
      USBSSTBY       : SOPT1_USBSSTBY_Field :=
                        NRF_SVD.SIM.SOPT1_USBSSTBY_Field_0;
      --  USB voltage regulator enable
      USBREGEN       : SOPT1_USBREGEN_Field :=
                        NRF_SVD.SIM.SOPT1_USBREGEN_Field_1;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_SOPT1_Register use record
      Reserved_0_11  at 0 range 0 .. 11;
      RAMSIZE        at 0 range 12 .. 15;
      Reserved_16_17 at 0 range 16 .. 17;
      OSC32KSEL      at 0 range 18 .. 19;
      Reserved_20_28 at 0 range 20 .. 28;
      USBVSTBY       at 0 range 29 .. 29;
      USBSSTBY       at 0 range 30 .. 30;
      USBREGEN       at 0 range 31 .. 31;
   end record;

   --  USB voltage regulator enable write enable
   type SOPT1CFG_URWE_Field is
     (
      --  SOPT1 USBREGEN cannot be written.
      SOPT1CFG_URWE_Field_0,
      --  SOPT1 USBREGEN can be written.
      SOPT1CFG_URWE_Field_1)
     with Size => 1;
   for SOPT1CFG_URWE_Field use
     (SOPT1CFG_URWE_Field_0 => 0,
      SOPT1CFG_URWE_Field_1 => 1);

   --  USB voltage regulator VLP standby write enable
   type SOPT1CFG_UVSWE_Field is
     (
      --  SOPT1 USBVSTBY cannot be written.
      SOPT1CFG_UVSWE_Field_0,
      --  SOPT1 USBVSTBY can be written.
      SOPT1CFG_UVSWE_Field_1)
     with Size => 1;
   for SOPT1CFG_UVSWE_Field use
     (SOPT1CFG_UVSWE_Field_0 => 0,
      SOPT1CFG_UVSWE_Field_1 => 1);

   --  USB voltage regulator stop standby write enable
   type SOPT1CFG_USSWE_Field is
     (
      --  SOPT1 USBSSTBY cannot be written.
      SOPT1CFG_USSWE_Field_0,
      --  SOPT1 USBSSTBY can be written.
      SOPT1CFG_USSWE_Field_1)
     with Size => 1;
   for SOPT1CFG_USSWE_Field use
     (SOPT1CFG_USSWE_Field_0 => 0,
      SOPT1CFG_USSWE_Field_1 => 1);

   --  SOPT1 Configuration Register
   type SIM_SOPT1CFG_Register is record
      --  unspecified
      Reserved_0_23  : HAL.UInt24 := 16#0#;
      --  USB voltage regulator enable write enable
      URWE           : SOPT1CFG_URWE_Field :=
                        NRF_SVD.SIM.SOPT1CFG_URWE_Field_0;
      --  USB voltage regulator VLP standby write enable
      UVSWE          : SOPT1CFG_UVSWE_Field :=
                        NRF_SVD.SIM.SOPT1CFG_UVSWE_Field_0;
      --  USB voltage regulator stop standby write enable
      USSWE          : SOPT1CFG_USSWE_Field :=
                        NRF_SVD.SIM.SOPT1CFG_USSWE_Field_0;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_SOPT1CFG_Register use record
      Reserved_0_23  at 0 range 0 .. 23;
      URWE           at 0 range 24 .. 24;
      UVSWE          at 0 range 25 .. 25;
      USSWE          at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  RTC clock out select
   type SOPT2_RTCCLKOUTSEL_Field is
     (
      --  RTC 1 Hz clock is output on the RTC_CLKOUT pin.
      SOPT2_RTCCLKOUTSEL_Field_0,
      --  RTC 32.768kHz clock is output on the RTC_CLKOUT pin.
      SOPT2_RTCCLKOUTSEL_Field_1)
     with Size => 1;
   for SOPT2_RTCCLKOUTSEL_Field use
     (SOPT2_RTCCLKOUTSEL_Field_0 => 0,
      SOPT2_RTCCLKOUTSEL_Field_1 => 1);

   --  CLKOUT select
   type SOPT2_CLKOUTSEL_Field is
     (
      --  FlexBus CLKOUT
      SOPT2_CLKOUTSEL_Field_000,
      --  Flash clock
      SOPT2_CLKOUTSEL_Field_010,
      --  LPO clock (1 kHz)
      SOPT2_CLKOUTSEL_Field_011,
      --  MCGIRCLK
      SOPT2_CLKOUTSEL_Field_100,
      --  RTC 32.768kHz clock
      SOPT2_CLKOUTSEL_Field_101,
      --  OSCERCLK0
      SOPT2_CLKOUTSEL_Field_110)
     with Size => 3;
   for SOPT2_CLKOUTSEL_Field use
     (SOPT2_CLKOUTSEL_Field_000 => 0,
      SOPT2_CLKOUTSEL_Field_010 => 2,
      SOPT2_CLKOUTSEL_Field_011 => 3,
      SOPT2_CLKOUTSEL_Field_100 => 4,
      SOPT2_CLKOUTSEL_Field_101 => 5,
      SOPT2_CLKOUTSEL_Field_110 => 6);

   --  FlexBus security level
   type SOPT2_FBSL_Field is
     (
      --  All off-chip accesses (instruction and data) via the FlexBus are
      --  disallowed.
      SOPT2_FBSL_Field_00,
      --  All off-chip accesses (instruction and data) via the FlexBus are
      --  disallowed.
      SOPT2_FBSL_Field_01,
      --  Off-chip instruction accesses are disallowed. Data accesses are
      --  allowed.
      SOPT2_FBSL_Field_10,
      --  Off-chip instruction accesses and data accesses are allowed.
      SOPT2_FBSL_Field_11)
     with Size => 2;
   for SOPT2_FBSL_Field use
     (SOPT2_FBSL_Field_00 => 0,
      SOPT2_FBSL_Field_01 => 1,
      SOPT2_FBSL_Field_10 => 2,
      SOPT2_FBSL_Field_11 => 3);

   --  PTD7 pad drive strength
   type SOPT2_PTD7PAD_Field is
     (
      --  Single-pad drive strength for PTD7.
      SOPT2_PTD7PAD_Field_0,
      --  Double pad drive strength for PTD7.
      SOPT2_PTD7PAD_Field_1)
     with Size => 1;
   for SOPT2_PTD7PAD_Field use
     (SOPT2_PTD7PAD_Field_0 => 0,
      SOPT2_PTD7PAD_Field_1 => 1);

   --  Debug trace clock select
   type SOPT2_TRACECLKSEL_Field is
     (
      --  MCGOUTCLK
      SOPT2_TRACECLKSEL_Field_0,
      --  Core/system clock
      SOPT2_TRACECLKSEL_Field_1)
     with Size => 1;
   for SOPT2_TRACECLKSEL_Field use
     (SOPT2_TRACECLKSEL_Field_0 => 0,
      SOPT2_TRACECLKSEL_Field_1 => 1);

   --  PLL/FLL clock select
   type SOPT2_PLLFLLSEL_Field is
     (
      --  MCGFLLCLK clock
      SOPT2_PLLFLLSEL_Field_0,
      --  MCGPLLCLK clock
      SOPT2_PLLFLLSEL_Field_1)
     with Size => 1;
   for SOPT2_PLLFLLSEL_Field use
     (SOPT2_PLLFLLSEL_Field_0 => 0,
      SOPT2_PLLFLLSEL_Field_1 => 1);

   --  USB clock source select
   type SOPT2_USBSRC_Field is
     (
      --  External bypass clock (USB_CLKIN).
      SOPT2_USBSRC_Field_0,
      --  MCGPLLCLK/MCGFLLCLK clock divided by the USB fractional divider. See
      --  the SIM_CLKDIV2[USBFRAC, USBDIV] descriptions.
      SOPT2_USBSRC_Field_1)
     with Size => 1;
   for SOPT2_USBSRC_Field use
     (SOPT2_USBSRC_Field_0 => 0,
      SOPT2_USBSRC_Field_1 => 1);

   --  SDHC clock source select
   type SOPT2_SDHCSRC_Field is
     (
      --  Core/system clock.
      SOPT2_SDHCSRC_Field_00,
      --  MCGPLLCLK/MCGFLLCLK clock
      SOPT2_SDHCSRC_Field_01,
      --  OSCERCLK clock
      SOPT2_SDHCSRC_Field_10,
      --  External bypass clock (SDHC0_CLKIN)
      SOPT2_SDHCSRC_Field_11)
     with Size => 2;
   for SOPT2_SDHCSRC_Field use
     (SOPT2_SDHCSRC_Field_00 => 0,
      SOPT2_SDHCSRC_Field_01 => 1,
      SOPT2_SDHCSRC_Field_10 => 2,
      SOPT2_SDHCSRC_Field_11 => 3);

   --  System Options Register 2
   type SIM_SOPT2_Register is record
      --  unspecified
      Reserved_0_3   : HAL.UInt4 := 16#0#;
      --  RTC clock out select
      RTCCLKOUTSEL   : SOPT2_RTCCLKOUTSEL_Field :=
                        NRF_SVD.SIM.SOPT2_RTCCLKOUTSEL_Field_0;
      --  CLKOUT select
      CLKOUTSEL      : SOPT2_CLKOUTSEL_Field :=
                        NRF_SVD.SIM.SOPT2_CLKOUTSEL_Field_000;
      --  FlexBus security level
      FBSL           : SOPT2_FBSL_Field := NRF_SVD.SIM.SOPT2_FBSL_Field_00;
      --  unspecified
      Reserved_10_10 : HAL.Bit := 16#0#;
      --  PTD7 pad drive strength
      PTD7PAD        : SOPT2_PTD7PAD_Field :=
                        NRF_SVD.SIM.SOPT2_PTD7PAD_Field_0;
      --  Debug trace clock select
      TRACECLKSEL    : SOPT2_TRACECLKSEL_Field :=
                        NRF_SVD.SIM.SOPT2_TRACECLKSEL_Field_1;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  PLL/FLL clock select
      PLLFLLSEL      : SOPT2_PLLFLLSEL_Field :=
                        NRF_SVD.SIM.SOPT2_PLLFLLSEL_Field_0;
      --  unspecified
      Reserved_17_17 : HAL.Bit := 16#0#;
      --  USB clock source select
      USBSRC         : SOPT2_USBSRC_Field := NRF_SVD.SIM.SOPT2_USBSRC_Field_0;
      --  unspecified
      Reserved_19_27 : HAL.UInt9 := 16#0#;
      --  SDHC clock source select
      SDHCSRC        : SOPT2_SDHCSRC_Field :=
                        NRF_SVD.SIM.SOPT2_SDHCSRC_Field_00;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_SOPT2_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      RTCCLKOUTSEL   at 0 range 4 .. 4;
      CLKOUTSEL      at 0 range 5 .. 7;
      FBSL           at 0 range 8 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      PTD7PAD        at 0 range 11 .. 11;
      TRACECLKSEL    at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      PLLFLLSEL      at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      USBSRC         at 0 range 18 .. 18;
      Reserved_19_27 at 0 range 19 .. 27;
      SDHCSRC        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  FTM0 Fault 0 Select
   type SOPT4_FTM0FLT0_Field is
     (
      --  FTM0_FLT0 pin
      SOPT4_FTM0FLT0_Field_0,
      --  CMP0 out
      SOPT4_FTM0FLT0_Field_1)
     with Size => 1;
   for SOPT4_FTM0FLT0_Field use
     (SOPT4_FTM0FLT0_Field_0 => 0,
      SOPT4_FTM0FLT0_Field_1 => 1);

   --  FTM0 Fault 1 Select
   type SOPT4_FTM0FLT1_Field is
     (
      --  FTM0_FLT1 pin
      SOPT4_FTM0FLT1_Field_0,
      --  CMP1 out
      SOPT4_FTM0FLT1_Field_1)
     with Size => 1;
   for SOPT4_FTM0FLT1_Field use
     (SOPT4_FTM0FLT1_Field_0 => 0,
      SOPT4_FTM0FLT1_Field_1 => 1);

   --  FTM0 Fault 2 Select
   type SOPT4_FTM0FLT2_Field is
     (
      --  FTM0_FLT2 pin
      SOPT4_FTM0FLT2_Field_0,
      --  CMP2 out
      SOPT4_FTM0FLT2_Field_1)
     with Size => 1;
   for SOPT4_FTM0FLT2_Field use
     (SOPT4_FTM0FLT2_Field_0 => 0,
      SOPT4_FTM0FLT2_Field_1 => 1);

   --  FTM1 Fault 0 Select
   type SOPT4_FTM1FLT0_Field is
     (
      --  FTM1_FLT0 pin
      SOPT4_FTM1FLT0_Field_0,
      --  CMP0 out
      SOPT4_FTM1FLT0_Field_1)
     with Size => 1;
   for SOPT4_FTM1FLT0_Field use
     (SOPT4_FTM1FLT0_Field_0 => 0,
      SOPT4_FTM1FLT0_Field_1 => 1);

   --  FTM2 Fault 0 Select
   type SOPT4_FTM2FLT0_Field is
     (
      --  FTM2_FLT0 pin
      SOPT4_FTM2FLT0_Field_0,
      --  CMP0 out
      SOPT4_FTM2FLT0_Field_1)
     with Size => 1;
   for SOPT4_FTM2FLT0_Field use
     (SOPT4_FTM2FLT0_Field_0 => 0,
      SOPT4_FTM2FLT0_Field_1 => 1);

   --  FTM3 Fault 0 Select
   type SOPT4_FTM3FLT0_Field is
     (
      --  FTM3_FLT0 pin
      SOPT4_FTM3FLT0_Field_0,
      --  CMP0 out
      SOPT4_FTM3FLT0_Field_1)
     with Size => 1;
   for SOPT4_FTM3FLT0_Field use
     (SOPT4_FTM3FLT0_Field_0 => 0,
      SOPT4_FTM3FLT0_Field_1 => 1);

   --  FTM1 channel 0 input capture source select
   type SOPT4_FTM1CH0SRC_Field is
     (
      --  FTM1_CH0 signal
      SOPT4_FTM1CH0SRC_Field_00,
      --  CMP0 output
      SOPT4_FTM1CH0SRC_Field_01,
      --  CMP1 output
      SOPT4_FTM1CH0SRC_Field_10,
      --  USB start of frame pulse
      SOPT4_FTM1CH0SRC_Field_11)
     with Size => 2;
   for SOPT4_FTM1CH0SRC_Field use
     (SOPT4_FTM1CH0SRC_Field_00 => 0,
      SOPT4_FTM1CH0SRC_Field_01 => 1,
      SOPT4_FTM1CH0SRC_Field_10 => 2,
      SOPT4_FTM1CH0SRC_Field_11 => 3);

   --  FTM2 channel 0 input capture source select
   type SOPT4_FTM2CH0SRC_Field is
     (
      --  FTM2_CH0 signal
      SOPT4_FTM2CH0SRC_Field_00,
      --  CMP0 output
      SOPT4_FTM2CH0SRC_Field_01,
      --  CMP1 output
      SOPT4_FTM2CH0SRC_Field_10)
     with Size => 2;
   for SOPT4_FTM2CH0SRC_Field use
     (SOPT4_FTM2CH0SRC_Field_00 => 0,
      SOPT4_FTM2CH0SRC_Field_01 => 1,
      SOPT4_FTM2CH0SRC_Field_10 => 2);

   --  FlexTimer 0 External Clock Pin Select
   type SOPT4_FTM0CLKSEL_Field is
     (
      --  FTM_CLK0 pin
      SOPT4_FTM0CLKSEL_Field_0,
      --  FTM_CLK1 pin
      SOPT4_FTM0CLKSEL_Field_1)
     with Size => 1;
   for SOPT4_FTM0CLKSEL_Field use
     (SOPT4_FTM0CLKSEL_Field_0 => 0,
      SOPT4_FTM0CLKSEL_Field_1 => 1);

   --  FTM1 External Clock Pin Select
   type SOPT4_FTM1CLKSEL_Field is
     (
      --  FTM_CLK0 pin
      SOPT4_FTM1CLKSEL_Field_0,
      --  FTM_CLK1 pin
      SOPT4_FTM1CLKSEL_Field_1)
     with Size => 1;
   for SOPT4_FTM1CLKSEL_Field use
     (SOPT4_FTM1CLKSEL_Field_0 => 0,
      SOPT4_FTM1CLKSEL_Field_1 => 1);

   --  FlexTimer 2 External Clock Pin Select
   type SOPT4_FTM2CLKSEL_Field is
     (
      --  FTM2 external clock driven by FTM_CLK0 pin.
      SOPT4_FTM2CLKSEL_Field_0,
      --  FTM2 external clock driven by FTM_CLK1 pin.
      SOPT4_FTM2CLKSEL_Field_1)
     with Size => 1;
   for SOPT4_FTM2CLKSEL_Field use
     (SOPT4_FTM2CLKSEL_Field_0 => 0,
      SOPT4_FTM2CLKSEL_Field_1 => 1);

   --  FlexTimer 3 External Clock Pin Select
   type SOPT4_FTM3CLKSEL_Field is
     (
      --  FTM3 external clock driven by FTM_CLK0 pin.
      SOPT4_FTM3CLKSEL_Field_0,
      --  FTM3 external clock driven by FTM_CLK1 pin.
      SOPT4_FTM3CLKSEL_Field_1)
     with Size => 1;
   for SOPT4_FTM3CLKSEL_Field use
     (SOPT4_FTM3CLKSEL_Field_0 => 0,
      SOPT4_FTM3CLKSEL_Field_1 => 1);

   --  FlexTimer 0 Hardware Trigger 0 Source Select
   type SOPT4_FTM0TRG0SRC_Field is
     (
      --  HSCMP0 output drives FTM0 hardware trigger 0
      SOPT4_FTM0TRG0SRC_Field_0,
      --  FTM1 channel match drives FTM0 hardware trigger 0
      SOPT4_FTM0TRG0SRC_Field_1)
     with Size => 1;
   for SOPT4_FTM0TRG0SRC_Field use
     (SOPT4_FTM0TRG0SRC_Field_0 => 0,
      SOPT4_FTM0TRG0SRC_Field_1 => 1);

   --  FlexTimer 0 Hardware Trigger 1 Source Select
   type SOPT4_FTM0TRG1SRC_Field is
     (
      --  PDB output trigger 1 drives FTM0 hardware trigger 1
      SOPT4_FTM0TRG1SRC_Field_0,
      --  FTM2 channel match drives FTM0 hardware trigger 1
      SOPT4_FTM0TRG1SRC_Field_1)
     with Size => 1;
   for SOPT4_FTM0TRG1SRC_Field use
     (SOPT4_FTM0TRG1SRC_Field_0 => 0,
      SOPT4_FTM0TRG1SRC_Field_1 => 1);

   --  FlexTimer 3 Hardware Trigger 0 Source Select
   type SOPT4_FTM3TRG0SRC_Field is
     (
      --  Reset value for the field
      Sopt4_Ftm3Trg0Src_Field_Reset,
      --  FTM1 channel match drives FTM3 hardware trigger 0
      SOPT4_FTM3TRG0SRC_Field_1)
     with Size => 1;
   for SOPT4_FTM3TRG0SRC_Field use
     (Sopt4_Ftm3Trg0Src_Field_Reset => 0,
      SOPT4_FTM3TRG0SRC_Field_1 => 1);

   --  FlexTimer 3 Hardware Trigger 1 Source Select
   type SOPT4_FTM3TRG1SRC_Field is
     (
      --  Reset value for the field
      Sopt4_Ftm3Trg1Src_Field_Reset,
      --  FTM2 channel match drives FTM3 hardware trigger 1
      SOPT4_FTM3TRG1SRC_Field_1)
     with Size => 1;
   for SOPT4_FTM3TRG1SRC_Field use
     (Sopt4_Ftm3Trg1Src_Field_Reset => 0,
      SOPT4_FTM3TRG1SRC_Field_1 => 1);

   --  System Options Register 4
   type SIM_SOPT4_Register is record
      --  FTM0 Fault 0 Select
      FTM0FLT0       : SOPT4_FTM0FLT0_Field :=
                        NRF_SVD.SIM.SOPT4_FTM0FLT0_Field_0;
      --  FTM0 Fault 1 Select
      FTM0FLT1       : SOPT4_FTM0FLT1_Field :=
                        NRF_SVD.SIM.SOPT4_FTM0FLT1_Field_0;
      --  FTM0 Fault 2 Select
      FTM0FLT2       : SOPT4_FTM0FLT2_Field :=
                        NRF_SVD.SIM.SOPT4_FTM0FLT2_Field_0;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  FTM1 Fault 0 Select
      FTM1FLT0       : SOPT4_FTM1FLT0_Field :=
                        NRF_SVD.SIM.SOPT4_FTM1FLT0_Field_0;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  FTM2 Fault 0 Select
      FTM2FLT0       : SOPT4_FTM2FLT0_Field :=
                        NRF_SVD.SIM.SOPT4_FTM2FLT0_Field_0;
      --  unspecified
      Reserved_9_11  : HAL.UInt3 := 16#0#;
      --  FTM3 Fault 0 Select
      FTM3FLT0       : SOPT4_FTM3FLT0_Field :=
                        NRF_SVD.SIM.SOPT4_FTM3FLT0_Field_0;
      --  unspecified
      Reserved_13_17 : HAL.UInt5 := 16#0#;
      --  FTM1 channel 0 input capture source select
      FTM1CH0SRC     : SOPT4_FTM1CH0SRC_Field :=
                        NRF_SVD.SIM.SOPT4_FTM1CH0SRC_Field_00;
      --  FTM2 channel 0 input capture source select
      FTM2CH0SRC     : SOPT4_FTM2CH0SRC_Field :=
                        NRF_SVD.SIM.SOPT4_FTM2CH0SRC_Field_00;
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  FlexTimer 0 External Clock Pin Select
      FTM0CLKSEL     : SOPT4_FTM0CLKSEL_Field :=
                        NRF_SVD.SIM.SOPT4_FTM0CLKSEL_Field_0;
      --  FTM1 External Clock Pin Select
      FTM1CLKSEL     : SOPT4_FTM1CLKSEL_Field :=
                        NRF_SVD.SIM.SOPT4_FTM1CLKSEL_Field_0;
      --  FlexTimer 2 External Clock Pin Select
      FTM2CLKSEL     : SOPT4_FTM2CLKSEL_Field :=
                        NRF_SVD.SIM.SOPT4_FTM2CLKSEL_Field_0;
      --  FlexTimer 3 External Clock Pin Select
      FTM3CLKSEL     : SOPT4_FTM3CLKSEL_Field :=
                        NRF_SVD.SIM.SOPT4_FTM3CLKSEL_Field_0;
      --  FlexTimer 0 Hardware Trigger 0 Source Select
      FTM0TRG0SRC    : SOPT4_FTM0TRG0SRC_Field :=
                        NRF_SVD.SIM.SOPT4_FTM0TRG0SRC_Field_0;
      --  FlexTimer 0 Hardware Trigger 1 Source Select
      FTM0TRG1SRC    : SOPT4_FTM0TRG1SRC_Field :=
                        NRF_SVD.SIM.SOPT4_FTM0TRG1SRC_Field_0;
      --  FlexTimer 3 Hardware Trigger 0 Source Select
      FTM3TRG0SRC    : SOPT4_FTM3TRG0SRC_Field :=
                        Sopt4_Ftm3Trg0Src_Field_Reset;
      --  FlexTimer 3 Hardware Trigger 1 Source Select
      FTM3TRG1SRC    : SOPT4_FTM3TRG1SRC_Field :=
                        Sopt4_Ftm3Trg1Src_Field_Reset;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_SOPT4_Register use record
      FTM0FLT0       at 0 range 0 .. 0;
      FTM0FLT1       at 0 range 1 .. 1;
      FTM0FLT2       at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      FTM1FLT0       at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      FTM2FLT0       at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      FTM3FLT0       at 0 range 12 .. 12;
      Reserved_13_17 at 0 range 13 .. 17;
      FTM1CH0SRC     at 0 range 18 .. 19;
      FTM2CH0SRC     at 0 range 20 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      FTM0CLKSEL     at 0 range 24 .. 24;
      FTM1CLKSEL     at 0 range 25 .. 25;
      FTM2CLKSEL     at 0 range 26 .. 26;
      FTM3CLKSEL     at 0 range 27 .. 27;
      FTM0TRG0SRC    at 0 range 28 .. 28;
      FTM0TRG1SRC    at 0 range 29 .. 29;
      FTM3TRG0SRC    at 0 range 30 .. 30;
      FTM3TRG1SRC    at 0 range 31 .. 31;
   end record;

   --  UART 0 transmit data source select
   type SOPT5_UART0TXSRC_Field is
     (
      --  UART0_TX pin
      SOPT5_UART0TXSRC_Field_00,
      --  UART0_TX pin modulated with FTM1 channel 0 output
      SOPT5_UART0TXSRC_Field_01,
      --  UART0_TX pin modulated with FTM2 channel 0 output
      SOPT5_UART0TXSRC_Field_10)
     with Size => 2;
   for SOPT5_UART0TXSRC_Field use
     (SOPT5_UART0TXSRC_Field_00 => 0,
      SOPT5_UART0TXSRC_Field_01 => 1,
      SOPT5_UART0TXSRC_Field_10 => 2);

   --  UART 0 receive data source select
   type SOPT5_UART0RXSRC_Field is
     (
      --  UART0_RX pin
      SOPT5_UART0RXSRC_Field_00,
      --  CMP0
      SOPT5_UART0RXSRC_Field_01,
      --  CMP1
      SOPT5_UART0RXSRC_Field_10)
     with Size => 2;
   for SOPT5_UART0RXSRC_Field use
     (SOPT5_UART0RXSRC_Field_00 => 0,
      SOPT5_UART0RXSRC_Field_01 => 1,
      SOPT5_UART0RXSRC_Field_10 => 2);

   --  UART 1 transmit data source select
   type SOPT5_UART1TXSRC_Field is
     (
      --  UART1_TX pin
      SOPT5_UART1TXSRC_Field_00,
      --  UART1_TX pin modulated with FTM1 channel 0 output
      SOPT5_UART1TXSRC_Field_01,
      --  UART1_TX pin modulated with FTM2 channel 0 output
      SOPT5_UART1TXSRC_Field_10)
     with Size => 2;
   for SOPT5_UART1TXSRC_Field use
     (SOPT5_UART1TXSRC_Field_00 => 0,
      SOPT5_UART1TXSRC_Field_01 => 1,
      SOPT5_UART1TXSRC_Field_10 => 2);

   --  UART 1 receive data source select
   type SOPT5_UART1RXSRC_Field is
     (
      --  UART1_RX pin
      SOPT5_UART1RXSRC_Field_00,
      --  CMP0
      SOPT5_UART1RXSRC_Field_01,
      --  CMP1
      SOPT5_UART1RXSRC_Field_10)
     with Size => 2;
   for SOPT5_UART1RXSRC_Field use
     (SOPT5_UART1RXSRC_Field_00 => 0,
      SOPT5_UART1RXSRC_Field_01 => 1,
      SOPT5_UART1RXSRC_Field_10 => 2);

   --  System Options Register 5
   type SIM_SOPT5_Register is record
      --  UART 0 transmit data source select
      UART0TXSRC    : SOPT5_UART0TXSRC_Field :=
                       NRF_SVD.SIM.SOPT5_UART0TXSRC_Field_00;
      --  UART 0 receive data source select
      UART0RXSRC    : SOPT5_UART0RXSRC_Field :=
                       NRF_SVD.SIM.SOPT5_UART0RXSRC_Field_00;
      --  UART 1 transmit data source select
      UART1TXSRC    : SOPT5_UART1TXSRC_Field :=
                       NRF_SVD.SIM.SOPT5_UART1TXSRC_Field_00;
      --  UART 1 receive data source select
      UART1RXSRC    : SOPT5_UART1RXSRC_Field :=
                       NRF_SVD.SIM.SOPT5_UART1RXSRC_Field_00;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_SOPT5_Register use record
      UART0TXSRC    at 0 range 0 .. 1;
      UART0RXSRC    at 0 range 2 .. 3;
      UART1TXSRC    at 0 range 4 .. 5;
      UART1RXSRC    at 0 range 6 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  ADC0 trigger select
   type SOPT7_ADC0TRGSEL_Field is
     (
      --  PDB external trigger pin input (PDB0_EXTRG)
      SOPT7_ADC0TRGSEL_Field_0000,
      --  High speed comparator 0 output
      SOPT7_ADC0TRGSEL_Field_0001,
      --  High speed comparator 1 output
      SOPT7_ADC0TRGSEL_Field_0010,
      --  High speed comparator 2 output
      SOPT7_ADC0TRGSEL_Field_0011,
      --  PIT trigger 0
      SOPT7_ADC0TRGSEL_Field_0100,
      --  PIT trigger 1
      SOPT7_ADC0TRGSEL_Field_0101,
      --  PIT trigger 2
      SOPT7_ADC0TRGSEL_Field_0110,
      --  PIT trigger 3
      SOPT7_ADC0TRGSEL_Field_0111,
      --  FTM0 trigger
      SOPT7_ADC0TRGSEL_Field_1000,
      --  FTM1 trigger
      SOPT7_ADC0TRGSEL_Field_1001,
      --  FTM2 trigger
      SOPT7_ADC0TRGSEL_Field_1010,
      --  FTM3 trigger
      SOPT7_ADC0TRGSEL_Field_1011,
      --  RTC alarm
      SOPT7_ADC0TRGSEL_Field_1100,
      --  RTC seconds
      SOPT7_ADC0TRGSEL_Field_1101,
      --  Low-power timer trigger
      SOPT7_ADC0TRGSEL_Field_1110)
     with Size => 4;
   for SOPT7_ADC0TRGSEL_Field use
     (SOPT7_ADC0TRGSEL_Field_0000 => 0,
      SOPT7_ADC0TRGSEL_Field_0001 => 1,
      SOPT7_ADC0TRGSEL_Field_0010 => 2,
      SOPT7_ADC0TRGSEL_Field_0011 => 3,
      SOPT7_ADC0TRGSEL_Field_0100 => 4,
      SOPT7_ADC0TRGSEL_Field_0101 => 5,
      SOPT7_ADC0TRGSEL_Field_0110 => 6,
      SOPT7_ADC0TRGSEL_Field_0111 => 7,
      SOPT7_ADC0TRGSEL_Field_1000 => 8,
      SOPT7_ADC0TRGSEL_Field_1001 => 9,
      SOPT7_ADC0TRGSEL_Field_1010 => 10,
      SOPT7_ADC0TRGSEL_Field_1011 => 11,
      SOPT7_ADC0TRGSEL_Field_1100 => 12,
      SOPT7_ADC0TRGSEL_Field_1101 => 13,
      SOPT7_ADC0TRGSEL_Field_1110 => 14);

   --  ADC0 pretrigger select
   type SOPT7_ADC0PRETRGSEL_Field is
     (
      --  Pre-trigger A
      SOPT7_ADC0PRETRGSEL_Field_0,
      --  Pre-trigger B
      SOPT7_ADC0PRETRGSEL_Field_1)
     with Size => 1;
   for SOPT7_ADC0PRETRGSEL_Field use
     (SOPT7_ADC0PRETRGSEL_Field_0 => 0,
      SOPT7_ADC0PRETRGSEL_Field_1 => 1);

   --  ADC0 alternate trigger enable
   type SOPT7_ADC0ALTTRGEN_Field is
     (
      --  PDB trigger selected for ADC0.
      SOPT7_ADC0ALTTRGEN_Field_0,
      --  Alternate trigger selected for ADC0.
      SOPT7_ADC0ALTTRGEN_Field_1)
     with Size => 1;
   for SOPT7_ADC0ALTTRGEN_Field use
     (SOPT7_ADC0ALTTRGEN_Field_0 => 0,
      SOPT7_ADC0ALTTRGEN_Field_1 => 1);

   --  ADC1 trigger select
   type SOPT7_ADC1TRGSEL_Field is
     (
      --  PDB external trigger pin input (PDB0_EXTRG)
      SOPT7_ADC1TRGSEL_Field_0000,
      --  High speed comparator 0 output
      SOPT7_ADC1TRGSEL_Field_0001,
      --  High speed comparator 1 output
      SOPT7_ADC1TRGSEL_Field_0010,
      --  High speed comparator 2 output
      SOPT7_ADC1TRGSEL_Field_0011,
      --  PIT trigger 0
      SOPT7_ADC1TRGSEL_Field_0100,
      --  PIT trigger 1
      SOPT7_ADC1TRGSEL_Field_0101,
      --  PIT trigger 2
      SOPT7_ADC1TRGSEL_Field_0110,
      --  PIT trigger 3
      SOPT7_ADC1TRGSEL_Field_0111,
      --  FTM0 trigger
      SOPT7_ADC1TRGSEL_Field_1000,
      --  FTM1 trigger
      SOPT7_ADC1TRGSEL_Field_1001,
      --  FTM2 trigger
      SOPT7_ADC1TRGSEL_Field_1010,
      --  FTM3 trigger
      SOPT7_ADC1TRGSEL_Field_1011,
      --  RTC alarm
      SOPT7_ADC1TRGSEL_Field_1100,
      --  RTC seconds
      SOPT7_ADC1TRGSEL_Field_1101,
      --  Low-power timer trigger
      SOPT7_ADC1TRGSEL_Field_1110)
     with Size => 4;
   for SOPT7_ADC1TRGSEL_Field use
     (SOPT7_ADC1TRGSEL_Field_0000 => 0,
      SOPT7_ADC1TRGSEL_Field_0001 => 1,
      SOPT7_ADC1TRGSEL_Field_0010 => 2,
      SOPT7_ADC1TRGSEL_Field_0011 => 3,
      SOPT7_ADC1TRGSEL_Field_0100 => 4,
      SOPT7_ADC1TRGSEL_Field_0101 => 5,
      SOPT7_ADC1TRGSEL_Field_0110 => 6,
      SOPT7_ADC1TRGSEL_Field_0111 => 7,
      SOPT7_ADC1TRGSEL_Field_1000 => 8,
      SOPT7_ADC1TRGSEL_Field_1001 => 9,
      SOPT7_ADC1TRGSEL_Field_1010 => 10,
      SOPT7_ADC1TRGSEL_Field_1011 => 11,
      SOPT7_ADC1TRGSEL_Field_1100 => 12,
      SOPT7_ADC1TRGSEL_Field_1101 => 13,
      SOPT7_ADC1TRGSEL_Field_1110 => 14);

   --  ADC1 pre-trigger select
   type SOPT7_ADC1PRETRGSEL_Field is
     (
      --  Pre-trigger A selected for ADC1.
      SOPT7_ADC1PRETRGSEL_Field_0,
      --  Pre-trigger B selected for ADC1.
      SOPT7_ADC1PRETRGSEL_Field_1)
     with Size => 1;
   for SOPT7_ADC1PRETRGSEL_Field use
     (SOPT7_ADC1PRETRGSEL_Field_0 => 0,
      SOPT7_ADC1PRETRGSEL_Field_1 => 1);

   --  ADC1 alternate trigger enable
   type SOPT7_ADC1ALTTRGEN_Field is
     (
      --  PDB trigger selected for ADC1
      SOPT7_ADC1ALTTRGEN_Field_0,
      --  Alternate trigger selected for ADC1 as defined by ADC1TRGSEL.
      SOPT7_ADC1ALTTRGEN_Field_1)
     with Size => 1;
   for SOPT7_ADC1ALTTRGEN_Field use
     (SOPT7_ADC1ALTTRGEN_Field_0 => 0,
      SOPT7_ADC1ALTTRGEN_Field_1 => 1);

   --  System Options Register 7
   type SIM_SOPT7_Register is record
      --  ADC0 trigger select
      ADC0TRGSEL     : SOPT7_ADC0TRGSEL_Field :=
                        NRF_SVD.SIM.SOPT7_ADC0TRGSEL_Field_0000;
      --  ADC0 pretrigger select
      ADC0PRETRGSEL  : SOPT7_ADC0PRETRGSEL_Field :=
                        NRF_SVD.SIM.SOPT7_ADC0PRETRGSEL_Field_0;
      --  unspecified
      Reserved_5_6   : HAL.UInt2 := 16#0#;
      --  ADC0 alternate trigger enable
      ADC0ALTTRGEN   : SOPT7_ADC0ALTTRGEN_Field :=
                        NRF_SVD.SIM.SOPT7_ADC0ALTTRGEN_Field_0;
      --  ADC1 trigger select
      ADC1TRGSEL     : SOPT7_ADC1TRGSEL_Field :=
                        NRF_SVD.SIM.SOPT7_ADC1TRGSEL_Field_0000;
      --  ADC1 pre-trigger select
      ADC1PRETRGSEL  : SOPT7_ADC1PRETRGSEL_Field :=
                        NRF_SVD.SIM.SOPT7_ADC1PRETRGSEL_Field_0;
      --  unspecified
      Reserved_13_14 : HAL.UInt2 := 16#0#;
      --  ADC1 alternate trigger enable
      ADC1ALTTRGEN   : SOPT7_ADC1ALTTRGEN_Field :=
                        NRF_SVD.SIM.SOPT7_ADC1ALTTRGEN_Field_0;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_SOPT7_Register use record
      ADC0TRGSEL     at 0 range 0 .. 3;
      ADC0PRETRGSEL  at 0 range 4 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      ADC0ALTTRGEN   at 0 range 7 .. 7;
      ADC1TRGSEL     at 0 range 8 .. 11;
      ADC1PRETRGSEL  at 0 range 12 .. 12;
      Reserved_13_14 at 0 range 13 .. 14;
      ADC1ALTTRGEN   at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Pincount identification
   type SDID_PINID_Field is
     (
      --  32-pin
      SDID_PINID_Field_0010,
      --  48-pin
      SDID_PINID_Field_0100,
      --  64-pin
      SDID_PINID_Field_0101,
      --  80-pin
      SDID_PINID_Field_0110,
      --  81-pin or 121-pin
      SDID_PINID_Field_0111,
      --  100-pin
      SDID_PINID_Field_1000,
      --  121-pin
      SDID_PINID_Field_1001,
      --  144-pin
      SDID_PINID_Field_1010,
      --  Custom pinout (WLCSP)
      SDID_PINID_Field_1011,
      --  256-pin
      SDID_PINID_Field_1110)
     with Size => 4;
   for SDID_PINID_Field use
     (SDID_PINID_Field_0010 => 2,
      SDID_PINID_Field_0100 => 4,
      SDID_PINID_Field_0101 => 5,
      SDID_PINID_Field_0110 => 6,
      SDID_PINID_Field_0111 => 7,
      SDID_PINID_Field_1000 => 8,
      SDID_PINID_Field_1001 => 9,
      SDID_PINID_Field_1010 => 10,
      SDID_PINID_Field_1011 => 11,
      SDID_PINID_Field_1110 => 14);

   --  Kinetis family identification
   type SDID_FAMID_Field is
     (
      --  K10 or K12 Family
      SDID_FAMID_Field_000,
      --  K20 or K22 Family
      SDID_FAMID_Field_001,
      --  K30 Family or K11 Family or K61 Family
      SDID_FAMID_Field_010,
      --  K40 Family or K21 Family
      SDID_FAMID_Field_011,
      --  K60 or K62 Family
      SDID_FAMID_Field_100,
      --  K70 Family
      SDID_FAMID_Field_101)
     with Size => 3;
   for SDID_FAMID_Field use
     (SDID_FAMID_Field_000 => 0,
      SDID_FAMID_Field_001 => 1,
      SDID_FAMID_Field_010 => 2,
      SDID_FAMID_Field_011 => 3,
      SDID_FAMID_Field_100 => 4,
      SDID_FAMID_Field_101 => 5);

   subtype SIM_SDID_DIEID_Field is HAL.UInt5;
   subtype SIM_SDID_REVID_Field is HAL.UInt4;

   --  System Device Identification Register
   type SIM_SDID_Register is record
      --  Read-only. Pincount identification
      PINID          : SDID_PINID_Field;
      --  Read-only. Kinetis family identification
      FAMID          : SDID_FAMID_Field;
      --  Read-only. Device die number
      DIEID          : SIM_SDID_DIEID_Field;
      --  Read-only. Device revision number
      REVID          : SIM_SDID_REVID_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_SDID_Register use record
      PINID          at 0 range 0 .. 3;
      FAMID          at 0 range 4 .. 6;
      DIEID          at 0 range 7 .. 11;
      REVID          at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  I2C2 Clock Gate Control
   type SCGC1_I2C2_Field is
     (
      --  Clock disabled
      SCGC1_I2C2_Field_0,
      --  Clock enabled
      SCGC1_I2C2_Field_1)
     with Size => 1;
   for SCGC1_I2C2_Field use
     (SCGC1_I2C2_Field_0 => 0,
      SCGC1_I2C2_Field_1 => 1);

   --  UART4 Clock Gate Control
   type SCGC1_UART4_Field is
     (
      --  Clock disabled
      SCGC1_UART4_Field_0,
      --  Clock enabled
      SCGC1_UART4_Field_1)
     with Size => 1;
   for SCGC1_UART4_Field use
     (SCGC1_UART4_Field_0 => 0,
      SCGC1_UART4_Field_1 => 1);

   --  SIM_SCGC1_UART array
   type SIM_SCGC1_UART_Field_Array is array (4 .. 5) of SCGC1_UART4_Field
     with Component_Size => 1, Size => 2;

   --  Type definition for SIM_SCGC1_UART
   type SIM_SCGC1_UART_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UART as a value
            Val : HAL.UInt2;
         when True =>
            --  UART as an array
            Arr : SIM_SCGC1_UART_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SIM_SCGC1_UART_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  System Clock Gating Control Register 1
   type SIM_SCGC1_Register is record
      --  unspecified
      Reserved_0_5   : HAL.UInt6 := 16#0#;
      --  I2C2 Clock Gate Control
      I2C2           : SCGC1_I2C2_Field := NRF_SVD.SIM.SCGC1_I2C2_Field_0;
      --  unspecified
      Reserved_7_9   : HAL.UInt3 := 16#0#;
      --  UART4 Clock Gate Control
      UART           : SIM_SCGC1_UART_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_SCGC1_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      I2C2           at 0 range 6 .. 6;
      Reserved_7_9   at 0 range 7 .. 9;
      UART           at 0 range 10 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  DAC0 Clock Gate Control
   type SCGC2_DAC0_Field is
     (
      --  Clock disabled
      SCGC2_DAC0_Field_0,
      --  Clock enabled
      SCGC2_DAC0_Field_1)
     with Size => 1;
   for SCGC2_DAC0_Field use
     (SCGC2_DAC0_Field_0 => 0,
      SCGC2_DAC0_Field_1 => 1);

   --  SIM_SCGC2_DAC array
   type SIM_SCGC2_DAC_Field_Array is array (0 .. 1) of SCGC2_DAC0_Field
     with Component_Size => 1, Size => 2;

   --  Type definition for SIM_SCGC2_DAC
   type SIM_SCGC2_DAC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DAC as a value
            Val : HAL.UInt2;
         when True =>
            --  DAC as an array
            Arr : SIM_SCGC2_DAC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SIM_SCGC2_DAC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  System Clock Gating Control Register 2
   type SIM_SCGC2_Register is record
      --  unspecified
      Reserved_0_11  : HAL.UInt12 := 16#0#;
      --  DAC0 Clock Gate Control
      DAC            : SIM_SCGC2_DAC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_31 : HAL.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_SCGC2_Register use record
      Reserved_0_11  at 0 range 0 .. 11;
      DAC            at 0 range 12 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   --  RNGA Clock Gate Control
   type SCGC3_RNGA_Field is
     (
      --  Clock disabled
      SCGC3_RNGA_Field_0,
      --  Clock enabled
      SCGC3_RNGA_Field_1)
     with Size => 1;
   for SCGC3_RNGA_Field use
     (SCGC3_RNGA_Field_0 => 0,
      SCGC3_RNGA_Field_1 => 1);

   --  SPI2 Clock Gate Control
   type SCGC3_SPI2_Field is
     (
      --  Clock disabled
      SCGC3_SPI2_Field_0,
      --  Clock enabled
      SCGC3_SPI2_Field_1)
     with Size => 1;
   for SCGC3_SPI2_Field use
     (SCGC3_SPI2_Field_0 => 0,
      SCGC3_SPI2_Field_1 => 1);

   --  SDHC Clock Gate Control
   type SCGC3_SDHC_Field is
     (
      --  Clock disabled
      SCGC3_SDHC_Field_0,
      --  Clock enabled
      SCGC3_SDHC_Field_1)
     with Size => 1;
   for SCGC3_SDHC_Field use
     (SCGC3_SDHC_Field_0 => 0,
      SCGC3_SDHC_Field_1 => 1);

   --  FTM2 Clock Gate Control
   type SCGC3_FTM2_Field is
     (
      --  Clock disabled
      SCGC3_FTM2_Field_0,
      --  Clock enabled
      SCGC3_FTM2_Field_1)
     with Size => 1;
   for SCGC3_FTM2_Field use
     (SCGC3_FTM2_Field_0 => 0,
      SCGC3_FTM2_Field_1 => 1);

   --  SIM_SCGC3_FTM array
   type SIM_SCGC3_FTM_Field_Array is array (2 .. 3) of SCGC3_FTM2_Field
     with Component_Size => 1, Size => 2;

   --  Type definition for SIM_SCGC3_FTM
   type SIM_SCGC3_FTM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FTM as a value
            Val : HAL.UInt2;
         when True =>
            --  FTM as an array
            Arr : SIM_SCGC3_FTM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SIM_SCGC3_FTM_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  ADC1 Clock Gate Control
   type SCGC3_ADC1_Field is
     (
      --  Clock disabled
      SCGC3_ADC1_Field_0,
      --  Clock enabled
      SCGC3_ADC1_Field_1)
     with Size => 1;
   for SCGC3_ADC1_Field use
     (SCGC3_ADC1_Field_0 => 0,
      SCGC3_ADC1_Field_1 => 1);

   --  System Clock Gating Control Register 3
   type SIM_SCGC3_Register is record
      --  RNGA Clock Gate Control
      RNGA           : SCGC3_RNGA_Field := NRF_SVD.SIM.SCGC3_RNGA_Field_0;
      --  unspecified
      Reserved_1_11  : HAL.UInt11 := 16#0#;
      --  SPI2 Clock Gate Control
      SPI2           : SCGC3_SPI2_Field := NRF_SVD.SIM.SCGC3_SPI2_Field_0;
      --  unspecified
      Reserved_13_16 : HAL.UInt4 := 16#0#;
      --  SDHC Clock Gate Control
      SDHC           : SCGC3_SDHC_Field := NRF_SVD.SIM.SCGC3_SDHC_Field_0;
      --  unspecified
      Reserved_18_23 : HAL.UInt6 := 16#0#;
      --  FTM2 Clock Gate Control
      FTM            : SIM_SCGC3_FTM_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_26_26 : HAL.Bit := 16#0#;
      --  ADC1 Clock Gate Control
      ADC1           : SCGC3_ADC1_Field := NRF_SVD.SIM.SCGC3_ADC1_Field_0;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_SCGC3_Register use record
      RNGA           at 0 range 0 .. 0;
      Reserved_1_11  at 0 range 1 .. 11;
      SPI2           at 0 range 12 .. 12;
      Reserved_13_16 at 0 range 13 .. 16;
      SDHC           at 0 range 17 .. 17;
      Reserved_18_23 at 0 range 18 .. 23;
      FTM            at 0 range 24 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      ADC1           at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  EWM Clock Gate Control
   type SCGC4_EWM_Field is
     (
      --  Clock disabled
      SCGC4_EWM_Field_0,
      --  Clock enabled
      SCGC4_EWM_Field_1)
     with Size => 1;
   for SCGC4_EWM_Field use
     (SCGC4_EWM_Field_0 => 0,
      SCGC4_EWM_Field_1 => 1);

   --  CMT Clock Gate Control
   type SCGC4_CMT_Field is
     (
      --  Clock disabled
      SCGC4_CMT_Field_0,
      --  Clock enabled
      SCGC4_CMT_Field_1)
     with Size => 1;
   for SCGC4_CMT_Field use
     (SCGC4_CMT_Field_0 => 0,
      SCGC4_CMT_Field_1 => 1);

   --  I2C0 Clock Gate Control
   type SCGC4_I2C0_Field is
     (
      --  Clock disabled
      SCGC4_I2C0_Field_0,
      --  Clock enabled
      SCGC4_I2C0_Field_1)
     with Size => 1;
   for SCGC4_I2C0_Field use
     (SCGC4_I2C0_Field_0 => 0,
      SCGC4_I2C0_Field_1 => 1);

   --  SIM_SCGC4_I2C array
   type SIM_SCGC4_I2C_Field_Array is array (0 .. 1) of SCGC4_I2C0_Field
     with Component_Size => 1, Size => 2;

   --  Type definition for SIM_SCGC4_I2C
   type SIM_SCGC4_I2C_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  I2C as a value
            Val : HAL.UInt2;
         when True =>
            --  I2C as an array
            Arr : SIM_SCGC4_I2C_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SIM_SCGC4_I2C_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  UART0 Clock Gate Control
   type SCGC4_UART0_Field is
     (
      --  Clock disabled
      SCGC4_UART0_Field_0,
      --  Clock enabled
      SCGC4_UART0_Field_1)
     with Size => 1;
   for SCGC4_UART0_Field use
     (SCGC4_UART0_Field_0 => 0,
      SCGC4_UART0_Field_1 => 1);

   --  SIM_SCGC4_UART array
   type SIM_SCGC4_UART_Field_Array is array (0 .. 3) of SCGC4_UART0_Field
     with Component_Size => 1, Size => 4;

   --  Type definition for SIM_SCGC4_UART
   type SIM_SCGC4_UART_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UART as a value
            Val : HAL.UInt4;
         when True =>
            --  UART as an array
            Arr : SIM_SCGC4_UART_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for SIM_SCGC4_UART_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  USB Clock Gate Control
   type SCGC4_USBOTG_Field is
     (
      --  Clock disabled
      SCGC4_USBOTG_Field_0,
      --  Clock enabled
      SCGC4_USBOTG_Field_1)
     with Size => 1;
   for SCGC4_USBOTG_Field use
     (SCGC4_USBOTG_Field_0 => 0,
      SCGC4_USBOTG_Field_1 => 1);

   --  Comparator Clock Gate Control
   type SCGC4_CMP_Field is
     (
      --  Clock disabled
      SCGC4_CMP_Field_0,
      --  Clock enabled
      SCGC4_CMP_Field_1)
     with Size => 1;
   for SCGC4_CMP_Field use
     (SCGC4_CMP_Field_0 => 0,
      SCGC4_CMP_Field_1 => 1);

   --  VREF Clock Gate Control
   type SCGC4_VREF_Field is
     (
      --  Clock disabled
      SCGC4_VREF_Field_0,
      --  Clock enabled
      SCGC4_VREF_Field_1)
     with Size => 1;
   for SCGC4_VREF_Field use
     (SCGC4_VREF_Field_0 => 0,
      SCGC4_VREF_Field_1 => 1);

   --  System Clock Gating Control Register 4
   type SIM_SCGC4_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      --  EWM Clock Gate Control
      EWM            : SCGC4_EWM_Field := NRF_SVD.SIM.SCGC4_EWM_Field_0;
      --  CMT Clock Gate Control
      CMT            : SCGC4_CMT_Field := NRF_SVD.SIM.SCGC4_CMT_Field_0;
      --  unspecified
      Reserved_3_5   : HAL.UInt3 := 16#6#;
      --  I2C0 Clock Gate Control
      I2C            : SIM_SCGC4_I2C_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_9   : HAL.UInt2 := 16#0#;
      --  UART0 Clock Gate Control
      UART           : SIM_SCGC4_UART_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_17 : HAL.UInt4 := 16#0#;
      --  USB Clock Gate Control
      USBOTG         : SCGC4_USBOTG_Field := NRF_SVD.SIM.SCGC4_USBOTG_Field_0;
      --  Comparator Clock Gate Control
      CMP            : SCGC4_CMP_Field := NRF_SVD.SIM.SCGC4_CMP_Field_0;
      --  VREF Clock Gate Control
      VREF           : SCGC4_VREF_Field := NRF_SVD.SIM.SCGC4_VREF_Field_1;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#780#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_SCGC4_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      EWM            at 0 range 1 .. 1;
      CMT            at 0 range 2 .. 2;
      Reserved_3_5   at 0 range 3 .. 5;
      I2C            at 0 range 6 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      UART           at 0 range 10 .. 13;
      Reserved_14_17 at 0 range 14 .. 17;
      USBOTG         at 0 range 18 .. 18;
      CMP            at 0 range 19 .. 19;
      VREF           at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   --  Low Power Timer Access Control
   type SCGC5_LPTMR_Field is
     (
      --  Access disabled
      SCGC5_LPTMR_Field_0,
      --  Access enabled
      SCGC5_LPTMR_Field_1)
     with Size => 1;
   for SCGC5_LPTMR_Field use
     (SCGC5_LPTMR_Field_0 => 0,
      SCGC5_LPTMR_Field_1 => 1);

   --  Port A Clock Gate Control
   type SCGC5_PORTA_Field is
     (
      --  Clock disabled
      SCGC5_PORTA_Field_0,
      --  Clock enabled
      SCGC5_PORTA_Field_1)
     with Size => 1;
   for SCGC5_PORTA_Field use
     (SCGC5_PORTA_Field_0 => 0,
      SCGC5_PORTA_Field_1 => 1);

   --  Port B Clock Gate Control
   type SCGC5_PORTB_Field is
     (
      --  Clock disabled
      SCGC5_PORTB_Field_0,
      --  Clock enabled
      SCGC5_PORTB_Field_1)
     with Size => 1;
   for SCGC5_PORTB_Field use
     (SCGC5_PORTB_Field_0 => 0,
      SCGC5_PORTB_Field_1 => 1);

   --  Port C Clock Gate Control
   type SCGC5_PORTC_Field is
     (
      --  Clock disabled
      SCGC5_PORTC_Field_0,
      --  Clock enabled
      SCGC5_PORTC_Field_1)
     with Size => 1;
   for SCGC5_PORTC_Field use
     (SCGC5_PORTC_Field_0 => 0,
      SCGC5_PORTC_Field_1 => 1);

   --  Port D Clock Gate Control
   type SCGC5_PORTD_Field is
     (
      --  Clock disabled
      SCGC5_PORTD_Field_0,
      --  Clock enabled
      SCGC5_PORTD_Field_1)
     with Size => 1;
   for SCGC5_PORTD_Field use
     (SCGC5_PORTD_Field_0 => 0,
      SCGC5_PORTD_Field_1 => 1);

   --  Port E Clock Gate Control
   type SCGC5_PORTE_Field is
     (
      --  Clock disabled
      SCGC5_PORTE_Field_0,
      --  Clock enabled
      SCGC5_PORTE_Field_1)
     with Size => 1;
   for SCGC5_PORTE_Field use
     (SCGC5_PORTE_Field_0 => 0,
      SCGC5_PORTE_Field_1 => 1);

   --  System Clock Gating Control Register 5
   type SIM_SCGC5_Register is record
      --  Low Power Timer Access Control
      LPTMR          : SCGC5_LPTMR_Field := NRF_SVD.SIM.SCGC5_LPTMR_Field_0;
      --  unspecified
      Reserved_1_8   : HAL.UInt8 := 16#C1#;
      --  Port A Clock Gate Control
      PORTA          : SCGC5_PORTA_Field := NRF_SVD.SIM.SCGC5_PORTA_Field_0;
      --  Port B Clock Gate Control
      PORTB          : SCGC5_PORTB_Field := NRF_SVD.SIM.SCGC5_PORTB_Field_0;
      --  Port C Clock Gate Control
      PORTC          : SCGC5_PORTC_Field := NRF_SVD.SIM.SCGC5_PORTC_Field_0;
      --  Port D Clock Gate Control
      PORTD          : SCGC5_PORTD_Field := NRF_SVD.SIM.SCGC5_PORTD_Field_0;
      --  Port E Clock Gate Control
      PORTE          : SCGC5_PORTE_Field := NRF_SVD.SIM.SCGC5_PORTE_Field_0;
      --  unspecified
      Reserved_14_31 : HAL.UInt18 := 16#10#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_SCGC5_Register use record
      LPTMR          at 0 range 0 .. 0;
      Reserved_1_8   at 0 range 1 .. 8;
      PORTA          at 0 range 9 .. 9;
      PORTB          at 0 range 10 .. 10;
      PORTC          at 0 range 11 .. 11;
      PORTD          at 0 range 12 .. 12;
      PORTE          at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   --  Flash Memory Clock Gate Control
   type SCGC6_FTF_Field is
     (
      --  Clock disabled
      SCGC6_FTF_Field_0,
      --  Clock enabled
      SCGC6_FTF_Field_1)
     with Size => 1;
   for SCGC6_FTF_Field use
     (SCGC6_FTF_Field_0 => 0,
      SCGC6_FTF_Field_1 => 1);

   --  DMA Mux Clock Gate Control
   type SCGC6_DMAMUX_Field is
     (
      --  Clock disabled
      SCGC6_DMAMUX_Field_0,
      --  Clock enabled
      SCGC6_DMAMUX_Field_1)
     with Size => 1;
   for SCGC6_DMAMUX_Field use
     (SCGC6_DMAMUX_Field_0 => 0,
      SCGC6_DMAMUX_Field_1 => 1);

   --  FlexCAN0 Clock Gate Control
   type SCGC6_FLEXCAN0_Field is
     (
      --  Clock disabled
      SCGC6_FLEXCAN0_Field_0,
      --  Clock enabled
      SCGC6_FLEXCAN0_Field_1)
     with Size => 1;
   for SCGC6_FLEXCAN0_Field use
     (SCGC6_FLEXCAN0_Field_0 => 0,
      SCGC6_FLEXCAN0_Field_1 => 1);

   --  SPI0 Clock Gate Control
   type SCGC6_SPI0_Field is
     (
      --  Clock disabled
      SCGC6_SPI0_Field_0,
      --  Clock enabled
      SCGC6_SPI0_Field_1)
     with Size => 1;
   for SCGC6_SPI0_Field use
     (SCGC6_SPI0_Field_0 => 0,
      SCGC6_SPI0_Field_1 => 1);

   --  SIM_SCGC6_SPI array
   type SIM_SCGC6_SPI_Field_Array is array (0 .. 1) of SCGC6_SPI0_Field
     with Component_Size => 1, Size => 2;

   --  Type definition for SIM_SCGC6_SPI
   type SIM_SCGC6_SPI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SPI as a value
            Val : HAL.UInt2;
         when True =>
            --  SPI as an array
            Arr : SIM_SCGC6_SPI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SIM_SCGC6_SPI_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  I2S Clock Gate Control
   type SCGC6_I2S_Field is
     (
      --  Clock disabled
      SCGC6_I2S_Field_0,
      --  Clock enabled
      SCGC6_I2S_Field_1)
     with Size => 1;
   for SCGC6_I2S_Field use
     (SCGC6_I2S_Field_0 => 0,
      SCGC6_I2S_Field_1 => 1);

   --  CRC Clock Gate Control
   type SCGC6_CRC_Field is
     (
      --  Clock disabled
      SCGC6_CRC_Field_0,
      --  Clock enabled
      SCGC6_CRC_Field_1)
     with Size => 1;
   for SCGC6_CRC_Field use
     (SCGC6_CRC_Field_0 => 0,
      SCGC6_CRC_Field_1 => 1);

   --  USB DCD Clock Gate Control
   type SCGC6_USBDCD_Field is
     (
      --  Clock disabled
      SCGC6_USBDCD_Field_0,
      --  Clock enabled
      SCGC6_USBDCD_Field_1)
     with Size => 1;
   for SCGC6_USBDCD_Field use
     (SCGC6_USBDCD_Field_0 => 0,
      SCGC6_USBDCD_Field_1 => 1);

   --  PDB Clock Gate Control
   type SCGC6_PDB_Field is
     (
      --  Clock disabled
      SCGC6_PDB_Field_0,
      --  Clock enabled
      SCGC6_PDB_Field_1)
     with Size => 1;
   for SCGC6_PDB_Field use
     (SCGC6_PDB_Field_0 => 0,
      SCGC6_PDB_Field_1 => 1);

   --  PIT Clock Gate Control
   type SCGC6_PIT_Field is
     (
      --  Clock disabled
      SCGC6_PIT_Field_0,
      --  Clock enabled
      SCGC6_PIT_Field_1)
     with Size => 1;
   for SCGC6_PIT_Field use
     (SCGC6_PIT_Field_0 => 0,
      SCGC6_PIT_Field_1 => 1);

   --  FTM0 Clock Gate Control
   type SCGC6_FTM0_Field is
     (
      --  Clock disabled
      SCGC6_FTM0_Field_0,
      --  Clock enabled
      SCGC6_FTM0_Field_1)
     with Size => 1;
   for SCGC6_FTM0_Field use
     (SCGC6_FTM0_Field_0 => 0,
      SCGC6_FTM0_Field_1 => 1);

   --  SIM_SCGC6_FTM array
   type SIM_SCGC6_FTM_Field_Array is array (0 .. 2) of SCGC6_FTM0_Field
     with Component_Size => 1, Size => 3;

   --  Type definition for SIM_SCGC6_FTM
   type SIM_SCGC6_FTM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FTM as a value
            Val : HAL.UInt3;
         when True =>
            --  FTM as an array
            Arr : SIM_SCGC6_FTM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for SIM_SCGC6_FTM_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  ADC0 Clock Gate Control
   type SCGC6_ADC0_Field is
     (
      --  Clock disabled
      SCGC6_ADC0_Field_0,
      --  Clock enabled
      SCGC6_ADC0_Field_1)
     with Size => 1;
   for SCGC6_ADC0_Field use
     (SCGC6_ADC0_Field_0 => 0,
      SCGC6_ADC0_Field_1 => 1);

   --  RTC Access Control
   type SCGC6_RTC_Field is
     (
      --  Access and interrupts disabled
      SCGC6_RTC_Field_0,
      --  Access and interrupts enabled
      SCGC6_RTC_Field_1)
     with Size => 1;
   for SCGC6_RTC_Field use
     (SCGC6_RTC_Field_0 => 0,
      SCGC6_RTC_Field_1 => 1);

   --  DAC0 Clock Gate Control
   type SCGC6_DAC0_Field is
     (
      --  Clock disabled
      SCGC6_DAC0_Field_0,
      --  Clock enabled
      SCGC6_DAC0_Field_1)
     with Size => 1;
   for SCGC6_DAC0_Field use
     (SCGC6_DAC0_Field_0 => 0,
      SCGC6_DAC0_Field_1 => 1);

   --  System Clock Gating Control Register 6
   type SIM_SCGC6_Register is record
      --  Flash Memory Clock Gate Control
      FTF            : SCGC6_FTF_Field := NRF_SVD.SIM.SCGC6_FTF_Field_1;
      --  DMA Mux Clock Gate Control
      DMAMUX         : SCGC6_DMAMUX_Field := NRF_SVD.SIM.SCGC6_DMAMUX_Field_0;
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      --  FlexCAN0 Clock Gate Control
      FLEXCAN0       : SCGC6_FLEXCAN0_Field :=
                        NRF_SVD.SIM.SCGC6_FLEXCAN0_Field_0;
      --  unspecified
      Reserved_5_8   : HAL.UInt4 := 16#0#;
      --  RNGA Clock Gate Control
      RNGA           : Boolean := False;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  SPI0 Clock Gate Control
      SPI            : SIM_SCGC6_SPI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_14 : HAL.Bit := 16#0#;
      --  I2S Clock Gate Control
      I2S            : SCGC6_I2S_Field := NRF_SVD.SIM.SCGC6_I2S_Field_0;
      --  unspecified
      Reserved_16_17 : HAL.UInt2 := 16#0#;
      --  CRC Clock Gate Control
      CRC            : SCGC6_CRC_Field := NRF_SVD.SIM.SCGC6_CRC_Field_0;
      --  unspecified
      Reserved_19_20 : HAL.UInt2 := 16#0#;
      --  USB DCD Clock Gate Control
      USBDCD         : SCGC6_USBDCD_Field := NRF_SVD.SIM.SCGC6_USBDCD_Field_0;
      --  PDB Clock Gate Control
      PDB            : SCGC6_PDB_Field := NRF_SVD.SIM.SCGC6_PDB_Field_0;
      --  PIT Clock Gate Control
      PIT            : SCGC6_PIT_Field := NRF_SVD.SIM.SCGC6_PIT_Field_0;
      --  FTM0 Clock Gate Control
      FTM            : SIM_SCGC6_FTM_Field :=
                        (As_Array => False, Val => 16#0#);
      --  ADC0 Clock Gate Control
      ADC0           : SCGC6_ADC0_Field := NRF_SVD.SIM.SCGC6_ADC0_Field_0;
      --  unspecified
      Reserved_28_28 : HAL.Bit := 16#0#;
      --  RTC Access Control
      RTC            : SCGC6_RTC_Field := NRF_SVD.SIM.SCGC6_RTC_Field_0;
      --  unspecified
      Reserved_30_30 : HAL.Bit := 16#1#;
      --  DAC0 Clock Gate Control
      DAC0           : SCGC6_DAC0_Field := NRF_SVD.SIM.SCGC6_DAC0_Field_0;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_SCGC6_Register use record
      FTF            at 0 range 0 .. 0;
      DMAMUX         at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      FLEXCAN0       at 0 range 4 .. 4;
      Reserved_5_8   at 0 range 5 .. 8;
      RNGA           at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      SPI            at 0 range 12 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      I2S            at 0 range 15 .. 15;
      Reserved_16_17 at 0 range 16 .. 17;
      CRC            at 0 range 18 .. 18;
      Reserved_19_20 at 0 range 19 .. 20;
      USBDCD         at 0 range 21 .. 21;
      PDB            at 0 range 22 .. 22;
      PIT            at 0 range 23 .. 23;
      FTM            at 0 range 24 .. 26;
      ADC0           at 0 range 27 .. 27;
      Reserved_28_28 at 0 range 28 .. 28;
      RTC            at 0 range 29 .. 29;
      Reserved_30_30 at 0 range 30 .. 30;
      DAC0           at 0 range 31 .. 31;
   end record;

   --  FlexBus Clock Gate Control
   type SCGC7_FLEXBUS_Field is
     (
      --  Clock disabled
      SCGC7_FLEXBUS_Field_0,
      --  Clock enabled
      SCGC7_FLEXBUS_Field_1)
     with Size => 1;
   for SCGC7_FLEXBUS_Field use
     (SCGC7_FLEXBUS_Field_0 => 0,
      SCGC7_FLEXBUS_Field_1 => 1);

   --  DMA Clock Gate Control
   type SCGC7_DMA_Field is
     (
      --  Clock disabled
      SCGC7_DMA_Field_0,
      --  Clock enabled
      SCGC7_DMA_Field_1)
     with Size => 1;
   for SCGC7_DMA_Field use
     (SCGC7_DMA_Field_0 => 0,
      SCGC7_DMA_Field_1 => 1);

   --  MPU Clock Gate Control
   type SCGC7_MPU_Field is
     (
      --  Clock disabled
      SCGC7_MPU_Field_0,
      --  Clock enabled
      SCGC7_MPU_Field_1)
     with Size => 1;
   for SCGC7_MPU_Field use
     (SCGC7_MPU_Field_0 => 0,
      SCGC7_MPU_Field_1 => 1);

   --  System Clock Gating Control Register 7
   type SIM_SCGC7_Register is record
      --  FlexBus Clock Gate Control
      FLEXBUS       : SCGC7_FLEXBUS_Field :=
                       NRF_SVD.SIM.SCGC7_FLEXBUS_Field_0;
      --  DMA Clock Gate Control
      DMA           : SCGC7_DMA_Field := NRF_SVD.SIM.SCGC7_DMA_Field_1;
      --  MPU Clock Gate Control
      MPU           : SCGC7_MPU_Field := NRF_SVD.SIM.SCGC7_MPU_Field_1;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_SCGC7_Register use record
      FLEXBUS       at 0 range 0 .. 0;
      DMA           at 0 range 1 .. 1;
      MPU           at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  Clock 4 output divider value
   type CLKDIV1_OUTDIV4_Field is
     (
      --  Divide-by-1.
      CLKDIV1_OUTDIV4_Field_0000,
      --  Divide-by-2.
      CLKDIV1_OUTDIV4_Field_0001,
      --  Divide-by-3.
      CLKDIV1_OUTDIV4_Field_0010,
      --  Divide-by-4.
      CLKDIV1_OUTDIV4_Field_0011,
      --  Divide-by-5.
      CLKDIV1_OUTDIV4_Field_0100,
      --  Divide-by-6.
      CLKDIV1_OUTDIV4_Field_0101,
      --  Divide-by-7.
      CLKDIV1_OUTDIV4_Field_0110,
      --  Divide-by-8.
      CLKDIV1_OUTDIV4_Field_0111,
      --  Divide-by-9.
      CLKDIV1_OUTDIV4_Field_1000,
      --  Divide-by-10.
      CLKDIV1_OUTDIV4_Field_1001,
      --  Divide-by-11.
      CLKDIV1_OUTDIV4_Field_1010,
      --  Divide-by-12.
      CLKDIV1_OUTDIV4_Field_1011,
      --  Divide-by-13.
      CLKDIV1_OUTDIV4_Field_1100,
      --  Divide-by-14.
      CLKDIV1_OUTDIV4_Field_1101,
      --  Divide-by-15.
      CLKDIV1_OUTDIV4_Field_1110,
      --  Divide-by-16.
      CLKDIV1_OUTDIV4_Field_1111)
     with Size => 4;
   for CLKDIV1_OUTDIV4_Field use
     (CLKDIV1_OUTDIV4_Field_0000 => 0,
      CLKDIV1_OUTDIV4_Field_0001 => 1,
      CLKDIV1_OUTDIV4_Field_0010 => 2,
      CLKDIV1_OUTDIV4_Field_0011 => 3,
      CLKDIV1_OUTDIV4_Field_0100 => 4,
      CLKDIV1_OUTDIV4_Field_0101 => 5,
      CLKDIV1_OUTDIV4_Field_0110 => 6,
      CLKDIV1_OUTDIV4_Field_0111 => 7,
      CLKDIV1_OUTDIV4_Field_1000 => 8,
      CLKDIV1_OUTDIV4_Field_1001 => 9,
      CLKDIV1_OUTDIV4_Field_1010 => 10,
      CLKDIV1_OUTDIV4_Field_1011 => 11,
      CLKDIV1_OUTDIV4_Field_1100 => 12,
      CLKDIV1_OUTDIV4_Field_1101 => 13,
      CLKDIV1_OUTDIV4_Field_1110 => 14,
      CLKDIV1_OUTDIV4_Field_1111 => 15);

   --  Clock 3 output divider value
   type CLKDIV1_OUTDIV3_Field is
     (
      --  Divide-by-1.
      CLKDIV1_OUTDIV3_Field_0000,
      --  Divide-by-2.
      CLKDIV1_OUTDIV3_Field_0001,
      --  Divide-by-3.
      CLKDIV1_OUTDIV3_Field_0010,
      --  Divide-by-4.
      CLKDIV1_OUTDIV3_Field_0011,
      --  Divide-by-5.
      CLKDIV1_OUTDIV3_Field_0100,
      --  Divide-by-6.
      CLKDIV1_OUTDIV3_Field_0101,
      --  Divide-by-7.
      CLKDIV1_OUTDIV3_Field_0110,
      --  Divide-by-8.
      CLKDIV1_OUTDIV3_Field_0111,
      --  Divide-by-9.
      CLKDIV1_OUTDIV3_Field_1000,
      --  Divide-by-10.
      CLKDIV1_OUTDIV3_Field_1001,
      --  Divide-by-11.
      CLKDIV1_OUTDIV3_Field_1010,
      --  Divide-by-12.
      CLKDIV1_OUTDIV3_Field_1011,
      --  Divide-by-13.
      CLKDIV1_OUTDIV3_Field_1100,
      --  Divide-by-14.
      CLKDIV1_OUTDIV3_Field_1101,
      --  Divide-by-15.
      CLKDIV1_OUTDIV3_Field_1110,
      --  Divide-by-16.
      CLKDIV1_OUTDIV3_Field_1111)
     with Size => 4;
   for CLKDIV1_OUTDIV3_Field use
     (CLKDIV1_OUTDIV3_Field_0000 => 0,
      CLKDIV1_OUTDIV3_Field_0001 => 1,
      CLKDIV1_OUTDIV3_Field_0010 => 2,
      CLKDIV1_OUTDIV3_Field_0011 => 3,
      CLKDIV1_OUTDIV3_Field_0100 => 4,
      CLKDIV1_OUTDIV3_Field_0101 => 5,
      CLKDIV1_OUTDIV3_Field_0110 => 6,
      CLKDIV1_OUTDIV3_Field_0111 => 7,
      CLKDIV1_OUTDIV3_Field_1000 => 8,
      CLKDIV1_OUTDIV3_Field_1001 => 9,
      CLKDIV1_OUTDIV3_Field_1010 => 10,
      CLKDIV1_OUTDIV3_Field_1011 => 11,
      CLKDIV1_OUTDIV3_Field_1100 => 12,
      CLKDIV1_OUTDIV3_Field_1101 => 13,
      CLKDIV1_OUTDIV3_Field_1110 => 14,
      CLKDIV1_OUTDIV3_Field_1111 => 15);

   --  Clock 2 output divider value
   type CLKDIV1_OUTDIV2_Field is
     (
      --  Divide-by-1.
      CLKDIV1_OUTDIV2_Field_0000,
      --  Divide-by-2.
      CLKDIV1_OUTDIV2_Field_0001,
      --  Divide-by-3.
      CLKDIV1_OUTDIV2_Field_0010,
      --  Divide-by-4.
      CLKDIV1_OUTDIV2_Field_0011,
      --  Divide-by-5.
      CLKDIV1_OUTDIV2_Field_0100,
      --  Divide-by-6.
      CLKDIV1_OUTDIV2_Field_0101,
      --  Divide-by-7.
      CLKDIV1_OUTDIV2_Field_0110,
      --  Divide-by-8.
      CLKDIV1_OUTDIV2_Field_0111,
      --  Divide-by-9.
      CLKDIV1_OUTDIV2_Field_1000,
      --  Divide-by-10.
      CLKDIV1_OUTDIV2_Field_1001,
      --  Divide-by-11.
      CLKDIV1_OUTDIV2_Field_1010,
      --  Divide-by-12.
      CLKDIV1_OUTDIV2_Field_1011,
      --  Divide-by-13.
      CLKDIV1_OUTDIV2_Field_1100,
      --  Divide-by-14.
      CLKDIV1_OUTDIV2_Field_1101,
      --  Divide-by-15.
      CLKDIV1_OUTDIV2_Field_1110,
      --  Divide-by-16.
      CLKDIV1_OUTDIV2_Field_1111)
     with Size => 4;
   for CLKDIV1_OUTDIV2_Field use
     (CLKDIV1_OUTDIV2_Field_0000 => 0,
      CLKDIV1_OUTDIV2_Field_0001 => 1,
      CLKDIV1_OUTDIV2_Field_0010 => 2,
      CLKDIV1_OUTDIV2_Field_0011 => 3,
      CLKDIV1_OUTDIV2_Field_0100 => 4,
      CLKDIV1_OUTDIV2_Field_0101 => 5,
      CLKDIV1_OUTDIV2_Field_0110 => 6,
      CLKDIV1_OUTDIV2_Field_0111 => 7,
      CLKDIV1_OUTDIV2_Field_1000 => 8,
      CLKDIV1_OUTDIV2_Field_1001 => 9,
      CLKDIV1_OUTDIV2_Field_1010 => 10,
      CLKDIV1_OUTDIV2_Field_1011 => 11,
      CLKDIV1_OUTDIV2_Field_1100 => 12,
      CLKDIV1_OUTDIV2_Field_1101 => 13,
      CLKDIV1_OUTDIV2_Field_1110 => 14,
      CLKDIV1_OUTDIV2_Field_1111 => 15);

   --  Clock 1 output divider value
   type CLKDIV1_OUTDIV1_Field is
     (
      --  Divide-by-1.
      CLKDIV1_OUTDIV1_Field_0000,
      --  Divide-by-2.
      CLKDIV1_OUTDIV1_Field_0001,
      --  Divide-by-3.
      CLKDIV1_OUTDIV1_Field_0010,
      --  Divide-by-4.
      CLKDIV1_OUTDIV1_Field_0011,
      --  Divide-by-5.
      CLKDIV1_OUTDIV1_Field_0100,
      --  Divide-by-6.
      CLKDIV1_OUTDIV1_Field_0101,
      --  Divide-by-7.
      CLKDIV1_OUTDIV1_Field_0110,
      --  Divide-by-8.
      CLKDIV1_OUTDIV1_Field_0111,
      --  Divide-by-9.
      CLKDIV1_OUTDIV1_Field_1000,
      --  Divide-by-10.
      CLKDIV1_OUTDIV1_Field_1001,
      --  Divide-by-11.
      CLKDIV1_OUTDIV1_Field_1010,
      --  Divide-by-12.
      CLKDIV1_OUTDIV1_Field_1011,
      --  Divide-by-13.
      CLKDIV1_OUTDIV1_Field_1100,
      --  Divide-by-14.
      CLKDIV1_OUTDIV1_Field_1101,
      --  Divide-by-15.
      CLKDIV1_OUTDIV1_Field_1110,
      --  Divide-by-16.
      CLKDIV1_OUTDIV1_Field_1111)
     with Size => 4;
   for CLKDIV1_OUTDIV1_Field use
     (CLKDIV1_OUTDIV1_Field_0000 => 0,
      CLKDIV1_OUTDIV1_Field_0001 => 1,
      CLKDIV1_OUTDIV1_Field_0010 => 2,
      CLKDIV1_OUTDIV1_Field_0011 => 3,
      CLKDIV1_OUTDIV1_Field_0100 => 4,
      CLKDIV1_OUTDIV1_Field_0101 => 5,
      CLKDIV1_OUTDIV1_Field_0110 => 6,
      CLKDIV1_OUTDIV1_Field_0111 => 7,
      CLKDIV1_OUTDIV1_Field_1000 => 8,
      CLKDIV1_OUTDIV1_Field_1001 => 9,
      CLKDIV1_OUTDIV1_Field_1010 => 10,
      CLKDIV1_OUTDIV1_Field_1011 => 11,
      CLKDIV1_OUTDIV1_Field_1100 => 12,
      CLKDIV1_OUTDIV1_Field_1101 => 13,
      CLKDIV1_OUTDIV1_Field_1110 => 14,
      CLKDIV1_OUTDIV1_Field_1111 => 15);

   --  System Clock Divider Register 1
   type SIM_CLKDIV1_Register is record
      --  unspecified
      Reserved_0_15 : HAL.UInt16 := 16#0#;
      --  Clock 4 output divider value
      OUTDIV4       : CLKDIV1_OUTDIV4_Field :=
                       NRF_SVD.SIM.CLKDIV1_OUTDIV4_Field_0001;
      --  Clock 3 output divider value
      OUTDIV3       : CLKDIV1_OUTDIV3_Field :=
                       NRF_SVD.SIM.CLKDIV1_OUTDIV3_Field_0001;
      --  Clock 2 output divider value
      OUTDIV2       : CLKDIV1_OUTDIV2_Field :=
                       NRF_SVD.SIM.CLKDIV1_OUTDIV2_Field_0000;
      --  Clock 1 output divider value
      OUTDIV1       : CLKDIV1_OUTDIV1_Field :=
                       NRF_SVD.SIM.CLKDIV1_OUTDIV1_Field_0000;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_CLKDIV1_Register use record
      Reserved_0_15 at 0 range 0 .. 15;
      OUTDIV4       at 0 range 16 .. 19;
      OUTDIV3       at 0 range 20 .. 23;
      OUTDIV2       at 0 range 24 .. 27;
      OUTDIV1       at 0 range 28 .. 31;
   end record;

   subtype SIM_CLKDIV2_USBDIV_Field is HAL.UInt3;

   --  System Clock Divider Register 2
   type SIM_CLKDIV2_Register is record
      --  USB clock divider fraction
      USBFRAC       : Boolean := False;
      --  USB clock divider divisor
      USBDIV        : SIM_CLKDIV2_USBDIV_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_CLKDIV2_Register use record
      USBFRAC       at 0 range 0 .. 0;
      USBDIV        at 0 range 1 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Flash Disable
   type FCFG1_FLASHDIS_Field is
     (
      --  Flash is enabled
      FCFG1_FLASHDIS_Field_0,
      --  Flash is disabled
      FCFG1_FLASHDIS_Field_1)
     with Size => 1;
   for FCFG1_FLASHDIS_Field use
     (FCFG1_FLASHDIS_Field_0 => 0,
      FCFG1_FLASHDIS_Field_1 => 1);

   --  Flash Doze
   type FCFG1_FLASHDOZE_Field is
     (
      --  Flash remains enabled during Wait mode
      FCFG1_FLASHDOZE_Field_0,
      --  Flash is disabled for the duration of Wait mode
      FCFG1_FLASHDOZE_Field_1)
     with Size => 1;
   for FCFG1_FLASHDOZE_Field use
     (FCFG1_FLASHDOZE_Field_0 => 0,
      FCFG1_FLASHDOZE_Field_1 => 1);

   subtype SIM_FCFG1_DEPART_Field is HAL.UInt4;

   --  EEPROM size
   type FCFG1_EESIZE_Field is
     (
      --  16 KB
      FCFG1_EESIZE_Field_0000,
      --  8 KB
      FCFG1_EESIZE_Field_0001,
      --  4 KB
      FCFG1_EESIZE_Field_0010,
      --  2 KB
      FCFG1_EESIZE_Field_0011,
      --  1 KB
      FCFG1_EESIZE_Field_0100,
      --  512 Bytes
      FCFG1_EESIZE_Field_0101,
      --  256 Bytes
      FCFG1_EESIZE_Field_0110,
      --  128 Bytes
      FCFG1_EESIZE_Field_0111,
      --  64 Bytes
      FCFG1_EESIZE_Field_1000,
      --  32 Bytes
      FCFG1_EESIZE_Field_1001,
      --  0 Bytes
      FCFG1_EESIZE_Field_1111)
     with Size => 4;
   for FCFG1_EESIZE_Field use
     (FCFG1_EESIZE_Field_0000 => 0,
      FCFG1_EESIZE_Field_0001 => 1,
      FCFG1_EESIZE_Field_0010 => 2,
      FCFG1_EESIZE_Field_0011 => 3,
      FCFG1_EESIZE_Field_0100 => 4,
      FCFG1_EESIZE_Field_0101 => 5,
      FCFG1_EESIZE_Field_0110 => 6,
      FCFG1_EESIZE_Field_0111 => 7,
      FCFG1_EESIZE_Field_1000 => 8,
      FCFG1_EESIZE_Field_1001 => 9,
      FCFG1_EESIZE_Field_1111 => 15);

   --  Program flash size
   type FCFG1_PFSIZE_Field is
     (
      --  32 KB of program flash memory
      FCFG1_PFSIZE_Field_0011,
      --  64 KB of program flash memory
      FCFG1_PFSIZE_Field_0101,
      --  128 KB of program flash memory
      FCFG1_PFSIZE_Field_0111,
      --  256 KB of program flash memory
      FCFG1_PFSIZE_Field_1001,
      --  512 KB of program flash memory
      FCFG1_PFSIZE_Field_1011,
      --  1024 KB of program flash memory
      FCFG1_PFSIZE_Field_1101,
      --  1024 KB of program flash memory
      FCFG1_PFSIZE_Field_1111)
     with Size => 4;
   for FCFG1_PFSIZE_Field use
     (FCFG1_PFSIZE_Field_0011 => 3,
      FCFG1_PFSIZE_Field_0101 => 5,
      FCFG1_PFSIZE_Field_0111 => 7,
      FCFG1_PFSIZE_Field_1001 => 9,
      FCFG1_PFSIZE_Field_1011 => 11,
      FCFG1_PFSIZE_Field_1101 => 13,
      FCFG1_PFSIZE_Field_1111 => 15);

   --  FlexNVM size
   type FCFG1_NVMSIZE_Field is
     (
      --  0 KB of FlexNVM
      FCFG1_NVMSIZE_Field_0000,
      --  32 KB of FlexNVM
      FCFG1_NVMSIZE_Field_0011,
      --  64 KB of FlexNVM
      FCFG1_NVMSIZE_Field_0101,
      --  128 KB of FlexNVM
      FCFG1_NVMSIZE_Field_0111,
      --  256 KB of FlexNVM
      FCFG1_NVMSIZE_Field_1001,
      --  512 KB of FlexNVM
      FCFG1_NVMSIZE_Field_1011,
      --  512 KB of FlexNVM
      FCFG1_NVMSIZE_Field_1111)
     with Size => 4;
   for FCFG1_NVMSIZE_Field use
     (FCFG1_NVMSIZE_Field_0000 => 0,
      FCFG1_NVMSIZE_Field_0011 => 3,
      FCFG1_NVMSIZE_Field_0101 => 5,
      FCFG1_NVMSIZE_Field_0111 => 7,
      FCFG1_NVMSIZE_Field_1001 => 9,
      FCFG1_NVMSIZE_Field_1011 => 11,
      FCFG1_NVMSIZE_Field_1111 => 15);

   --  Flash Configuration Register 1
   type SIM_FCFG1_Register is record
      --  Flash Disable
      FLASHDIS       : FCFG1_FLASHDIS_Field :=
                        NRF_SVD.SIM.FCFG1_FLASHDIS_Field_0;
      --  Flash Doze
      FLASHDOZE      : FCFG1_FLASHDOZE_Field :=
                        NRF_SVD.SIM.FCFG1_FLASHDOZE_Field_0;
      --  unspecified
      Reserved_2_7   : HAL.UInt6 := 16#0#;
      --  Read-only. FlexNVM partition
      DEPART         : SIM_FCFG1_DEPART_Field := 16#F#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Read-only. EEPROM size
      EESIZE         : FCFG1_EESIZE_Field :=
                        NRF_SVD.SIM.FCFG1_EESIZE_Field_1111;
      --  unspecified
      Reserved_20_23 : HAL.UInt4 := 16#0#;
      --  Read-only. Program flash size
      PFSIZE         : FCFG1_PFSIZE_Field :=
                        NRF_SVD.SIM.FCFG1_PFSIZE_Field_1111;
      --  Read-only. FlexNVM size
      NVMSIZE        : FCFG1_NVMSIZE_Field :=
                        NRF_SVD.SIM.FCFG1_NVMSIZE_Field_1111;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_FCFG1_Register use record
      FLASHDIS       at 0 range 0 .. 0;
      FLASHDOZE      at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      DEPART         at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      EESIZE         at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      PFSIZE         at 0 range 24 .. 27;
      NVMSIZE        at 0 range 28 .. 31;
   end record;

   subtype SIM_FCFG2_MAXADDR1_Field is HAL.UInt7;

   --  Program flash
   type FCFG2_PFLSH_Field is
     (
      --  Physical flash block 1 is used as FlexNVM Reserved for devices
      --  without FlexNVM
      FCFG2_PFLSH_Field_0,
      --  Physical flash block 1 is used as program flash
      FCFG2_PFLSH_Field_1)
     with Size => 1;
   for FCFG2_PFLSH_Field use
     (FCFG2_PFLSH_Field_0 => 0,
      FCFG2_PFLSH_Field_1 => 1);

   subtype SIM_FCFG2_MAXADDR0_Field is HAL.UInt7;

   --  Swap program flash
   type FCFG2_SWAPPFLSH_Field is
     (
      --  Swap is not active.
      FCFG2_SWAPPFLSH_Field_0,
      --  Swap is active.
      FCFG2_SWAPPFLSH_Field_1)
     with Size => 1;
   for FCFG2_SWAPPFLSH_Field use
     (FCFG2_SWAPPFLSH_Field_0 => 0,
      FCFG2_SWAPPFLSH_Field_1 => 1);

   --  Flash Configuration Register 2
   type SIM_FCFG2_Register is record
      --  unspecified
      Reserved_0_15 : HAL.UInt16;
      --  Read-only. Max address block 1
      MAXADDR1      : SIM_FCFG2_MAXADDR1_Field;
      --  Read-only. Program flash
      PFLSH         : FCFG2_PFLSH_Field;
      --  Read-only. Max address block 0
      MAXADDR0      : SIM_FCFG2_MAXADDR0_Field;
      --  Read-only. Swap program flash
      SWAPPFLSH     : FCFG2_SWAPPFLSH_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIM_FCFG2_Register use record
      Reserved_0_15 at 0 range 0 .. 15;
      MAXADDR1      at 0 range 16 .. 22;
      PFLSH         at 0 range 23 .. 23;
      MAXADDR0      at 0 range 24 .. 30;
      SWAPPFLSH     at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  System Integration Module
   type SIM_Peripheral is record
      --  System Options Register 1
      SOPT1    : aliased SIM_SOPT1_Register;
      --  SOPT1 Configuration Register
      SOPT1CFG : aliased SIM_SOPT1CFG_Register;
      --  System Options Register 2
      SOPT2    : aliased SIM_SOPT2_Register;
      --  System Options Register 4
      SOPT4    : aliased SIM_SOPT4_Register;
      --  System Options Register 5
      SOPT5    : aliased SIM_SOPT5_Register;
      --  System Options Register 7
      SOPT7    : aliased SIM_SOPT7_Register;
      --  System Device Identification Register
      SDID     : aliased SIM_SDID_Register;
      --  System Clock Gating Control Register 1
      SCGC1    : aliased SIM_SCGC1_Register;
      --  System Clock Gating Control Register 2
      SCGC2    : aliased SIM_SCGC2_Register;
      --  System Clock Gating Control Register 3
      SCGC3    : aliased SIM_SCGC3_Register;
      --  System Clock Gating Control Register 4
      SCGC4    : aliased SIM_SCGC4_Register;
      --  System Clock Gating Control Register 5
      SCGC5    : aliased SIM_SCGC5_Register;
      --  System Clock Gating Control Register 6
      SCGC6    : aliased SIM_SCGC6_Register;
      --  System Clock Gating Control Register 7
      SCGC7    : aliased SIM_SCGC7_Register;
      --  System Clock Divider Register 1
      CLKDIV1  : aliased SIM_CLKDIV1_Register;
      --  System Clock Divider Register 2
      CLKDIV2  : aliased SIM_CLKDIV2_Register;
      --  Flash Configuration Register 1
      FCFG1    : aliased SIM_FCFG1_Register;
      --  Flash Configuration Register 2
      FCFG2    : aliased SIM_FCFG2_Register;
      --  Unique Identification Register High
      UIDH     : aliased HAL.UInt32;
      --  Unique Identification Register Mid-High
      UIDMH    : aliased HAL.UInt32;
      --  Unique Identification Register Mid Low
      UIDML    : aliased HAL.UInt32;
      --  Unique Identification Register Low
      UIDL     : aliased HAL.UInt32;
   end record
     with Volatile;

   for SIM_Peripheral use record
      SOPT1    at 16#0# range 0 .. 31;
      SOPT1CFG at 16#4# range 0 .. 31;
      SOPT2    at 16#1004# range 0 .. 31;
      SOPT4    at 16#100C# range 0 .. 31;
      SOPT5    at 16#1010# range 0 .. 31;
      SOPT7    at 16#1018# range 0 .. 31;
      SDID     at 16#1024# range 0 .. 31;
      SCGC1    at 16#1028# range 0 .. 31;
      SCGC2    at 16#102C# range 0 .. 31;
      SCGC3    at 16#1030# range 0 .. 31;
      SCGC4    at 16#1034# range 0 .. 31;
      SCGC5    at 16#1038# range 0 .. 31;
      SCGC6    at 16#103C# range 0 .. 31;
      SCGC7    at 16#1040# range 0 .. 31;
      CLKDIV1  at 16#1044# range 0 .. 31;
      CLKDIV2  at 16#1048# range 0 .. 31;
      FCFG1    at 16#104C# range 0 .. 31;
      FCFG2    at 16#1050# range 0 .. 31;
      UIDH     at 16#1054# range 0 .. 31;
      UIDMH    at 16#1058# range 0 .. 31;
      UIDML    at 16#105C# range 0 .. 31;
      UIDL     at 16#1060# range 0 .. 31;
   end record;

   --  System Integration Module
   SIM_Periph : aliased SIM_Peripheral
     with Import, Address => SIM_Base;

end NRF_SVD.SIM;
