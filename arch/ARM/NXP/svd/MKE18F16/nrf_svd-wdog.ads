--  This spec has been automatically generated from MKE18F16.xml

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package NRF_SVD.WDOG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Stop Enable
   type CS_STOP_Field is
     (
      --  Watchdog disabled in chip stop mode.
      Stop_0,
      --  Watchdog enabled in chip stop mode.
      Stop_1)
     with Size => 1;
   for CS_STOP_Field use
     (Stop_0 => 0,
      Stop_1 => 1);

   --  Wait Enable
   type CS_WAIT_Field is
     (
      --  Watchdog disabled in chip wait mode.
      Wait_0,
      --  Watchdog enabled in chip wait mode.
      Wait_1)
     with Size => 1;
   for CS_WAIT_Field use
     (Wait_0 => 0,
      Wait_1 => 1);

   --  Debug Enable
   type CS_DBG_Field is
     (
      --  Watchdog disabled in chip debug mode.
      Dbg_0,
      --  Watchdog enabled in chip debug mode.
      Dbg_1)
     with Size => 1;
   for CS_DBG_Field use
     (Dbg_0 => 0,
      Dbg_1 => 1);

   --  Watchdog Test
   type CS_TST_Field is
     (
      --  Watchdog test mode disabled.
      Tst_0,
      --  Watchdog user mode enabled. (Watchdog test mode disabled.) After
      --  testing the watchdog, software should use this setting to indicate
      --  that the watchdog is functioning normally in user mode.
      Tst_1,
      --  Watchdog test mode enabled, only the low byte is used. CNT[CNTLOW] is
      --  compared with TOVAL[TOVALLOW].
      Tst_2,
      --  Watchdog test mode enabled, only the high byte is used. CNT[CNTHIGH]
      --  is compared with TOVAL[TOVALHIGH].
      Tst_3)
     with Size => 2;
   for CS_TST_Field use
     (Tst_0 => 0,
      Tst_1 => 1,
      Tst_2 => 2,
      Tst_3 => 3);

   --  Allow updates
   type CS_UPDATE_Field is
     (
      --  Updates not allowed. After the initial configuration, the watchdog
      --  cannot be later modified without forcing a reset.
      Update_0,
      --  Updates allowed. Software can modify the watchdog configuration
      --  registers within 128 bus clocks after performing the unlock write
      --  sequence.
      Update_1)
     with Size => 1;
   for CS_UPDATE_Field use
     (Update_0 => 0,
      Update_1 => 1);

   --  Watchdog Interrupt
   type CS_INT_Field is
     (
      --  Watchdog interrupts are disabled. Watchdog resets are not delayed.
      Int_0,
      --  Watchdog interrupts are enabled. Watchdog resets are delayed by 128
      --  bus clocks from the interrupt vector fetch.
      Int_1)
     with Size => 1;
   for CS_INT_Field use
     (Int_0 => 0,
      Int_1 => 1);

   --  Watchdog Enable
   type CS_EN_Field is
     (
      --  Watchdog disabled.
      En_0,
      --  Watchdog enabled.
      En_1)
     with Size => 1;
   for CS_EN_Field use
     (En_0 => 0,
      En_1 => 1);

   --  Watchdog Clock
   type CS_CLK_Field is
     (
      --  Bus clock
      Clk_0,
      --  LPO clock
      Clk_1,
      --  System oscillator clock (SOSC, from SCG)
      Clk_2,
      --  Slow internal reference clock (SIRC, from SCG)
      Clk_3)
     with Size => 2;
   for CS_CLK_Field use
     (Clk_0 => 0,
      Clk_1 => 1,
      Clk_2 => 2,
      Clk_3 => 3);

   --  Reconfiguration Success
   type CS_RCS_Field is
     (
      --  Reconfiguring WDOG.
      Rcs_0,
      --  Reconfiguration is successful.
      Rcs_1)
     with Size => 1;
   for CS_RCS_Field use
     (Rcs_0 => 0,
      Rcs_1 => 1);

   --  Unlock status
   type CS_ULK_Field is
     (
      --  WDOG is locked.
      Ulk_0,
      --  WDOG is unlocked.
      Ulk_1)
     with Size => 1;
   for CS_ULK_Field use
     (Ulk_0 => 0,
      Ulk_1 => 1);

   --  Watchdog prescaler
   type CS_PRES_Field is
     (
      --  256 prescaler disabled.
      Pres_0,
      --  256 prescaler enabled.
      Pres_1)
     with Size => 1;
   for CS_PRES_Field use
     (Pres_0 => 0,
      Pres_1 => 1);

   --  Enables or disables WDOG support for 32-bit (otherwise 16-bit or 8-bit)
   --  refresh/unlock command write words
   type CS_CMD32EN_Field is
     (
      --  Disables support for 32-bit refresh/unlock command write words. Only
      --  16-bit or 8-bit is supported.
      Cmd32En_0,
      --  Enables support for 32-bit refresh/unlock command write words. 16-bit
      --  or 8-bit is NOT supported.
      Cmd32En_1)
     with Size => 1;
   for CS_CMD32EN_Field use
     (Cmd32En_0 => 0,
      Cmd32En_1 => 1);

   --  Watchdog Interrupt Flag
   type CS_FLG_Field is
     (
      --  No interrupt occurred.
      Flg_0,
      --  An interrupt occurred.
      Flg_1)
     with Size => 1;
   for CS_FLG_Field use
     (Flg_0 => 0,
      Flg_1 => 1);

   --  Watchdog Window
   type CS_WIN_Field is
     (
      --  Window mode disabled.
      Win_0,
      --  Window mode enabled.
      Win_1)
     with Size => 1;
   for CS_WIN_Field use
     (Win_0 => 0,
      Win_1 => 1);

   --  Watchdog Control and Status Register
   type WDOG_CS_Register is record
      --  Stop Enable
      STOP           : CS_STOP_Field := NRF_SVD.WDOG.Stop_0;
      --  Wait Enable
      WAIT           : CS_WAIT_Field := NRF_SVD.WDOG.Wait_0;
      --  Debug Enable
      DBG            : CS_DBG_Field := NRF_SVD.WDOG.Dbg_0;
      --  Watchdog Test
      TST            : CS_TST_Field := NRF_SVD.WDOG.Tst_0;
      --  Allow updates
      UPDATE         : CS_UPDATE_Field := NRF_SVD.WDOG.Update_0;
      --  Watchdog Interrupt
      INT            : CS_INT_Field := NRF_SVD.WDOG.Int_0;
      --  Watchdog Enable
      EN             : CS_EN_Field := NRF_SVD.WDOG.En_1;
      --  Watchdog Clock
      CLK            : CS_CLK_Field := NRF_SVD.WDOG.Clk_1;
      --  Read-only. Reconfiguration Success
      RCS            : CS_RCS_Field := NRF_SVD.WDOG.Rcs_0;
      --  Read-only. Unlock status
      ULK            : CS_ULK_Field := NRF_SVD.WDOG.Ulk_1;
      --  Watchdog prescaler
      PRES           : CS_PRES_Field := NRF_SVD.WDOG.Pres_0;
      --  Enables or disables WDOG support for 32-bit (otherwise 16-bit or
      --  8-bit) refresh/unlock command write words
      CMD32EN        : CS_CMD32EN_Field := NRF_SVD.WDOG.Cmd32En_1;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Watchdog Interrupt Flag
      FLG            : CS_FLG_Field := NRF_SVD.WDOG.Flg_0;
      --  Watchdog Window
      WIN            : CS_WIN_Field := NRF_SVD.WDOG.Win_0;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WDOG_CS_Register use record
      STOP           at 0 range 0 .. 0;
      WAIT           at 0 range 1 .. 1;
      DBG            at 0 range 2 .. 2;
      TST            at 0 range 3 .. 4;
      UPDATE         at 0 range 5 .. 5;
      INT            at 0 range 6 .. 6;
      EN             at 0 range 7 .. 7;
      CLK            at 0 range 8 .. 9;
      RCS            at 0 range 10 .. 10;
      ULK            at 0 range 11 .. 11;
      PRES           at 0 range 12 .. 12;
      CMD32EN        at 0 range 13 .. 13;
      FLG            at 0 range 14 .. 14;
      WIN            at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype WDOG_CNT_CNTLOW_Field is HAL.UInt8;
   subtype WDOG_CNT_CNTHIGH_Field is HAL.UInt8;

   --  Watchdog Counter Register
   type WDOG_CNT_Register is record
      --  Low byte of the Watchdog Counter
      CNTLOW         : WDOG_CNT_CNTLOW_Field := 16#0#;
      --  High byte of the Watchdog Counter
      CNTHIGH        : WDOG_CNT_CNTHIGH_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WDOG_CNT_Register use record
      CNTLOW         at 0 range 0 .. 7;
      CNTHIGH        at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype WDOG_TOVAL_TOVALLOW_Field is HAL.UInt8;
   subtype WDOG_TOVAL_TOVALHIGH_Field is HAL.UInt8;

   --  Watchdog Timeout Value Register
   type WDOG_TOVAL_Register is record
      --  Low byte of the timeout value
      TOVALLOW       : WDOG_TOVAL_TOVALLOW_Field := 16#0#;
      --  High byte of the timeout value
      TOVALHIGH      : WDOG_TOVAL_TOVALHIGH_Field := 16#4#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WDOG_TOVAL_Register use record
      TOVALLOW       at 0 range 0 .. 7;
      TOVALHIGH      at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype WDOG_WIN_WINLOW_Field is HAL.UInt8;
   subtype WDOG_WIN_WINHIGH_Field is HAL.UInt8;

   --  Watchdog Window Register
   type WDOG_WIN_Register is record
      --  Low byte of Watchdog Window
      WINLOW         : WDOG_WIN_WINLOW_Field := 16#0#;
      --  High byte of Watchdog Window
      WINHIGH        : WDOG_WIN_WINHIGH_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WDOG_WIN_Register use record
      WINLOW         at 0 range 0 .. 7;
      WINHIGH        at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Watchdog timer
   type WDOG_Peripheral is record
      --  Watchdog Control and Status Register
      CS    : aliased WDOG_CS_Register;
      --  Watchdog Counter Register
      CNT   : aliased WDOG_CNT_Register;
      --  Watchdog Timeout Value Register
      TOVAL : aliased WDOG_TOVAL_Register;
      --  Watchdog Window Register
      WIN   : aliased WDOG_WIN_Register;
   end record
     with Volatile;

   for WDOG_Peripheral use record
      CS    at 16#0# range 0 .. 31;
      CNT   at 16#4# range 0 .. 31;
      TOVAL at 16#8# range 0 .. 31;
      WIN   at 16#C# range 0 .. 31;
   end record;

   --  Watchdog timer
   WDOG_Periph : aliased WDOG_Peripheral
     with Import, Address => System'To_Address (16#40052000#);

end NRF_SVD.WDOG;
