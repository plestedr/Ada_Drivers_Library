--

--  This spec has been automatically generated from SN32F100.svd

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
      Disable,
      --  Timer Counter and the Prescale Counter are synchronously reset on the
      --  next positive edge of PCLK. This is cleared by HW when the counter
      --  					reset operation finishes.
      Reset Counter)
     with Size => 1;
   for TMRCTRL_CRST_Field use
     (Disable => 0,
      Reset Counter => 1);

   --  Offset:0x00 CT16Bn Timer Control Register
   type TMRCTRL_Register is record
      --  Counter enable
      CEN           : TMRCTRL_CEN_Field := NRF_SVD.TIMER.Disable;
      --  Counter Reset
      CRST          : TMRCTRL_CRST_Field := NRF_SVD.TIMER.Disable;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TMRCTRL_Register use record
      CEN           at 0 range 0 .. 0;
      CRST          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
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

   subtype PRE_PR_Field is HAL.UInt16;

   --  Offset:0x08 CT16Bn Prescale Register
   type PRE_Register is record
      --  Prescaler
      PR             : PRE_PR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRE_Register use record
      PR             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype PC_PC_Field is HAL.UInt16;

   --  Offset:0x0C CT16Bn Prescale Counter Register
   type PC_Register is record
      --  Prescaler Counter
      PC             : PC_PC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PC_Register use record
      PC             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Counter/Timer Mode
   type CNTCTRL_CTM_Field is
     (
      --  Every rising PCLK edge
      Timer Mode,
      --  TC is incremented on rising edges on the CAP0 input selected by CIS
      --  bits.
      Counter Mode,
      --  TC is incremented on falling edges on the CAP0 input selected by CIS
      --  bits.
      Counter Mode_1,
      --  TC is incremented on both edges on the CAP0 input selected by CIS
      --  bits.
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
      Disable,
      --  Stop TC and PC and clear CEN bit when MR2 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR2STOP_Field use
     (Disable => 0,
      Enable => 1);

   --  Enable generating an interrupt when MR3 matches TC
   type MCTRL_MR3IE_Field is
     (
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
      Disable,
      --  Stop TC and PC and clear CEN bit when MR3 matches TC
      Enable)
     with Size => 1;
   for MCTRL_MR3STOP_Field use
     (Disable => 0,
      Enable => 1);

   --  Offset:0x14 CT16Bn Match Control Register
   type MCTRL_Register is record
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
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MCTRL_Register use record
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
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  Capture/Reset on CT16Bn_CAP0 signal rising edge
   type CAPCTRL_CAP0RE_Field is
     (
      Disable,
      --  Enable a sequence of 0 then 1 on CT16Bn_CAP0 					signal will cause
      --  CAP0 to be loaded with the contents of TC
      Enable,
      --  Enable a sequence of 0 then 1 on CT16Bn_CAP0 					signal will reset
      --  the TC.
      Enable_1)
     with Size => 2;
   for CAPCTRL_CAP0RE_Field use
     (Disable => 0,
      Enable => 1,
      Enable_1 => 2);

   --  Capture/Reset on CT16Bn_CAP0 signal falling edge
   type CAPCTRL_CAP0FE_Field is
     (
      Disable,
      --  Enable a sequence of 1 then 0 on CT16Bn_CAP0 					signal will cause
      --  CAP0 to be loaded with the contents of TC
      Enable,
      --  Enable a sequence of 1 then 0 on CT16Bn_CAP0 					signal will reset
      --  the TC.
      Enable_1)
     with Size => 2;
   for CAPCTRL_CAP0FE_Field use
     (Disable => 0,
      Enable => 1,
      Enable_1 => 2);

   --  Interrupt on CT16Bn_CAP0 signal event: a CAP0 load 				due to a
   --  CT16Bn_CAP0 signal event will generate an interrupt.
   type CAPCTRL_CAP0IE_Field is
     (
      Disable,
      Enable)
     with Size => 1;
   for CAPCTRL_CAP0IE_Field use
     (Disable => 0,
      Enable => 1);

   --  CAP0 function enable bit
   type CAPCTRL_CAP0EN_Field is
     (
      Disable,
      --  Enable Capture 0 function for external Capture pin
      Enable)
     with Size => 2;
   for CAPCTRL_CAP0EN_Field use
     (Disable => 0,
      Enable => 1);

   --  Offset:0x28 CT16Bn Capture Control Register
   type CAPCTRL_Register is record
      --  Capture/Reset on CT16Bn_CAP0 signal rising edge
      CAP0RE        : CAPCTRL_CAP0RE_Field := NRF_SVD.TIMER.Disable;
      --  Capture/Reset on CT16Bn_CAP0 signal falling edge
      CAP0FE        : CAPCTRL_CAP0FE_Field := NRF_SVD.TIMER.Disable;
      --  Interrupt on CT16Bn_CAP0 signal event: a CAP0 load 				due to a
      --  CT16Bn_CAP0 signal event will generate an interrupt.
      CAP0IE        : CAPCTRL_CAP0IE_Field := NRF_SVD.TIMER.Disable;
      --  CAP0 function enable bit
      CAP0EN        : CAPCTRL_CAP0EN_Field := NRF_SVD.TIMER.Disable;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CAPCTRL_Register use record
      CAP0RE        at 0 range 0 .. 1;
      CAP0FE        at 0 range 2 .. 3;
      CAP0IE        at 0 range 4 .. 4;
      CAP0EN        at 0 range 5 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
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

   --  CT16Bn_PWM0 functionality
   type EM_EMC0_Field is
     (
      Do Nothing,
      Ct16Bn_Pwm0 PIN IS Low,
      Ct16Bn_Pwm0 PIN IS High,
      Toggle Ct16Bn_Pwm0)
     with Size => 2;
   for EM_EMC0_Field use
     (Do Nothing => 0,
      Ct16Bn_Pwm0 PIN IS Low => 1,
      Ct16Bn_Pwm0 PIN IS High => 2,
      Toggle Ct16Bn_Pwm0 => 3);

   --  Offset:0x30 CT16Bn External Match Register
   type EM_Register is record
      --  When the TC matches MR0, this bit will act according to EMC0[1:0],
      --  and also drive the state of CT16Bn_PWM0 output.
      EM0           : Boolean := False;
      --  unspecified
      Reserved_1_3  : HAL.UInt3 := 16#0#;
      --  CT16Bn_PWM0 functionality
      EMC0          : EM_EMC0_Field := NRF_SVD.TIMER.Do Nothing;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EM_Register use record
      EM0           at 0 range 0 .. 0;
      Reserved_1_3  at 0 range 1 .. 3;
      EMC0          at 0 range 4 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
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

   --  Offset:0x34 CT16Bn PWM Control Register
   type PWMCTRL_Register is record
      --  PWM0 enable
      PWM0EN         : PWMCTRL_PWM0EN_Field := NRF_SVD.TIMER.Disable;
      --  unspecified
      Reserved_1_19  : HAL.UInt19 := 16#0#;
      --  CT16Bn_PWM0/GPIO selection
      PWM0IOEN       : PWMCTRL_PWM0IOEN_Field := NRF_SVD.TIMER.Disable;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PWMCTRL_Register use record
      PWM0EN         at 0 range 0 .. 0;
      Reserved_1_19  at 0 range 1 .. 19;
      PWM0IOEN       at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
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
      No INTERRUPT,
      --  Interrupt requirements met on match channel 1
      Met INTERRUPT REQUIREMENTS)
     with Size => 1;
   for RIS_MR1IF_Field use
     (No INTERRUPT => 0,
      Met INTERRUPT REQUIREMENTS => 1);

   --  Match channel 2 interrupt flag
   type RIS_MR2IF_Field is
     (
      --  No interrupt on match channel 2
      No INTERRUPT,
      --  Interrupt requirements met on match channel 2
      Met INTERRUPT REQUIREMENTS)
     with Size => 1;
   for RIS_MR2IF_Field use
     (No INTERRUPT => 0,
      Met INTERRUPT REQUIREMENTS => 1);

   --  Match channel 3 interrupt flag
   type RIS_MR3IF_Field is
     (
      --  No interrupt on match channel 3
      No INTERRUPT,
      --  Interrupt requirements met on match channel 3
      Met INTERRUPT REQUIREMENTS)
     with Size => 1;
   for RIS_MR3IF_Field use
     (No INTERRUPT => 0,
      Met INTERRUPT REQUIREMENTS => 1);

   --  Capture channel 0 interrupt flag
   type RIS_CAP0IF_Field is
     (
      --  No interrupt on CAP0
      No INTERRUPT,
      --  Interrupt requirements met on CAP0
      Met INTERRUPT REQUIREMENTS)
     with Size => 1;
   for RIS_CAP0IF_Field use
     (No INTERRUPT => 0,
      Met INTERRUPT REQUIREMENTS => 1);

   --  Offset:0x38 CT16Bn Raw Interrupt Status Register
   type RIS_Register is record
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
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RIS_Register use record
      MR0IF         at 0 range 0 .. 0;
      MR1IF         at 0 range 1 .. 1;
      MR2IF         at 0 range 2 .. 2;
      MR3IF         at 0 range 3 .. 3;
      CAP0IF        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  MR0IF clear bit
   type IC_MR0IC_Field is
     (
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
      No EFFECT,
      --  Clear MR2IF
      Clear)
     with Size => 1;
   for IC_MR2IC_Field use
     (No EFFECT => 0,
      Clear => 1);

   --  MR3IF clear bit
   type IC_MR3IC_Field is
     (
      No EFFECT,
      --  Clear MR3IF
      Clear)
     with Size => 1;
   for IC_MR3IC_Field use
     (No EFFECT => 0,
      Clear => 1);

   --  CAP0IF clear bit
   type IC_CAP0IC_Field is
     (
      No EFFECT,
      --  Clear CAP0IF
      Clear)
     with Size => 1;
   for IC_CAP0IC_Field use
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
      --  Write-only. MR3IF clear bit
      MR3IC         : IC_MR3IC_Field := NRF_SVD.TIMER.No EFFECT;
      --  Write-only. CAP0IF clear bit
      CAP0IC        : IC_CAP0IC_Field := NRF_SVD.TIMER.No EFFECT;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_Register use record
      MR0IC         at 0 range 0 .. 0;
      MR1IC         at 0 range 1 .. 1;
      MR2IC         at 0 range 2 .. 2;
      MR3IC         at 0 range 3 .. 3;
      CAP0IC        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  EM array
   type EM_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for EM
   type EM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EM as a value
            Val : HAL.UInt2;
         when True =>
            --  EM as an array
            Arr : EM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for EM_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  CT32Bn_PWM0 functionality
   type EM_EMC0_Field_1 is
     (
      Do Nothing,
      Ct32Bn_Pwm0 PIN IS Low,
      Ct32Bn_Pwm0 PIN IS High,
      Toggle Ct32Bn_Pwm0)
     with Size => 2;
   for EM_EMC0_Field_1 use
     (Do Nothing => 0,
      Ct32Bn_Pwm0 PIN IS Low => 1,
      Ct32Bn_Pwm0 PIN IS High => 2,
      Toggle Ct32Bn_Pwm0 => 3);

   --  CT32Bn_PWM1 functionality
   type EM_EMC1_Field is
     (
      Do Nothing,
      Ct32Bn_Pwm1 PIN IS Low,
      Ct32Bn_Pwm1 PIN IS High,
      Toggle Ct32Bn_Pwm1)
     with Size => 2;
   for EM_EMC1_Field use
     (Do Nothing => 0,
      Ct32Bn_Pwm1 PIN IS Low => 1,
      Ct32Bn_Pwm1 PIN IS High => 2,
      Toggle Ct32Bn_Pwm1 => 3);

   --  Offset:0x30 CT32Bn External Match Register
   type EM_Register_1 is record
      --  When the TC matches MR0, this bit will act according to EMC0[1:0],
      --  and also drive the state of CT16Bn_PWM0 output.
      EM            : EM_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_3  : HAL.UInt2 := 16#0#;
      --  CT32Bn_PWM0 functionality
      EMC0          : EM_EMC0_Field_1 := NRF_SVD.TIMER.Do Nothing;
      --  CT32Bn_PWM1 functionality
      EMC1          : EM_EMC1_Field := NRF_SVD.TIMER.Do Nothing;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EM_Register_1 use record
      EM            at 0 range 0 .. 1;
      Reserved_2_3  at 0 range 2 .. 3;
      EMC0          at 0 range 4 .. 5;
      EMC1          at 0 range 6 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  PWM1 enable
   type PWMCTRL_PWM1EN_Field is
     (
      --  CT32Bn_PWM1 is controlled by EM1
      Disable,
      --  Enable PWM mode for CT32Bn_PWM1
      Enable)
     with Size => 1;
   for PWMCTRL_PWM1EN_Field use
     (Disable => 0,
      Enable => 1);

   --  CT16Bn_PWM1/GPIO selection
   type PWMCTRL_PWM1IOEN_Field is
     (
      --  CT32Bn_PWM1 pin is act as GPIO
      Disable,
      --  CT32Bn_PWM1 pin act as match output, and output depends on PWM1EN bit
      Enable)
     with Size => 1;
   for PWMCTRL_PWM1IOEN_Field use
     (Disable => 0,
      Enable => 1);

   --  Offset:0x34 CT32Bn PWM Control Register
   type PWMCTRL_Register_1 is record
      --  PWM0 enable
      PWM0EN         : PWMCTRL_PWM0EN_Field := NRF_SVD.TIMER.Disable;
      --  PWM1 enable
      PWM1EN         : PWMCTRL_PWM1EN_Field := NRF_SVD.TIMER.Disable;
      --  unspecified
      Reserved_2_19  : HAL.UInt18 := 16#0#;
      --  CT32Bn_PWM0/GPIO selection
      PWM0IOEN       : PWMCTRL_PWM0IOEN_Field := NRF_SVD.TIMER.Disable;
      --  CT16Bn_PWM1/GPIO selection
      PWM1IOEN       : PWMCTRL_PWM1IOEN_Field := NRF_SVD.TIMER.Disable;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PWMCTRL_Register_1 use record
      PWM0EN         at 0 range 0 .. 0;
      PWM1EN         at 0 range 1 .. 1;
      Reserved_2_19  at 0 range 2 .. 19;
      PWM0IOEN       at 0 range 20 .. 20;
      PWM1IOEN       at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  16-bit Timer 0 with Capture function
   type SN_CT16B0_Peripheral is record
      --  Offset:0x00 CT16Bn Timer Control Register
      TMRCTRL : aliased TMRCTRL_Register;
      --  Offset:0x04 CT16Bn Timer Counter Register
      TC      : aliased TC_Register;
      --  Offset:0x08 CT16Bn Prescale Register
      PRE     : aliased PRE_Register;
      --  Offset:0x0C CT16Bn Prescale Counter Register
      PC      : aliased PC_Register;
      --  Offset:0x10 CT16Bn Counter Control Register
      CNTCTRL : aliased CNTCTRL_Register;
      --  Offset:0x14 CT16Bn Match Control Register
      MCTRL   : aliased MCTRL_Register;
      --  Offset:0x18 CT16Bn MR0 Register
      MR0     : aliased HAL.UInt32;
      --  Offset:0x1C CT16Bn MR1 Register
      MR1     : aliased HAL.UInt32;
      --  Offset:0x20 CT16Bn MR2 Register
      MR2     : aliased HAL.UInt32;
      --  Offset:0x24 CT16Bn MR3 Register
      MR3     : aliased HAL.UInt32;
      --  Offset:0x28 CT16Bn Capture Control Register
      CAPCTRL : aliased CAPCTRL_Register;
      --  Offset:0x2C CT16Bn CAP0 Register
      CAP0    : aliased CAP0_Register;
      --  Offset:0x30 CT16Bn External Match Register
      EM      : aliased EM_Register;
      --  Offset:0x34 CT16Bn PWM Control Register
      PWMCTRL : aliased PWMCTRL_Register;
      --  Offset:0x38 CT16Bn Raw Interrupt Status Register
      RIS     : aliased RIS_Register;
      --  Offset:0x3C CT16Bn Interrupt Clear Register
      IC      : aliased IC_Register;
   end record
     with Volatile;

   for SN_CT16B0_Peripheral use record
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
   end record;

   --  16-bit Timer 0 with Capture function
   SN_CT16B0_Periph : aliased SN_CT16B0_Peripheral
     with Import, Address => System'To_Address (16#40000000#);

   --  16-bit Timer 0 with Capture function
   SN_CT16B1_Periph : aliased SN_CT16B0_Peripheral
     with Import, Address => System'To_Address (16#40002000#);

   --  32-bit Timer 0 with Capture function
   type SN_CT32B0_Peripheral is record
      --  Offset:0x00 CT32Bn Timer Control Register
      TMRCTRL : aliased TMRCTRL_Register;
      --  Offset:0x04 CT32Bn Timer Counter Register
      TC      : aliased HAL.UInt32;
      --  Offset:0x08 CT32Bn Prescale Register
      PRE     : aliased HAL.UInt32;
      --  Offset:0x0C CT32Bn Prescale Counter Register
      PC      : aliased HAL.UInt32;
      --  Offset:0x10 CT32Bn Counter Control Register
      CNTCTRL : aliased CNTCTRL_Register;
      --  Offset:0x14 CT32Bn Match Control Register
      MCTRL   : aliased MCTRL_Register;
      --  Offset:0x18 CT32Bn MR0 Register
      MR0     : aliased HAL.UInt32;
      --  Offset:0x1C CT32Bn MR1 Register
      MR1     : aliased HAL.UInt32;
      --  Offset:0x20 CT32Bn MR2 Register
      MR2     : aliased HAL.UInt32;
      --  Offset:0x24 CT32Bn MR3 Register
      MR3     : aliased HAL.UInt32;
      --  Offset:0x28 CT32Bn Capture Control Register
      CAPCTRL : aliased CAPCTRL_Register;
      --  Offset:0x2C CT32Bn CAP0 Register
      CAP0    : aliased HAL.UInt32;
      --  Offset:0x30 CT32Bn External Match Register
      EM      : aliased EM_Register_1;
      --  Offset:0x34 CT32Bn PWM Control Register
      PWMCTRL : aliased PWMCTRL_Register_1;
      --  Offset:0x38 CT32Bn Raw Interrupt Status Register
      RIS     : aliased RIS_Register;
      --  Offset:0x3C CT32Bn Interrupt Clear Register
      IC      : aliased IC_Register;
   end record
     with Volatile;

   for SN_CT32B0_Peripheral use record
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
   end record;

   --  32-bit Timer 0 with Capture function
   SN_CT32B0_Periph : aliased SN_CT32B0_Peripheral
     with Import, Address => System'To_Address (16#40004000#);

   --  32-bit Timer 0 with Capture function
   SN_CT32B1_Periph : aliased SN_CT32B0_Peripheral
     with Import, Address => System'To_Address (16#40006000#);

end NRF_SVD.TIMER;
