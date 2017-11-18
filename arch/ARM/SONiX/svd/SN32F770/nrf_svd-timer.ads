--

--  This spec has been automatically generated from SN32F770.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package NRF_SVD.TIMER is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Counter enable
   type TMRCTRL_CEN_Field is
     (
      --  Disable counter
      Disable,
      --  Enable Timer Counter and Prescale Counter for counting
      Enable)
     with Size => 1;
   for TMRCTRL_CEN_Field use
     (Disable => 0,
      Enable => 1);

   --  Counter Reset
   type TMRCTRL_CRST_Field is
     (
      --  Disable
      Disable,
      --  Timer Counter and the Prescale Counter are synchronously reset on the
      --  next positive edge of PCLK
      Reset Counter)
     with Size => 1;
   for TMRCTRL_CRST_Field use
     (Disable => 0,
      Reset Counter => 1);

   --  Clock source
   type TMRCTRL_CLKSEL_Field is
     (
      --  CT16Bn clock source=HCLK
      Hclk,
      --  CT16Bn clock source=IHRC
      Ihrc)
     with Size => 1;
   for TMRCTRL_CLKSEL_Field use
     (Hclk => 0,
      Ihrc => 1);

   --  Counting mode selection
   type TMRCTRL_CM_Field is
     (
      --  Edge-aligned Up-counting mode
      Counting MODE,
      --  Edge-aligned Down-counting mode
      Counting MODE_1,
      --  Center-aligned mode 1. The match interrupt flag is set during the
      --  down-counting period
      Counting MODE_2,
      --  Center-aligned mode 2. The match interrupt flag is set during the up-
      --  counting period
      Counting MODE_3,
      --  Center-aligned mode 3. The match interrupt flag is set during both
      --  up-counting and down-counting period
      Counting MODE_4)
     with Size => 3;
   for TMRCTRL_CM_Field use
     (Counting MODE => 0,
      Counting MODE_1 => 1,
      Counting MODE_2 => 2,
      Counting MODE_3 => 4,
      Counting MODE_4 => 6);

   --  Internal high-speed clock frequency for CT16B0 PCLK
   type TMRCTRL_IHRCFREQ_Field is
     (
      --  Enable IHRC 12MHz for CT16B0 PCLK
      Ihrc,
      --  Enable IHRC 24MHz for CT16B0 PCLK
      Ihrc_1,
      --  Enable IHRC 48MHz for CT16B0 PCLK
      Ihrc_2,
      --  Enable IHRC 96MHz for CT16B0 PCLK
      Ihrc_3)
     with Size => 4;
   for TMRCTRL_IHRCFREQ_Field use
     (Ihrc => 1,
      Ihrc_1 => 2,
      Ihrc_2 => 4,
      Ihrc_3 => 8);

   --  Offset:0x00 CT16Bn Timer Control Register
   type TMRCTRL_Register is record
      --  Counter enable
      CEN            : TMRCTRL_CEN_Field := NRF_SVD.TIMER.Disable;
      --  Counter Reset
      CRST           : TMRCTRL_CRST_Field := NRF_SVD.TIMER.Disable;
      --  Clock source
      CLKSEL         : TMRCTRL_CLKSEL_Field := NRF_SVD.TIMER.Hclk;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  Counting mode selection
      CM             : TMRCTRL_CM_Field := NRF_SVD.TIMER.Counting MODE;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Internal high-speed clock frequency for CT16B0 PCLK
      IHRCFREQ       : TMRCTRL_IHRCFREQ_Field := NRF_SVD.TIMER.Ihrc;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TMRCTRL_Register use record
      CEN            at 0 range 0 .. 0;
      CRST           at 0 range 1 .. 1;
      CLKSEL         at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      CM             at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      IHRCFREQ       at 0 range 8 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype TC_TC_Field is HAL.UInt16;

   --  Offset:0x04 CT16Bn Timer Counter Register
   type TC_Register is record
      --  Timer Counter
      TC             : TC_TC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TC_Register use record
      TC             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype PRE_PRE_Field is HAL.UInt8;

   --  Offset:0x08 CT16Bn Prescale Register
   type PRE_Register is record
      --  Prescaler
      PRE           : PRE_PRE_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRE_Register use record
      PRE           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype PC_PC_Field is HAL.UInt8;

   --  Offset:0x0C CT16Bn Prescale Counter Register
   type PC_Register is record
      --  Prescaler Counter
      PC            : PC_PC_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PC_Register use record
      PC            at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  Counter/Timer Mode
   type CNTCTRL_CTM_Field is
     (
      --  Timer Mode: every rising PCLK edge
      Timer Mode,
      --  Counter Mode:TC is incremented on rising edges on the CAP0 input
      --  selected by CIS bits.
      Counter Mode,
      --  Counter Mode:TC is incremented on falling edges on the CAP0 input
      --  selected by CIS bits.
      Counter Mode_1,
      --  Counter Mode:TC is incremented on both edges on the CAP0 input
      --  selected by CIS bits.
      Counter Mode_2)
     with Size => 2;
   for CNTCTRL_CTM_Field use
     (Timer Mode => 0,
      Counter Mode => 1,
      Counter Mode_1 => 2,
      Counter Mode_2 => 3);

   --  Counter Input Select
   type CNTCTRL_CIS_Field is
     (
      --  CT16Bn_CAP0
      Ct16Bn_Cap0)
     with Size => 2;
   for CNTCTRL_CIS_Field use
     (Ct16Bn_Cap0 => 0);

   --  Offset:0x10 CT16Bn Counter Control Register
   type CNTCTRL_Register is record
      --  Counter/Timer Mode
      CTM           : CNTCTRL_CTM_Field := NRF_SVD.TIMER.Timer Mode;
      --  Counter Input Select
      CIS           : CNTCTRL_CIS_Field := NRF_SVD.TIMER.Ct16Bn_Cap0;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNTCTRL_Register use record
      CTM           at 0 range 0 .. 1;
      CIS           at 0 range 2 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Enable generating an interrupt when MR0 matches TC
   type MCTRL_MR0IE_Field is
     (
      --  Disable
      Disable,
      --  Generating an interrupt when MR0 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR0IE_Field use
     (Disable => 0,
      Enable => 1);

   --  Enable reset TC when MR0 matches TC
   type MCTRL_MR0RST_Field is
     (
      --  Disable
      Disable,
      --  Reset TC when MR0 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR0RST_Field use
     (Disable => 0,
      Enable => 1);

   --  Stop TC and PC and clear CEN bit when MR0 matches TC
   type MCTRL_MR0STOP_Field is
     (
      --  Disable
      Disable,
      --  Stop TC and PC and clear CEN bit when MR0 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR0STOP_Field use
     (Disable => 0,
      Enable => 1);

   --  Enable generating an interrupt when MR1 matches TC
   type MCTRL_MR1IE_Field is
     (
      --  Disable
      Disable,
      --  Generating an interrupt when MR1 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR1IE_Field use
     (Disable => 0,
      Enable => 1);

   --  Enable reset TC when MR1 matches TC
   type MCTRL_MR1RST_Field is
     (
      --  Disable
      Disable,
      --  Reset TC when MR1 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR1RST_Field use
     (Disable => 0,
      Enable => 1);

   --  Stop TC and PC and clear CEN bit when MR1 matches TC
   type MCTRL_MR1STOP_Field is
     (
      --  Disable
      Disable,
      --  Stop TC and PC and clear CEN bit when MR1 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR1STOP_Field use
     (Disable => 0,
      Enable => 1);

   --  Enable generating an interrupt when MR2 matches TC
   type MCTRL_MR2IE_Field is
     (
      --  Disable
      Disable,
      --  Generating an interrupt when MR2 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR2IE_Field use
     (Disable => 0,
      Enable => 1);

   --  Enable reset TC when MR2 matches TC
   type MCTRL_MR2RST_Field is
     (
      --  Disable
      Disable,
      --  Reset TC when MR2 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR2RST_Field use
     (Disable => 0,
      Enable => 1);

   --  Stop TC and PC and clear CEN bit when MR2 matches TC
   type MCTRL_MR2STOP_Field is
     (
      --  Disable
      Disable,
      --  Stop TC and PC and clear CEN bit when MR2 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR2STOP_Field use
     (Disable => 0,
      Enable => 1);

   --  Enable generating an interrupt based on CM[2:0] when MR9 matches the
   --  value in the TC
   type MCTRL_MR9IE_Field is
     (
      --  Disable
      Disable,
      --  Generating an interrupt when MR9 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR9IE_Field use
     (Disable => 0,
      Enable => 1);

   --  Enable reset TC when MR9 matches TC
   type MCTRL_MR9RST_Field is
     (
      --  Disable
      Disable,
      --  Reset TC when MR9 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR9RST_Field use
     (Disable => 0,
      Enable => 1);

   --  Stop TC and PC and clear CEN bit when MR9 matches TC
   type MCTRL_MR9STOP_Field is
     (
      --  Disable
      Disable,
      --  Stop TC and PC and clear CEN bit when MR9 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR9STOP_Field use
     (Disable => 0,
      Enable => 1);

   subtype MCTRL_PWMKEY_Field is HAL.UInt8;

   --  Offset:0x14 CT16Bn Match Control Register
   type MCTRL_Register is record
      --  Enable generating an interrupt when MR0 matches TC
      MR0IE         : MCTRL_MR0IE_Field := NRF_SVD.TIMER.Disable;
      --  Enable reset TC when MR0 matches TC
      MR0RST        : MCTRL_MR0RST_Field := NRF_SVD.TIMER.Disable;
      --  Stop TC and PC and clear CEN bit when MR0 matches TC
      MR0STOP       : MCTRL_MR0STOP_Field := NRF_SVD.TIMER.Disable;
      --  Enable generating an interrupt when MR1 matches TC
      MR1IE         : MCTRL_MR1IE_Field := NRF_SVD.TIMER.Disable;
      --  Enable reset TC when MR1 matches TC
      MR1RST        : MCTRL_MR1RST_Field := NRF_SVD.TIMER.Disable;
      --  Stop TC and PC and clear CEN bit when MR1 matches TC
      MR1STOP       : MCTRL_MR1STOP_Field := NRF_SVD.TIMER.Disable;
      --  Enable generating an interrupt when MR2 matches TC
      MR2IE         : MCTRL_MR2IE_Field := NRF_SVD.TIMER.Disable;
      --  Enable reset TC when MR2 matches TC
      MR2RST        : MCTRL_MR2RST_Field := NRF_SVD.TIMER.Disable;
      --  Stop TC and PC and clear CEN bit when MR2 matches TC
      MR2STOP       : MCTRL_MR2STOP_Field := NRF_SVD.TIMER.Disable;
      --  unspecified
      Reserved_9_20 : HAL.UInt12 := 16#0#;
      --  Enable generating an interrupt based on CM[2:0] when MR9 matches the
      --  value in the TC
      MR9IE         : MCTRL_MR9IE_Field := NRF_SVD.TIMER.Disable;
      --  Enable reset TC when MR9 matches TC
      MR9RST        : MCTRL_MR9RST_Field := NRF_SVD.TIMER.Disable;
      --  Stop TC and PC and clear CEN bit when MR9 matches TC
      MR9STOP       : MCTRL_MR9STOP_Field := NRF_SVD.TIMER.Disable;
      --  Write-only. PWM register key.
      PWMKEY        : MCTRL_PWMKEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MCTRL_Register use record
      MR0IE         at 0 range 0 .. 0;
      MR0RST        at 0 range 1 .. 1;
      MR0STOP       at 0 range 2 .. 2;
      MR1IE         at 0 range 3 .. 3;
      MR1RST        at 0 range 4 .. 4;
      MR1STOP       at 0 range 5 .. 5;
      MR2IE         at 0 range 6 .. 6;
      MR2RST        at 0 range 7 .. 7;
      MR2STOP       at 0 range 8 .. 8;
      Reserved_9_20 at 0 range 9 .. 20;
      MR9IE         at 0 range 21 .. 21;
      MR9RST        at 0 range 22 .. 22;
      MR9STOP       at 0 range 23 .. 23;
      PWMKEY        at 0 range 24 .. 31;
   end record;

   subtype MR_MR_Field is HAL.UInt16;
   subtype MR_PWMKEY_Field is HAL.UInt8;

   --  Offset:0x18 CT16Bn MR0 Register
   type MR_Register is record
      --  Timer counter match value
      MR             : MR_MR_Field := 16#0#;
      --  unspecified
      Reserved_16_23 : HAL.UInt8 := 16#0#;
      --  Write-only. PWM register key
      PWMKEY         : MR_PWMKEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MR_Register use record
      MR             at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      PWMKEY         at 0 range 24 .. 31;
   end record;

   --  Capture on CT16Bn_CAP0 rising edge
   type CAPCTRL_CAP0RE_Field is
     (
      --  Disable
      Disable,
      --  A sequence of 0 then 1 on CT16Bn_CAP0 will cause CAP0 to be loaded
      --  with the contents of TC.
      Enable)
     with Size => 1;
   for CAPCTRL_CAP0RE_Field use
     (Disable => 0,
      Enable => 1);

   --  Capture on CT16Bn_CAP0 falling edge
   type CAPCTRL_CAP0FE_Field is
     (
      --  Disable
      Disable,
      --  A sequence of 1 then 0 on CT16Bn_CAP0 will cause CAP0 to be loaded
      --  with the contents of TC.
      Enable)
     with Size => 1;
   for CAPCTRL_CAP0FE_Field use
     (Disable => 0,
      Enable => 1);

   --  Interrupt on CT16Bn_CAP0 event
   type CAPCTRL_CAP0IE_Field is
     (
      --  Disable
      Disable,
      --  A CAP0 load due to a CT16Bn_CAP0 event will generate an interrupt.
      Enable)
     with Size => 1;
   for CAPCTRL_CAP0IE_Field use
     (Disable => 0,
      Enable => 1);

   --  CAP0 function enable
   type CAPCTRL_CAP0EN_Field is
     (
      --  Disable
      Disable,
      --  Enable CAP0 function
      Enable)
     with Size => 1;
   for CAPCTRL_CAP0EN_Field use
     (Disable => 0,
      Enable => 1);

   --  Offset:0x28 CT16Bn Capture Control Register
   type CAPCTRL_Register is record
      --  Capture on CT16Bn_CAP0 rising edge
      CAP0RE        : CAPCTRL_CAP0RE_Field := NRF_SVD.TIMER.Disable;
      --  Capture on CT16Bn_CAP0 falling edge
      CAP0FE        : CAPCTRL_CAP0FE_Field := NRF_SVD.TIMER.Disable;
      --  Interrupt on CT16Bn_CAP0 event
      CAP0IE        : CAPCTRL_CAP0IE_Field := NRF_SVD.TIMER.Disable;
      --  CAP0 function enable
      CAP0EN        : CAPCTRL_CAP0EN_Field := NRF_SVD.TIMER.Disable;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CAPCTRL_Register use record
      CAP0RE        at 0 range 0 .. 0;
      CAP0FE        at 0 range 1 .. 1;
      CAP0IE        at 0 range 2 .. 2;
      CAP0EN        at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype CAP0_CAP0_Field is HAL.UInt16;

   --  Offset:0x2C CT16Bn CAP0 Register
   type CAP0_Register is record
      --  Read-only. Timer counter capture value
      CAP0           : CAP0_CAP0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CAP0_Register use record
      CAP0           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EM array
   type EM_Field_Array is array (0 .. 2) of Boolean
     with Component_Size => 1, Size => 3;

   --  Type definition for EM
   type EM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EM as a value
            Val : HAL.UInt3;
         when True =>
            --  EM as an array
            Arr : EM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for EM_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  CT16Bn_PWM0 functionality
   type EM_EMC0_Field is
     (
      --  Do nothing
      Do Nothing,
      --  CT16Bn_PWM0 pin is LOW
      Low,
      --  CT16Bn_PWM0 pin is HIGH
      High,
      --  Toggle CT16Bn_PWM0 pin
      Toggle)
     with Size => 2;
   for EM_EMC0_Field use
     (Do Nothing => 0,
      Low => 1,
      High => 2,
      Toggle => 3);

   --  CT16Bn_PWM1 functionality
   type EM_EMC1_Field is
     (
      --  Do nothing
      Do Nothing,
      --  CT16Bn_PWM1 pin is LOW
      Low,
      --  CT16Bn_PWM1 pin is HIGH
      High,
      --  Toggle CT16Bn_PWM1 pin
      Toggle)
     with Size => 2;
   for EM_EMC1_Field use
     (Do Nothing => 0,
      Low => 1,
      High => 2,
      Toggle => 3);

   --  CT16Bn_PWM2 functionality
   type EM_EMC2_Field is
     (
      --  Do nothing
      Do Nothing,
      --  CT16Bn_PWM2 pin is LOW
      Low,
      --  CT16Bn_PWM2 pin is HIGH
      High,
      --  Toggle CT16Bn_PWM2 pin
      Toggle)
     with Size => 2;
   for EM_EMC2_Field use
     (Do Nothing => 0,
      Low => 1,
      High => 2,
      Toggle => 3);

   subtype EM_PWMKEY_Field is HAL.UInt8;

   --  Offset:0x30 CT16Bn External Match Register
   type EM_Register is record
      --  When the TC matches MR0, this bit will act according to EMC0[1:0],
      --  and also drive the state of CT16Bn_PWM0 output.
      EM             : EM_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  CT16Bn_PWM0 functionality
      EMC0           : EM_EMC0_Field := NRF_SVD.TIMER.Do Nothing;
      --  CT16Bn_PWM1 functionality
      EMC1           : EM_EMC1_Field := NRF_SVD.TIMER.Do Nothing;
      --  CT16Bn_PWM2 functionality
      EMC2           : EM_EMC2_Field := NRF_SVD.TIMER.Do Nothing;
      --  unspecified
      Reserved_10_23 : HAL.UInt14 := 16#0#;
      --  Write-only. PWM register key.
      PWMKEY         : EM_PWMKEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EM_Register use record
      EM             at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      EMC0           at 0 range 4 .. 5;
      EMC1           at 0 range 6 .. 7;
      EMC2           at 0 range 8 .. 9;
      Reserved_10_23 at 0 range 10 .. 23;
      PWMKEY         at 0 range 24 .. 31;
   end record;

   --  PWM0 enable
   type PWMCTRL_PWM0EN_Field is
     (
      --  CT16Bn_PWM0 is controlled by EM0
      Disable,
      --  Enable PWM mode for CT16Bn_PWM0
      Enable)
     with Size => 1;
   for PWMCTRL_PWM0EN_Field use
     (Disable => 0,
      Enable => 1);

   --  PWM1 enable
   type PWMCTRL_PWM1EN_Field is
     (
      --  CT16Bn_PWM1 is controlled by EM1
      Disable,
      --  Enable PWM mode for CT16Bn_PWM1
      Enable)
     with Size => 1;
   for PWMCTRL_PWM1EN_Field use
     (Disable => 0,
      Enable => 1);

   --  PWM2 enable
   type PWMCTRL_PWM2EN_Field is
     (
      --  CT16Bn_PWM2 is controlled by EM2
      Disable,
      --  Enable PWM mode for CT16Bn_PWM2
      Enable)
     with Size => 1;
   for PWMCTRL_PWM2EN_Field use
     (Disable => 0,
      Enable => 1);

   --  PWM0 output mode
   type PWMCTRL_PWM0MODE_Field is
     (
      --  During up-counting, PWM0 is 0 when TC is less than MR0.
      Pwm MODE 1,
      --  During up-counting, PWM0 is 1 when TC is less than MR0.
      Pwm MODE 2,
      --  PWM0 is forced to 0
      Force 0,
      --  PWM0 is forced to 1
      Force 1)
     with Size => 2;
   for PWMCTRL_PWM0MODE_Field use
     (Pwm MODE 1 => 0,
      Pwm MODE 2 => 1,
      Force 0 => 2,
      Force 1 => 3);

   --  PWM1 output mode
   type PWMCTRL_PWM1MODE_Field is
     (
      --  During up-counting, PWM1 is 0 when TC is less than MR1.
      Pwm MODE 1,
      --  During up-counting, PWM1 is 1 when TC is less than MR1.
      Pwm MODE 2,
      --  PWM1 is forced to 0
      Force 0,
      --  PWM1 is forced to 1
      Force 1)
     with Size => 2;
   for PWMCTRL_PWM1MODE_Field use
     (Pwm MODE 1 => 0,
      Pwm MODE 2 => 1,
      Force 0 => 2,
      Force 1 => 3);

   --  PWM2 output mode
   type PWMCTRL_PWM2MODE_Field is
     (
      --  During up-counting, PWM2 is 0 when TC is less than MR2.
      Pwm MODE 1,
      --  During up-counting, PWM2 is 1 when TC is less than MR2.
      Pwm MODE 2,
      --  PWM2 is forced to 0
      Force 0,
      --  PWM2 is forced to 1
      Force 1)
     with Size => 2;
   for PWMCTRL_PWM2MODE_Field use
     (Pwm MODE 1 => 0,
      Pwm MODE 2 => 1,
      Force 0 => 2,
      Force 1 => 3);

   --  CT16Bn_PWM0/GPIO selection
   type PWMCTRL_PWM0IOEN_Field is
     (
      --  CT16Bn_PWM0 pin is act as GPIO
      Disable,
      --  CT16Bn_PWM0 pin act as match output, and output depends on PWM0EN bit
      Enable)
     with Size => 1;
   for PWMCTRL_PWM0IOEN_Field use
     (Disable => 0,
      Enable => 1);

   --  CT16Bn_PWM1/GPIO selection
   type PWMCTRL_PWM1IOEN_Field is
     (
      --  CT16Bn_PWM1 pin is act as GPIO
      Disable,
      --  CT16Bn_PWM1 pin act as match output, and output depends on PWM1EN bit
      Enable)
     with Size => 1;
   for PWMCTRL_PWM1IOEN_Field use
     (Disable => 0,
      Enable => 1);

   --  CT16Bn_PWM2/GPIO selection
   type PWMCTRL_PWM2IOEN_Field is
     (
      --  CT16Bn_PWM2 pin is act as GPIO
      Disable,
      --  CT16Bn_PWM2 pin act as match output, and output depends on PWM2EN bit
      Enable)
     with Size => 1;
   for PWMCTRL_PWM2IOEN_Field use
     (Disable => 0,
      Enable => 1);

   subtype PWMCTRL_PWMKEY_Field is HAL.UInt8;

   --  Offset:0x34 CT16Bn PWM Control Register
   type PWMCTRL_Register is record
      --  PWM0 enable
      PWM0EN         : PWMCTRL_PWM0EN_Field := NRF_SVD.TIMER.Disable;
      --  PWM1 enable
      PWM1EN         : PWMCTRL_PWM1EN_Field := NRF_SVD.TIMER.Disable;
      --  PWM2 enable
      PWM2EN         : PWMCTRL_PWM2EN_Field := NRF_SVD.TIMER.Disable;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  PWM0 output mode
      PWM0MODE       : PWMCTRL_PWM0MODE_Field := NRF_SVD.TIMER.Pwm MODE 1;
      --  PWM1 output mode
      PWM1MODE       : PWMCTRL_PWM1MODE_Field := NRF_SVD.TIMER.Pwm MODE 1;
      --  PWM2 output mode
      PWM2MODE       : PWMCTRL_PWM2MODE_Field := NRF_SVD.TIMER.Pwm MODE 1;
      --  unspecified
      Reserved_10_19 : HAL.UInt10 := 16#0#;
      --  CT16Bn_PWM0/GPIO selection
      PWM0IOEN       : PWMCTRL_PWM0IOEN_Field := NRF_SVD.TIMER.Disable;
      --  CT16Bn_PWM1/GPIO selection
      PWM1IOEN       : PWMCTRL_PWM1IOEN_Field := NRF_SVD.TIMER.Disable;
      --  CT16Bn_PWM2/GPIO selection
      PWM2IOEN       : PWMCTRL_PWM2IOEN_Field := NRF_SVD.TIMER.Disable;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      --  Write-only. PWM register key.
      PWMKEY         : PWMCTRL_PWMKEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PWMCTRL_Register use record
      PWM0EN         at 0 range 0 .. 0;
      PWM1EN         at 0 range 1 .. 1;
      PWM2EN         at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      PWM0MODE       at 0 range 4 .. 5;
      PWM1MODE       at 0 range 6 .. 7;
      PWM2MODE       at 0 range 8 .. 9;
      Reserved_10_19 at 0 range 10 .. 19;
      PWM0IOEN       at 0 range 20 .. 20;
      PWM1IOEN       at 0 range 21 .. 21;
      PWM2IOEN       at 0 range 22 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      PWMKEY         at 0 range 24 .. 31;
   end record;

   --  Match channel 0 interrupt flag
   type RIS_MR0IF_Field is
     (
      --  No interrupt on match channel 0
      No INTERRUPT,
      --  Interrupt requirements met on match channel 0
      Met INTERRUPT REQUIREMENTS)
     with Size => 1;
   for RIS_MR0IF_Field use
     (No INTERRUPT => 0,
      Met INTERRUPT REQUIREMENTS => 1);

   --  Match channel 1 interrupt flag
   type RIS_MR1IF_Field is
     (
      --  No interrupt on match channel 1
      No,
      --  Interrupt requirements met on match channel 1
      Met INTERRUPT REQUIREMENTS)
     with Size => 1;
   for RIS_MR1IF_Field use
     (No => 0,
      Met INTERRUPT REQUIREMENTS => 1);

   --  Match channel 2 interrupt flag
   type RIS_MR2IF_Field is
     (
      --  No interrupt on match channel 2
      No,
      --  Interrupt requirements met on match channel 2
      Met INTERRUPT REQUIREMENTS)
     with Size => 1;
   for RIS_MR2IF_Field use
     (No => 0,
      Met INTERRUPT REQUIREMENTS => 1);

   --  Capture channel 0 interrupt flag
   type RIS_CAP0IF_Field is
     (
      --  No interrupt on CAP0
      No,
      --  Interrupt requirements met on CAP0
      Met INTERRUPT REQUIREMENTS)
     with Size => 1;
   for RIS_CAP0IF_Field use
     (No => 0,
      Met INTERRUPT REQUIREMENTS => 1);

   --  Match channel 9 interrupt flag
   type RIS_MR9IF_Field is
     (
      --  No interrupt on match channel 9
      No,
      --  Interrupt requirements met on match channel 9
      Met INTERRUPT REQUIREMENTS)
     with Size => 1;
   for RIS_MR9IF_Field use
     (No => 0,
      Met INTERRUPT REQUIREMENTS => 1);

   --  Offset:0x38 CT16Bn Raw Interrupt Status Register
   type RIS_Register is record
      --  Read-only. Match channel 0 interrupt flag
      MR0IF         : RIS_MR0IF_Field;
      --  Read-only. Match channel 1 interrupt flag
      MR1IF         : RIS_MR1IF_Field;
      --  Read-only. Match channel 2 interrupt flag
      MR2IF         : RIS_MR2IF_Field;
      --  unspecified
      Reserved_3_3  : HAL.Bit;
      --  Read-only. Capture channel 0 interrupt flag
      CAP0IF        : RIS_CAP0IF_Field;
      --  Read-only. Match channel 9 interrupt flag
      MR9IF         : RIS_MR9IF_Field;
      --  unspecified
      Reserved_6_31 : HAL.UInt26;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RIS_Register use record
      MR0IF         at 0 range 0 .. 0;
      MR1IF         at 0 range 1 .. 1;
      MR2IF         at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      CAP0IF        at 0 range 4 .. 4;
      MR9IF         at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   --  MR0IF clear bit
   type IC_MR0IC_Field is
     (
      --  No effect
      No EFFECT,
      --  Clear MR0IF
      Clear)
     with Size => 1;
   for IC_MR0IC_Field use
     (No EFFECT => 0,
      Clear => 1);

   --  MR1IF clear bit
   type IC_MR1IC_Field is
     (
      --  No effect
      No EFFECT,
      --  Clear MR1IF
      Clear)
     with Size => 1;
   for IC_MR1IC_Field use
     (No EFFECT => 0,
      Clear => 1);

   --  MR2IF clear bit
   type IC_MR2IC_Field is
     (
      --  No effect
      No EFFECT,
      --  Clear MR2IF
      Clear)
     with Size => 1;
   for IC_MR2IC_Field use
     (No EFFECT => 0,
      Clear => 1);

   --  CAP0IF clear bit
   type IC_CAP0IC_Field is
     (
      --  No effect
      No EFFECT,
      --  Clear CAP0IF
      Clear)
     with Size => 1;
   for IC_CAP0IC_Field use
     (No EFFECT => 0,
      Clear => 1);

   --  MR9IF clear bit
   type IC_MR9IC_Field is
     (
      --  No effect
      No EFFECT,
      --  Clear MR9IF
      Clear)
     with Size => 1;
   for IC_MR9IC_Field use
     (No EFFECT => 0,
      Clear => 1);

   --  Offset:0x3C CT16Bn Interrupt Clear Register
   type IC_Register is record
      --  Write-only. MR0IF clear bit
      MR0IC         : IC_MR0IC_Field := NRF_SVD.TIMER.No EFFECT;
      --  Write-only. MR1IF clear bit
      MR1IC         : IC_MR1IC_Field := NRF_SVD.TIMER.No EFFECT;
      --  Write-only. MR2IF clear bit
      MR2IC         : IC_MR2IC_Field := NRF_SVD.TIMER.No EFFECT;
      --  unspecified
      Reserved_3_3  : HAL.Bit := 16#0#;
      --  Write-only. CAP0IF clear bit
      CAP0IC        : IC_CAP0IC_Field := NRF_SVD.TIMER.No EFFECT;
      --  Write-only. MR9IF clear bit
      MR9IC         : IC_MR9IC_Field := NRF_SVD.TIMER.No EFFECT;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_Register use record
      MR0IC         at 0 range 0 .. 0;
      MR1IC         at 0 range 1 .. 1;
      MR2IC         at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      CAP0IC        at 0 range 4 .. 4;
      MR9IC         at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   --  CT16Bn_PWM0N/GPIO selection bit
   type PWMmNIOCTRL_PWM0NIOEN_Field is
     (
      --  CT16Bn_PWM0N pin is act as GPIO
      PWMmNIOCTRL_PWM0NIOEN_Field_0,
      --  CT16Bn_PWM0N pin outputs the inverse signal with dead-band of
      --  CT16Bn_PWM0, but same High signal during dead-band period
      PWMmNIOCTRL_PWM0NIOEN_Field_1,
      --  CT16Bn_PWM0N pin outputs the inverse signal with dead-band of
      --  CT16Bn_PWM0, but same Low signal during dead-band period
      PWMmNIOCTRL_PWM0NIOEN_Field_2,
      --  CT16Bn_PWM0N pin outputs the same signal with dead-band of
      --  CT16Bn_PWM0
      PWMmNIOCTRL_PWM0NIOEN_Field_3)
     with Size => 2;
   for PWMmNIOCTRL_PWM0NIOEN_Field use
     (PWMmNIOCTRL_PWM0NIOEN_Field_0 => 0,
      PWMmNIOCTRL_PWM0NIOEN_Field_1 => 1,
      PWMmNIOCTRL_PWM0NIOEN_Field_2 => 2,
      PWMmNIOCTRL_PWM0NIOEN_Field_3 => 3);

   --  CT16Bn_PWM0N/GPIO selection bit
   type PWMmNIOCTRL_PWM1NIOEN_Field is
     (
      --  CT16Bn_PWM1N pin is act as GPIO
      PWMmNIOCTRL_PWM1NIOEN_Field_0,
      --  CT16Bn_PWM1N pin outputs the inverse signal with dead-band of
      --  CT16Bn_PWM0, but same High signal during dead-band period
      PWMmNIOCTRL_PWM1NIOEN_Field_1,
      --  CT16Bn_PWM1N pin outputs the inverse signal with dead-band of
      --  CT16Bn_PWM0, but same Low signal during dead-band period
      PWMmNIOCTRL_PWM1NIOEN_Field_2,
      --  CT16Bn_PWM1N pin outputs the same signal with dead-band of
      --  CT16Bn_PWM0
      PWMmNIOCTRL_PWM1NIOEN_Field_3)
     with Size => 2;
   for PWMmNIOCTRL_PWM1NIOEN_Field use
     (PWMmNIOCTRL_PWM1NIOEN_Field_0 => 0,
      PWMmNIOCTRL_PWM1NIOEN_Field_1 => 1,
      PWMmNIOCTRL_PWM1NIOEN_Field_2 => 2,
      PWMmNIOCTRL_PWM1NIOEN_Field_3 => 3);

   --  CT16Bn_PWM0N/GPIO selection bit
   type PWMmNIOCTRL_PWM2NIOEN_Field is
     (
      --  CT16Bn_PWM2N pin is act as GPIO
      PWMmNIOCTRL_PWM2NIOEN_Field_0,
      --  CT16Bn_PWM2N pin outputs the inverse signal with dead-band of
      --  CT16Bn_PWM0, but same High signal during dead-band period
      PWMmNIOCTRL_PWM2NIOEN_Field_1,
      --  CT16Bn_PWM2N pin outputs the inverse signal with dead-band of
      --  CT16Bn_PWM0, but same Low signal during dead-band period
      PWMmNIOCTRL_PWM2NIOEN_Field_2,
      --  CT16Bn_PWM2N pin outputs the same signal with dead-band of
      --  CT16Bn_PWM0
      PWMmNIOCTRL_PWM2NIOEN_Field_3)
     with Size => 2;
   for PWMmNIOCTRL_PWM2NIOEN_Field use
     (PWMmNIOCTRL_PWM2NIOEN_Field_0 => 0,
      PWMmNIOCTRL_PWM2NIOEN_Field_1 => 1,
      PWMmNIOCTRL_PWM2NIOEN_Field_2 => 2,
      PWMmNIOCTRL_PWM2NIOEN_Field_3 => 3);

   subtype PWMmNIOCTRL_PWMKEY_Field is HAL.UInt8;

   --  Offset:0x44 CT16Bn PWMmN IO Control register
   type PWMmNIOCTRL_Register is record
      --  CT16Bn_PWM0N/GPIO selection bit
      PWM0NIOEN     : PWMmNIOCTRL_PWM0NIOEN_Field :=
                       NRF_SVD.TIMER.PWMmNIOCTRL_PWM0NIOEN_Field_0;
      --  CT16Bn_PWM0N/GPIO selection bit
      PWM1NIOEN     : PWMmNIOCTRL_PWM1NIOEN_Field :=
                       NRF_SVD.TIMER.PWMmNIOCTRL_PWM1NIOEN_Field_0;
      --  CT16Bn_PWM0N/GPIO selection bit
      PWM2NIOEN     : PWMmNIOCTRL_PWM2NIOEN_Field :=
                       NRF_SVD.TIMER.PWMmNIOCTRL_PWM2NIOEN_Field_0;
      --  unspecified
      Reserved_6_23 : HAL.UInt18 := 16#0#;
      --  Write-only. PWM register key.
      PWMKEY        : PWMmNIOCTRL_PWMKEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PWMmNIOCTRL_Register use record
      PWM0NIOEN     at 0 range 0 .. 1;
      PWM1NIOEN     at 0 range 2 .. 3;
      PWM2NIOEN     at 0 range 4 .. 5;
      Reserved_6_23 at 0 range 6 .. 23;
      PWMKEY        at 0 range 24 .. 31;
   end record;

   subtype PWM0NDB_DB_Field is HAL.UInt10;
   subtype PWM0NDB_PWMKEY_Field is HAL.UInt8;

   --  Offset:0x48 CT16Bn PWM0N Dead-band Period Register
   type PWM0NDB_Register is record
      --  PWM0N output dead-band period time=DB*CT16Bn_PCLK cycle
      DB             : PWM0NDB_DB_Field := 16#0#;
      --  unspecified
      Reserved_10_23 : HAL.UInt14 := 16#0#;
      --  Write-only. PWM register key.
      PWMKEY         : PWM0NDB_PWMKEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PWM0NDB_Register use record
      DB             at 0 range 0 .. 9;
      Reserved_10_23 at 0 range 10 .. 23;
      PWMKEY         at 0 range 24 .. 31;
   end record;

   subtype PWM1NDB_DB_Field is HAL.UInt10;
   subtype PWM1NDB_PWMKEY_Field is HAL.UInt8;

   --  Offset:0x4C CT16Bn PWM1N Dead-band Period Register
   type PWM1NDB_Register is record
      --  PWM1N output dead-band period time=DB*CT16Bn_PCLK cycle
      DB             : PWM1NDB_DB_Field := 16#0#;
      --  unspecified
      Reserved_10_23 : HAL.UInt14 := 16#0#;
      --  Write-only. PWM register key.
      PWMKEY         : PWM1NDB_PWMKEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PWM1NDB_Register use record
      DB             at 0 range 0 .. 9;
      Reserved_10_23 at 0 range 10 .. 23;
      PWMKEY         at 0 range 24 .. 31;
   end record;

   subtype PWM2NDB_DB_Field is HAL.UInt10;
   subtype PWM2NDB_PWMKEY_Field is HAL.UInt8;

   --  Offset:0x50 CT16Bn PWM2N Dead-band Period Register
   type PWM2NDB_Register is record
      --  PWM2N output dead-band period time=DB*CT16Bn_PCLK cycle
      DB             : PWM2NDB_DB_Field := 16#0#;
      --  unspecified
      Reserved_10_23 : HAL.UInt14 := 16#0#;
      --  Write-only. PWM register key.
      PWMKEY         : PWM2NDB_PWMKEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PWM2NDB_Register use record
      DB             at 0 range 0 .. 9;
      Reserved_10_23 at 0 range 10 .. 23;
      PWMKEY         at 0 range 24 .. 31;
   end record;

   --  Internal high-speed clock frequency for CT16B0 PCLK
   type TMRCTRL_IHRCFREQ_Field_1 is
     (
      --  Reset value for the field
      Tmrctrl_Ihrcfreq_Field_Reset,
      --  Enable IHRC 12MHz for CT16B0 PCLK
      Ihrc,
      --  Enable IHRC 24MHz for CT16B0 PCLK
      Ihrc_1,
      --  Enable IHRC 48MHz for CT16B0 PCLK
      Ihrc_2,
      --  Enable IHRC 96MHz for CT16B0 PCLK
      Ihrc_3)
     with Size => 4;
   for TMRCTRL_IHRCFREQ_Field_1 use
     (Tmrctrl_Ihrcfreq_Field_Reset => 0,
      Ihrc => 1,
      Ihrc_1 => 2,
      Ihrc_2 => 4,
      Ihrc_3 => 8);

   --  Offset:0x00 CT16Bn Timer Control Register
   type TMRCTRL_Register_1 is record
      --  Counter enable
      CEN            : TMRCTRL_CEN_Field := NRF_SVD.TIMER.Disable;
      --  Counter Reset
      CRST           : TMRCTRL_CRST_Field := NRF_SVD.TIMER.Disable;
      --  Clock source
      CLKSEL         : TMRCTRL_CLKSEL_Field := NRF_SVD.TIMER.Hclk;
      --  unspecified
      Reserved_3_7   : HAL.UInt5 := 16#0#;
      --  Internal high-speed clock frequency for CT16B0 PCLK
      IHRCFREQ       : TMRCTRL_IHRCFREQ_Field_1 :=
                        Tmrctrl_Ihrcfreq_Field_Reset;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TMRCTRL_Register_1 use record
      CEN            at 0 range 0 .. 0;
      CRST           at 0 range 1 .. 1;
      CLKSEL         at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      IHRCFREQ       at 0 range 8 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  Enable generating an interrupt when MR3 matches TC
   type MCTRL_MR3IE_Field is
     (
      --  Disable
      Disable,
      --  Generating an interrupt when MR3 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR3IE_Field use
     (Disable => 0,
      Enable => 1);

   --  Enable reset TC when MR3 matches TC
   type MCTRL_MR3RST_Field is
     (
      --  Disable
      Disable,
      --  Reset TC when MR3 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR3RST_Field use
     (Disable => 0,
      Enable => 1);

   --  Stop TC and PC and clear CEN bit when MR3 matches TC
   type MCTRL_MR3STOP_Field is
     (
      --  Disable
      Disable,
      --  Stop TC and PC and clear CEN bit when MR3 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR3STOP_Field use
     (Disable => 0,
      Enable => 1);

   --  Offset:0x14 CT16Bn Match Control Register
   type MCTRL_Register_1 is record
      --  Enable generating an interrupt when MR0 matches TC
      MR0IE          : MCTRL_MR0IE_Field := NRF_SVD.TIMER.Disable;
      --  Enable reset TC when MR0 matches TC
      MR0RST         : MCTRL_MR0RST_Field := NRF_SVD.TIMER.Disable;
      --  Stop TC and PC and clear CEN bit when MR0 matches TC
      MR0STOP        : MCTRL_MR0STOP_Field := NRF_SVD.TIMER.Disable;
      --  Enable generating an interrupt when MR1 matches TC
      MR1IE          : MCTRL_MR1IE_Field := NRF_SVD.TIMER.Disable;
      --  Enable reset TC when MR1 matches TC
      MR1RST         : MCTRL_MR1RST_Field := NRF_SVD.TIMER.Disable;
      --  Stop TC and PC and clear CEN bit when MR1 matches TC
      MR1STOP        : MCTRL_MR1STOP_Field := NRF_SVD.TIMER.Disable;
      --  Enable generating an interrupt when MR2 matches TC
      MR2IE          : MCTRL_MR2IE_Field := NRF_SVD.TIMER.Disable;
      --  Enable reset TC when MR2 matches TC
      MR2RST         : MCTRL_MR2RST_Field := NRF_SVD.TIMER.Disable;
      --  Stop TC and PC and clear CEN bit when MR2 matches TC
      MR2STOP        : MCTRL_MR2STOP_Field := NRF_SVD.TIMER.Disable;
      --  Enable generating an interrupt when MR3 matches TC
      MR3IE          : MCTRL_MR3IE_Field := NRF_SVD.TIMER.Disable;
      --  Enable reset TC when MR3 matches TC
      MR3RST         : MCTRL_MR3RST_Field := NRF_SVD.TIMER.Disable;
      --  Stop TC and PC and clear CEN bit when MR3 matches TC
      MR3STOP        : MCTRL_MR3STOP_Field := NRF_SVD.TIMER.Disable;
      --  unspecified
      Reserved_12_20 : HAL.UInt9 := 16#0#;
      --  Enable generating an interrupt based on CM[2:0] when MR9 matches the
      --  value in the TC
      MR9IE          : MCTRL_MR9IE_Field := NRF_SVD.TIMER.Disable;
      --  Enable reset TC when MR9 matches TC
      MR9RST         : MCTRL_MR9RST_Field := NRF_SVD.TIMER.Disable;
      --  Stop TC and PC and clear CEN bit when MR9 matches TC
      MR9STOP        : MCTRL_MR9STOP_Field := NRF_SVD.TIMER.Disable;
      --  Write-only. PWM register key.
      PWMKEY         : MCTRL_PWMKEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MCTRL_Register_1 use record
      MR0IE          at 0 range 0 .. 0;
      MR0RST         at 0 range 1 .. 1;
      MR0STOP        at 0 range 2 .. 2;
      MR1IE          at 0 range 3 .. 3;
      MR1RST         at 0 range 4 .. 4;
      MR1STOP        at 0 range 5 .. 5;
      MR2IE          at 0 range 6 .. 6;
      MR2RST         at 0 range 7 .. 7;
      MR2STOP        at 0 range 8 .. 8;
      MR3IE          at 0 range 9 .. 9;
      MR3RST         at 0 range 10 .. 10;
      MR3STOP        at 0 range 11 .. 11;
      Reserved_12_20 at 0 range 12 .. 20;
      MR9IE          at 0 range 21 .. 21;
      MR9RST         at 0 range 22 .. 22;
      MR9STOP        at 0 range 23 .. 23;
      PWMKEY         at 0 range 24 .. 31;
   end record;

   --  EM array
   type EM_Field_Array_1 is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for EM
   type EM_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EM as a value
            Val : HAL.UInt4;
         when True =>
            --  EM as an array
            Arr : EM_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for EM_Field_1 use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  CT16Bn_PWM3 functionality
   type EM_EMC3_Field is
     (
      --  Do nothing
      Do Nothing,
      --  CT16Bn_PWM3 pin is LOW
      Low,
      --  CT16Bn_PWM3 pin is HIGH
      High,
      --  Toggle CT16Bn_PWM3 pin
      Toggle)
     with Size => 2;
   for EM_EMC3_Field use
     (Do Nothing => 0,
      Low => 1,
      High => 2,
      Toggle => 3);

   --  Offset:0x30 CT16Bn External Match Register
   type EM_Register_1 is record
      --  When the TC matches MR0, this bit will act according to EMC0[1:0],
      --  and also drive the state of CT16Bn_PWM0 output.
      EM             : EM_Field_1 := (As_Array => False, Val => 16#0#);
      --  CT16Bn_PWM0 functionality
      EMC0           : EM_EMC0_Field := NRF_SVD.TIMER.Do Nothing;
      --  CT16Bn_PWM1 functionality
      EMC1           : EM_EMC1_Field := NRF_SVD.TIMER.Do Nothing;
      --  CT16Bn_PWM2 functionality
      EMC2           : EM_EMC2_Field := NRF_SVD.TIMER.Do Nothing;
      --  CT16Bn_PWM3 functionality
      EMC3           : EM_EMC3_Field := NRF_SVD.TIMER.Do Nothing;
      --  unspecified
      Reserved_12_23 : HAL.UInt12 := 16#0#;
      --  Write-only. PWM register key
      PWMKEY         : EM_PWMKEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EM_Register_1 use record
      EM             at 0 range 0 .. 3;
      EMC0           at 0 range 4 .. 5;
      EMC1           at 0 range 6 .. 7;
      EMC2           at 0 range 8 .. 9;
      EMC3           at 0 range 10 .. 11;
      Reserved_12_23 at 0 range 12 .. 23;
      PWMKEY         at 0 range 24 .. 31;
   end record;

   --  PWM3 enable
   type PWMCTRL_PWM3EN_Field is
     (
      --  CT16Bn_PWM3 is controlled by EM3
      Disable,
      --  Enable PWM mode for CT16Bn_PWM3
      Enable)
     with Size => 1;
   for PWMCTRL_PWM3EN_Field use
     (Disable => 0,
      Enable => 1);

   --  PWM3 output mode
   type PWMCTRL_PWM3MODE_Field is
     (
      --  During up-counting, PWM3 is 0 when TC is less than MR3.
      Pwm MODE 1,
      --  During up-counting, PWM3 is 1 when TC is less than MR3.
      Pwm MODE 2,
      --  PWM3 is forced to 0
      Force 0,
      --  PWM3 is forced to 1
      Force 1)
     with Size => 2;
   for PWMCTRL_PWM3MODE_Field use
     (Pwm MODE 1 => 0,
      Pwm MODE 2 => 1,
      Force 0 => 2,
      Force 1 => 3);

   --  CT16Bn_PWM3/GPIO selection
   type PWMCTRL_PWM3IOEN_Field is
     (
      --  CT16Bn_PWM3 pin is act as GPIO
      Disable,
      --  CT16Bn_PWM3 pin act as match output, and output depends on PWM2EN bit
      Enable)
     with Size => 1;
   for PWMCTRL_PWM3IOEN_Field use
     (Disable => 0,
      Enable => 1);

   --  Offset:0x34 CT16Bn PWM Control Register
   type PWMCTRL_Register_1 is record
      --  PWM0 enable
      PWM0EN         : PWMCTRL_PWM0EN_Field := NRF_SVD.TIMER.Disable;
      --  PWM1 enable
      PWM1EN         : PWMCTRL_PWM1EN_Field := NRF_SVD.TIMER.Disable;
      --  PWM2 enable
      PWM2EN         : PWMCTRL_PWM2EN_Field := NRF_SVD.TIMER.Disable;
      --  PWM3 enable
      PWM3EN         : PWMCTRL_PWM3EN_Field := NRF_SVD.TIMER.Disable;
      --  PWM0 output mode
      PWM0MODE       : PWMCTRL_PWM0MODE_Field := NRF_SVD.TIMER.Pwm MODE 1;
      --  PWM1 output mode
      PWM1MODE       : PWMCTRL_PWM1MODE_Field := NRF_SVD.TIMER.Pwm MODE 1;
      --  PWM2 output mode
      PWM2MODE       : PWMCTRL_PWM2MODE_Field := NRF_SVD.TIMER.Pwm MODE 1;
      --  PWM3 output mode
      PWM3MODE       : PWMCTRL_PWM3MODE_Field := NRF_SVD.TIMER.Pwm MODE 1;
      --  unspecified
      Reserved_12_19 : HAL.UInt8 := 16#0#;
      --  CT16Bn_PWM0/GPIO selection
      PWM0IOEN       : PWMCTRL_PWM0IOEN_Field := NRF_SVD.TIMER.Disable;
      --  CT16Bn_PWM1/GPIO selection
      PWM1IOEN       : PWMCTRL_PWM1IOEN_Field := NRF_SVD.TIMER.Disable;
      --  CT16Bn_PWM2/GPIO selection
      PWM2IOEN       : PWMCTRL_PWM2IOEN_Field := NRF_SVD.TIMER.Disable;
      --  CT16Bn_PWM3/GPIO selection
      PWM3IOEN       : PWMCTRL_PWM3IOEN_Field := NRF_SVD.TIMER.Disable;
      --  Write-only. PWM register key
      PWMKEY         : PWMCTRL_PWMKEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PWMCTRL_Register_1 use record
      PWM0EN         at 0 range 0 .. 0;
      PWM1EN         at 0 range 1 .. 1;
      PWM2EN         at 0 range 2 .. 2;
      PWM3EN         at 0 range 3 .. 3;
      PWM0MODE       at 0 range 4 .. 5;
      PWM1MODE       at 0 range 6 .. 7;
      PWM2MODE       at 0 range 8 .. 9;
      PWM3MODE       at 0 range 10 .. 11;
      Reserved_12_19 at 0 range 12 .. 19;
      PWM0IOEN       at 0 range 20 .. 20;
      PWM1IOEN       at 0 range 21 .. 21;
      PWM2IOEN       at 0 range 22 .. 22;
      PWM3IOEN       at 0 range 23 .. 23;
      PWMKEY         at 0 range 24 .. 31;
   end record;

   --  Match channel 3 interrupt flag
   type RIS_MR3IF_Field is
     (
      --  No interrupt on match channel 3
      No,
      --  Interrupt requirements met on match channel 3
      Met INTERRUPT REQUIREMENTS)
     with Size => 1;
   for RIS_MR3IF_Field use
     (No => 0,
      Met INTERRUPT REQUIREMENTS => 1);

   --  Offset:0x38 CT16Bn Raw Interrupt Status Register
   type RIS_Register_1 is record
      --  Read-only. Match channel 0 interrupt flag
      MR0IF         : RIS_MR0IF_Field;
      --  Read-only. Match channel 1 interrupt flag
      MR1IF         : RIS_MR1IF_Field;
      --  Read-only. Match channel 2 interrupt flag
      MR2IF         : RIS_MR2IF_Field;
      --  Read-only. Match channel 3 interrupt flag
      MR3IF         : RIS_MR3IF_Field;
      --  Read-only. Capture channel 0 interrupt flag
      CAP0IF        : RIS_CAP0IF_Field;
      --  Read-only. Match channel 9 interrupt flag
      MR9IF         : RIS_MR9IF_Field;
      --  unspecified
      Reserved_6_31 : HAL.UInt26;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RIS_Register_1 use record
      MR0IF         at 0 range 0 .. 0;
      MR1IF         at 0 range 1 .. 1;
      MR2IF         at 0 range 2 .. 2;
      MR3IF         at 0 range 3 .. 3;
      CAP0IF        at 0 range 4 .. 4;
      MR9IF         at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   --  MR3IF clear bit
   type IC_MR3IC_Field is
     (
      --  No effect
      No EFFECT,
      --  Clear MR3IF
      Clear)
     with Size => 1;
   for IC_MR3IC_Field use
     (No EFFECT => 0,
      Clear => 1);

   --  Offset:0x3C CT16Bn Interrupt Clear Register
   type IC_Register_1 is record
      --  Write-only. MR0IF clear bit
      MR0IC         : IC_MR0IC_Field := NRF_SVD.TIMER.No EFFECT;
      --  Write-only. MR1IF clear bit
      MR1IC         : IC_MR1IC_Field := NRF_SVD.TIMER.No EFFECT;
      --  Write-only. MR2IF clear bit
      MR2IC         : IC_MR2IC_Field := NRF_SVD.TIMER.No EFFECT;
      --  Write-only. MR3IF clear bit
      MR3IC         : IC_MR3IC_Field := NRF_SVD.TIMER.No EFFECT;
      --  Write-only. CAP0IF clear bit
      CAP0IC        : IC_CAP0IC_Field := NRF_SVD.TIMER.No EFFECT;
      --  Write-only. MR9IF clear bit
      MR9IC         : IC_MR9IC_Field := NRF_SVD.TIMER.No EFFECT;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_Register_1 use record
      MR0IC         at 0 range 0 .. 0;
      MR1IC         at 0 range 1 .. 1;
      MR2IC         at 0 range 2 .. 2;
      MR3IC         at 0 range 3 .. 3;
      CAP0IC        at 0 range 4 .. 4;
      MR9IC         at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  16-bit Timer 0 with Capture function
   type SN_CT16B0_Peripheral is record
      --  Offset:0x00 CT16Bn Timer Control Register
      TMRCTRL     : aliased TMRCTRL_Register;
      --  Offset:0x04 CT16Bn Timer Counter Register
      TC          : aliased TC_Register;
      --  Offset:0x08 CT16Bn Prescale Register
      PRE         : aliased PRE_Register;
      --  Offset:0x0C CT16Bn Prescale Counter Register
      PC          : aliased PC_Register;
      --  Offset:0x10 CT16Bn Counter Control Register
      CNTCTRL     : aliased CNTCTRL_Register;
      --  Offset:0x14 CT16Bn Match Control Register
      MCTRL       : aliased MCTRL_Register;
      --  Offset:0x18 CT16Bn MR0 Register
      MR0         : aliased MR_Register;
      --  Offset:0x1C CT16Bn MR1 Register
      MR1         : aliased MR_Register;
      --  Offset:0x20 CT16Bn MR2 Register
      MR2         : aliased MR_Register;
      --  Offset:0x28 CT16Bn Capture Control Register
      CAPCTRL     : aliased CAPCTRL_Register;
      --  Offset:0x2C CT16Bn CAP0 Register
      CAP0        : aliased CAP0_Register;
      --  Offset:0x30 CT16Bn External Match Register
      EM          : aliased EM_Register;
      --  Offset:0x34 CT16Bn PWM Control Register
      PWMCTRL     : aliased PWMCTRL_Register;
      --  Offset:0x38 CT16Bn Raw Interrupt Status Register
      RIS         : aliased RIS_Register;
      --  Offset:0x3C CT16Bn Interrupt Clear Register
      IC          : aliased IC_Register;
      --  Offset:0x40 CT16Bn MR9 Register
      MR9         : aliased MR_Register;
      --  Offset:0x44 CT16Bn PWMmN IO Control register
      PWMmNIOCTRL : aliased PWMmNIOCTRL_Register;
      --  Offset:0x48 CT16Bn PWM0N Dead-band Period Register
      PWM0NDB     : aliased PWM0NDB_Register;
      --  Offset:0x4C CT16Bn PWM1N Dead-band Period Register
      PWM1NDB     : aliased PWM1NDB_Register;
      --  Offset:0x50 CT16Bn PWM2N Dead-band Period Register
      PWM2NDB     : aliased PWM2NDB_Register;
   end record
     with Volatile;

   for SN_CT16B0_Peripheral use record
      TMRCTRL     at 16#0# range 0 .. 31;
      TC          at 16#4# range 0 .. 31;
      PRE         at 16#8# range 0 .. 31;
      PC          at 16#C# range 0 .. 31;
      CNTCTRL     at 16#10# range 0 .. 31;
      MCTRL       at 16#14# range 0 .. 31;
      MR0         at 16#18# range 0 .. 31;
      MR1         at 16#1C# range 0 .. 31;
      MR2         at 16#20# range 0 .. 31;
      CAPCTRL     at 16#28# range 0 .. 31;
      CAP0        at 16#2C# range 0 .. 31;
      EM          at 16#30# range 0 .. 31;
      PWMCTRL     at 16#34# range 0 .. 31;
      RIS         at 16#38# range 0 .. 31;
      IC          at 16#3C# range 0 .. 31;
      MR9         at 16#40# range 0 .. 31;
      PWMmNIOCTRL at 16#44# range 0 .. 31;
      PWM0NDB     at 16#48# range 0 .. 31;
      PWM1NDB     at 16#4C# range 0 .. 31;
      PWM2NDB     at 16#50# range 0 .. 31;
   end record;

   --  16-bit Timer 0 with Capture function
   SN_CT16B0_Periph : aliased SN_CT16B0_Peripheral
     with Import, Address => System'To_Address (16#40000000#);

   --  16-bit Timer 1 with Capture function
   type SN_CT16B1_Peripheral is record
      --  Offset:0x00 CT16Bn Timer Control Register
      TMRCTRL : aliased TMRCTRL_Register_1;
      --  Offset:0x04 CT16Bn Timer Counter Register
      TC      : aliased TC_Register;
      --  Offset:0x08 CT16Bn Prescale Register
      PRE     : aliased PRE_Register;
      --  Offset:0x0C CT16Bn Prescale Counter Register
      PC      : aliased PC_Register;
      --  Offset:0x10 CT16Bn Counter Control Register
      CNTCTRL : aliased CNTCTRL_Register;
      --  Offset:0x14 CT16Bn Match Control Register
      MCTRL   : aliased MCTRL_Register_1;
      --  Offset:0x18 CT16Bn MR0 Register
      MR0     : aliased MR_Register;
      --  Offset:0x1C CT16Bn MR1 Register
      MR1     : aliased MR_Register;
      --  Offset:0x20 CT16Bn MR2 Register
      MR2     : aliased MR_Register;
      --  Offset:0x24 CT16Bn MR3 Register
      MR3     : aliased MR_Register;
      --  Offset:0x28 CT16Bn Capture Control Register
      CAPCTRL : aliased CAPCTRL_Register;
      --  Offset:0x2C CT16Bn CAP0 Register
      CAP0    : aliased CAP0_Register;
      --  Offset:0x30 CT16Bn External Match Register
      EM      : aliased EM_Register_1;
      --  Offset:0x34 CT16Bn PWM Control Register
      PWMCTRL : aliased PWMCTRL_Register_1;
      --  Offset:0x38 CT16Bn Raw Interrupt Status Register
      RIS     : aliased RIS_Register_1;
      --  Offset:0x3C CT16Bn Interrupt Clear Register
      IC      : aliased IC_Register_1;
      --  Offset:0x40 CT16Bn MR9 Register
      MR9     : aliased MR_Register;
   end record
     with Volatile;

   for SN_CT16B1_Peripheral use record
      TMRCTRL at 16#0# range 0 .. 31;
      TC      at 16#4# range 0 .. 31;
      PRE     at 16#8# range 0 .. 31;
      PC      at 16#C# range 0 .. 31;
      CNTCTRL at 16#10# range 0 .. 31;
      MCTRL   at 16#14# range 0 .. 31;
      MR0     at 16#18# range 0 .. 31;
      MR1     at 16#1C# range 0 .. 31;
      MR2     at 16#20# range 0 .. 31;
      MR3     at 16#24# range 0 .. 31;
      CAPCTRL at 16#28# range 0 .. 31;
      CAP0    at 16#2C# range 0 .. 31;
      EM      at 16#30# range 0 .. 31;
      PWMCTRL at 16#34# range 0 .. 31;
      RIS     at 16#38# range 0 .. 31;
      IC      at 16#3C# range 0 .. 31;
      MR9     at 16#40# range 0 .. 31;
   end record;

   --  16-bit Timer 1 with Capture function
   SN_CT16B1_Periph : aliased SN_CT16B1_Peripheral
     with Import, Address => System'To_Address (16#40002000#);

end NRF_SVD.TIMER;
