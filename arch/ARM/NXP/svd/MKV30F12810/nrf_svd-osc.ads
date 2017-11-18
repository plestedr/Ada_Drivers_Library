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

--  This spec has been automatically generated from MKV30F12810.xml

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

--  Oscillator
package NRF_SVD.OSC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Oscillator 16 pF Capacitor Load Configure
   type CR_SC16P_Field is
     (
      --  Disable the selection.
      CR_SC16P_Field_0,
      --  Add 16 pF capacitor to the oscillator load.
      CR_SC16P_Field_1)
     with Size => 1;
   for CR_SC16P_Field use
     (CR_SC16P_Field_0 => 0,
      CR_SC16P_Field_1 => 1);

   --  Oscillator 8 pF Capacitor Load Configure
   type CR_SC8P_Field is
     (
      --  Disable the selection.
      CR_SC8P_Field_0,
      --  Add 8 pF capacitor to the oscillator load.
      CR_SC8P_Field_1)
     with Size => 1;
   for CR_SC8P_Field use
     (CR_SC8P_Field_0 => 0,
      CR_SC8P_Field_1 => 1);

   --  Oscillator 4 pF Capacitor Load Configure
   type CR_SC4P_Field is
     (
      --  Disable the selection.
      CR_SC4P_Field_0,
      --  Add 4 pF capacitor to the oscillator load.
      CR_SC4P_Field_1)
     with Size => 1;
   for CR_SC4P_Field use
     (CR_SC4P_Field_0 => 0,
      CR_SC4P_Field_1 => 1);

   --  Oscillator 2 pF Capacitor Load Configure
   type CR_SC2P_Field is
     (
      --  Disable the selection.
      CR_SC2P_Field_0,
      --  Add 2 pF capacitor to the oscillator load.
      CR_SC2P_Field_1)
     with Size => 1;
   for CR_SC2P_Field use
     (CR_SC2P_Field_0 => 0,
      CR_SC2P_Field_1 => 1);

   --  External Reference Stop Enable
   type CR_EREFSTEN_Field is
     (
      --  External reference clock is disabled in Stop mode.
      CR_EREFSTEN_Field_0,
      --  External reference clock stays enabled in Stop mode if ERCLKEN is set
      --  before entering Stop mode.
      CR_EREFSTEN_Field_1)
     with Size => 1;
   for CR_EREFSTEN_Field use
     (CR_EREFSTEN_Field_0 => 0,
      CR_EREFSTEN_Field_1 => 1);

   --  External Reference Enable
   type CR_ERCLKEN_Field is
     (
      --  External reference clock is inactive.
      CR_ERCLKEN_Field_0,
      --  External reference clock is enabled.
      CR_ERCLKEN_Field_1)
     with Size => 1;
   for CR_ERCLKEN_Field use
     (CR_ERCLKEN_Field_0 => 0,
      CR_ERCLKEN_Field_1 => 1);

   --  OSC Control Register
   type OSC_CR_Register is record
      --  Oscillator 16 pF Capacitor Load Configure
      SC16P        : CR_SC16P_Field := NRF_SVD.OSC.CR_SC16P_Field_0;
      --  Oscillator 8 pF Capacitor Load Configure
      SC8P         : CR_SC8P_Field := NRF_SVD.OSC.CR_SC8P_Field_0;
      --  Oscillator 4 pF Capacitor Load Configure
      SC4P         : CR_SC4P_Field := NRF_SVD.OSC.CR_SC4P_Field_0;
      --  Oscillator 2 pF Capacitor Load Configure
      SC2P         : CR_SC2P_Field := NRF_SVD.OSC.CR_SC2P_Field_0;
      --  unspecified
      Reserved_4_4 : HAL.Bit := 16#0#;
      --  External Reference Stop Enable
      EREFSTEN     : CR_EREFSTEN_Field := NRF_SVD.OSC.CR_EREFSTEN_Field_0;
      --  unspecified
      Reserved_6_6 : HAL.Bit := 16#0#;
      --  External Reference Enable
      ERCLKEN      : CR_ERCLKEN_Field := NRF_SVD.OSC.CR_ERCLKEN_Field_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for OSC_CR_Register use record
      SC16P        at 0 range 0 .. 0;
      SC8P         at 0 range 1 .. 1;
      SC4P         at 0 range 2 .. 2;
      SC2P         at 0 range 3 .. 3;
      Reserved_4_4 at 0 range 4 .. 4;
      EREFSTEN     at 0 range 5 .. 5;
      Reserved_6_6 at 0 range 6 .. 6;
      ERCLKEN      at 0 range 7 .. 7;
   end record;

   --  ERCLK prescaler
   type DIV_ERPS_Field is
     (
      --  The divisor ratio is 1.
      DIV_ERPS_Field_00,
      --  The divisor ratio is 2.
      DIV_ERPS_Field_01,
      --  The divisor ratio is 4.
      DIV_ERPS_Field_10,
      --  The divisor ratio is 8.
      DIV_ERPS_Field_11)
     with Size => 2;
   for DIV_ERPS_Field use
     (DIV_ERPS_Field_00 => 0,
      DIV_ERPS_Field_01 => 1,
      DIV_ERPS_Field_10 => 2,
      DIV_ERPS_Field_11 => 3);

   --  OSC_DIV
   type OSC_DIV_Register is record
      --  unspecified
      Reserved_0_5 : HAL.UInt6 := 16#0#;
      --  ERCLK prescaler
      ERPS         : DIV_ERPS_Field := NRF_SVD.OSC.DIV_ERPS_Field_00;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for OSC_DIV_Register use record
      Reserved_0_5 at 0 range 0 .. 5;
      ERPS         at 0 range 6 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Oscillator
   type OSC_Peripheral is record
      --  OSC Control Register
      CR  : aliased OSC_CR_Register;
      --  OSC_DIV
      DIV : aliased OSC_DIV_Register;
   end record
     with Volatile;

   for OSC_Peripheral use record
      CR  at 16#0# range 0 .. 7;
      DIV at 16#2# range 0 .. 7;
   end record;

   --  Oscillator
   OSC_Periph : aliased OSC_Peripheral
     with Import, Address => OSC_Base;

end NRF_SVD.OSC;
