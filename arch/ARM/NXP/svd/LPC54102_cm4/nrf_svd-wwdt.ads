--  Redistribution and use in source and binary forms, with or without modification,are permitted provided that the following conditions are met:1. Redistributions of source code must retain the above copyright notice, this list  of conditions and the following disclaimer.2. Redistributions in binary form must reproduce the above copyright notice, this  list of conditions and the following disclaimer in the documentation and/or  other materials provided with the distribution.3. Neither the name of the copyright holder nor the names of its  contributors may be used to endorse or promote products derived from this  software without specific prior written permission.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" ANDANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIEDWARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE AREDISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FORANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ONANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THISSOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.  

--  This spec has been automatically generated from LPC54102_cm4.xml

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package NRF_SVD.WWDT is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Watchdog enable bit. Once this bit is set to one and a watchdog feed is
   --  performed, the watchdog timer will run permanently.
   type MOD_WDEN_Field is
     (
      --  Stop. The watchdog timer is stopped.
      Stop,
      --  Run. The watchdog timer is running.
      Run)
     with Size => 1;
   for MOD_WDEN_Field use
     (Stop => 0,
      Run => 1);

   --  Watchdog reset enable bit. Once this bit has been written with a 1 it
   --  cannot be re-written with a 0.
   type MOD_WDRESET_Field is
     (
      --  Interrupt. A watchdog time-out will not cause a chip reset.
      Interrupt,
      --  Reset. A watchdog time-out will cause a chip reset.
      Reset)
     with Size => 1;
   for MOD_WDRESET_Field use
     (Interrupt => 0,
      Reset => 1);

   --  Watchdog update mode. This bit can be set once by software and is only
   --  cleared by a reset.
   type MOD_WDPROTECT_Field is
     (
      --  Flexible. The watchdog time-out value (TC) can be changed at any
      --  time.
      Flexible,
      --  Threshold. The watchdog time-out value (TC) can be changed only after
      --  the counter is below the value of WDWARNINT and WDWINDOW.
      Threshold)
     with Size => 1;
   for MOD_WDPROTECT_Field use
     (Flexible => 0,
      Threshold => 1);

   --  Watchdog mode register. This register contains the basic mode and status
   --  of the Watchdog Timer.
   type MOD_Register is record
      --  Watchdog enable bit. Once this bit is set to one and a watchdog feed
      --  is performed, the watchdog timer will run permanently.
      WDEN          : MOD_WDEN_Field := NRF_SVD.WWDT.Stop;
      --  Watchdog reset enable bit. Once this bit has been written with a 1 it
      --  cannot be re-written with a 0.
      WDRESET       : MOD_WDRESET_Field := NRF_SVD.WWDT.Interrupt;
      --  Watchdog time-out flag. Set when the watchdog timer times out, by a
      --  feed error, or by events associated with WDPROTECT. Cleared by
      --  software. Causes a chip reset if WDRESET = 1.
      WDTOF         : Boolean := False;
      --  Warning interrupt flag. Set when the timer reaches the value in
      --  WDWARNINT. Cleared by software.
      WDINT         : Boolean := False;
      --  Watchdog update mode. This bit can be set once by software and is
      --  only cleared by a reset.
      WDPROTECT     : MOD_WDPROTECT_Field := NRF_SVD.WWDT.Flexible;
      --  Once this bit is set to one and a watchdog feed is performed,
      --  disabling or powering down the watchdog oscillator is prevented by
      --  hardware. This bit can be set once by software and is only cleared by
      --  any reset.
      LOCK          : Boolean := False;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MOD_Register use record
      WDEN          at 0 range 0 .. 0;
      WDRESET       at 0 range 1 .. 1;
      WDTOF         at 0 range 2 .. 2;
      WDINT         at 0 range 3 .. 3;
      WDPROTECT     at 0 range 4 .. 4;
      LOCK          at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype TC_COUNT_Field is HAL.UInt24;

   --  Watchdog timer constant register. This 24-bit register determines the
   --  time-out value.
   type TC_Register is record
      --  Watchdog time-out value.
      COUNT          : TC_COUNT_Field := 16#FF#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TC_Register use record
      COUNT          at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype FEED_FEED_Field is HAL.UInt8;

   --  Watchdog feed sequence register. Writing 0xAA followed by 0x55 to this
   --  register reloads the Watchdog timer with the value contained in WDTC.
   type FEED_Register is record
      --  Write-only. Feed value should be 0xAA followed by 0x55.
      FEED          : FEED_FEED_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FEED_Register use record
      FEED          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TV_COUNT_Field is HAL.UInt24;

   --  Watchdog timer value register. This 24-bit register reads out the
   --  current value of the Watchdog timer.
   type TV_Register is record
      --  Read-only. Counter timer value.
      COUNT          : TV_COUNT_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TV_Register use record
      COUNT          at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype WARNINT_WARNINT_Field is HAL.UInt10;

   --  Watchdog Warning Interrupt compare value.
   type WARNINT_Register is record
      --  Watchdog warning interrupt compare value.
      WARNINT        : WARNINT_WARNINT_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WARNINT_Register use record
      WARNINT        at 0 range 0 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype WINDOW_WINDOW_Field is HAL.UInt24;

   --  Watchdog Window compare value.
   type WINDOW_Register is record
      --  Watchdog window value.
      WINDOW         : WINDOW_WINDOW_Field := 16#FFFFFF#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WINDOW_Register use record
      WINDOW         at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  LPC5410x Windowed Watchdog Timer (WWDT)
   type WWDT_Peripheral is record
      --  Watchdog mode register. This register contains the basic mode and
      --  status of the Watchdog Timer.
      MOD_k   : aliased MOD_Register;
      --  Watchdog timer constant register. This 24-bit register determines the
      --  time-out value.
      TC      : aliased TC_Register;
      --  Watchdog feed sequence register. Writing 0xAA followed by 0x55 to
      --  this register reloads the Watchdog timer with the value contained in
      --  WDTC.
      FEED    : aliased FEED_Register;
      --  Watchdog timer value register. This 24-bit register reads out the
      --  current value of the Watchdog timer.
      TV      : aliased TV_Register;
      --  Watchdog Warning Interrupt compare value.
      WARNINT : aliased WARNINT_Register;
      --  Watchdog Window compare value.
      WINDOW  : aliased WINDOW_Register;
   end record
     with Volatile;

   for WWDT_Peripheral use record
      MOD_k   at 16#0# range 0 .. 31;
      TC      at 16#4# range 0 .. 31;
      FEED    at 16#8# range 0 .. 31;
      TV      at 16#C# range 0 .. 31;
      WARNINT at 16#14# range 0 .. 31;
      WINDOW  at 16#18# range 0 .. 31;
   end record;

   --  LPC5410x Windowed Watchdog Timer (WWDT)
   WWDT_Periph : aliased WWDT_Peripheral
     with Import, Address => System'To_Address (16#40038000#);

end NRF_SVD.WWDT;
