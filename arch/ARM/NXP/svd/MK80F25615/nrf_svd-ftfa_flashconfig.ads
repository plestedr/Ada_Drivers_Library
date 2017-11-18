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

--  This spec has been automatically generated from MK80F25615.xml

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

--  Flash configuration field
package NRF_SVD.FTFA_FlashConfig is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Flash Security
   type FSEC_SEC_Field is
     (
      --  MCU security status is unsecure
      FSEC_SEC_Field_10,
      --  MCU security status is secure
      FSEC_SEC_Field_11)
     with Size => 2;
   for FSEC_SEC_Field use
     (FSEC_SEC_Field_10 => 2,
      FSEC_SEC_Field_11 => 3);

   --  Freescale Failure Analysis Access Code
   type FSEC_FSLACC_Field is
     (
      --  Freescale factory access denied
      FSEC_FSLACC_Field_10,
      --  Freescale factory access granted
      FSEC_FSLACC_Field_11)
     with Size => 2;
   for FSEC_FSLACC_Field use
     (FSEC_FSLACC_Field_10 => 2,
      FSEC_FSLACC_Field_11 => 3);

   --  no description available
   type FSEC_MEEN_Field is
     (
      --  Mass erase is disabled
      FSEC_MEEN_Field_10,
      --  Mass erase is enabled
      FSEC_MEEN_Field_11)
     with Size => 2;
   for FSEC_MEEN_Field use
     (FSEC_MEEN_Field_10 => 2,
      FSEC_MEEN_Field_11 => 3);

   --  Backdoor Key Security Enable
   type FSEC_KEYEN_Field is
     (
      --  Backdoor key access enabled
      FSEC_KEYEN_Field_10,
      --  Backdoor key access disabled
      FSEC_KEYEN_Field_11)
     with Size => 2;
   for FSEC_KEYEN_Field use
     (FSEC_KEYEN_Field_10 => 2,
      FSEC_KEYEN_Field_11 => 3);

   --  Non-volatile Flash Security Register
   type NV_FSEC_Register is record
      --  Read-only. Flash Security
      SEC    : FSEC_SEC_Field;
      --  Read-only. Freescale Failure Analysis Access Code
      FSLACC : FSEC_FSLACC_Field;
      --  Read-only. no description available
      MEEN   : FSEC_MEEN_Field;
      --  Read-only. Backdoor Key Security Enable
      KEYEN  : FSEC_KEYEN_Field;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for NV_FSEC_Register use record
      SEC    at 0 range 0 .. 1;
      FSLACC at 0 range 2 .. 3;
      MEEN   at 0 range 4 .. 5;
      KEYEN  at 0 range 6 .. 7;
   end record;

   --  no description available
   type FOPT_LPBOOT_Field is
     (
      --  Low-power boot
      FOPT_LPBOOT_Field_00,
      --  Normal boot
      FOPT_LPBOOT_Field_01)
     with Size => 1;
   for FOPT_LPBOOT_Field use
     (FOPT_LPBOOT_Field_00 => 0,
      FOPT_LPBOOT_Field_01 => 1);

   --  no description available
   type FOPT_BOOTPIN_OPT_Field is
     (
      --  Force Boot from ROM if BOOTCFG0 asserted, where BOOTCFG0 is the boot
      --  config function which is muxed with NMI pin
      FOPT_BOOTPIN_OPT_Field_00,
      --  Boot source configured by FOPT (BOOTSRC_SEL) bits
      FOPT_BOOTPIN_OPT_Field_01)
     with Size => 1;
   for FOPT_BOOTPIN_OPT_Field use
     (FOPT_BOOTPIN_OPT_Field_00 => 0,
      FOPT_BOOTPIN_OPT_Field_01 => 1);

   --  no description available
   type FOPT_NMI_DIS_Field is
     (
      --  NMI interrupts are always blocked
      FOPT_NMI_DIS_Field_00,
      --  NMI_b pin/interrupts reset default to enabled
      FOPT_NMI_DIS_Field_01)
     with Size => 1;
   for FOPT_NMI_DIS_Field use
     (FOPT_NMI_DIS_Field_00 => 0,
      FOPT_NMI_DIS_Field_01 => 1);

   --  no description available
   type FOPT_FAST_INIT_Field is
     (
      --  Slower initialization
      FOPT_FAST_INIT_Field_00,
      --  Fast Initialization
      FOPT_FAST_INIT_Field_01)
     with Size => 1;
   for FOPT_FAST_INIT_Field use
     (FOPT_FAST_INIT_Field_00 => 0,
      FOPT_FAST_INIT_Field_01 => 1);

   --  Boot source selection
   type FOPT_BOOTSRC_SEL_Field is
     (
      --  Boot from Flash
      FOPT_BOOTSRC_SEL_Field_00,
      --  Boot from ROM, configure QSPI0, and enter boot loader mode.
      FOPT_BOOTSRC_SEL_Field_10,
      --  Boot from ROM and enter boot loader mode.
      FOPT_BOOTSRC_SEL_Field_11)
     with Size => 2;
   for FOPT_BOOTSRC_SEL_Field use
     (FOPT_BOOTSRC_SEL_Field_00 => 0,
      FOPT_BOOTSRC_SEL_Field_10 => 2,
      FOPT_BOOTSRC_SEL_Field_11 => 3);

   --  Non-volatile Flash Option Register
   type NV_FOPT_Register is record
      --  Read-only. no description available
      LPBOOT       : FOPT_LPBOOT_Field;
      --  Read-only. no description available
      BOOTPIN_OPT  : FOPT_BOOTPIN_OPT_Field;
      --  Read-only. no description available
      NMI_DIS      : FOPT_NMI_DIS_Field;
      --  unspecified
      Reserved_3_4 : HAL.UInt2;
      --  Read-only. no description available
      FAST_INIT    : FOPT_FAST_INIT_Field;
      --  Read-only. Boot source selection
      BOOTSRC_SEL  : FOPT_BOOTSRC_SEL_Field;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for NV_FOPT_Register use record
      LPBOOT       at 0 range 0 .. 0;
      BOOTPIN_OPT  at 0 range 1 .. 1;
      NMI_DIS      at 0 range 2 .. 2;
      Reserved_3_4 at 0 range 3 .. 4;
      FAST_INIT    at 0 range 5 .. 5;
      BOOTSRC_SEL  at 0 range 6 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Flash configuration field
   type FTFA_FlashConfig_Peripheral is record
      --  Backdoor Comparison Key 3.
      BACKKEY3 : aliased HAL.UInt8;
      --  Backdoor Comparison Key 2.
      BACKKEY2 : aliased HAL.UInt8;
      --  Backdoor Comparison Key 1.
      BACKKEY1 : aliased HAL.UInt8;
      --  Backdoor Comparison Key 0.
      BACKKEY0 : aliased HAL.UInt8;
      --  Backdoor Comparison Key 7.
      BACKKEY7 : aliased HAL.UInt8;
      --  Backdoor Comparison Key 6.
      BACKKEY6 : aliased HAL.UInt8;
      --  Backdoor Comparison Key 5.
      BACKKEY5 : aliased HAL.UInt8;
      --  Backdoor Comparison Key 4.
      BACKKEY4 : aliased HAL.UInt8;
      --  Non-volatile P-Flash Protection 1 - Low Register
      FPROT3   : aliased HAL.UInt8;
      --  Non-volatile P-Flash Protection 1 - High Register
      FPROT2   : aliased HAL.UInt8;
      --  Non-volatile P-Flash Protection 0 - Low Register
      FPROT1   : aliased HAL.UInt8;
      --  Non-volatile P-Flash Protection 0 - High Register
      FPROT0   : aliased HAL.UInt8;
      --  Non-volatile Flash Security Register
      FSEC     : aliased NV_FSEC_Register;
      --  Non-volatile Flash Option Register
      FOPT     : aliased NV_FOPT_Register;
   end record
     with Volatile;

   for FTFA_FlashConfig_Peripheral use record
      BACKKEY3 at 16#0# range 0 .. 7;
      BACKKEY2 at 16#1# range 0 .. 7;
      BACKKEY1 at 16#2# range 0 .. 7;
      BACKKEY0 at 16#3# range 0 .. 7;
      BACKKEY7 at 16#4# range 0 .. 7;
      BACKKEY6 at 16#5# range 0 .. 7;
      BACKKEY5 at 16#6# range 0 .. 7;
      BACKKEY4 at 16#7# range 0 .. 7;
      FPROT3   at 16#8# range 0 .. 7;
      FPROT2   at 16#9# range 0 .. 7;
      FPROT1   at 16#A# range 0 .. 7;
      FPROT0   at 16#B# range 0 .. 7;
      FSEC     at 16#C# range 0 .. 7;
      FOPT     at 16#D# range 0 .. 7;
   end record;

   --  Flash configuration field
   FTFA_FlashConfig_Periph : aliased FTFA_FlashConfig_Peripheral
     with Import, Address => FTFA_FlashConfig_Base;

end NRF_SVD.FTFA_FlashConfig;
