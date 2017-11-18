--  Redistribution and use in source and binary forms, with or without modification,
--  are permitted provided that the following conditions are met:
--  1. Redistributions of source code must retain the above copyright notice, this list
--  of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above copyright notice, this
--  list of conditions and the following disclaimer in the documentation and/or
--  other materials provided with the distribution.
--  3. Neither the name of the copyright holder nor the names of its
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

--  This spec has been automatically generated from MKS20F12.xml

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package NRF_SVD.TPM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Feature Identification Number
   type VERID_FEATURE_Field is
     (
      --  Standard feature set.
      VERID_FEATURE_Field_1,
      --  Standard feature set with Filter and Combine registers implemented.
      VERID_FEATURE_Field_11,
      --  Standard feature set with Filter, Combine and Quadrature registers
      --  implemented.
      VERID_FEATURE_Field_111)
     with Size => 16;
   for VERID_FEATURE_Field use
     (VERID_FEATURE_Field_1 => 1,
      VERID_FEATURE_Field_11 => 3,
      VERID_FEATURE_Field_111 => 7);

   subtype TPM0_VERID_MINOR_Field is HAL.UInt8;
   subtype TPM0_VERID_MAJOR_Field is HAL.UInt8;

   --  Version ID Register
   type TPM0_VERID_Register is record
      --  Read-only. Feature Identification Number
      FEATURE : VERID_FEATURE_Field;
      --  Read-only. Minor Version Number
      MINOR   : TPM0_VERID_MINOR_Field;
      --  Read-only. Major Version Number
      MAJOR   : TPM0_VERID_MAJOR_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPM0_VERID_Register use record
      FEATURE at 0 range 0 .. 15;
      MINOR   at 0 range 16 .. 23;
      MAJOR   at 0 range 24 .. 31;
   end record;

   subtype TPM0_PARAM_CHAN_Field is HAL.UInt8;
   subtype TPM0_PARAM_TRIG_Field is HAL.UInt8;
   subtype TPM0_PARAM_WIDTH_Field is HAL.UInt8;

   --  Parameter Register
   type TPM0_PARAM_Register is record
      --  Read-only. Channel Count
      CHAN           : TPM0_PARAM_CHAN_Field;
      --  Read-only. Trigger Count
      TRIG           : TPM0_PARAM_TRIG_Field;
      --  Read-only. Counter Width
      WIDTH          : TPM0_PARAM_WIDTH_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPM0_PARAM_Register use record
      CHAN           at 0 range 0 .. 7;
      TRIG           at 0 range 8 .. 15;
      WIDTH          at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Software Reset
   type GLOBAL_RST_Field is
     (
      --  Module is not reset.
      GLOBAL_RST_Field_0,
      --  Module is reset.
      GLOBAL_RST_Field_1)
     with Size => 1;
   for GLOBAL_RST_Field use
     (GLOBAL_RST_Field_0 => 0,
      GLOBAL_RST_Field_1 => 1);

   --  TPM Global Register
   type TPM0_GLOBAL_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit := 16#0#;
      --  Software Reset
      RST           : GLOBAL_RST_Field := NRF_SVD.TPM.GLOBAL_RST_Field_0;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPM0_GLOBAL_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      RST           at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Prescale Factor Selection
   type SC_PS_Field is
     (
      --  Divide by 1
      SC_PS_Field_000,
      --  Divide by 2
      SC_PS_Field_001,
      --  Divide by 4
      SC_PS_Field_010,
      --  Divide by 8
      SC_PS_Field_011,
      --  Divide by 16
      SC_PS_Field_100,
      --  Divide by 32
      SC_PS_Field_101,
      --  Divide by 64
      SC_PS_Field_110,
      --  Divide by 128
      SC_PS_Field_111)
     with Size => 3;
   for SC_PS_Field use
     (SC_PS_Field_000 => 0,
      SC_PS_Field_001 => 1,
      SC_PS_Field_010 => 2,
      SC_PS_Field_011 => 3,
      SC_PS_Field_100 => 4,
      SC_PS_Field_101 => 5,
      SC_PS_Field_110 => 6,
      SC_PS_Field_111 => 7);

   --  Clock Mode Selection
   type SC_CMOD_Field is
     (
      --  TPM counter is disabled
      SC_CMOD_Field_00,
      --  TPM counter increments on every TPM counter clock
      SC_CMOD_Field_01,
      --  TPM counter increments on rising edge of TPM_EXTCLK synchronized to
      --  the TPM counter clock
      SC_CMOD_Field_10,
      --  TPM counter increments on rising edge of the selected external input
      --  trigger.
      SC_CMOD_Field_11)
     with Size => 2;
   for SC_CMOD_Field use
     (SC_CMOD_Field_00 => 0,
      SC_CMOD_Field_01 => 1,
      SC_CMOD_Field_10 => 2,
      SC_CMOD_Field_11 => 3);

   --  Center-Aligned PWM Select
   type SC_CPWMS_Field is
     (
      --  TPM counter operates in up counting mode.
      SC_CPWMS_Field_0,
      --  TPM counter operates in up-down counting mode.
      SC_CPWMS_Field_1)
     with Size => 1;
   for SC_CPWMS_Field use
     (SC_CPWMS_Field_0 => 0,
      SC_CPWMS_Field_1 => 1);

   --  Timer Overflow Interrupt Enable
   type SC_TOIE_Field is
     (
      --  Disable TOF interrupts. Use software polling or DMA request.
      SC_TOIE_Field_0,
      --  Enable TOF interrupts. An interrupt is generated when TOF equals one.
      SC_TOIE_Field_1)
     with Size => 1;
   for SC_TOIE_Field use
     (SC_TOIE_Field_0 => 0,
      SC_TOIE_Field_1 => 1);

   --  Timer Overflow Flag
   type SC_TOF_Field is
     (
      --  TPM counter has not overflowed.
      SC_TOF_Field_0,
      --  TPM counter has overflowed.
      SC_TOF_Field_1)
     with Size => 1;
   for SC_TOF_Field use
     (SC_TOF_Field_0 => 0,
      SC_TOF_Field_1 => 1);

   --  DMA Enable
   type SC_DMA_Field is
     (
      --  Disables DMA transfers.
      SC_DMA_Field_0,
      --  Enables DMA transfers.
      SC_DMA_Field_1)
     with Size => 1;
   for SC_DMA_Field use
     (SC_DMA_Field_0 => 0,
      SC_DMA_Field_1 => 1);

   --  Status and Control
   type TPM0_SC_Register is record
      --  Prescale Factor Selection
      PS            : SC_PS_Field := NRF_SVD.TPM.SC_PS_Field_000;
      --  Clock Mode Selection
      CMOD          : SC_CMOD_Field := NRF_SVD.TPM.SC_CMOD_Field_00;
      --  Center-Aligned PWM Select
      CPWMS         : SC_CPWMS_Field := NRF_SVD.TPM.SC_CPWMS_Field_0;
      --  Timer Overflow Interrupt Enable
      TOIE          : SC_TOIE_Field := NRF_SVD.TPM.SC_TOIE_Field_0;
      --  Timer Overflow Flag
      TOF           : SC_TOF_Field := NRF_SVD.TPM.SC_TOF_Field_0;
      --  DMA Enable
      DMA           : SC_DMA_Field := NRF_SVD.TPM.SC_DMA_Field_0;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPM0_SC_Register use record
      PS            at 0 range 0 .. 2;
      CMOD          at 0 range 3 .. 4;
      CPWMS         at 0 range 5 .. 5;
      TOIE          at 0 range 6 .. 6;
      TOF           at 0 range 7 .. 7;
      DMA           at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype TPM0_CNT_COUNT_Field is HAL.UInt16;

   --  Counter
   type TPM0_CNT_Register is record
      --  Counter value
      COUNT          : TPM0_CNT_COUNT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPM0_CNT_Register use record
      COUNT          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TPM0_MOD_MOD_Field is HAL.UInt16;

   --  Modulo
   type TPM0_MOD_Register is record
      --  Modulo value
      MOD_k          : TPM0_MOD_MOD_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPM0_MOD_Register use record
      MOD_k          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Channel 0 Flag
   type STATUS_CH0F_Field is
     (
      --  No channel event has occurred.
      STATUS_CH0F_Field_0,
      --  A channel event has occurred.
      STATUS_CH0F_Field_1)
     with Size => 1;
   for STATUS_CH0F_Field use
     (STATUS_CH0F_Field_0 => 0,
      STATUS_CH0F_Field_1 => 1);

   --  Channel 1 Flag
   type STATUS_CH1F_Field is
     (
      --  No channel event has occurred.
      STATUS_CH1F_Field_0,
      --  A channel event has occurred.
      STATUS_CH1F_Field_1)
     with Size => 1;
   for STATUS_CH1F_Field use
     (STATUS_CH1F_Field_0 => 0,
      STATUS_CH1F_Field_1 => 1);

   --  Channel 2 Flag
   type STATUS_CH2F_Field is
     (
      --  No channel event has occurred.
      STATUS_CH2F_Field_0,
      --  A channel event has occurred.
      STATUS_CH2F_Field_1)
     with Size => 1;
   for STATUS_CH2F_Field use
     (STATUS_CH2F_Field_0 => 0,
      STATUS_CH2F_Field_1 => 1);

   --  Channel 3 Flag
   type STATUS_CH3F_Field is
     (
      --  No channel event has occurred.
      STATUS_CH3F_Field_0,
      --  A channel event has occurred.
      STATUS_CH3F_Field_1)
     with Size => 1;
   for STATUS_CH3F_Field use
     (STATUS_CH3F_Field_0 => 0,
      STATUS_CH3F_Field_1 => 1);

   --  Channel 4 Flag
   type STATUS_CH4F_Field is
     (
      --  No channel event has occurred.
      STATUS_CH4F_Field_0,
      --  A channel event has occurred.
      STATUS_CH4F_Field_1)
     with Size => 1;
   for STATUS_CH4F_Field use
     (STATUS_CH4F_Field_0 => 0,
      STATUS_CH4F_Field_1 => 1);

   --  Channel 5 Flag
   type STATUS_CH5F_Field is
     (
      --  No channel event has occurred.
      STATUS_CH5F_Field_0,
      --  A channel event has occurred.
      STATUS_CH5F_Field_1)
     with Size => 1;
   for STATUS_CH5F_Field use
     (STATUS_CH5F_Field_0 => 0,
      STATUS_CH5F_Field_1 => 1);

   --  Timer Overflow Flag
   type STATUS_TOF_Field is
     (
      --  TPM counter has not overflowed.
      STATUS_TOF_Field_0,
      --  TPM counter has overflowed.
      STATUS_TOF_Field_1)
     with Size => 1;
   for STATUS_TOF_Field use
     (STATUS_TOF_Field_0 => 0,
      STATUS_TOF_Field_1 => 1);

   --  Capture and Compare Status
   type TPM0_STATUS_Register is record
      --  Channel 0 Flag
      CH0F          : STATUS_CH0F_Field := NRF_SVD.TPM.STATUS_CH0F_Field_0;
      --  Channel 1 Flag
      CH1F          : STATUS_CH1F_Field := NRF_SVD.TPM.STATUS_CH1F_Field_0;
      --  Channel 2 Flag
      CH2F          : STATUS_CH2F_Field := NRF_SVD.TPM.STATUS_CH2F_Field_0;
      --  Channel 3 Flag
      CH3F          : STATUS_CH3F_Field := NRF_SVD.TPM.STATUS_CH3F_Field_0;
      --  Channel 4 Flag
      CH4F          : STATUS_CH4F_Field := NRF_SVD.TPM.STATUS_CH4F_Field_0;
      --  Channel 5 Flag
      CH5F          : STATUS_CH5F_Field := NRF_SVD.TPM.STATUS_CH5F_Field_0;
      --  unspecified
      Reserved_6_7  : HAL.UInt2 := 16#0#;
      --  Timer Overflow Flag
      TOF           : STATUS_TOF_Field := NRF_SVD.TPM.STATUS_TOF_Field_0;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPM0_STATUS_Register use record
      CH0F          at 0 range 0 .. 0;
      CH1F          at 0 range 1 .. 1;
      CH2F          at 0 range 2 .. 2;
      CH3F          at 0 range 3 .. 3;
      CH4F          at 0 range 4 .. 4;
      CH5F          at 0 range 5 .. 5;
      Reserved_6_7  at 0 range 6 .. 7;
      TOF           at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  DMA Enable
   type CSC0_DMA_Field is
     (
      --  Disable DMA transfers.
      CSC0_DMA_Field_0,
      --  Enable DMA transfers.
      CSC0_DMA_Field_1)
     with Size => 1;
   for CSC0_DMA_Field use
     (CSC0_DMA_Field_0 => 0,
      CSC0_DMA_Field_1 => 1);

   --  Channel Interrupt Enable
   type CSC0_CHIE_Field is
     (
      --  Disable channel interrupts.
      CSC0_CHIE_Field_0,
      --  Enable channel interrupts.
      CSC0_CHIE_Field_1)
     with Size => 1;
   for CSC0_CHIE_Field use
     (CSC0_CHIE_Field_0 => 0,
      CSC0_CHIE_Field_1 => 1);

   --  Channel Flag
   type CSC0_CHF_Field is
     (
      --  No channel event has occurred.
      CSC0_CHF_Field_0,
      --  A channel event has occurred.
      CSC0_CHF_Field_1)
     with Size => 1;
   for CSC0_CHF_Field use
     (CSC0_CHF_Field_0 => 0,
      CSC0_CHF_Field_1 => 1);

   --  Channel (n) Status and Control
   type CSC_Register is record
      --  DMA Enable
      DMA           : CSC0_DMA_Field := NRF_SVD.TPM.CSC0_DMA_Field_0;
      --  unspecified
      Reserved_1_1  : HAL.Bit := 16#0#;
      --  Edge or Level Select
      ELSA          : Boolean := False;
      --  Edge or Level Select
      ELSB          : Boolean := False;
      --  Channel Mode Select
      MSA           : Boolean := False;
      --  Channel Mode Select
      MSB           : Boolean := False;
      --  Channel Interrupt Enable
      CHIE          : CSC0_CHIE_Field := NRF_SVD.TPM.CSC0_CHIE_Field_0;
      --  Channel Flag
      CHF           : CSC0_CHF_Field := NRF_SVD.TPM.CSC0_CHF_Field_0;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSC_Register use record
      DMA           at 0 range 0 .. 0;
      Reserved_1_1  at 0 range 1 .. 1;
      ELSA          at 0 range 2 .. 2;
      ELSB          at 0 range 3 .. 3;
      MSA           at 0 range 4 .. 4;
      MSB           at 0 range 5 .. 5;
      CHIE          at 0 range 6 .. 6;
      CHF           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CV_VAL_Field is HAL.UInt16;

   --  Channel (n) Value
   type CV_Register is record
      --  Channel Value
      VAL            : CV_VAL_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CV_Register use record
      VAL            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Combine Channels 0 and 1
   type COMBINE_COMBINE0_Field is
     (
      --  Channels 0 and 1 are independent.
      COMBINE_COMBINE0_Field_0,
      --  Channels 0 and 1 are combined.
      COMBINE_COMBINE0_Field_1)
     with Size => 1;
   for COMBINE_COMBINE0_Field use
     (COMBINE_COMBINE0_Field_0 => 0,
      COMBINE_COMBINE0_Field_1 => 1);

   --  Combine Channel 0 and 1 Swap
   type COMBINE_COMSWAP0_Field is
     (
      --  Even channel is used for input capture and 1st compare.
      COMBINE_COMSWAP0_Field_0,
      --  Odd channel is used for input capture and 1st compare.
      COMBINE_COMSWAP0_Field_1)
     with Size => 1;
   for COMBINE_COMSWAP0_Field use
     (COMBINE_COMSWAP0_Field_0 => 0,
      COMBINE_COMSWAP0_Field_1 => 1);

   --  Combine Channels 2 and 3
   type COMBINE_COMBINE1_Field is
     (
      --  Channels 2 and 3 are independent.
      COMBINE_COMBINE1_Field_0,
      --  Channels 2 and 3 are combined.
      COMBINE_COMBINE1_Field_1)
     with Size => 1;
   for COMBINE_COMBINE1_Field use
     (COMBINE_COMBINE1_Field_0 => 0,
      COMBINE_COMBINE1_Field_1 => 1);

   --  Combine Channels 2 and 3 Swap
   type COMBINE_COMSWAP1_Field is
     (
      --  Even channel is used for input capture and 1st compare.
      COMBINE_COMSWAP1_Field_0,
      --  Odd channel is used for input capture and 1st compare.
      COMBINE_COMSWAP1_Field_1)
     with Size => 1;
   for COMBINE_COMSWAP1_Field use
     (COMBINE_COMSWAP1_Field_0 => 0,
      COMBINE_COMSWAP1_Field_1 => 1);

   --  Combine Channels 4 and 5
   type COMBINE_COMBINE2_Field is
     (
      --  Channels 4 and 5 are independent.
      COMBINE_COMBINE2_Field_0,
      --  Channels 4 and 5 are combined.
      COMBINE_COMBINE2_Field_1)
     with Size => 1;
   for COMBINE_COMBINE2_Field use
     (COMBINE_COMBINE2_Field_0 => 0,
      COMBINE_COMBINE2_Field_1 => 1);

   --  Combine Channels 4 and 5 Swap
   type COMBINE_COMSWAP2_Field is
     (
      --  Even channel is used for input capture and 1st compare.
      COMBINE_COMSWAP2_Field_0,
      --  Odd channel is used for input capture and 1st compare.
      COMBINE_COMSWAP2_Field_1)
     with Size => 1;
   for COMBINE_COMSWAP2_Field use
     (COMBINE_COMSWAP2_Field_0 => 0,
      COMBINE_COMSWAP2_Field_1 => 1);

   --  Combine Channel Register
   type TPM0_COMBINE_Register is record
      --  Combine Channels 0 and 1
      COMBINE0       : COMBINE_COMBINE0_Field :=
                        NRF_SVD.TPM.COMBINE_COMBINE0_Field_0;
      --  Combine Channel 0 and 1 Swap
      COMSWAP0       : COMBINE_COMSWAP0_Field :=
                        NRF_SVD.TPM.COMBINE_COMSWAP0_Field_0;
      --  unspecified
      Reserved_2_7   : HAL.UInt6 := 16#0#;
      --  Combine Channels 2 and 3
      COMBINE1       : COMBINE_COMBINE1_Field :=
                        NRF_SVD.TPM.COMBINE_COMBINE1_Field_0;
      --  Combine Channels 2 and 3 Swap
      COMSWAP1       : COMBINE_COMSWAP1_Field :=
                        NRF_SVD.TPM.COMBINE_COMSWAP1_Field_0;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
      --  Combine Channels 4 and 5
      COMBINE2       : COMBINE_COMBINE2_Field :=
                        NRF_SVD.TPM.COMBINE_COMBINE2_Field_0;
      --  Combine Channels 4 and 5 Swap
      COMSWAP2       : COMBINE_COMSWAP2_Field :=
                        NRF_SVD.TPM.COMBINE_COMSWAP2_Field_0;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPM0_COMBINE_Register use record
      COMBINE0       at 0 range 0 .. 0;
      COMSWAP0       at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      COMBINE1       at 0 range 8 .. 8;
      COMSWAP1       at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      COMBINE2       at 0 range 16 .. 16;
      COMSWAP2       at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   --  Channel 0 Trigger
   type TRIG_TRIG0_Field is
     (
      --  No effect.
      TRIG_TRIG0_Field_0,
      --  The input trigger is used for input capture and modulates output (for
      --  output compare and PWM).
      TRIG_TRIG0_Field_1)
     with Size => 1;
   for TRIG_TRIG0_Field use
     (TRIG_TRIG0_Field_0 => 0,
      TRIG_TRIG0_Field_1 => 1);

   --  TPM0_TRIG_TRIG array
   type TPM0_TRIG_TRIG_Field_Array is array (0 .. 5) of TRIG_TRIG0_Field
     with Component_Size => 1, Size => 6;

   --  Type definition for TPM0_TRIG_TRIG
   type TPM0_TRIG_TRIG_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TRIG as a value
            Val : HAL.UInt6;
         when True =>
            --  TRIG as an array
            Arr : TPM0_TRIG_TRIG_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for TPM0_TRIG_TRIG_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  Channel Trigger
   type TPM0_TRIG_Register is record
      --  Channel 0 Trigger
      TRIG          : TPM0_TRIG_TRIG_Field :=
                       (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPM0_TRIG_Register use record
      TRIG          at 0 range 0 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   --  Channel 0 Polarity
   type POL_POL0_Field is
     (
      --  The channel polarity is active high.
      POL_POL0_Field_0,
      --  The channel polarity is active low.
      POL_POL0_Field_1)
     with Size => 1;
   for POL_POL0_Field use
     (POL_POL0_Field_0 => 0,
      POL_POL0_Field_1 => 1);

   --  TPM0_POL_POL array
   type TPM0_POL_POL_Field_Array is array (0 .. 3) of POL_POL0_Field
     with Component_Size => 1, Size => 4;

   --  Type definition for TPM0_POL_POL
   type TPM0_POL_POL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  POL as a value
            Val : HAL.UInt4;
         when True =>
            --  POL as an array
            Arr : TPM0_POL_POL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for TPM0_POL_POL_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Channel 4 Polarity
   type POL_POL4_Field is
     (
      --  The channel polarity is active high
      POL_POL4_Field_0,
      --  The channel polarity is active low.
      POL_POL4_Field_1)
     with Size => 1;
   for POL_POL4_Field use
     (POL_POL4_Field_0 => 0,
      POL_POL4_Field_1 => 1);

   --  Channel 5 Polarity
   type POL_POL5_Field is
     (
      --  The channel polarity is active high.
      POL_POL5_Field_0,
      --  The channel polarity is active low.
      POL_POL5_Field_1)
     with Size => 1;
   for POL_POL5_Field use
     (POL_POL5_Field_0 => 0,
      POL_POL5_Field_1 => 1);

   --  Channel Polarity
   type TPM0_POL_Register is record
      --  Channel 0 Polarity
      POL           : TPM0_POL_POL_Field := (As_Array => False, Val => 16#0#);
      --  Channel 4 Polarity
      POL4          : POL_POL4_Field := NRF_SVD.TPM.POL_POL4_Field_0;
      --  Channel 5 Polarity
      POL5          : POL_POL5_Field := NRF_SVD.TPM.POL_POL5_Field_0;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPM0_POL_Register use record
      POL           at 0 range 0 .. 3;
      POL4          at 0 range 4 .. 4;
      POL5          at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype TPM0_FILTER_CH0FVAL_Field is HAL.UInt4;
   subtype TPM0_FILTER_CH1FVAL_Field is HAL.UInt4;
   subtype TPM0_FILTER_CH2FVAL_Field is HAL.UInt4;
   subtype TPM0_FILTER_CH3FVAL_Field is HAL.UInt4;
   subtype TPM0_FILTER_CH4FVAL_Field is HAL.UInt4;
   subtype TPM0_FILTER_CH5FVAL_Field is HAL.UInt4;

   --  Filter Control
   type TPM0_FILTER_Register is record
      --  Channel 0 Filter Value
      CH0FVAL        : TPM0_FILTER_CH0FVAL_Field := 16#0#;
      --  Channel 1 Filter Value
      CH1FVAL        : TPM0_FILTER_CH1FVAL_Field := 16#0#;
      --  Channel 2 Filter Value
      CH2FVAL        : TPM0_FILTER_CH2FVAL_Field := 16#0#;
      --  Channel 3 Filter Value
      CH3FVAL        : TPM0_FILTER_CH3FVAL_Field := 16#0#;
      --  Channel 4 Filter Value
      CH4FVAL        : TPM0_FILTER_CH4FVAL_Field := 16#0#;
      --  Channel 5 Filter Value
      CH5FVAL        : TPM0_FILTER_CH5FVAL_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPM0_FILTER_Register use record
      CH0FVAL        at 0 range 0 .. 3;
      CH1FVAL        at 0 range 4 .. 7;
      CH2FVAL        at 0 range 8 .. 11;
      CH3FVAL        at 0 range 12 .. 15;
      CH4FVAL        at 0 range 16 .. 19;
      CH5FVAL        at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Enables the quadrature decoder mode
   type QDCTRL_QUADEN_Field is
     (
      --  Quadrature decoder mode is disabled.
      QDCTRL_QUADEN_Field_0,
      --  Quadrature decoder mode is enabled.
      QDCTRL_QUADEN_Field_1)
     with Size => 1;
   for QDCTRL_QUADEN_Field use
     (QDCTRL_QUADEN_Field_0 => 0,
      QDCTRL_QUADEN_Field_1 => 1);

   --  Indicates if the TOF bit was set on the top or the bottom of counting.
   type QDCTRL_TOFDIR_Field is
     (
      --  TOF bit was set on the bottom of counting. There was an FTM counter
      --  decrement and FTM counter changes from its minimum value (zero) to
      --  its maximum value (MOD register).
      QDCTRL_TOFDIR_Field_0,
      --  TOF bit was set on the top of counting. There was an FTM counter
      --  increment and FTM counter changes from its maximum value (MOD
      --  register) to its minimum value (zero).
      QDCTRL_TOFDIR_Field_1)
     with Size => 1;
   for QDCTRL_TOFDIR_Field use
     (QDCTRL_TOFDIR_Field_0 => 0,
      QDCTRL_TOFDIR_Field_1 => 1);

   --  Counter Direction in Quadrature Decode Mode
   type QDCTRL_QUADIR_Field is
     (
      --  Counter direction is decreasing (counter decrement).
      QDCTRL_QUADIR_Field_0,
      --  Counter direction is increasing (counter increment).
      QDCTRL_QUADIR_Field_1)
     with Size => 1;
   for QDCTRL_QUADIR_Field use
     (QDCTRL_QUADIR_Field_0 => 0,
      QDCTRL_QUADIR_Field_1 => 1);

   --  Quadrature Decoder Mode
   type QDCTRL_QUADMODE_Field is
     (
      --  Phase encoding mode.
      QDCTRL_QUADMODE_Field_0,
      --  Count and direction encoding mode.
      QDCTRL_QUADMODE_Field_1)
     with Size => 1;
   for QDCTRL_QUADMODE_Field use
     (QDCTRL_QUADMODE_Field_0 => 0,
      QDCTRL_QUADMODE_Field_1 => 1);

   --  Quadrature Decoder Control and Status
   type TPM0_QDCTRL_Register is record
      --  Enables the quadrature decoder mode
      QUADEN        : QDCTRL_QUADEN_Field :=
                       NRF_SVD.TPM.QDCTRL_QUADEN_Field_0;
      --  Read-only. Indicates if the TOF bit was set on the top or the bottom
      --  of counting.
      TOFDIR        : QDCTRL_TOFDIR_Field :=
                       NRF_SVD.TPM.QDCTRL_TOFDIR_Field_0;
      --  Read-only. Counter Direction in Quadrature Decode Mode
      QUADIR        : QDCTRL_QUADIR_Field :=
                       NRF_SVD.TPM.QDCTRL_QUADIR_Field_0;
      --  Quadrature Decoder Mode
      QUADMODE      : QDCTRL_QUADMODE_Field :=
                       NRF_SVD.TPM.QDCTRL_QUADMODE_Field_0;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPM0_QDCTRL_Register use record
      QUADEN        at 0 range 0 .. 0;
      TOFDIR        at 0 range 1 .. 1;
      QUADIR        at 0 range 2 .. 2;
      QUADMODE      at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Doze Enable
   type CONF_DOZEEN_Field is
     (
      --  Internal TPM counter continues in Doze mode.
      CONF_DOZEEN_Field_0,
      --  Internal TPM counter is paused and does not increment during Doze
      --  mode. Trigger inputs and input capture events are also ignored.
      CONF_DOZEEN_Field_1)
     with Size => 1;
   for CONF_DOZEEN_Field use
     (CONF_DOZEEN_Field_0 => 0,
      CONF_DOZEEN_Field_1 => 1);

   --  Debug Mode
   type CONF_DBGMODE_Field is
     (
      --  TPM counter is paused and does not increment during debug mode.
      --  Trigger inputs and input capture events are also ignored.
      CONF_DBGMODE_Field_00,
      --  TPM counter continues in debug mode.
      CONF_DBGMODE_Field_11)
     with Size => 2;
   for CONF_DBGMODE_Field use
     (CONF_DBGMODE_Field_00 => 0,
      CONF_DBGMODE_Field_11 => 3);

   --  Global Time Base Synchronization
   type CONF_GTBSYNC_Field is
     (
      --  Global timebase synchronization disabled.
      CONF_GTBSYNC_Field_0,
      --  Global timebase synchronization enabled.
      CONF_GTBSYNC_Field_1)
     with Size => 1;
   for CONF_GTBSYNC_Field use
     (CONF_GTBSYNC_Field_0 => 0,
      CONF_GTBSYNC_Field_1 => 1);

   --  Global time base enable
   type CONF_GTBEEN_Field is
     (
      --  All channels use the internally generated TPM counter as their
      --  timebase
      CONF_GTBEEN_Field_0,
      --  All channels use an externally generated global timebase as their
      --  timebase
      CONF_GTBEEN_Field_1)
     with Size => 1;
   for CONF_GTBEEN_Field use
     (CONF_GTBEEN_Field_0 => 0,
      CONF_GTBEEN_Field_1 => 1);

   --  Counter Start on Trigger
   type CONF_CSOT_Field is
     (
      --  TPM counter starts to increment immediately, once it is enabled.
      CONF_CSOT_Field_0,
      --  TPM counter only starts to increment when it a rising edge on the
      --  selected input trigger is detected, after it has been enabled or
      --  after it has stopped due to overflow.
      CONF_CSOT_Field_1)
     with Size => 1;
   for CONF_CSOT_Field use
     (CONF_CSOT_Field_0 => 0,
      CONF_CSOT_Field_1 => 1);

   --  Counter Stop On Overflow
   type CONF_CSOO_Field is
     (
      --  TPM counter continues incrementing or decrementing after overflow
      CONF_CSOO_Field_0,
      --  TPM counter stops incrementing or decrementing after overflow.
      CONF_CSOO_Field_1)
     with Size => 1;
   for CONF_CSOO_Field use
     (CONF_CSOO_Field_0 => 0,
      CONF_CSOO_Field_1 => 1);

   --  Counter Reload On Trigger
   type CONF_CROT_Field is
     (
      --  Counter is not reloaded due to a rising edge on the selected input
      --  trigger
      CONF_CROT_Field_0,
      --  Counter is reloaded when a rising edge is detected on the selected
      --  input trigger
      CONF_CROT_Field_1)
     with Size => 1;
   for CONF_CROT_Field use
     (CONF_CROT_Field_0 => 0,
      CONF_CROT_Field_1 => 1);

   --  Trigger Polarity
   type CONF_TRGPOL_Field is
     (
      --  Trigger is active high.
      CONF_TRGPOL_Field_0,
      --  Trigger is active low.
      CONF_TRGPOL_Field_1)
     with Size => 1;
   for CONF_TRGPOL_Field use
     (CONF_TRGPOL_Field_0 => 0,
      CONF_TRGPOL_Field_1 => 1);

   --  Trigger Source
   type CONF_TRGSRC_Field is
     (
      --  Trigger source selected by TRGSEL is external.
      CONF_TRGSRC_Field_0,
      --  Trigger source selected by TRGSEL is internal (channel pin input
      --  capture).
      CONF_TRGSRC_Field_1)
     with Size => 1;
   for CONF_TRGSRC_Field use
     (CONF_TRGSRC_Field_0 => 0,
      CONF_TRGSRC_Field_1 => 1);

   --  Trigger Select
   type CONF_TRGSEL_Field is
     (
      --  Reset value for the field
      Conf_Trgsel_Field_Reset,
      --  Channel 0 pin input capture
      CONF_TRGSEL_Field_0001,
      --  Channel 1 pin input capture
      CONF_TRGSEL_Field_0010,
      --  Channel 0 or Channel 1 pin input capture
      CONF_TRGSEL_Field_0011,
      --  Channel 2 pin input capture
      CONF_TRGSEL_Field_0100,
      --  Channel 0 or Channel 2 pin input capture
      CONF_TRGSEL_Field_0101,
      --  Channel 1 or Channel 2 pin input capture
      CONF_TRGSEL_Field_0110,
      --  Channel 0 or Channel 1 or Channel 2 pin input capture
      CONF_TRGSEL_Field_0111,
      --  Channel 3 pin input capture
      CONF_TRGSEL_Field_1000,
      --  Channel 0 or Channel 3 pin input capture
      CONF_TRGSEL_Field_1001,
      --  Channel 1 or Channel 3 pin input capture
      CONF_TRGSEL_Field_1010,
      --  Channel 0 or Channel 1 or Channel 3 pin input capture
      CONF_TRGSEL_Field_1011,
      --  Channel 2 or Channel 3 pin input capture
      CONF_TRGSEL_Field_1100,
      --  Channel 0 or Channel 2 or Channel 3 pin input capture
      CONF_TRGSEL_Field_1101,
      --  Channel 1 or Channel 2 or Channel 3 pin input capture
      CONF_TRGSEL_Field_1110,
      --  Channel 0 or Channel 1 or Channel 2 or Channel 3 pin input capture
      CONF_TRGSEL_Field_1111)
     with Size => 4;
   for CONF_TRGSEL_Field use
     (Conf_Trgsel_Field_Reset => 0,
      CONF_TRGSEL_Field_0001 => 1,
      CONF_TRGSEL_Field_0010 => 2,
      CONF_TRGSEL_Field_0011 => 3,
      CONF_TRGSEL_Field_0100 => 4,
      CONF_TRGSEL_Field_0101 => 5,
      CONF_TRGSEL_Field_0110 => 6,
      CONF_TRGSEL_Field_0111 => 7,
      CONF_TRGSEL_Field_1000 => 8,
      CONF_TRGSEL_Field_1001 => 9,
      CONF_TRGSEL_Field_1010 => 10,
      CONF_TRGSEL_Field_1011 => 11,
      CONF_TRGSEL_Field_1100 => 12,
      CONF_TRGSEL_Field_1101 => 13,
      CONF_TRGSEL_Field_1110 => 14,
      CONF_TRGSEL_Field_1111 => 15);

   --  Configuration
   type TPM0_CONF_Register is record
      --  unspecified
      Reserved_0_4   : HAL.UInt5 := 16#0#;
      --  Doze Enable
      DOZEEN         : CONF_DOZEEN_Field := NRF_SVD.TPM.CONF_DOZEEN_Field_0;
      --  Debug Mode
      DBGMODE        : CONF_DBGMODE_Field :=
                        NRF_SVD.TPM.CONF_DBGMODE_Field_00;
      --  Global Time Base Synchronization
      GTBSYNC        : CONF_GTBSYNC_Field := NRF_SVD.TPM.CONF_GTBSYNC_Field_0;
      --  Global time base enable
      GTBEEN         : CONF_GTBEEN_Field := NRF_SVD.TPM.CONF_GTBEEN_Field_0;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
      --  Counter Start on Trigger
      CSOT           : CONF_CSOT_Field := NRF_SVD.TPM.CONF_CSOT_Field_0;
      --  Counter Stop On Overflow
      CSOO           : CONF_CSOO_Field := NRF_SVD.TPM.CONF_CSOO_Field_0;
      --  Counter Reload On Trigger
      CROT           : CONF_CROT_Field := NRF_SVD.TPM.CONF_CROT_Field_0;
      --  Counter Pause On Trigger
      CPOT           : Boolean := False;
      --  unspecified
      Reserved_20_21 : HAL.UInt2 := 16#0#;
      --  Trigger Polarity
      TRGPOL         : CONF_TRGPOL_Field := NRF_SVD.TPM.CONF_TRGPOL_Field_0;
      --  Trigger Source
      TRGSRC         : CONF_TRGSRC_Field := NRF_SVD.TPM.CONF_TRGSRC_Field_0;
      --  Trigger Select
      TRGSEL         : CONF_TRGSEL_Field := Conf_Trgsel_Field_Reset;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPM0_CONF_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      DOZEEN         at 0 range 5 .. 5;
      DBGMODE        at 0 range 6 .. 7;
      GTBSYNC        at 0 range 8 .. 8;
      GTBEEN         at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      CSOT           at 0 range 16 .. 16;
      CSOO           at 0 range 17 .. 17;
      CROT           at 0 range 18 .. 18;
      CPOT           at 0 range 19 .. 19;
      Reserved_20_21 at 0 range 20 .. 21;
      TRGPOL         at 0 range 22 .. 22;
      TRGSRC         at 0 range 23 .. 23;
      TRGSEL         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Timer/PWM Module
   type TPM0_Peripheral is record
      --  Version ID Register
      VERID   : aliased TPM0_VERID_Register;
      --  Parameter Register
      PARAM   : aliased TPM0_PARAM_Register;
      --  TPM Global Register
      GLOBAL  : aliased TPM0_GLOBAL_Register;
      --  Status and Control
      SC      : aliased TPM0_SC_Register;
      --  Counter
      CNT     : aliased TPM0_CNT_Register;
      --  Modulo
      MOD_k   : aliased TPM0_MOD_Register;
      --  Capture and Compare Status
      STATUS  : aliased TPM0_STATUS_Register;
      --  Channel (n) Status and Control
      CSC0    : aliased CSC_Register;
      --  Channel (n) Value
      CV0     : aliased CV_Register;
      --  Channel (n) Status and Control
      CSC1    : aliased CSC_Register;
      --  Channel (n) Value
      CV1     : aliased CV_Register;
      --  Channel (n) Status and Control
      CSC2    : aliased CSC_Register;
      --  Channel (n) Value
      CV2     : aliased CV_Register;
      --  Channel (n) Status and Control
      CSC3    : aliased CSC_Register;
      --  Channel (n) Value
      CV3     : aliased CV_Register;
      --  Channel (n) Status and Control
      CSC4    : aliased CSC_Register;
      --  Channel (n) Value
      CV4     : aliased CV_Register;
      --  Channel (n) Status and Control
      CSC5    : aliased CSC_Register;
      --  Channel (n) Value
      CV5     : aliased CV_Register;
      --  Combine Channel Register
      COMBINE : aliased TPM0_COMBINE_Register;
      --  Channel Trigger
      TRIG    : aliased TPM0_TRIG_Register;
      --  Channel Polarity
      POL     : aliased TPM0_POL_Register;
      --  Filter Control
      FILTER  : aliased TPM0_FILTER_Register;
      --  Quadrature Decoder Control and Status
      QDCTRL  : aliased TPM0_QDCTRL_Register;
      --  Configuration
      CONF    : aliased TPM0_CONF_Register;
   end record
     with Volatile;

   for TPM0_Peripheral use record
      VERID   at 16#0# range 0 .. 31;
      PARAM   at 16#4# range 0 .. 31;
      GLOBAL  at 16#8# range 0 .. 31;
      SC      at 16#10# range 0 .. 31;
      CNT     at 16#14# range 0 .. 31;
      MOD_k   at 16#18# range 0 .. 31;
      STATUS  at 16#1C# range 0 .. 31;
      CSC0    at 16#20# range 0 .. 31;
      CV0     at 16#24# range 0 .. 31;
      CSC1    at 16#28# range 0 .. 31;
      CV1     at 16#2C# range 0 .. 31;
      CSC2    at 16#30# range 0 .. 31;
      CV2     at 16#34# range 0 .. 31;
      CSC3    at 16#38# range 0 .. 31;
      CV3     at 16#3C# range 0 .. 31;
      CSC4    at 16#40# range 0 .. 31;
      CV4     at 16#44# range 0 .. 31;
      CSC5    at 16#48# range 0 .. 31;
      CV5     at 16#4C# range 0 .. 31;
      COMBINE at 16#64# range 0 .. 31;
      TRIG    at 16#6C# range 0 .. 31;
      POL     at 16#70# range 0 .. 31;
      FILTER  at 16#78# range 0 .. 31;
      QDCTRL  at 16#80# range 0 .. 31;
      CONF    at 16#84# range 0 .. 31;
   end record;

   --  Timer/PWM Module
   TPM0_Periph : aliased TPM0_Peripheral
     with Import, Address => System'To_Address (16#40038000#);

   --  Timer/PWM Module
   type TPM_Peripheral is record
      --  Version ID Register
      VERID   : aliased TPM0_VERID_Register;
      --  Parameter Register
      PARAM   : aliased TPM0_PARAM_Register;
      --  TPM Global Register
      GLOBAL  : aliased TPM0_GLOBAL_Register;
      --  Status and Control
      SC      : aliased TPM0_SC_Register;
      --  Counter
      CNT     : aliased TPM0_CNT_Register;
      --  Modulo
      MOD_k   : aliased TPM0_MOD_Register;
      --  Capture and Compare Status
      STATUS  : aliased TPM0_STATUS_Register;
      --  Channel (n) Status and Control
      CSC0    : aliased CSC_Register;
      --  Channel (n) Value
      CV0     : aliased CV_Register;
      --  Channel (n) Status and Control
      CSC1    : aliased CSC_Register;
      --  Channel (n) Value
      CV1     : aliased CV_Register;
      --  Combine Channel Register
      COMBINE : aliased TPM0_COMBINE_Register;
      --  Channel Trigger
      TRIG    : aliased TPM0_TRIG_Register;
      --  Channel Polarity
      POL     : aliased TPM0_POL_Register;
      --  Filter Control
      FILTER  : aliased TPM0_FILTER_Register;
      --  Quadrature Decoder Control and Status
      QDCTRL  : aliased TPM0_QDCTRL_Register;
      --  Configuration
      CONF    : aliased TPM0_CONF_Register;
   end record
     with Volatile;

   for TPM_Peripheral use record
      VERID   at 16#0# range 0 .. 31;
      PARAM   at 16#4# range 0 .. 31;
      GLOBAL  at 16#8# range 0 .. 31;
      SC      at 16#10# range 0 .. 31;
      CNT     at 16#14# range 0 .. 31;
      MOD_k   at 16#18# range 0 .. 31;
      STATUS  at 16#1C# range 0 .. 31;
      CSC0    at 16#20# range 0 .. 31;
      CV0     at 16#24# range 0 .. 31;
      CSC1    at 16#28# range 0 .. 31;
      CV1     at 16#2C# range 0 .. 31;
      COMBINE at 16#64# range 0 .. 31;
      TRIG    at 16#6C# range 0 .. 31;
      POL     at 16#70# range 0 .. 31;
      FILTER  at 16#78# range 0 .. 31;
      QDCTRL  at 16#80# range 0 .. 31;
      CONF    at 16#84# range 0 .. 31;
   end record;

   --  Timer/PWM Module
   TPM1_Periph : aliased TPM_Peripheral
     with Import, Address => System'To_Address (16#40039000#);

   --  Timer/PWM Module
   TPM2_Periph : aliased TPM_Peripheral
     with Import, Address => System'To_Address (16#4003A000#);

end NRF_SVD.TPM;
