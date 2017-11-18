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

--  This spec has been automatically generated from MKL36Z4.xml

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

--  Nested Vectored Interrupt Controller
package NRF_SVD.NVIC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  INT_DMA0 interrupt set-enable bit
   type NVIC_ISER_SETENA0_Field is
     (
      --  write: no effect; read: INT_DMA0 interrupt disabled
      NVIC_ISER_SETENA0_Field_0,
      --  write: enable INT_DMA0 interrupt; read: INT_DMA0 interrupt enabled
      NVIC_ISER_SETENA0_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA0_Field use
     (NVIC_ISER_SETENA0_Field_0 => 0,
      NVIC_ISER_SETENA0_Field_1 => 1);

   --  INT_DMA1 interrupt set-enable bit
   type NVIC_ISER_SETENA1_Field is
     (
      --  write: no effect; read: INT_DMA1 interrupt disabled
      NVIC_ISER_SETENA1_Field_0,
      --  write: enable INT_DMA1 interrupt; read: INT_DMA1 interrupt enabled
      NVIC_ISER_SETENA1_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA1_Field use
     (NVIC_ISER_SETENA1_Field_0 => 0,
      NVIC_ISER_SETENA1_Field_1 => 1);

   --  INT_DMA2 interrupt set-enable bit
   type NVIC_ISER_SETENA2_Field is
     (
      --  write: no effect; read: INT_DMA2 interrupt disabled
      NVIC_ISER_SETENA2_Field_0,
      --  write: enable INT_DMA2 interrupt; read: INT_DMA2 interrupt enabled
      NVIC_ISER_SETENA2_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA2_Field use
     (NVIC_ISER_SETENA2_Field_0 => 0,
      NVIC_ISER_SETENA2_Field_1 => 1);

   --  INT_DMA3 interrupt set-enable bit
   type NVIC_ISER_SETENA3_Field is
     (
      --  write: no effect; read: INT_DMA3 interrupt disabled
      NVIC_ISER_SETENA3_Field_0,
      --  write: enable INT_DMA3 interrupt; read: INT_DMA3 interrupt enabled
      NVIC_ISER_SETENA3_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA3_Field use
     (NVIC_ISER_SETENA3_Field_0 => 0,
      NVIC_ISER_SETENA3_Field_1 => 1);

   --  Reserved iv 20 interrupt set-enable bit
   type NVIC_ISER_SETENA4_Field is
     (
      --  write: no effect; read: Reserved iv 20 interrupt disabled
      NVIC_ISER_SETENA4_Field_0,
      --  write: enable Reserved iv 20 interrupt; read: Reserved iv 20
      --  interrupt enabled
      NVIC_ISER_SETENA4_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA4_Field use
     (NVIC_ISER_SETENA4_Field_0 => 0,
      NVIC_ISER_SETENA4_Field_1 => 1);

   --  FTFA command complete and read collision interrupt set-enable bit
   type NVIC_ISER_SETENA5_Field is
     (
      --  write: no effect; read: FTFA command complete and read collision
      --  interrupt disabled
      NVIC_ISER_SETENA5_Field_0,
      --  write: enable FTFA command complete and read collision interrupt;
      --  read: FTFA command complete and read collision interrupt enabled
      NVIC_ISER_SETENA5_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA5_Field use
     (NVIC_ISER_SETENA5_Field_0 => 0,
      NVIC_ISER_SETENA5_Field_1 => 1);

   --  low-voltage detect and low-voltage warning interrupt set-enable bit
   type NVIC_ISER_SETENA6_Field is
     (
      --  write: no effect; read: low-voltage detect and low-voltage warning
      --  interrupt disabled
      NVIC_ISER_SETENA6_Field_0,
      --  write: enable low-voltage detect and low-voltage warning interrupt;
      --  read: low-voltage detect and low-voltage warning interrupt enabled
      NVIC_ISER_SETENA6_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA6_Field use
     (NVIC_ISER_SETENA6_Field_0 => 0,
      NVIC_ISER_SETENA6_Field_1 => 1);

   --  low leakage wakeup interrupt set-enable bit
   type NVIC_ISER_SETENA7_Field is
     (
      --  write: no effect; read: low leakage wakeup interrupt disabled
      NVIC_ISER_SETENA7_Field_0,
      --  write: enable low leakage wakeup interrupt; read: low leakage wakeup
      --  interrupt enabled
      NVIC_ISER_SETENA7_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA7_Field use
     (NVIC_ISER_SETENA7_Field_0 => 0,
      NVIC_ISER_SETENA7_Field_1 => 1);

   --  inter-integrated circuit 0 interrupt set-enable bit
   type NVIC_ISER_SETENA8_Field is
     (
      --  write: no effect; read: inter-integrated circuit 0 interrupt disabled
      NVIC_ISER_SETENA8_Field_0,
      --  write: enable inter-integrated circuit 0 interrupt; read:
      --  inter-integrated circuit 0 interrupt enabled
      NVIC_ISER_SETENA8_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA8_Field use
     (NVIC_ISER_SETENA8_Field_0 => 0,
      NVIC_ISER_SETENA8_Field_1 => 1);

   --  inter-integrated circuit 1 interrupt set-enable bit
   type NVIC_ISER_SETENA9_Field is
     (
      --  write: no effect; read: inter-integrated circuit 1 interrupt disabled
      NVIC_ISER_SETENA9_Field_0,
      --  write: enable inter-integrated circuit 1 interrupt; read:
      --  inter-integrated circuit 1 interrupt enabled
      NVIC_ISER_SETENA9_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA9_Field use
     (NVIC_ISER_SETENA9_Field_0 => 0,
      NVIC_ISER_SETENA9_Field_1 => 1);

   --  serial peripheral interface 0 interrupt set-enable bit
   type NVIC_ISER_SETENA10_Field is
     (
      --  write: no effect; read: serial peripheral interface 0 interrupt
      --  disabled
      NVIC_ISER_SETENA10_Field_0,
      --  write: enable serial peripheral interface 0 interrupt; read: serial
      --  peripheral interface 0 interrupt enabled
      NVIC_ISER_SETENA10_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA10_Field use
     (NVIC_ISER_SETENA10_Field_0 => 0,
      NVIC_ISER_SETENA10_Field_1 => 1);

   --  serial peripheral interface 1 interrupt set-enable bit
   type NVIC_ISER_SETENA11_Field is
     (
      --  write: no effect; read: serial peripheral interface 1 interrupt
      --  disabled
      NVIC_ISER_SETENA11_Field_0,
      --  write: enable serial peripheral interface 1 interrupt; read: serial
      --  peripheral interface 1 interrupt enabled
      NVIC_ISER_SETENA11_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA11_Field use
     (NVIC_ISER_SETENA11_Field_0 => 0,
      NVIC_ISER_SETENA11_Field_1 => 1);

   --  UART0 status and error interrupt set-enable bit
   type NVIC_ISER_SETENA12_Field is
     (
      --  write: no effect; read: UART0 status and error interrupt disabled
      NVIC_ISER_SETENA12_Field_0,
      --  write: enable UART0 status and error interrupt; read: UART0 status
      --  and error interrupt enabled
      NVIC_ISER_SETENA12_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA12_Field use
     (NVIC_ISER_SETENA12_Field_0 => 0,
      NVIC_ISER_SETENA12_Field_1 => 1);

   --  UART1 status and error interrupt set-enable bit
   type NVIC_ISER_SETENA13_Field is
     (
      --  write: no effect; read: UART1 status and error interrupt disabled
      NVIC_ISER_SETENA13_Field_0,
      --  write: enable UART1 status and error interrupt; read: UART1 status
      --  and error interrupt enabled
      NVIC_ISER_SETENA13_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA13_Field use
     (NVIC_ISER_SETENA13_Field_0 => 0,
      NVIC_ISER_SETENA13_Field_1 => 1);

   --  UART2 status and error interrupt set-enable bit
   type NVIC_ISER_SETENA14_Field is
     (
      --  write: no effect; read: UART2 status and error interrupt disabled
      NVIC_ISER_SETENA14_Field_0,
      --  write: enable UART2 status and error interrupt; read: UART2 status
      --  and error interrupt enabled
      NVIC_ISER_SETENA14_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA14_Field use
     (NVIC_ISER_SETENA14_Field_0 => 0,
      NVIC_ISER_SETENA14_Field_1 => 1);

   --  Analog-to-digital converter 0 interrupt set-enable bit
   type NVIC_ISER_SETENA15_Field is
     (
      --  write: no effect; read: Analog-to-digital converter 0 interrupt
      --  disabled
      NVIC_ISER_SETENA15_Field_0,
      --  write: enable Analog-to-digital converter 0 interrupt; read:
      --  Analog-to-digital converter 0 interrupt enabled
      NVIC_ISER_SETENA15_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA15_Field use
     (NVIC_ISER_SETENA15_Field_0 => 0,
      NVIC_ISER_SETENA15_Field_1 => 1);

   --  Comparator 0 interrupt set-enable bit
   type NVIC_ISER_SETENA16_Field is
     (
      --  write: no effect; read: Comparator 0 interrupt disabled
      NVIC_ISER_SETENA16_Field_0,
      --  write: enable Comparator 0 interrupt; read: Comparator 0 interrupt
      --  enabled
      NVIC_ISER_SETENA16_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA16_Field use
     (NVIC_ISER_SETENA16_Field_0 => 0,
      NVIC_ISER_SETENA16_Field_1 => 1);

   --  Timer PWM module 0 interrupt set-enable bit
   type NVIC_ISER_SETENA17_Field is
     (
      --  write: no effect; read: Timer PWM module 0 interrupt disabled
      NVIC_ISER_SETENA17_Field_0,
      --  write: enable Timer PWM module 0 interrupt; read: Timer PWM module 0
      --  interrupt enabled
      NVIC_ISER_SETENA17_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA17_Field use
     (NVIC_ISER_SETENA17_Field_0 => 0,
      NVIC_ISER_SETENA17_Field_1 => 1);

   --  Timer PWM module 1 interrupt set-enable bit
   type NVIC_ISER_SETENA18_Field is
     (
      --  write: no effect; read: Timer PWM module 1 interrupt disabled
      NVIC_ISER_SETENA18_Field_0,
      --  write: enable Timer PWM module 1 interrupt; read: Timer PWM module 1
      --  interrupt enabled
      NVIC_ISER_SETENA18_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA18_Field use
     (NVIC_ISER_SETENA18_Field_0 => 0,
      NVIC_ISER_SETENA18_Field_1 => 1);

   --  Timer PWM module 2 interrupt set-enable bit
   type NVIC_ISER_SETENA19_Field is
     (
      --  write: no effect; read: Timer PWM module 2 interrupt disabled
      NVIC_ISER_SETENA19_Field_0,
      --  write: enable Timer PWM module 2 interrupt; read: Timer PWM module 2
      --  interrupt enabled
      NVIC_ISER_SETENA19_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA19_Field use
     (NVIC_ISER_SETENA19_Field_0 => 0,
      NVIC_ISER_SETENA19_Field_1 => 1);

   --  real time clock alarm interrupt set-enable bit
   type NVIC_ISER_SETENA20_Field is
     (
      --  write: no effect; read: real time clock alarm interrupt disabled
      NVIC_ISER_SETENA20_Field_0,
      --  write: enable real time clock alarm interrupt; read: real time clock
      --  alarm interrupt enabled
      NVIC_ISER_SETENA20_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA20_Field use
     (NVIC_ISER_SETENA20_Field_0 => 0,
      NVIC_ISER_SETENA20_Field_1 => 1);

   --  real time clock seconds interrupt set-enable bit
   type NVIC_ISER_SETENA21_Field is
     (
      --  write: no effect; read: real time clock seconds interrupt disabled
      NVIC_ISER_SETENA21_Field_0,
      --  write: enable real time clock seconds interrupt; read: real time
      --  clock seconds interrupt enabled
      NVIC_ISER_SETENA21_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA21_Field use
     (NVIC_ISER_SETENA21_Field_0 => 0,
      NVIC_ISER_SETENA21_Field_1 => 1);

   --  periodic interrupt timer all channels interrupt set-enable bit
   type NVIC_ISER_SETENA22_Field is
     (
      --  write: no effect; read: periodic interrupt timer all channels
      --  interrupt disabled
      NVIC_ISER_SETENA22_Field_0,
      --  write: enable periodic interrupt timer all channels interrupt; read:
      --  periodic interrupt timer all channels interrupt enabled
      NVIC_ISER_SETENA22_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA22_Field use
     (NVIC_ISER_SETENA22_Field_0 => 0,
      NVIC_ISER_SETENA22_Field_1 => 1);

   --  integrated interchip sound 0 interrupt set-enable bit
   type NVIC_ISER_SETENA23_Field is
     (
      --  write: no effect; read: integrated interchip sound 0 interrupt
      --  disabled
      NVIC_ISER_SETENA23_Field_0,
      --  write: enable integrated interchip sound 0 interrupt; read:
      --  integrated interchip sound 0 interrupt enabled
      NVIC_ISER_SETENA23_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA23_Field use
     (NVIC_ISER_SETENA23_Field_0 => 0,
      NVIC_ISER_SETENA23_Field_1 => 1);

   --  Reserved iv 40 interrupt set-enable bit
   type NVIC_ISER_SETENA24_Field is
     (
      --  write: no effect; read: Reserved iv 40 interrupt disabled
      NVIC_ISER_SETENA24_Field_0,
      --  write: enable Reserved iv 40 interrupt; read: Reserved iv 40
      --  interrupt enabled
      NVIC_ISER_SETENA24_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA24_Field use
     (NVIC_ISER_SETENA24_Field_0 => 0,
      NVIC_ISER_SETENA24_Field_1 => 1);

   --  digital-to-analog converter 0 interrupt set-enable bit
   type NVIC_ISER_SETENA25_Field is
     (
      --  write: no effect; read: digital-to-analog converter 0 interrupt
      --  disabled
      NVIC_ISER_SETENA25_Field_0,
      --  write: enable digital-to-analog converter 0 interrupt; read:
      --  digital-to-analog converter 0 interrupt enabled
      NVIC_ISER_SETENA25_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA25_Field use
     (NVIC_ISER_SETENA25_Field_0 => 0,
      NVIC_ISER_SETENA25_Field_1 => 1);

   --  touch sensing input interrupt set-enable bit
   type NVIC_ISER_SETENA26_Field is
     (
      --  write: no effect; read: touch sensing input interrupt disabled
      NVIC_ISER_SETENA26_Field_0,
      --  write: enable touch sensing input interrupt; read: touch sensing
      --  input interrupt enabled
      NVIC_ISER_SETENA26_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA26_Field use
     (NVIC_ISER_SETENA26_Field_0 => 0,
      NVIC_ISER_SETENA26_Field_1 => 1);

   --  multipurpose clock generator interrupt set-enable bit
   type NVIC_ISER_SETENA27_Field is
     (
      --  write: no effect; read: multipurpose clock generator interrupt
      --  disabled
      NVIC_ISER_SETENA27_Field_0,
      --  write: enable multipurpose clock generator interrupt; read:
      --  multipurpose clock generator interrupt enabled
      NVIC_ISER_SETENA27_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA27_Field use
     (NVIC_ISER_SETENA27_Field_0 => 0,
      NVIC_ISER_SETENA27_Field_1 => 1);

   --  Low-Power Timer interrupt set-enable bit
   type NVIC_ISER_SETENA28_Field is
     (
      --  write: no effect; read: Low-Power Timer interrupt disabled
      NVIC_ISER_SETENA28_Field_0,
      --  write: enable Low-Power Timer interrupt; read: Low-Power Timer
      --  interrupt enabled
      NVIC_ISER_SETENA28_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA28_Field use
     (NVIC_ISER_SETENA28_Field_0 => 0,
      NVIC_ISER_SETENA28_Field_1 => 1);

   --  segment LCD interrupt set-enable bit
   type NVIC_ISER_SETENA29_Field is
     (
      --  write: no effect; read: segment LCD interrupt disabled
      NVIC_ISER_SETENA29_Field_0,
      --  write: enable segment LCD interrupt; read: segment LCD interrupt
      --  enabled
      NVIC_ISER_SETENA29_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA29_Field use
     (NVIC_ISER_SETENA29_Field_0 => 0,
      NVIC_ISER_SETENA29_Field_1 => 1);

   --  PORTA pin detect interrupt set-enable bit
   type NVIC_ISER_SETENA30_Field is
     (
      --  write: no effect; read: PORTA pin detect interrupt disabled
      NVIC_ISER_SETENA30_Field_0,
      --  write: enable PORTA pin detect interrupt; read: PORTA pin detect
      --  interrupt enabled
      NVIC_ISER_SETENA30_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA30_Field use
     (NVIC_ISER_SETENA30_Field_0 => 0,
      NVIC_ISER_SETENA30_Field_1 => 1);

   --  PORTC and PORTD pin detect interrupt set-enable bit
   type NVIC_ISER_SETENA31_Field is
     (
      --  write: no effect; read: PORTC and PORTD pin detect interrupt disabled
      NVIC_ISER_SETENA31_Field_0,
      --  write: enable PORTC and PORTD pin detect interrupt; read: PORTC and
      --  PORTD pin detect interrupt enabled
      NVIC_ISER_SETENA31_Field_1)
     with Size => 1;
   for NVIC_ISER_SETENA31_Field use
     (NVIC_ISER_SETENA31_Field_0 => 0,
      NVIC_ISER_SETENA31_Field_1 => 1);

   --  Interrupt Set Enable Register
   type NVIC_ISER_Register is record
      --  INT_DMA0 interrupt set-enable bit
      SETENA0  : NVIC_ISER_SETENA0_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA0_Field_0;
      --  INT_DMA1 interrupt set-enable bit
      SETENA1  : NVIC_ISER_SETENA1_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA1_Field_0;
      --  INT_DMA2 interrupt set-enable bit
      SETENA2  : NVIC_ISER_SETENA2_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA2_Field_0;
      --  INT_DMA3 interrupt set-enable bit
      SETENA3  : NVIC_ISER_SETENA3_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA3_Field_0;
      --  Reserved iv 20 interrupt set-enable bit
      SETENA4  : NVIC_ISER_SETENA4_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA4_Field_0;
      --  FTFA command complete and read collision interrupt set-enable bit
      SETENA5  : NVIC_ISER_SETENA5_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA5_Field_0;
      --  low-voltage detect and low-voltage warning interrupt set-enable bit
      SETENA6  : NVIC_ISER_SETENA6_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA6_Field_0;
      --  low leakage wakeup interrupt set-enable bit
      SETENA7  : NVIC_ISER_SETENA7_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA7_Field_0;
      --  inter-integrated circuit 0 interrupt set-enable bit
      SETENA8  : NVIC_ISER_SETENA8_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA8_Field_0;
      --  inter-integrated circuit 1 interrupt set-enable bit
      SETENA9  : NVIC_ISER_SETENA9_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA9_Field_0;
      --  serial peripheral interface 0 interrupt set-enable bit
      SETENA10 : NVIC_ISER_SETENA10_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA10_Field_0;
      --  serial peripheral interface 1 interrupt set-enable bit
      SETENA11 : NVIC_ISER_SETENA11_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA11_Field_0;
      --  UART0 status and error interrupt set-enable bit
      SETENA12 : NVIC_ISER_SETENA12_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA12_Field_0;
      --  UART1 status and error interrupt set-enable bit
      SETENA13 : NVIC_ISER_SETENA13_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA13_Field_0;
      --  UART2 status and error interrupt set-enable bit
      SETENA14 : NVIC_ISER_SETENA14_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA14_Field_0;
      --  Analog-to-digital converter 0 interrupt set-enable bit
      SETENA15 : NVIC_ISER_SETENA15_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA15_Field_0;
      --  Comparator 0 interrupt set-enable bit
      SETENA16 : NVIC_ISER_SETENA16_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA16_Field_0;
      --  Timer PWM module 0 interrupt set-enable bit
      SETENA17 : NVIC_ISER_SETENA17_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA17_Field_0;
      --  Timer PWM module 1 interrupt set-enable bit
      SETENA18 : NVIC_ISER_SETENA18_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA18_Field_0;
      --  Timer PWM module 2 interrupt set-enable bit
      SETENA19 : NVIC_ISER_SETENA19_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA19_Field_0;
      --  real time clock alarm interrupt set-enable bit
      SETENA20 : NVIC_ISER_SETENA20_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA20_Field_0;
      --  real time clock seconds interrupt set-enable bit
      SETENA21 : NVIC_ISER_SETENA21_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA21_Field_0;
      --  periodic interrupt timer all channels interrupt set-enable bit
      SETENA22 : NVIC_ISER_SETENA22_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA22_Field_0;
      --  integrated interchip sound 0 interrupt set-enable bit
      SETENA23 : NVIC_ISER_SETENA23_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA23_Field_0;
      --  Reserved iv 40 interrupt set-enable bit
      SETENA24 : NVIC_ISER_SETENA24_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA24_Field_0;
      --  digital-to-analog converter 0 interrupt set-enable bit
      SETENA25 : NVIC_ISER_SETENA25_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA25_Field_0;
      --  touch sensing input interrupt set-enable bit
      SETENA26 : NVIC_ISER_SETENA26_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA26_Field_0;
      --  multipurpose clock generator interrupt set-enable bit
      SETENA27 : NVIC_ISER_SETENA27_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA27_Field_0;
      --  Low-Power Timer interrupt set-enable bit
      SETENA28 : NVIC_ISER_SETENA28_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA28_Field_0;
      --  segment LCD interrupt set-enable bit
      SETENA29 : NVIC_ISER_SETENA29_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA29_Field_0;
      --  PORTA pin detect interrupt set-enable bit
      SETENA30 : NVIC_ISER_SETENA30_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA30_Field_0;
      --  PORTC and PORTD pin detect interrupt set-enable bit
      SETENA31 : NVIC_ISER_SETENA31_Field :=
                  NRF_SVD.NVIC.NVIC_ISER_SETENA31_Field_0;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_ISER_Register use record
      SETENA0  at 0 range 0 .. 0;
      SETENA1  at 0 range 1 .. 1;
      SETENA2  at 0 range 2 .. 2;
      SETENA3  at 0 range 3 .. 3;
      SETENA4  at 0 range 4 .. 4;
      SETENA5  at 0 range 5 .. 5;
      SETENA6  at 0 range 6 .. 6;
      SETENA7  at 0 range 7 .. 7;
      SETENA8  at 0 range 8 .. 8;
      SETENA9  at 0 range 9 .. 9;
      SETENA10 at 0 range 10 .. 10;
      SETENA11 at 0 range 11 .. 11;
      SETENA12 at 0 range 12 .. 12;
      SETENA13 at 0 range 13 .. 13;
      SETENA14 at 0 range 14 .. 14;
      SETENA15 at 0 range 15 .. 15;
      SETENA16 at 0 range 16 .. 16;
      SETENA17 at 0 range 17 .. 17;
      SETENA18 at 0 range 18 .. 18;
      SETENA19 at 0 range 19 .. 19;
      SETENA20 at 0 range 20 .. 20;
      SETENA21 at 0 range 21 .. 21;
      SETENA22 at 0 range 22 .. 22;
      SETENA23 at 0 range 23 .. 23;
      SETENA24 at 0 range 24 .. 24;
      SETENA25 at 0 range 25 .. 25;
      SETENA26 at 0 range 26 .. 26;
      SETENA27 at 0 range 27 .. 27;
      SETENA28 at 0 range 28 .. 28;
      SETENA29 at 0 range 29 .. 29;
      SETENA30 at 0 range 30 .. 30;
      SETENA31 at 0 range 31 .. 31;
   end record;

   --  INT_DMA0 interrupt clear-enable bit
   type NVIC_ICER_CLRENA0_Field is
     (
      --  write: no effect; read: INT_DMA0 interrupt disabled
      NVIC_ICER_CLRENA0_Field_0,
      --  write: disable INT_DMA0 interrupt; read: INT_DMA0 interrupt enabled
      NVIC_ICER_CLRENA0_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA0_Field use
     (NVIC_ICER_CLRENA0_Field_0 => 0,
      NVIC_ICER_CLRENA0_Field_1 => 1);

   --  INT_DMA1 interrupt clear-enable bit
   type NVIC_ICER_CLRENA1_Field is
     (
      --  write: no effect; read: INT_DMA1 interrupt disabled
      NVIC_ICER_CLRENA1_Field_0,
      --  write: disable INT_DMA1 interrupt; read: INT_DMA1 interrupt enabled
      NVIC_ICER_CLRENA1_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA1_Field use
     (NVIC_ICER_CLRENA1_Field_0 => 0,
      NVIC_ICER_CLRENA1_Field_1 => 1);

   --  INT_DMA2 interrupt clear-enable bit
   type NVIC_ICER_CLRENA2_Field is
     (
      --  write: no effect; read: INT_DMA2 interrupt disabled
      NVIC_ICER_CLRENA2_Field_0,
      --  write: disable INT_DMA2 interrupt; read: INT_DMA2 interrupt enabled
      NVIC_ICER_CLRENA2_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA2_Field use
     (NVIC_ICER_CLRENA2_Field_0 => 0,
      NVIC_ICER_CLRENA2_Field_1 => 1);

   --  INT_DMA3 interrupt clear-enable bit
   type NVIC_ICER_CLRENA3_Field is
     (
      --  write: no effect; read: INT_DMA3 interrupt disabled
      NVIC_ICER_CLRENA3_Field_0,
      --  write: disable INT_DMA3 interrupt; read: INT_DMA3 interrupt enabled
      NVIC_ICER_CLRENA3_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA3_Field use
     (NVIC_ICER_CLRENA3_Field_0 => 0,
      NVIC_ICER_CLRENA3_Field_1 => 1);

   --  Reserved iv 20 interrupt clear-enable bit
   type NVIC_ICER_CLRENA4_Field is
     (
      --  write: no effect; read: Reserved iv 20 interrupt disabled
      NVIC_ICER_CLRENA4_Field_0,
      --  write: disable Reserved iv 20 interrupt; read: Reserved iv 20
      --  interrupt enabled
      NVIC_ICER_CLRENA4_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA4_Field use
     (NVIC_ICER_CLRENA4_Field_0 => 0,
      NVIC_ICER_CLRENA4_Field_1 => 1);

   --  FTFA command complete and read collision interrupt clear-enable bit
   type NVIC_ICER_CLRENA5_Field is
     (
      --  write: no effect; read: FTFA command complete and read collision
      --  interrupt disabled
      NVIC_ICER_CLRENA5_Field_0,
      --  write: disable FTFA command complete and read collision interrupt;
      --  read: FTFA command complete and read collision interrupt enabled
      NVIC_ICER_CLRENA5_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA5_Field use
     (NVIC_ICER_CLRENA5_Field_0 => 0,
      NVIC_ICER_CLRENA5_Field_1 => 1);

   --  low-voltage detect and low-voltage warning interrupt clear-enable bit
   type NVIC_ICER_CLRENA6_Field is
     (
      --  write: no effect; read: low-voltage detect and low-voltage warning
      --  interrupt disabled
      NVIC_ICER_CLRENA6_Field_0,
      --  write: disable low-voltage detect and low-voltage warning interrupt;
      --  read: low-voltage detect and low-voltage warning interrupt enabled
      NVIC_ICER_CLRENA6_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA6_Field use
     (NVIC_ICER_CLRENA6_Field_0 => 0,
      NVIC_ICER_CLRENA6_Field_1 => 1);

   --  low leakage wakeup interrupt clear-enable bit
   type NVIC_ICER_CLRENA7_Field is
     (
      --  write: no effect; read: low leakage wakeup interrupt disabled
      NVIC_ICER_CLRENA7_Field_0,
      --  write: disable low leakage wakeup interrupt; read: low leakage wakeup
      --  interrupt enabled
      NVIC_ICER_CLRENA7_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA7_Field use
     (NVIC_ICER_CLRENA7_Field_0 => 0,
      NVIC_ICER_CLRENA7_Field_1 => 1);

   --  inter-integrated circuit 0 interrupt clear-enable bit
   type NVIC_ICER_CLRENA8_Field is
     (
      --  write: no effect; read: inter-integrated circuit 0 interrupt disabled
      NVIC_ICER_CLRENA8_Field_0,
      --  write: disable inter-integrated circuit 0 interrupt; read:
      --  inter-integrated circuit 0 interrupt enabled
      NVIC_ICER_CLRENA8_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA8_Field use
     (NVIC_ICER_CLRENA8_Field_0 => 0,
      NVIC_ICER_CLRENA8_Field_1 => 1);

   --  inter-integrated circuit 1 interrupt clear-enable bit
   type NVIC_ICER_CLRENA9_Field is
     (
      --  write: no effect; read: inter-integrated circuit 1 interrupt disabled
      NVIC_ICER_CLRENA9_Field_0,
      --  write: disable inter-integrated circuit 1 interrupt; read:
      --  inter-integrated circuit 1 interrupt enabled
      NVIC_ICER_CLRENA9_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA9_Field use
     (NVIC_ICER_CLRENA9_Field_0 => 0,
      NVIC_ICER_CLRENA9_Field_1 => 1);

   --  serial peripheral interface 0 interrupt clear-enable bit
   type NVIC_ICER_CLRENA10_Field is
     (
      --  write: no effect; read: serial peripheral interface 0 interrupt
      --  disabled
      NVIC_ICER_CLRENA10_Field_0,
      --  write: disable serial peripheral interface 0 interrupt; read: serial
      --  peripheral interface 0 interrupt enabled
      NVIC_ICER_CLRENA10_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA10_Field use
     (NVIC_ICER_CLRENA10_Field_0 => 0,
      NVIC_ICER_CLRENA10_Field_1 => 1);

   --  serial peripheral interface 1 interrupt clear-enable bit
   type NVIC_ICER_CLRENA11_Field is
     (
      --  write: no effect; read: serial peripheral interface 1 interrupt
      --  disabled
      NVIC_ICER_CLRENA11_Field_0,
      --  write: disable serial peripheral interface 1 interrupt; read: serial
      --  peripheral interface 1 interrupt enabled
      NVIC_ICER_CLRENA11_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA11_Field use
     (NVIC_ICER_CLRENA11_Field_0 => 0,
      NVIC_ICER_CLRENA11_Field_1 => 1);

   --  UART0 status and error interrupt clear-enable bit
   type NVIC_ICER_CLRENA12_Field is
     (
      --  write: no effect; read: UART0 status and error interrupt disabled
      NVIC_ICER_CLRENA12_Field_0,
      --  write: disable UART0 status and error interrupt; read: UART0 status
      --  and error interrupt enabled
      NVIC_ICER_CLRENA12_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA12_Field use
     (NVIC_ICER_CLRENA12_Field_0 => 0,
      NVIC_ICER_CLRENA12_Field_1 => 1);

   --  UART1 status and error interrupt clear-enable bit
   type NVIC_ICER_CLRENA13_Field is
     (
      --  write: no effect; read: UART1 status and error interrupt disabled
      NVIC_ICER_CLRENA13_Field_0,
      --  write: disable UART1 status and error interrupt; read: UART1 status
      --  and error interrupt enabled
      NVIC_ICER_CLRENA13_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA13_Field use
     (NVIC_ICER_CLRENA13_Field_0 => 0,
      NVIC_ICER_CLRENA13_Field_1 => 1);

   --  UART2 status and error interrupt clear-enable bit
   type NVIC_ICER_CLRENA14_Field is
     (
      --  write: no effect; read: UART2 status and error interrupt disabled
      NVIC_ICER_CLRENA14_Field_0,
      --  write: disable UART2 status and error interrupt; read: UART2 status
      --  and error interrupt enabled
      NVIC_ICER_CLRENA14_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA14_Field use
     (NVIC_ICER_CLRENA14_Field_0 => 0,
      NVIC_ICER_CLRENA14_Field_1 => 1);

   --  Analog-to-digital converter 0 interrupt clear-enable bit
   type NVIC_ICER_CLRENA15_Field is
     (
      --  write: no effect; read: Analog-to-digital converter 0 interrupt
      --  disabled
      NVIC_ICER_CLRENA15_Field_0,
      --  write: disable Analog-to-digital converter 0 interrupt; read:
      --  Analog-to-digital converter 0 interrupt enabled
      NVIC_ICER_CLRENA15_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA15_Field use
     (NVIC_ICER_CLRENA15_Field_0 => 0,
      NVIC_ICER_CLRENA15_Field_1 => 1);

   --  Comparator 0 interrupt clear-enable bit
   type NVIC_ICER_CLRENA16_Field is
     (
      --  write: no effect; read: Comparator 0 interrupt disabled
      NVIC_ICER_CLRENA16_Field_0,
      --  write: disable Comparator 0 interrupt; read: Comparator 0 interrupt
      --  enabled
      NVIC_ICER_CLRENA16_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA16_Field use
     (NVIC_ICER_CLRENA16_Field_0 => 0,
      NVIC_ICER_CLRENA16_Field_1 => 1);

   --  Timer PWM module 0 interrupt clear-enable bit
   type NVIC_ICER_CLRENA17_Field is
     (
      --  write: no effect; read: Timer PWM module 0 interrupt disabled
      NVIC_ICER_CLRENA17_Field_0,
      --  write: disable Timer PWM module 0 interrupt; read: Timer PWM module 0
      --  interrupt enabled
      NVIC_ICER_CLRENA17_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA17_Field use
     (NVIC_ICER_CLRENA17_Field_0 => 0,
      NVIC_ICER_CLRENA17_Field_1 => 1);

   --  Timer PWM module 1 interrupt clear-enable bit
   type NVIC_ICER_CLRENA18_Field is
     (
      --  write: no effect; read: Timer PWM module 1 interrupt disabled
      NVIC_ICER_CLRENA18_Field_0,
      --  write: disable Timer PWM module 1 interrupt; read: Timer PWM module 1
      --  interrupt enabled
      NVIC_ICER_CLRENA18_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA18_Field use
     (NVIC_ICER_CLRENA18_Field_0 => 0,
      NVIC_ICER_CLRENA18_Field_1 => 1);

   --  Timer PWM module 2 interrupt clear-enable bit
   type NVIC_ICER_CLRENA19_Field is
     (
      --  write: no effect; read: Timer PWM module 2 interrupt disabled
      NVIC_ICER_CLRENA19_Field_0,
      --  write: disable Timer PWM module 2 interrupt; read: Timer PWM module 2
      --  interrupt enabled
      NVIC_ICER_CLRENA19_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA19_Field use
     (NVIC_ICER_CLRENA19_Field_0 => 0,
      NVIC_ICER_CLRENA19_Field_1 => 1);

   --  real time clock alarm interrupt clear-enable bit
   type NVIC_ICER_CLRENA20_Field is
     (
      --  write: no effect; read: real time clock alarm interrupt disabled
      NVIC_ICER_CLRENA20_Field_0,
      --  write: disable real time clock alarm interrupt; read: real time clock
      --  alarm interrupt enabled
      NVIC_ICER_CLRENA20_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA20_Field use
     (NVIC_ICER_CLRENA20_Field_0 => 0,
      NVIC_ICER_CLRENA20_Field_1 => 1);

   --  real time clock seconds interrupt clear-enable bit
   type NVIC_ICER_CLRENA21_Field is
     (
      --  write: no effect; read: real time clock seconds interrupt disabled
      NVIC_ICER_CLRENA21_Field_0,
      --  write: disable real time clock seconds interrupt; read: real time
      --  clock seconds interrupt enabled
      NVIC_ICER_CLRENA21_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA21_Field use
     (NVIC_ICER_CLRENA21_Field_0 => 0,
      NVIC_ICER_CLRENA21_Field_1 => 1);

   --  periodic interrupt timer all channels interrupt clear-enable bit
   type NVIC_ICER_CLRENA22_Field is
     (
      --  write: no effect; read: periodic interrupt timer all channels
      --  interrupt disabled
      NVIC_ICER_CLRENA22_Field_0,
      --  write: disable periodic interrupt timer all channels interrupt; read:
      --  periodic interrupt timer all channels interrupt enabled
      NVIC_ICER_CLRENA22_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA22_Field use
     (NVIC_ICER_CLRENA22_Field_0 => 0,
      NVIC_ICER_CLRENA22_Field_1 => 1);

   --  integrated interchip sound 0 interrupt clear-enable bit
   type NVIC_ICER_CLRENA23_Field is
     (
      --  write: no effect; read: integrated interchip sound 0 interrupt
      --  disabled
      NVIC_ICER_CLRENA23_Field_0,
      --  write: disable integrated interchip sound 0 interrupt; read:
      --  integrated interchip sound 0 interrupt enabled
      NVIC_ICER_CLRENA23_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA23_Field use
     (NVIC_ICER_CLRENA23_Field_0 => 0,
      NVIC_ICER_CLRENA23_Field_1 => 1);

   --  Reserved iv 40 interrupt clear-enable bit
   type NVIC_ICER_CLRENA24_Field is
     (
      --  write: no effect; read: Reserved iv 40 interrupt disabled
      NVIC_ICER_CLRENA24_Field_0,
      --  write: disable Reserved iv 40 interrupt; read: Reserved iv 40
      --  interrupt enabled
      NVIC_ICER_CLRENA24_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA24_Field use
     (NVIC_ICER_CLRENA24_Field_0 => 0,
      NVIC_ICER_CLRENA24_Field_1 => 1);

   --  digital-to-analog converter 0 interrupt clear-enable bit
   type NVIC_ICER_CLRENA25_Field is
     (
      --  write: no effect; read: digital-to-analog converter 0 interrupt
      --  disabled
      NVIC_ICER_CLRENA25_Field_0,
      --  write: disable digital-to-analog converter 0 interrupt; read:
      --  digital-to-analog converter 0 interrupt enabled
      NVIC_ICER_CLRENA25_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA25_Field use
     (NVIC_ICER_CLRENA25_Field_0 => 0,
      NVIC_ICER_CLRENA25_Field_1 => 1);

   --  touch sensing input interrupt clear-enable bit
   type NVIC_ICER_CLRENA26_Field is
     (
      --  write: no effect; read: touch sensing input interrupt disabled
      NVIC_ICER_CLRENA26_Field_0,
      --  write: disable touch sensing input interrupt; read: touch sensing
      --  input interrupt enabled
      NVIC_ICER_CLRENA26_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA26_Field use
     (NVIC_ICER_CLRENA26_Field_0 => 0,
      NVIC_ICER_CLRENA26_Field_1 => 1);

   --  multipurpose clock generator interrupt clear-enable bit
   type NVIC_ICER_CLRENA27_Field is
     (
      --  write: no effect; read: multipurpose clock generator interrupt
      --  disabled
      NVIC_ICER_CLRENA27_Field_0,
      --  write: disable multipurpose clock generator interrupt; read:
      --  multipurpose clock generator interrupt enabled
      NVIC_ICER_CLRENA27_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA27_Field use
     (NVIC_ICER_CLRENA27_Field_0 => 0,
      NVIC_ICER_CLRENA27_Field_1 => 1);

   --  Low-Power Timer interrupt clear-enable bit
   type NVIC_ICER_CLRENA28_Field is
     (
      --  write: no effect; read: Low-Power Timer interrupt disabled
      NVIC_ICER_CLRENA28_Field_0,
      --  write: disable Low-Power Timer interrupt; read: Low-Power Timer
      --  interrupt enabled
      NVIC_ICER_CLRENA28_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA28_Field use
     (NVIC_ICER_CLRENA28_Field_0 => 0,
      NVIC_ICER_CLRENA28_Field_1 => 1);

   --  segment LCD interrupt clear-enable bit
   type NVIC_ICER_CLRENA29_Field is
     (
      --  write: no effect; read: segment LCD interrupt disabled
      NVIC_ICER_CLRENA29_Field_0,
      --  write: disable segment LCD interrupt; read: segment LCD interrupt
      --  enabled
      NVIC_ICER_CLRENA29_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA29_Field use
     (NVIC_ICER_CLRENA29_Field_0 => 0,
      NVIC_ICER_CLRENA29_Field_1 => 1);

   --  PORTA pin detect interrupt clear-enable bit
   type NVIC_ICER_CLRENA30_Field is
     (
      --  write: no effect; read: PORTA pin detect interrupt disabled
      NVIC_ICER_CLRENA30_Field_0,
      --  write: disable PORTA pin detect interrupt; read: PORTA pin detect
      --  interrupt enabled
      NVIC_ICER_CLRENA30_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA30_Field use
     (NVIC_ICER_CLRENA30_Field_0 => 0,
      NVIC_ICER_CLRENA30_Field_1 => 1);

   --  PORTC and PORTD pin detect interrupt clear-enable bit
   type NVIC_ICER_CLRENA31_Field is
     (
      --  write: no effect; read: PORTC and PORTD pin detect interrupt disabled
      NVIC_ICER_CLRENA31_Field_0,
      --  write: disable PORTC and PORTD pin detect interrupt; read: PORTC and
      --  PORTD pin detect interrupt enabled
      NVIC_ICER_CLRENA31_Field_1)
     with Size => 1;
   for NVIC_ICER_CLRENA31_Field use
     (NVIC_ICER_CLRENA31_Field_0 => 0,
      NVIC_ICER_CLRENA31_Field_1 => 1);

   --  Interrupt Clear Enable Register
   type NVIC_ICER_Register is record
      --  INT_DMA0 interrupt clear-enable bit
      CLRENA0  : NVIC_ICER_CLRENA0_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA0_Field_0;
      --  INT_DMA1 interrupt clear-enable bit
      CLRENA1  : NVIC_ICER_CLRENA1_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA1_Field_0;
      --  INT_DMA2 interrupt clear-enable bit
      CLRENA2  : NVIC_ICER_CLRENA2_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA2_Field_0;
      --  INT_DMA3 interrupt clear-enable bit
      CLRENA3  : NVIC_ICER_CLRENA3_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA3_Field_0;
      --  Reserved iv 20 interrupt clear-enable bit
      CLRENA4  : NVIC_ICER_CLRENA4_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA4_Field_0;
      --  FTFA command complete and read collision interrupt clear-enable bit
      CLRENA5  : NVIC_ICER_CLRENA5_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA5_Field_0;
      --  low-voltage detect and low-voltage warning interrupt clear-enable bit
      CLRENA6  : NVIC_ICER_CLRENA6_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA6_Field_0;
      --  low leakage wakeup interrupt clear-enable bit
      CLRENA7  : NVIC_ICER_CLRENA7_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA7_Field_0;
      --  inter-integrated circuit 0 interrupt clear-enable bit
      CLRENA8  : NVIC_ICER_CLRENA8_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA8_Field_0;
      --  inter-integrated circuit 1 interrupt clear-enable bit
      CLRENA9  : NVIC_ICER_CLRENA9_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA9_Field_0;
      --  serial peripheral interface 0 interrupt clear-enable bit
      CLRENA10 : NVIC_ICER_CLRENA10_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA10_Field_0;
      --  serial peripheral interface 1 interrupt clear-enable bit
      CLRENA11 : NVIC_ICER_CLRENA11_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA11_Field_0;
      --  UART0 status and error interrupt clear-enable bit
      CLRENA12 : NVIC_ICER_CLRENA12_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA12_Field_0;
      --  UART1 status and error interrupt clear-enable bit
      CLRENA13 : NVIC_ICER_CLRENA13_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA13_Field_0;
      --  UART2 status and error interrupt clear-enable bit
      CLRENA14 : NVIC_ICER_CLRENA14_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA14_Field_0;
      --  Analog-to-digital converter 0 interrupt clear-enable bit
      CLRENA15 : NVIC_ICER_CLRENA15_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA15_Field_0;
      --  Comparator 0 interrupt clear-enable bit
      CLRENA16 : NVIC_ICER_CLRENA16_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA16_Field_0;
      --  Timer PWM module 0 interrupt clear-enable bit
      CLRENA17 : NVIC_ICER_CLRENA17_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA17_Field_0;
      --  Timer PWM module 1 interrupt clear-enable bit
      CLRENA18 : NVIC_ICER_CLRENA18_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA18_Field_0;
      --  Timer PWM module 2 interrupt clear-enable bit
      CLRENA19 : NVIC_ICER_CLRENA19_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA19_Field_0;
      --  real time clock alarm interrupt clear-enable bit
      CLRENA20 : NVIC_ICER_CLRENA20_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA20_Field_0;
      --  real time clock seconds interrupt clear-enable bit
      CLRENA21 : NVIC_ICER_CLRENA21_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA21_Field_0;
      --  periodic interrupt timer all channels interrupt clear-enable bit
      CLRENA22 : NVIC_ICER_CLRENA22_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA22_Field_0;
      --  integrated interchip sound 0 interrupt clear-enable bit
      CLRENA23 : NVIC_ICER_CLRENA23_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA23_Field_0;
      --  Reserved iv 40 interrupt clear-enable bit
      CLRENA24 : NVIC_ICER_CLRENA24_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA24_Field_0;
      --  digital-to-analog converter 0 interrupt clear-enable bit
      CLRENA25 : NVIC_ICER_CLRENA25_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA25_Field_0;
      --  touch sensing input interrupt clear-enable bit
      CLRENA26 : NVIC_ICER_CLRENA26_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA26_Field_0;
      --  multipurpose clock generator interrupt clear-enable bit
      CLRENA27 : NVIC_ICER_CLRENA27_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA27_Field_0;
      --  Low-Power Timer interrupt clear-enable bit
      CLRENA28 : NVIC_ICER_CLRENA28_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA28_Field_0;
      --  segment LCD interrupt clear-enable bit
      CLRENA29 : NVIC_ICER_CLRENA29_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA29_Field_0;
      --  PORTA pin detect interrupt clear-enable bit
      CLRENA30 : NVIC_ICER_CLRENA30_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA30_Field_0;
      --  PORTC and PORTD pin detect interrupt clear-enable bit
      CLRENA31 : NVIC_ICER_CLRENA31_Field :=
                  NRF_SVD.NVIC.NVIC_ICER_CLRENA31_Field_0;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_ICER_Register use record
      CLRENA0  at 0 range 0 .. 0;
      CLRENA1  at 0 range 1 .. 1;
      CLRENA2  at 0 range 2 .. 2;
      CLRENA3  at 0 range 3 .. 3;
      CLRENA4  at 0 range 4 .. 4;
      CLRENA5  at 0 range 5 .. 5;
      CLRENA6  at 0 range 6 .. 6;
      CLRENA7  at 0 range 7 .. 7;
      CLRENA8  at 0 range 8 .. 8;
      CLRENA9  at 0 range 9 .. 9;
      CLRENA10 at 0 range 10 .. 10;
      CLRENA11 at 0 range 11 .. 11;
      CLRENA12 at 0 range 12 .. 12;
      CLRENA13 at 0 range 13 .. 13;
      CLRENA14 at 0 range 14 .. 14;
      CLRENA15 at 0 range 15 .. 15;
      CLRENA16 at 0 range 16 .. 16;
      CLRENA17 at 0 range 17 .. 17;
      CLRENA18 at 0 range 18 .. 18;
      CLRENA19 at 0 range 19 .. 19;
      CLRENA20 at 0 range 20 .. 20;
      CLRENA21 at 0 range 21 .. 21;
      CLRENA22 at 0 range 22 .. 22;
      CLRENA23 at 0 range 23 .. 23;
      CLRENA24 at 0 range 24 .. 24;
      CLRENA25 at 0 range 25 .. 25;
      CLRENA26 at 0 range 26 .. 26;
      CLRENA27 at 0 range 27 .. 27;
      CLRENA28 at 0 range 28 .. 28;
      CLRENA29 at 0 range 29 .. 29;
      CLRENA30 at 0 range 30 .. 30;
      CLRENA31 at 0 range 31 .. 31;
   end record;

   --  INT_DMA0 interrupt set-pending bit
   type NVIC_ISPR_SETPEND0_Field is
     (
      --  write: no effect; read: INT_DMA0 interrupt is not pending
      NVIC_ISPR_SETPEND0_Field_0,
      --  write: changes the INT_DMA0 interrupt state to pending; read:
      --  INT_DMA0 interrupt is pending
      NVIC_ISPR_SETPEND0_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND0_Field use
     (NVIC_ISPR_SETPEND0_Field_0 => 0,
      NVIC_ISPR_SETPEND0_Field_1 => 1);

   --  INT_DMA1 interrupt set-pending bit
   type NVIC_ISPR_SETPEND1_Field is
     (
      --  write: no effect; read: INT_DMA1 interrupt is not pending
      NVIC_ISPR_SETPEND1_Field_0,
      --  write: changes the INT_DMA1 interrupt state to pending; read:
      --  INT_DMA1 interrupt is pending
      NVIC_ISPR_SETPEND1_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND1_Field use
     (NVIC_ISPR_SETPEND1_Field_0 => 0,
      NVIC_ISPR_SETPEND1_Field_1 => 1);

   --  INT_DMA2 interrupt set-pending bit
   type NVIC_ISPR_SETPEND2_Field is
     (
      --  write: no effect; read: INT_DMA2 interrupt is not pending
      NVIC_ISPR_SETPEND2_Field_0,
      --  write: changes the INT_DMA2 interrupt state to pending; read:
      --  INT_DMA2 interrupt is pending
      NVIC_ISPR_SETPEND2_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND2_Field use
     (NVIC_ISPR_SETPEND2_Field_0 => 0,
      NVIC_ISPR_SETPEND2_Field_1 => 1);

   --  INT_DMA3 interrupt set-pending bit
   type NVIC_ISPR_SETPEND3_Field is
     (
      --  write: no effect; read: INT_DMA3 interrupt is not pending
      NVIC_ISPR_SETPEND3_Field_0,
      --  write: changes the INT_DMA3 interrupt state to pending; read:
      --  INT_DMA3 interrupt is pending
      NVIC_ISPR_SETPEND3_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND3_Field use
     (NVIC_ISPR_SETPEND3_Field_0 => 0,
      NVIC_ISPR_SETPEND3_Field_1 => 1);

   --  Reserved iv 20 interrupt set-pending bit
   type NVIC_ISPR_SETPEND4_Field is
     (
      --  write: no effect; read: Reserved iv 20 interrupt is not pending
      NVIC_ISPR_SETPEND4_Field_0,
      --  write: changes the Reserved iv 20 interrupt state to pending; read:
      --  Reserved iv 20 interrupt is pending
      NVIC_ISPR_SETPEND4_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND4_Field use
     (NVIC_ISPR_SETPEND4_Field_0 => 0,
      NVIC_ISPR_SETPEND4_Field_1 => 1);

   --  FTFA command complete and read collision interrupt set-pending bit
   type NVIC_ISPR_SETPEND5_Field is
     (
      --  write: no effect; read: FTFA command complete and read collision
      --  interrupt is not pending
      NVIC_ISPR_SETPEND5_Field_0,
      --  write: changes the FTFA command complete and read collision interrupt
      --  state to pending; read: FTFA command complete and read collision
      --  interrupt is pending
      NVIC_ISPR_SETPEND5_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND5_Field use
     (NVIC_ISPR_SETPEND5_Field_0 => 0,
      NVIC_ISPR_SETPEND5_Field_1 => 1);

   --  low-voltage detect and low-voltage warning interrupt set-pending bit
   type NVIC_ISPR_SETPEND6_Field is
     (
      --  write: no effect; read: low-voltage detect and low-voltage warning
      --  interrupt is not pending
      NVIC_ISPR_SETPEND6_Field_0,
      --  write: changes the low-voltage detect and low-voltage warning
      --  interrupt state to pending; read: low-voltage detect and low-voltage
      --  warning interrupt is pending
      NVIC_ISPR_SETPEND6_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND6_Field use
     (NVIC_ISPR_SETPEND6_Field_0 => 0,
      NVIC_ISPR_SETPEND6_Field_1 => 1);

   --  low leakage wakeup interrupt set-pending bit
   type NVIC_ISPR_SETPEND7_Field is
     (
      --  write: no effect; read: low leakage wakeup interrupt is not pending
      NVIC_ISPR_SETPEND7_Field_0,
      --  write: changes the low leakage wakeup interrupt state to pending;
      --  read: low leakage wakeup interrupt is pending
      NVIC_ISPR_SETPEND7_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND7_Field use
     (NVIC_ISPR_SETPEND7_Field_0 => 0,
      NVIC_ISPR_SETPEND7_Field_1 => 1);

   --  inter-integrated circuit 0 interrupt set-pending bit
   type NVIC_ISPR_SETPEND8_Field is
     (
      --  write: no effect; read: inter-integrated circuit 0 interrupt is not
      --  pending
      NVIC_ISPR_SETPEND8_Field_0,
      --  write: changes the inter-integrated circuit 0 interrupt state to
      --  pending; read: inter-integrated circuit 0 interrupt is pending
      NVIC_ISPR_SETPEND8_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND8_Field use
     (NVIC_ISPR_SETPEND8_Field_0 => 0,
      NVIC_ISPR_SETPEND8_Field_1 => 1);

   --  inter-integrated circuit 1 interrupt set-pending bit
   type NVIC_ISPR_SETPEND9_Field is
     (
      --  write: no effect; read: inter-integrated circuit 1 interrupt is not
      --  pending
      NVIC_ISPR_SETPEND9_Field_0,
      --  write: changes the inter-integrated circuit 1 interrupt state to
      --  pending; read: inter-integrated circuit 1 interrupt is pending
      NVIC_ISPR_SETPEND9_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND9_Field use
     (NVIC_ISPR_SETPEND9_Field_0 => 0,
      NVIC_ISPR_SETPEND9_Field_1 => 1);

   --  serial peripheral interface 0 interrupt set-pending bit
   type NVIC_ISPR_SETPEND10_Field is
     (
      --  write: no effect; read: serial peripheral interface 0 interrupt is
      --  not pending
      NVIC_ISPR_SETPEND10_Field_0,
      --  write: changes the serial peripheral interface 0 interrupt state to
      --  pending; read: serial peripheral interface 0 interrupt is pending
      NVIC_ISPR_SETPEND10_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND10_Field use
     (NVIC_ISPR_SETPEND10_Field_0 => 0,
      NVIC_ISPR_SETPEND10_Field_1 => 1);

   --  serial peripheral interface 1 interrupt set-pending bit
   type NVIC_ISPR_SETPEND11_Field is
     (
      --  write: no effect; read: serial peripheral interface 1 interrupt is
      --  not pending
      NVIC_ISPR_SETPEND11_Field_0,
      --  write: changes the serial peripheral interface 1 interrupt state to
      --  pending; read: serial peripheral interface 1 interrupt is pending
      NVIC_ISPR_SETPEND11_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND11_Field use
     (NVIC_ISPR_SETPEND11_Field_0 => 0,
      NVIC_ISPR_SETPEND11_Field_1 => 1);

   --  UART0 status and error interrupt set-pending bit
   type NVIC_ISPR_SETPEND12_Field is
     (
      --  write: no effect; read: UART0 status and error interrupt is not
      --  pending
      NVIC_ISPR_SETPEND12_Field_0,
      --  write: changes the UART0 status and error interrupt state to pending;
      --  read: UART0 status and error interrupt is pending
      NVIC_ISPR_SETPEND12_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND12_Field use
     (NVIC_ISPR_SETPEND12_Field_0 => 0,
      NVIC_ISPR_SETPEND12_Field_1 => 1);

   --  UART1 status and error interrupt set-pending bit
   type NVIC_ISPR_SETPEND13_Field is
     (
      --  write: no effect; read: UART1 status and error interrupt is not
      --  pending
      NVIC_ISPR_SETPEND13_Field_0,
      --  write: changes the UART1 status and error interrupt state to pending;
      --  read: UART1 status and error interrupt is pending
      NVIC_ISPR_SETPEND13_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND13_Field use
     (NVIC_ISPR_SETPEND13_Field_0 => 0,
      NVIC_ISPR_SETPEND13_Field_1 => 1);

   --  UART2 status and error interrupt set-pending bit
   type NVIC_ISPR_SETPEND14_Field is
     (
      --  write: no effect; read: UART2 status and error interrupt is not
      --  pending
      NVIC_ISPR_SETPEND14_Field_0,
      --  write: changes the UART2 status and error interrupt state to pending;
      --  read: UART2 status and error interrupt is pending
      NVIC_ISPR_SETPEND14_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND14_Field use
     (NVIC_ISPR_SETPEND14_Field_0 => 0,
      NVIC_ISPR_SETPEND14_Field_1 => 1);

   --  Analog-to-digital converter 0 interrupt set-pending bit
   type NVIC_ISPR_SETPEND15_Field is
     (
      --  write: no effect; read: Analog-to-digital converter 0 interrupt is
      --  not pending
      NVIC_ISPR_SETPEND15_Field_0,
      --  write: changes the Analog-to-digital converter 0 interrupt state to
      --  pending; read: Analog-to-digital converter 0 interrupt is pending
      NVIC_ISPR_SETPEND15_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND15_Field use
     (NVIC_ISPR_SETPEND15_Field_0 => 0,
      NVIC_ISPR_SETPEND15_Field_1 => 1);

   --  Comparator 0 interrupt set-pending bit
   type NVIC_ISPR_SETPEND16_Field is
     (
      --  write: no effect; read: Comparator 0 interrupt is not pending
      NVIC_ISPR_SETPEND16_Field_0,
      --  write: changes the Comparator 0 interrupt state to pending; read:
      --  Comparator 0 interrupt is pending
      NVIC_ISPR_SETPEND16_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND16_Field use
     (NVIC_ISPR_SETPEND16_Field_0 => 0,
      NVIC_ISPR_SETPEND16_Field_1 => 1);

   --  Timer PWM module 0 interrupt set-pending bit
   type NVIC_ISPR_SETPEND17_Field is
     (
      --  write: no effect; read: Timer PWM module 0 interrupt is not pending
      NVIC_ISPR_SETPEND17_Field_0,
      --  write: changes the Timer PWM module 0 interrupt state to pending;
      --  read: Timer PWM module 0 interrupt is pending
      NVIC_ISPR_SETPEND17_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND17_Field use
     (NVIC_ISPR_SETPEND17_Field_0 => 0,
      NVIC_ISPR_SETPEND17_Field_1 => 1);

   --  Timer PWM module 1 interrupt set-pending bit
   type NVIC_ISPR_SETPEND18_Field is
     (
      --  write: no effect; read: Timer PWM module 1 interrupt is not pending
      NVIC_ISPR_SETPEND18_Field_0,
      --  write: changes the Timer PWM module 1 interrupt state to pending;
      --  read: Timer PWM module 1 interrupt is pending
      NVIC_ISPR_SETPEND18_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND18_Field use
     (NVIC_ISPR_SETPEND18_Field_0 => 0,
      NVIC_ISPR_SETPEND18_Field_1 => 1);

   --  Timer PWM module 2 interrupt set-pending bit
   type NVIC_ISPR_SETPEND19_Field is
     (
      --  write: no effect; read: Timer PWM module 2 interrupt is not pending
      NVIC_ISPR_SETPEND19_Field_0,
      --  write: changes the Timer PWM module 2 interrupt state to pending;
      --  read: Timer PWM module 2 interrupt is pending
      NVIC_ISPR_SETPEND19_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND19_Field use
     (NVIC_ISPR_SETPEND19_Field_0 => 0,
      NVIC_ISPR_SETPEND19_Field_1 => 1);

   --  real time clock alarm interrupt set-pending bit
   type NVIC_ISPR_SETPEND20_Field is
     (
      --  write: no effect; read: real time clock alarm interrupt is not
      --  pending
      NVIC_ISPR_SETPEND20_Field_0,
      --  write: changes the real time clock alarm interrupt state to pending;
      --  read: real time clock alarm interrupt is pending
      NVIC_ISPR_SETPEND20_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND20_Field use
     (NVIC_ISPR_SETPEND20_Field_0 => 0,
      NVIC_ISPR_SETPEND20_Field_1 => 1);

   --  real time clock seconds interrupt set-pending bit
   type NVIC_ISPR_SETPEND21_Field is
     (
      --  write: no effect; read: real time clock seconds interrupt is not
      --  pending
      NVIC_ISPR_SETPEND21_Field_0,
      --  write: changes the real time clock seconds interrupt state to
      --  pending; read: real time clock seconds interrupt is pending
      NVIC_ISPR_SETPEND21_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND21_Field use
     (NVIC_ISPR_SETPEND21_Field_0 => 0,
      NVIC_ISPR_SETPEND21_Field_1 => 1);

   --  periodic interrupt timer all channels interrupt set-pending bit
   type NVIC_ISPR_SETPEND22_Field is
     (
      --  write: no effect; read: periodic interrupt timer all channels
      --  interrupt is not pending
      NVIC_ISPR_SETPEND22_Field_0,
      --  write: changes the periodic interrupt timer all channels interrupt
      --  state to pending; read: periodic interrupt timer all channels
      --  interrupt is pending
      NVIC_ISPR_SETPEND22_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND22_Field use
     (NVIC_ISPR_SETPEND22_Field_0 => 0,
      NVIC_ISPR_SETPEND22_Field_1 => 1);

   --  integrated interchip sound 0 interrupt set-pending bit
   type NVIC_ISPR_SETPEND23_Field is
     (
      --  write: no effect; read: integrated interchip sound 0 interrupt is not
      --  pending
      NVIC_ISPR_SETPEND23_Field_0,
      --  write: changes the integrated interchip sound 0 interrupt state to
      --  pending; read: integrated interchip sound 0 interrupt is pending
      NVIC_ISPR_SETPEND23_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND23_Field use
     (NVIC_ISPR_SETPEND23_Field_0 => 0,
      NVIC_ISPR_SETPEND23_Field_1 => 1);

   --  Reserved iv 40 interrupt set-pending bit
   type NVIC_ISPR_SETPEND24_Field is
     (
      --  write: no effect; read: Reserved iv 40 interrupt is not pending
      NVIC_ISPR_SETPEND24_Field_0,
      --  write: changes the Reserved iv 40 interrupt state to pending; read:
      --  Reserved iv 40 interrupt is pending
      NVIC_ISPR_SETPEND24_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND24_Field use
     (NVIC_ISPR_SETPEND24_Field_0 => 0,
      NVIC_ISPR_SETPEND24_Field_1 => 1);

   --  digital-to-analog converter 0 interrupt set-pending bit
   type NVIC_ISPR_SETPEND25_Field is
     (
      --  write: no effect; read: digital-to-analog converter 0 interrupt is
      --  not pending
      NVIC_ISPR_SETPEND25_Field_0,
      --  write: changes the digital-to-analog converter 0 interrupt state to
      --  pending; read: digital-to-analog converter 0 interrupt is pending
      NVIC_ISPR_SETPEND25_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND25_Field use
     (NVIC_ISPR_SETPEND25_Field_0 => 0,
      NVIC_ISPR_SETPEND25_Field_1 => 1);

   --  touch sensing input interrupt set-pending bit
   type NVIC_ISPR_SETPEND26_Field is
     (
      --  write: no effect; read: touch sensing input interrupt is not pending
      NVIC_ISPR_SETPEND26_Field_0,
      --  write: changes the touch sensing input interrupt state to pending;
      --  read: touch sensing input interrupt is pending
      NVIC_ISPR_SETPEND26_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND26_Field use
     (NVIC_ISPR_SETPEND26_Field_0 => 0,
      NVIC_ISPR_SETPEND26_Field_1 => 1);

   --  multipurpose clock generator interrupt set-pending bit
   type NVIC_ISPR_SETPEND27_Field is
     (
      --  write: no effect; read: multipurpose clock generator interrupt is not
      --  pending
      NVIC_ISPR_SETPEND27_Field_0,
      --  write: changes the multipurpose clock generator interrupt state to
      --  pending; read: multipurpose clock generator interrupt is pending
      NVIC_ISPR_SETPEND27_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND27_Field use
     (NVIC_ISPR_SETPEND27_Field_0 => 0,
      NVIC_ISPR_SETPEND27_Field_1 => 1);

   --  Low-Power Timer interrupt set-pending bit
   type NVIC_ISPR_SETPEND28_Field is
     (
      --  write: no effect; read: Low-Power Timer interrupt is not pending
      NVIC_ISPR_SETPEND28_Field_0,
      --  write: changes the Low-Power Timer interrupt state to pending; read:
      --  Low-Power Timer interrupt is pending
      NVIC_ISPR_SETPEND28_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND28_Field use
     (NVIC_ISPR_SETPEND28_Field_0 => 0,
      NVIC_ISPR_SETPEND28_Field_1 => 1);

   --  segment LCD interrupt set-pending bit
   type NVIC_ISPR_SETPEND29_Field is
     (
      --  write: no effect; read: segment LCD interrupt is not pending
      NVIC_ISPR_SETPEND29_Field_0,
      --  write: changes the segment LCD interrupt state to pending; read:
      --  segment LCD interrupt is pending
      NVIC_ISPR_SETPEND29_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND29_Field use
     (NVIC_ISPR_SETPEND29_Field_0 => 0,
      NVIC_ISPR_SETPEND29_Field_1 => 1);

   --  PORTA pin detect interrupt set-pending bit
   type NVIC_ISPR_SETPEND30_Field is
     (
      --  write: no effect; read: PORTA pin detect interrupt is not pending
      NVIC_ISPR_SETPEND30_Field_0,
      --  write: changes the PORTA pin detect interrupt state to pending; read:
      --  PORTA pin detect interrupt is pending
      NVIC_ISPR_SETPEND30_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND30_Field use
     (NVIC_ISPR_SETPEND30_Field_0 => 0,
      NVIC_ISPR_SETPEND30_Field_1 => 1);

   --  PORTC and PORTD pin detect interrupt set-pending bit
   type NVIC_ISPR_SETPEND31_Field is
     (
      --  write: no effect; read: PORTC and PORTD pin detect interrupt is not
      --  pending
      NVIC_ISPR_SETPEND31_Field_0,
      --  write: changes the PORTC and PORTD pin detect interrupt state to
      --  pending; read: PORTC and PORTD pin detect interrupt is pending
      NVIC_ISPR_SETPEND31_Field_1)
     with Size => 1;
   for NVIC_ISPR_SETPEND31_Field use
     (NVIC_ISPR_SETPEND31_Field_0 => 0,
      NVIC_ISPR_SETPEND31_Field_1 => 1);

   --  Interrupt Set Pending Register
   type NVIC_ISPR_Register is record
      --  INT_DMA0 interrupt set-pending bit
      SETPEND0  : NVIC_ISPR_SETPEND0_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND0_Field_0;
      --  INT_DMA1 interrupt set-pending bit
      SETPEND1  : NVIC_ISPR_SETPEND1_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND1_Field_0;
      --  INT_DMA2 interrupt set-pending bit
      SETPEND2  : NVIC_ISPR_SETPEND2_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND2_Field_0;
      --  INT_DMA3 interrupt set-pending bit
      SETPEND3  : NVIC_ISPR_SETPEND3_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND3_Field_0;
      --  Reserved iv 20 interrupt set-pending bit
      SETPEND4  : NVIC_ISPR_SETPEND4_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND4_Field_0;
      --  FTFA command complete and read collision interrupt set-pending bit
      SETPEND5  : NVIC_ISPR_SETPEND5_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND5_Field_0;
      --  low-voltage detect and low-voltage warning interrupt set-pending bit
      SETPEND6  : NVIC_ISPR_SETPEND6_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND6_Field_0;
      --  low leakage wakeup interrupt set-pending bit
      SETPEND7  : NVIC_ISPR_SETPEND7_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND7_Field_0;
      --  inter-integrated circuit 0 interrupt set-pending bit
      SETPEND8  : NVIC_ISPR_SETPEND8_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND8_Field_0;
      --  inter-integrated circuit 1 interrupt set-pending bit
      SETPEND9  : NVIC_ISPR_SETPEND9_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND9_Field_0;
      --  serial peripheral interface 0 interrupt set-pending bit
      SETPEND10 : NVIC_ISPR_SETPEND10_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND10_Field_0;
      --  serial peripheral interface 1 interrupt set-pending bit
      SETPEND11 : NVIC_ISPR_SETPEND11_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND11_Field_0;
      --  UART0 status and error interrupt set-pending bit
      SETPEND12 : NVIC_ISPR_SETPEND12_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND12_Field_0;
      --  UART1 status and error interrupt set-pending bit
      SETPEND13 : NVIC_ISPR_SETPEND13_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND13_Field_0;
      --  UART2 status and error interrupt set-pending bit
      SETPEND14 : NVIC_ISPR_SETPEND14_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND14_Field_0;
      --  Analog-to-digital converter 0 interrupt set-pending bit
      SETPEND15 : NVIC_ISPR_SETPEND15_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND15_Field_0;
      --  Comparator 0 interrupt set-pending bit
      SETPEND16 : NVIC_ISPR_SETPEND16_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND16_Field_0;
      --  Timer PWM module 0 interrupt set-pending bit
      SETPEND17 : NVIC_ISPR_SETPEND17_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND17_Field_0;
      --  Timer PWM module 1 interrupt set-pending bit
      SETPEND18 : NVIC_ISPR_SETPEND18_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND18_Field_0;
      --  Timer PWM module 2 interrupt set-pending bit
      SETPEND19 : NVIC_ISPR_SETPEND19_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND19_Field_0;
      --  real time clock alarm interrupt set-pending bit
      SETPEND20 : NVIC_ISPR_SETPEND20_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND20_Field_0;
      --  real time clock seconds interrupt set-pending bit
      SETPEND21 : NVIC_ISPR_SETPEND21_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND21_Field_0;
      --  periodic interrupt timer all channels interrupt set-pending bit
      SETPEND22 : NVIC_ISPR_SETPEND22_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND22_Field_0;
      --  integrated interchip sound 0 interrupt set-pending bit
      SETPEND23 : NVIC_ISPR_SETPEND23_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND23_Field_0;
      --  Reserved iv 40 interrupt set-pending bit
      SETPEND24 : NVIC_ISPR_SETPEND24_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND24_Field_0;
      --  digital-to-analog converter 0 interrupt set-pending bit
      SETPEND25 : NVIC_ISPR_SETPEND25_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND25_Field_0;
      --  touch sensing input interrupt set-pending bit
      SETPEND26 : NVIC_ISPR_SETPEND26_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND26_Field_0;
      --  multipurpose clock generator interrupt set-pending bit
      SETPEND27 : NVIC_ISPR_SETPEND27_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND27_Field_0;
      --  Low-Power Timer interrupt set-pending bit
      SETPEND28 : NVIC_ISPR_SETPEND28_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND28_Field_0;
      --  segment LCD interrupt set-pending bit
      SETPEND29 : NVIC_ISPR_SETPEND29_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND29_Field_0;
      --  PORTA pin detect interrupt set-pending bit
      SETPEND30 : NVIC_ISPR_SETPEND30_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND30_Field_0;
      --  PORTC and PORTD pin detect interrupt set-pending bit
      SETPEND31 : NVIC_ISPR_SETPEND31_Field :=
                   NRF_SVD.NVIC.NVIC_ISPR_SETPEND31_Field_0;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_ISPR_Register use record
      SETPEND0  at 0 range 0 .. 0;
      SETPEND1  at 0 range 1 .. 1;
      SETPEND2  at 0 range 2 .. 2;
      SETPEND3  at 0 range 3 .. 3;
      SETPEND4  at 0 range 4 .. 4;
      SETPEND5  at 0 range 5 .. 5;
      SETPEND6  at 0 range 6 .. 6;
      SETPEND7  at 0 range 7 .. 7;
      SETPEND8  at 0 range 8 .. 8;
      SETPEND9  at 0 range 9 .. 9;
      SETPEND10 at 0 range 10 .. 10;
      SETPEND11 at 0 range 11 .. 11;
      SETPEND12 at 0 range 12 .. 12;
      SETPEND13 at 0 range 13 .. 13;
      SETPEND14 at 0 range 14 .. 14;
      SETPEND15 at 0 range 15 .. 15;
      SETPEND16 at 0 range 16 .. 16;
      SETPEND17 at 0 range 17 .. 17;
      SETPEND18 at 0 range 18 .. 18;
      SETPEND19 at 0 range 19 .. 19;
      SETPEND20 at 0 range 20 .. 20;
      SETPEND21 at 0 range 21 .. 21;
      SETPEND22 at 0 range 22 .. 22;
      SETPEND23 at 0 range 23 .. 23;
      SETPEND24 at 0 range 24 .. 24;
      SETPEND25 at 0 range 25 .. 25;
      SETPEND26 at 0 range 26 .. 26;
      SETPEND27 at 0 range 27 .. 27;
      SETPEND28 at 0 range 28 .. 28;
      SETPEND29 at 0 range 29 .. 29;
      SETPEND30 at 0 range 30 .. 30;
      SETPEND31 at 0 range 31 .. 31;
   end record;

   --  INT_DMA0 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND0_Field is
     (
      --  write: no effect; read: INT_DMA0 interrupt is not pending
      NVIC_ICPR_CLRPEND0_Field_0,
      --  write: removes pending state from the INT_DMA0 interrupt; read:
      --  INT_DMA0 interrupt is pending
      NVIC_ICPR_CLRPEND0_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND0_Field use
     (NVIC_ICPR_CLRPEND0_Field_0 => 0,
      NVIC_ICPR_CLRPEND0_Field_1 => 1);

   --  INT_DMA1 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND1_Field is
     (
      --  write: no effect; read: INT_DMA1 interrupt is not pending
      NVIC_ICPR_CLRPEND1_Field_0,
      --  write: removes pending state from the INT_DMA1 interrupt; read:
      --  INT_DMA1 interrupt is pending
      NVIC_ICPR_CLRPEND1_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND1_Field use
     (NVIC_ICPR_CLRPEND1_Field_0 => 0,
      NVIC_ICPR_CLRPEND1_Field_1 => 1);

   --  INT_DMA2 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND2_Field is
     (
      --  write: no effect; read: INT_DMA2 interrupt is not pending
      NVIC_ICPR_CLRPEND2_Field_0,
      --  write: removes pending state from the INT_DMA2 interrupt; read:
      --  INT_DMA2 interrupt is pending
      NVIC_ICPR_CLRPEND2_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND2_Field use
     (NVIC_ICPR_CLRPEND2_Field_0 => 0,
      NVIC_ICPR_CLRPEND2_Field_1 => 1);

   --  INT_DMA3 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND3_Field is
     (
      --  write: no effect; read: INT_DMA3 interrupt is not pending
      NVIC_ICPR_CLRPEND3_Field_0,
      --  write: removes pending state from the INT_DMA3 interrupt; read:
      --  INT_DMA3 interrupt is pending
      NVIC_ICPR_CLRPEND3_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND3_Field use
     (NVIC_ICPR_CLRPEND3_Field_0 => 0,
      NVIC_ICPR_CLRPEND3_Field_1 => 1);

   --  Reserved iv 20 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND4_Field is
     (
      --  write: no effect; read: Reserved iv 20 interrupt is not pending
      NVIC_ICPR_CLRPEND4_Field_0,
      --  write: removes pending state from the Reserved iv 20 interrupt; read:
      --  Reserved iv 20 interrupt is pending
      NVIC_ICPR_CLRPEND4_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND4_Field use
     (NVIC_ICPR_CLRPEND4_Field_0 => 0,
      NVIC_ICPR_CLRPEND4_Field_1 => 1);

   --  FTFA command complete and read collision interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND5_Field is
     (
      --  write: no effect; read: FTFA command complete and read collision
      --  interrupt is not pending
      NVIC_ICPR_CLRPEND5_Field_0,
      --  write: removes pending state from the FTFA command complete and read
      --  collision interrupt; read: FTFA command complete and read collision
      --  interrupt is pending
      NVIC_ICPR_CLRPEND5_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND5_Field use
     (NVIC_ICPR_CLRPEND5_Field_0 => 0,
      NVIC_ICPR_CLRPEND5_Field_1 => 1);

   --  low-voltage detect and low-voltage warning interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND6_Field is
     (
      --  write: no effect; read: low-voltage detect and low-voltage warning
      --  interrupt is not pending
      NVIC_ICPR_CLRPEND6_Field_0,
      --  write: removes pending state from the low-voltage detect and
      --  low-voltage warning interrupt; read: low-voltage detect and
      --  low-voltage warning interrupt is pending
      NVIC_ICPR_CLRPEND6_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND6_Field use
     (NVIC_ICPR_CLRPEND6_Field_0 => 0,
      NVIC_ICPR_CLRPEND6_Field_1 => 1);

   --  low leakage wakeup interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND7_Field is
     (
      --  write: no effect; read: low leakage wakeup interrupt is not pending
      NVIC_ICPR_CLRPEND7_Field_0,
      --  write: removes pending state from the low leakage wakeup interrupt;
      --  read: low leakage wakeup interrupt is pending
      NVIC_ICPR_CLRPEND7_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND7_Field use
     (NVIC_ICPR_CLRPEND7_Field_0 => 0,
      NVIC_ICPR_CLRPEND7_Field_1 => 1);

   --  inter-integrated circuit 0 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND8_Field is
     (
      --  write: no effect; read: inter-integrated circuit 0 interrupt is not
      --  pending
      NVIC_ICPR_CLRPEND8_Field_0,
      --  write: removes pending state from the inter-integrated circuit 0
      --  interrupt; read: inter-integrated circuit 0 interrupt is pending
      NVIC_ICPR_CLRPEND8_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND8_Field use
     (NVIC_ICPR_CLRPEND8_Field_0 => 0,
      NVIC_ICPR_CLRPEND8_Field_1 => 1);

   --  inter-integrated circuit 1 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND9_Field is
     (
      --  write: no effect; read: inter-integrated circuit 1 interrupt is not
      --  pending
      NVIC_ICPR_CLRPEND9_Field_0,
      --  write: removes pending state from the inter-integrated circuit 1
      --  interrupt; read: inter-integrated circuit 1 interrupt is pending
      NVIC_ICPR_CLRPEND9_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND9_Field use
     (NVIC_ICPR_CLRPEND9_Field_0 => 0,
      NVIC_ICPR_CLRPEND9_Field_1 => 1);

   --  serial peripheral interface 0 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND10_Field is
     (
      --  write: no effect; read: serial peripheral interface 0 interrupt is
      --  not pending
      NVIC_ICPR_CLRPEND10_Field_0,
      --  write: removes pending state from the serial peripheral interface 0
      --  interrupt; read: serial peripheral interface 0 interrupt is pending
      NVIC_ICPR_CLRPEND10_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND10_Field use
     (NVIC_ICPR_CLRPEND10_Field_0 => 0,
      NVIC_ICPR_CLRPEND10_Field_1 => 1);

   --  serial peripheral interface 1 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND11_Field is
     (
      --  write: no effect; read: serial peripheral interface 1 interrupt is
      --  not pending
      NVIC_ICPR_CLRPEND11_Field_0,
      --  write: removes pending state from the serial peripheral interface 1
      --  interrupt; read: serial peripheral interface 1 interrupt is pending
      NVIC_ICPR_CLRPEND11_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND11_Field use
     (NVIC_ICPR_CLRPEND11_Field_0 => 0,
      NVIC_ICPR_CLRPEND11_Field_1 => 1);

   --  UART0 status and error interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND12_Field is
     (
      --  write: no effect; read: UART0 status and error interrupt is not
      --  pending
      NVIC_ICPR_CLRPEND12_Field_0,
      --  write: removes pending state from the UART0 status and error
      --  interrupt; read: UART0 status and error interrupt is pending
      NVIC_ICPR_CLRPEND12_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND12_Field use
     (NVIC_ICPR_CLRPEND12_Field_0 => 0,
      NVIC_ICPR_CLRPEND12_Field_1 => 1);

   --  UART1 status and error interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND13_Field is
     (
      --  write: no effect; read: UART1 status and error interrupt is not
      --  pending
      NVIC_ICPR_CLRPEND13_Field_0,
      --  write: removes pending state from the UART1 status and error
      --  interrupt; read: UART1 status and error interrupt is pending
      NVIC_ICPR_CLRPEND13_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND13_Field use
     (NVIC_ICPR_CLRPEND13_Field_0 => 0,
      NVIC_ICPR_CLRPEND13_Field_1 => 1);

   --  UART2 status and error interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND14_Field is
     (
      --  write: no effect; read: UART2 status and error interrupt is not
      --  pending
      NVIC_ICPR_CLRPEND14_Field_0,
      --  write: removes pending state from the UART2 status and error
      --  interrupt; read: UART2 status and error interrupt is pending
      NVIC_ICPR_CLRPEND14_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND14_Field use
     (NVIC_ICPR_CLRPEND14_Field_0 => 0,
      NVIC_ICPR_CLRPEND14_Field_1 => 1);

   --  Analog-to-digital converter 0 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND15_Field is
     (
      --  write: no effect; read: Analog-to-digital converter 0 interrupt is
      --  not pending
      NVIC_ICPR_CLRPEND15_Field_0,
      --  write: removes pending state from the Analog-to-digital converter 0
      --  interrupt; read: Analog-to-digital converter 0 interrupt is pending
      NVIC_ICPR_CLRPEND15_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND15_Field use
     (NVIC_ICPR_CLRPEND15_Field_0 => 0,
      NVIC_ICPR_CLRPEND15_Field_1 => 1);

   --  Comparator 0 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND16_Field is
     (
      --  write: no effect; read: Comparator 0 interrupt is not pending
      NVIC_ICPR_CLRPEND16_Field_0,
      --  write: removes pending state from the Comparator 0 interrupt; read:
      --  Comparator 0 interrupt is pending
      NVIC_ICPR_CLRPEND16_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND16_Field use
     (NVIC_ICPR_CLRPEND16_Field_0 => 0,
      NVIC_ICPR_CLRPEND16_Field_1 => 1);

   --  Timer PWM module 0 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND17_Field is
     (
      --  write: no effect; read: Timer PWM module 0 interrupt is not pending
      NVIC_ICPR_CLRPEND17_Field_0,
      --  write: removes pending state from the Timer PWM module 0 interrupt;
      --  read: Timer PWM module 0 interrupt is pending
      NVIC_ICPR_CLRPEND17_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND17_Field use
     (NVIC_ICPR_CLRPEND17_Field_0 => 0,
      NVIC_ICPR_CLRPEND17_Field_1 => 1);

   --  Timer PWM module 1 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND18_Field is
     (
      --  write: no effect; read: Timer PWM module 1 interrupt is not pending
      NVIC_ICPR_CLRPEND18_Field_0,
      --  write: removes pending state from the Timer PWM module 1 interrupt;
      --  read: Timer PWM module 1 interrupt is pending
      NVIC_ICPR_CLRPEND18_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND18_Field use
     (NVIC_ICPR_CLRPEND18_Field_0 => 0,
      NVIC_ICPR_CLRPEND18_Field_1 => 1);

   --  Timer PWM module 2 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND19_Field is
     (
      --  write: no effect; read: Timer PWM module 2 interrupt is not pending
      NVIC_ICPR_CLRPEND19_Field_0,
      --  write: removes pending state from the Timer PWM module 2 interrupt;
      --  read: Timer PWM module 2 interrupt is pending
      NVIC_ICPR_CLRPEND19_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND19_Field use
     (NVIC_ICPR_CLRPEND19_Field_0 => 0,
      NVIC_ICPR_CLRPEND19_Field_1 => 1);

   --  real time clock alarm interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND20_Field is
     (
      --  write: no effect; read: real time clock alarm interrupt is not
      --  pending
      NVIC_ICPR_CLRPEND20_Field_0,
      --  write: removes pending state from the real time clock alarm
      --  interrupt; read: real time clock alarm interrupt is pending
      NVIC_ICPR_CLRPEND20_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND20_Field use
     (NVIC_ICPR_CLRPEND20_Field_0 => 0,
      NVIC_ICPR_CLRPEND20_Field_1 => 1);

   --  real time clock seconds interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND21_Field is
     (
      --  write: no effect; read: real time clock seconds interrupt is not
      --  pending
      NVIC_ICPR_CLRPEND21_Field_0,
      --  write: removes pending state from the real time clock seconds
      --  interrupt; read: real time clock seconds interrupt is pending
      NVIC_ICPR_CLRPEND21_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND21_Field use
     (NVIC_ICPR_CLRPEND21_Field_0 => 0,
      NVIC_ICPR_CLRPEND21_Field_1 => 1);

   --  periodic interrupt timer all channels interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND22_Field is
     (
      --  write: no effect; read: periodic interrupt timer all channels
      --  interrupt is not pending
      NVIC_ICPR_CLRPEND22_Field_0,
      --  write: removes pending state from the periodic interrupt timer all
      --  channels interrupt; read: periodic interrupt timer all channels
      --  interrupt is pending
      NVIC_ICPR_CLRPEND22_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND22_Field use
     (NVIC_ICPR_CLRPEND22_Field_0 => 0,
      NVIC_ICPR_CLRPEND22_Field_1 => 1);

   --  integrated interchip sound 0 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND23_Field is
     (
      --  write: no effect; read: integrated interchip sound 0 interrupt is not
      --  pending
      NVIC_ICPR_CLRPEND23_Field_0,
      --  write: removes pending state from the integrated interchip sound 0
      --  interrupt; read: integrated interchip sound 0 interrupt is pending
      NVIC_ICPR_CLRPEND23_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND23_Field use
     (NVIC_ICPR_CLRPEND23_Field_0 => 0,
      NVIC_ICPR_CLRPEND23_Field_1 => 1);

   --  Reserved iv 40 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND24_Field is
     (
      --  write: no effect; read: Reserved iv 40 interrupt is not pending
      NVIC_ICPR_CLRPEND24_Field_0,
      --  write: removes pending state from the Reserved iv 40 interrupt; read:
      --  Reserved iv 40 interrupt is pending
      NVIC_ICPR_CLRPEND24_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND24_Field use
     (NVIC_ICPR_CLRPEND24_Field_0 => 0,
      NVIC_ICPR_CLRPEND24_Field_1 => 1);

   --  digital-to-analog converter 0 interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND25_Field is
     (
      --  write: no effect; read: digital-to-analog converter 0 interrupt is
      --  not pending
      NVIC_ICPR_CLRPEND25_Field_0,
      --  write: removes pending state from the digital-to-analog converter 0
      --  interrupt; read: digital-to-analog converter 0 interrupt is pending
      NVIC_ICPR_CLRPEND25_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND25_Field use
     (NVIC_ICPR_CLRPEND25_Field_0 => 0,
      NVIC_ICPR_CLRPEND25_Field_1 => 1);

   --  touch sensing input interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND26_Field is
     (
      --  write: no effect; read: touch sensing input interrupt is not pending
      NVIC_ICPR_CLRPEND26_Field_0,
      --  write: removes pending state from the touch sensing input interrupt;
      --  read: touch sensing input interrupt is pending
      NVIC_ICPR_CLRPEND26_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND26_Field use
     (NVIC_ICPR_CLRPEND26_Field_0 => 0,
      NVIC_ICPR_CLRPEND26_Field_1 => 1);

   --  multipurpose clock generator interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND27_Field is
     (
      --  write: no effect; read: multipurpose clock generator interrupt is not
      --  pending
      NVIC_ICPR_CLRPEND27_Field_0,
      --  write: removes pending state from the multipurpose clock generator
      --  interrupt; read: multipurpose clock generator interrupt is pending
      NVIC_ICPR_CLRPEND27_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND27_Field use
     (NVIC_ICPR_CLRPEND27_Field_0 => 0,
      NVIC_ICPR_CLRPEND27_Field_1 => 1);

   --  Low-Power Timer interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND28_Field is
     (
      --  write: no effect; read: Low-Power Timer interrupt is not pending
      NVIC_ICPR_CLRPEND28_Field_0,
      --  write: removes pending state from the Low-Power Timer interrupt;
      --  read: Low-Power Timer interrupt is pending
      NVIC_ICPR_CLRPEND28_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND28_Field use
     (NVIC_ICPR_CLRPEND28_Field_0 => 0,
      NVIC_ICPR_CLRPEND28_Field_1 => 1);

   --  segment LCD interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND29_Field is
     (
      --  write: no effect; read: segment LCD interrupt is not pending
      NVIC_ICPR_CLRPEND29_Field_0,
      --  write: removes pending state from the segment LCD interrupt; read:
      --  segment LCD interrupt is pending
      NVIC_ICPR_CLRPEND29_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND29_Field use
     (NVIC_ICPR_CLRPEND29_Field_0 => 0,
      NVIC_ICPR_CLRPEND29_Field_1 => 1);

   --  PORTA pin detect interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND30_Field is
     (
      --  write: no effect; read: PORTA pin detect interrupt is not pending
      NVIC_ICPR_CLRPEND30_Field_0,
      --  write: removes pending state from the PORTA pin detect interrupt;
      --  read: PORTA pin detect interrupt is pending
      NVIC_ICPR_CLRPEND30_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND30_Field use
     (NVIC_ICPR_CLRPEND30_Field_0 => 0,
      NVIC_ICPR_CLRPEND30_Field_1 => 1);

   --  PORTC and PORTD pin detect interrupt clear-pending bit
   type NVIC_ICPR_CLRPEND31_Field is
     (
      --  write: no effect; read: PORTC and PORTD pin detect interrupt is not
      --  pending
      NVIC_ICPR_CLRPEND31_Field_0,
      --  write: removes pending state from the PORTC and PORTD pin detect
      --  interrupt; read: PORTC and PORTD pin detect interrupt is pending
      NVIC_ICPR_CLRPEND31_Field_1)
     with Size => 1;
   for NVIC_ICPR_CLRPEND31_Field use
     (NVIC_ICPR_CLRPEND31_Field_0 => 0,
      NVIC_ICPR_CLRPEND31_Field_1 => 1);

   --  Interrupt Clear Pending Register
   type NVIC_ICPR_Register is record
      --  INT_DMA0 interrupt clear-pending bit
      CLRPEND0  : NVIC_ICPR_CLRPEND0_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND0_Field_0;
      --  INT_DMA1 interrupt clear-pending bit
      CLRPEND1  : NVIC_ICPR_CLRPEND1_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND1_Field_0;
      --  INT_DMA2 interrupt clear-pending bit
      CLRPEND2  : NVIC_ICPR_CLRPEND2_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND2_Field_0;
      --  INT_DMA3 interrupt clear-pending bit
      CLRPEND3  : NVIC_ICPR_CLRPEND3_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND3_Field_0;
      --  Reserved iv 20 interrupt clear-pending bit
      CLRPEND4  : NVIC_ICPR_CLRPEND4_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND4_Field_0;
      --  FTFA command complete and read collision interrupt clear-pending bit
      CLRPEND5  : NVIC_ICPR_CLRPEND5_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND5_Field_0;
      --  low-voltage detect and low-voltage warning interrupt clear-pending
      --  bit
      CLRPEND6  : NVIC_ICPR_CLRPEND6_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND6_Field_0;
      --  low leakage wakeup interrupt clear-pending bit
      CLRPEND7  : NVIC_ICPR_CLRPEND7_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND7_Field_0;
      --  inter-integrated circuit 0 interrupt clear-pending bit
      CLRPEND8  : NVIC_ICPR_CLRPEND8_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND8_Field_0;
      --  inter-integrated circuit 1 interrupt clear-pending bit
      CLRPEND9  : NVIC_ICPR_CLRPEND9_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND9_Field_0;
      --  serial peripheral interface 0 interrupt clear-pending bit
      CLRPEND10 : NVIC_ICPR_CLRPEND10_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND10_Field_0;
      --  serial peripheral interface 1 interrupt clear-pending bit
      CLRPEND11 : NVIC_ICPR_CLRPEND11_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND11_Field_0;
      --  UART0 status and error interrupt clear-pending bit
      CLRPEND12 : NVIC_ICPR_CLRPEND12_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND12_Field_0;
      --  UART1 status and error interrupt clear-pending bit
      CLRPEND13 : NVIC_ICPR_CLRPEND13_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND13_Field_0;
      --  UART2 status and error interrupt clear-pending bit
      CLRPEND14 : NVIC_ICPR_CLRPEND14_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND14_Field_0;
      --  Analog-to-digital converter 0 interrupt clear-pending bit
      CLRPEND15 : NVIC_ICPR_CLRPEND15_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND15_Field_0;
      --  Comparator 0 interrupt clear-pending bit
      CLRPEND16 : NVIC_ICPR_CLRPEND16_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND16_Field_0;
      --  Timer PWM module 0 interrupt clear-pending bit
      CLRPEND17 : NVIC_ICPR_CLRPEND17_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND17_Field_0;
      --  Timer PWM module 1 interrupt clear-pending bit
      CLRPEND18 : NVIC_ICPR_CLRPEND18_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND18_Field_0;
      --  Timer PWM module 2 interrupt clear-pending bit
      CLRPEND19 : NVIC_ICPR_CLRPEND19_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND19_Field_0;
      --  real time clock alarm interrupt clear-pending bit
      CLRPEND20 : NVIC_ICPR_CLRPEND20_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND20_Field_0;
      --  real time clock seconds interrupt clear-pending bit
      CLRPEND21 : NVIC_ICPR_CLRPEND21_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND21_Field_0;
      --  periodic interrupt timer all channels interrupt clear-pending bit
      CLRPEND22 : NVIC_ICPR_CLRPEND22_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND22_Field_0;
      --  integrated interchip sound 0 interrupt clear-pending bit
      CLRPEND23 : NVIC_ICPR_CLRPEND23_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND23_Field_0;
      --  Reserved iv 40 interrupt clear-pending bit
      CLRPEND24 : NVIC_ICPR_CLRPEND24_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND24_Field_0;
      --  digital-to-analog converter 0 interrupt clear-pending bit
      CLRPEND25 : NVIC_ICPR_CLRPEND25_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND25_Field_0;
      --  touch sensing input interrupt clear-pending bit
      CLRPEND26 : NVIC_ICPR_CLRPEND26_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND26_Field_0;
      --  multipurpose clock generator interrupt clear-pending bit
      CLRPEND27 : NVIC_ICPR_CLRPEND27_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND27_Field_0;
      --  Low-Power Timer interrupt clear-pending bit
      CLRPEND28 : NVIC_ICPR_CLRPEND28_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND28_Field_0;
      --  segment LCD interrupt clear-pending bit
      CLRPEND29 : NVIC_ICPR_CLRPEND29_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND29_Field_0;
      --  PORTA pin detect interrupt clear-pending bit
      CLRPEND30 : NVIC_ICPR_CLRPEND30_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND30_Field_0;
      --  PORTC and PORTD pin detect interrupt clear-pending bit
      CLRPEND31 : NVIC_ICPR_CLRPEND31_Field :=
                   NRF_SVD.NVIC.NVIC_ICPR_CLRPEND31_Field_0;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_ICPR_Register use record
      CLRPEND0  at 0 range 0 .. 0;
      CLRPEND1  at 0 range 1 .. 1;
      CLRPEND2  at 0 range 2 .. 2;
      CLRPEND3  at 0 range 3 .. 3;
      CLRPEND4  at 0 range 4 .. 4;
      CLRPEND5  at 0 range 5 .. 5;
      CLRPEND6  at 0 range 6 .. 6;
      CLRPEND7  at 0 range 7 .. 7;
      CLRPEND8  at 0 range 8 .. 8;
      CLRPEND9  at 0 range 9 .. 9;
      CLRPEND10 at 0 range 10 .. 10;
      CLRPEND11 at 0 range 11 .. 11;
      CLRPEND12 at 0 range 12 .. 12;
      CLRPEND13 at 0 range 13 .. 13;
      CLRPEND14 at 0 range 14 .. 14;
      CLRPEND15 at 0 range 15 .. 15;
      CLRPEND16 at 0 range 16 .. 16;
      CLRPEND17 at 0 range 17 .. 17;
      CLRPEND18 at 0 range 18 .. 18;
      CLRPEND19 at 0 range 19 .. 19;
      CLRPEND20 at 0 range 20 .. 20;
      CLRPEND21 at 0 range 21 .. 21;
      CLRPEND22 at 0 range 22 .. 22;
      CLRPEND23 at 0 range 23 .. 23;
      CLRPEND24 at 0 range 24 .. 24;
      CLRPEND25 at 0 range 25 .. 25;
      CLRPEND26 at 0 range 26 .. 26;
      CLRPEND27 at 0 range 27 .. 27;
      CLRPEND28 at 0 range 28 .. 28;
      CLRPEND29 at 0 range 29 .. 29;
      CLRPEND30 at 0 range 30 .. 30;
      CLRPEND31 at 0 range 31 .. 31;
   end record;

   subtype NVIC_IPR0_PRI_0_Field is HAL.UInt8;
   subtype NVIC_IPR0_PRI_1_Field is HAL.UInt8;
   subtype NVIC_IPR0_PRI_2_Field is HAL.UInt8;
   subtype NVIC_IPR0_PRI_3_Field is HAL.UInt8;

   --  Interrupt Priority Register 0
   type NVIC_IPR0_Register is record
      --  Priority of the INT_DMA0 interrupt
      PRI_0 : NVIC_IPR0_PRI_0_Field := 16#0#;
      --  Priority of the INT_DMA1 interrupt
      PRI_1 : NVIC_IPR0_PRI_1_Field := 16#0#;
      --  Priority of the INT_DMA2 interrupt
      PRI_2 : NVIC_IPR0_PRI_2_Field := 16#0#;
      --  Priority of the INT_DMA3 interrupt
      PRI_3 : NVIC_IPR0_PRI_3_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR0_Register use record
      PRI_0 at 0 range 0 .. 7;
      PRI_1 at 0 range 8 .. 15;
      PRI_2 at 0 range 16 .. 23;
      PRI_3 at 0 range 24 .. 31;
   end record;

   subtype NVIC_IPR1_PRI_4_Field is HAL.UInt8;
   subtype NVIC_IPR1_PRI_5_Field is HAL.UInt8;
   subtype NVIC_IPR1_PRI_6_Field is HAL.UInt8;
   subtype NVIC_IPR1_PRI_7_Field is HAL.UInt8;

   --  Interrupt Priority Register 1
   type NVIC_IPR1_Register is record
      --  Priority of the Reserved iv 20 interrupt
      PRI_4 : NVIC_IPR1_PRI_4_Field := 16#0#;
      --  Priority of the FTFA command complete and read collision interrupt
      PRI_5 : NVIC_IPR1_PRI_5_Field := 16#0#;
      --  Priority of the low-voltage detect and low-voltage warning interrupt
      PRI_6 : NVIC_IPR1_PRI_6_Field := 16#0#;
      --  Priority of the low leakage wakeup interrupt
      PRI_7 : NVIC_IPR1_PRI_7_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR1_Register use record
      PRI_4 at 0 range 0 .. 7;
      PRI_5 at 0 range 8 .. 15;
      PRI_6 at 0 range 16 .. 23;
      PRI_7 at 0 range 24 .. 31;
   end record;

   subtype NVIC_IPR2_PRI_8_Field is HAL.UInt8;
   subtype NVIC_IPR2_PRI_9_Field is HAL.UInt8;
   subtype NVIC_IPR2_PRI_10_Field is HAL.UInt8;
   subtype NVIC_IPR2_PRI_11_Field is HAL.UInt8;

   --  Interrupt Priority Register 2
   type NVIC_IPR2_Register is record
      --  Priority of the inter-integrated circuit 0 interrupt
      PRI_8  : NVIC_IPR2_PRI_8_Field := 16#0#;
      --  Priority of the inter-integrated circuit 1 interrupt
      PRI_9  : NVIC_IPR2_PRI_9_Field := 16#0#;
      --  Priority of the serial peripheral interface 0 interrupt
      PRI_10 : NVIC_IPR2_PRI_10_Field := 16#0#;
      --  Priority of the serial peripheral interface 1 interrupt
      PRI_11 : NVIC_IPR2_PRI_11_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR2_Register use record
      PRI_8  at 0 range 0 .. 7;
      PRI_9  at 0 range 8 .. 15;
      PRI_10 at 0 range 16 .. 23;
      PRI_11 at 0 range 24 .. 31;
   end record;

   subtype NVIC_IPR3_PRI_12_Field is HAL.UInt8;
   subtype NVIC_IPR3_PRI_13_Field is HAL.UInt8;
   subtype NVIC_IPR3_PRI_14_Field is HAL.UInt8;
   subtype NVIC_IPR3_PRI_15_Field is HAL.UInt8;

   --  Interrupt Priority Register 3
   type NVIC_IPR3_Register is record
      --  Priority of the UART0 status and error interrupt
      PRI_12 : NVIC_IPR3_PRI_12_Field := 16#0#;
      --  Priority of the UART1 status and error interrupt
      PRI_13 : NVIC_IPR3_PRI_13_Field := 16#0#;
      --  Priority of the UART2 status and error interrupt
      PRI_14 : NVIC_IPR3_PRI_14_Field := 16#0#;
      --  Priority of the Analog-to-digital converter 0 interrupt
      PRI_15 : NVIC_IPR3_PRI_15_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR3_Register use record
      PRI_12 at 0 range 0 .. 7;
      PRI_13 at 0 range 8 .. 15;
      PRI_14 at 0 range 16 .. 23;
      PRI_15 at 0 range 24 .. 31;
   end record;

   subtype NVIC_IPR4_PRI_16_Field is HAL.UInt8;
   subtype NVIC_IPR4_PRI_17_Field is HAL.UInt8;
   subtype NVIC_IPR4_PRI_18_Field is HAL.UInt8;
   subtype NVIC_IPR4_PRI_19_Field is HAL.UInt8;

   --  Interrupt Priority Register 4
   type NVIC_IPR4_Register is record
      --  Priority of the Comparator 0 interrupt
      PRI_16 : NVIC_IPR4_PRI_16_Field := 16#0#;
      --  Priority of the Timer PWM module 0 interrupt
      PRI_17 : NVIC_IPR4_PRI_17_Field := 16#0#;
      --  Priority of the Timer PWM module 1 interrupt
      PRI_18 : NVIC_IPR4_PRI_18_Field := 16#0#;
      --  Priority of the Timer PWM module 2 interrupt
      PRI_19 : NVIC_IPR4_PRI_19_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR4_Register use record
      PRI_16 at 0 range 0 .. 7;
      PRI_17 at 0 range 8 .. 15;
      PRI_18 at 0 range 16 .. 23;
      PRI_19 at 0 range 24 .. 31;
   end record;

   subtype NVIC_IPR5_PRI_20_Field is HAL.UInt8;
   subtype NVIC_IPR5_PRI_21_Field is HAL.UInt8;
   subtype NVIC_IPR5_PRI_22_Field is HAL.UInt8;
   subtype NVIC_IPR5_PRI_23_Field is HAL.UInt8;

   --  Interrupt Priority Register 5
   type NVIC_IPR5_Register is record
      --  Priority of the real time clock alarm interrupt
      PRI_20 : NVIC_IPR5_PRI_20_Field := 16#0#;
      --  Priority of the real time clock seconds interrupt
      PRI_21 : NVIC_IPR5_PRI_21_Field := 16#0#;
      --  Priority of the periodic interrupt timer all channels interrupt
      PRI_22 : NVIC_IPR5_PRI_22_Field := 16#0#;
      --  Priority of the integrated interchip sound 0 interrupt
      PRI_23 : NVIC_IPR5_PRI_23_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR5_Register use record
      PRI_20 at 0 range 0 .. 7;
      PRI_21 at 0 range 8 .. 15;
      PRI_22 at 0 range 16 .. 23;
      PRI_23 at 0 range 24 .. 31;
   end record;

   subtype NVIC_IPR6_PRI_24_Field is HAL.UInt8;
   subtype NVIC_IPR6_PRI_25_Field is HAL.UInt8;
   subtype NVIC_IPR6_PRI_26_Field is HAL.UInt8;
   subtype NVIC_IPR6_PRI_27_Field is HAL.UInt8;

   --  Interrupt Priority Register 6
   type NVIC_IPR6_Register is record
      --  Priority of the Reserved iv 40 interrupt
      PRI_24 : NVIC_IPR6_PRI_24_Field := 16#0#;
      --  Priority of the digital-to-analog converter 0 interrupt
      PRI_25 : NVIC_IPR6_PRI_25_Field := 16#0#;
      --  Priority of the touch sensing input interrupt
      PRI_26 : NVIC_IPR6_PRI_26_Field := 16#0#;
      --  Priority of the multipurpose clock generator interrupt
      PRI_27 : NVIC_IPR6_PRI_27_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR6_Register use record
      PRI_24 at 0 range 0 .. 7;
      PRI_25 at 0 range 8 .. 15;
      PRI_26 at 0 range 16 .. 23;
      PRI_27 at 0 range 24 .. 31;
   end record;

   subtype NVIC_IPR7_PRI_28_Field is HAL.UInt8;
   subtype NVIC_IPR7_PRI_29_Field is HAL.UInt8;
   subtype NVIC_IPR7_PRI_30_Field is HAL.UInt8;
   subtype NVIC_IPR7_PRI_31_Field is HAL.UInt8;

   --  Interrupt Priority Register 7
   type NVIC_IPR7_Register is record
      --  Priority of the Low-Power Timer interrupt
      PRI_28 : NVIC_IPR7_PRI_28_Field := 16#0#;
      --  Priority of the segment LCD interrupt
      PRI_29 : NVIC_IPR7_PRI_29_Field := 16#0#;
      --  Priority of the PORTA pin detect interrupt
      PRI_30 : NVIC_IPR7_PRI_30_Field := 16#0#;
      --  Priority of the PORTC and PORTD pin detect interrupt
      PRI_31 : NVIC_IPR7_PRI_31_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR7_Register use record
      PRI_28 at 0 range 0 .. 7;
      PRI_29 at 0 range 8 .. 15;
      PRI_30 at 0 range 16 .. 23;
      PRI_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Nested Vectored Interrupt Controller
   type NVIC_Peripheral is record
      --  Interrupt Set Enable Register
      NVIC_ISER : aliased NVIC_ISER_Register;
      --  Interrupt Clear Enable Register
      NVIC_ICER : aliased NVIC_ICER_Register;
      --  Interrupt Set Pending Register
      NVIC_ISPR : aliased NVIC_ISPR_Register;
      --  Interrupt Clear Pending Register
      NVIC_ICPR : aliased NVIC_ICPR_Register;
      --  Interrupt Priority Register 0
      NVIC_IPR0 : aliased NVIC_IPR0_Register;
      --  Interrupt Priority Register 1
      NVIC_IPR1 : aliased NVIC_IPR1_Register;
      --  Interrupt Priority Register 2
      NVIC_IPR2 : aliased NVIC_IPR2_Register;
      --  Interrupt Priority Register 3
      NVIC_IPR3 : aliased NVIC_IPR3_Register;
      --  Interrupt Priority Register 4
      NVIC_IPR4 : aliased NVIC_IPR4_Register;
      --  Interrupt Priority Register 5
      NVIC_IPR5 : aliased NVIC_IPR5_Register;
      --  Interrupt Priority Register 6
      NVIC_IPR6 : aliased NVIC_IPR6_Register;
      --  Interrupt Priority Register 7
      NVIC_IPR7 : aliased NVIC_IPR7_Register;
   end record
     with Volatile;

   for NVIC_Peripheral use record
      NVIC_ISER at 16#0# range 0 .. 31;
      NVIC_ICER at 16#80# range 0 .. 31;
      NVIC_ISPR at 16#100# range 0 .. 31;
      NVIC_ICPR at 16#180# range 0 .. 31;
      NVIC_IPR0 at 16#300# range 0 .. 31;
      NVIC_IPR1 at 16#304# range 0 .. 31;
      NVIC_IPR2 at 16#308# range 0 .. 31;
      NVIC_IPR3 at 16#30C# range 0 .. 31;
      NVIC_IPR4 at 16#310# range 0 .. 31;
      NVIC_IPR5 at 16#314# range 0 .. 31;
      NVIC_IPR6 at 16#318# range 0 .. 31;
      NVIC_IPR7 at 16#31C# range 0 .. 31;
   end record;

   --  Nested Vectored Interrupt Controller
   NVIC_Periph : aliased NVIC_Peripheral
     with Import, Address => NVIC_Base;

end NRF_SVD.NVIC;
