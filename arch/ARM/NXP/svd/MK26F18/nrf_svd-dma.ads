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

--  This spec has been automatically generated from MK26F18.xml

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

--  Enhanced direct memory access controller
package NRF_SVD.DMA is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Enable Debug
   type CR_EDBG_Field is
     (
      --  When in debug mode, the DMA continues to operate.
      CR_EDBG_Field_0,
      --  When in debug mode, the DMA stalls the start of a new channel.
      --  Executing channels are allowed to complete. Channel execution resumes
      --  when the system exits debug mode or the EDBG bit is cleared.
      CR_EDBG_Field_1)
     with Size => 1;
   for CR_EDBG_Field use
     (CR_EDBG_Field_0 => 0,
      CR_EDBG_Field_1 => 1);

   --  Enable Round Robin Channel Arbitration
   type CR_ERCA_Field is
     (
      --  Fixed priority arbitration is used for channel selection within each
      --  group.
      CR_ERCA_Field_0,
      --  Round robin arbitration is used for channel selection within each
      --  group.
      CR_ERCA_Field_1)
     with Size => 1;
   for CR_ERCA_Field use
     (CR_ERCA_Field_0 => 0,
      CR_ERCA_Field_1 => 1);

   --  Enable Round Robin Group Arbitration
   type CR_ERGA_Field is
     (
      --  Fixed priority arbitration is used for selection among the groups.
      CR_ERGA_Field_0,
      --  Round robin arbitration is used for selection among the groups.
      CR_ERGA_Field_1)
     with Size => 1;
   for CR_ERGA_Field use
     (CR_ERGA_Field_0 => 0,
      CR_ERGA_Field_1 => 1);

   --  Halt On Error
   type CR_HOE_Field is
     (
      --  Normal operation
      CR_HOE_Field_0,
      --  Any error causes the HALT bit to set. Subsequently, all service
      --  requests are ignored until the HALT bit is cleared.
      CR_HOE_Field_1)
     with Size => 1;
   for CR_HOE_Field use
     (CR_HOE_Field_0 => 0,
      CR_HOE_Field_1 => 1);

   --  Halt DMA Operations
   type CR_HALT_Field is
     (
      --  Normal operation
      CR_HALT_Field_0,
      --  Stall the start of any new channels. Executing channels are allowed
      --  to complete. Channel execution resumes when this bit is cleared.
      CR_HALT_Field_1)
     with Size => 1;
   for CR_HALT_Field use
     (CR_HALT_Field_0 => 0,
      CR_HALT_Field_1 => 1);

   --  Continuous Link Mode
   type CR_CLM_Field is
     (
      --  A minor loop channel link made to itself goes through channel
      --  arbitration before being activated again.
      CR_CLM_Field_0,
      --  A minor loop channel link made to itself does not go through channel
      --  arbitration before being activated again. Upon minor loop completion,
      --  the channel activates again if that channel has a minor loop channel
      --  link enabled and the link channel is itself. This effectively applies
      --  the minor loop offsets and restarts the next minor loop.
      CR_CLM_Field_1)
     with Size => 1;
   for CR_CLM_Field use
     (CR_CLM_Field_0 => 0,
      CR_CLM_Field_1 => 1);

   --  Enable Minor Loop Mapping
   type CR_EMLM_Field is
     (
      --  Disabled. TCDn.word2 is defined as a 32-bit NBYTES field.
      CR_EMLM_Field_0,
      --  Enabled. TCDn.word2 is redefined to include individual enable fields,
      --  an offset field, and the NBYTES field. The individual enable fields
      --  allow the minor loop offset to be applied to the source address, the
      --  destination address, or both. The NBYTES field is reduced when either
      --  offset is enabled.
      CR_EMLM_Field_1)
     with Size => 1;
   for CR_EMLM_Field use
     (CR_EMLM_Field_0 => 0,
      CR_EMLM_Field_1 => 1);

   --  Error Cancel Transfer
   type CR_ECX_Field is
     (
      --  Normal operation
      CR_ECX_Field_0,
      --  Cancel the remaining data transfer in the same fashion as the CX bit.
      --  Stop the executing channel and force the minor loop to finish. The
      --  cancel takes effect after the last write of the current read/write
      --  sequence. The ECX bit clears itself after the cancel is honored. In
      --  addition to cancelling the transfer, ECX treats the cancel as an
      --  error condition, thus updating the Error Status register (DMAx_ES)
      --  and generating an optional error interrupt.
      CR_ECX_Field_1)
     with Size => 1;
   for CR_ECX_Field use
     (CR_ECX_Field_0 => 0,
      CR_ECX_Field_1 => 1);

   --  Cancel Transfer
   type CR_CX_Field is
     (
      --  Normal operation
      CR_CX_Field_0,
      --  Cancel the remaining data transfer. Stop the executing channel and
      --  force the minor loop to finish. The cancel takes effect after the
      --  last write of the current read/write sequence. The CX bit clears
      --  itself after the cancel has been honored. This cancel retires the
      --  channel normally as if the minor loop was completed.
      CR_CX_Field_1)
     with Size => 1;
   for CR_CX_Field use
     (CR_CX_Field_0 => 0,
      CR_CX_Field_1 => 1);

   --  Control Register
   type DMA_CR_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      --  Enable Debug
      EDBG           : CR_EDBG_Field := NRF_SVD.DMA.CR_EDBG_Field_0;
      --  Enable Round Robin Channel Arbitration
      ERCA           : CR_ERCA_Field := NRF_SVD.DMA.CR_ERCA_Field_0;
      --  Enable Round Robin Group Arbitration
      ERGA           : CR_ERGA_Field := NRF_SVD.DMA.CR_ERGA_Field_0;
      --  Halt On Error
      HOE            : CR_HOE_Field := NRF_SVD.DMA.CR_HOE_Field_0;
      --  Halt DMA Operations
      HALT           : CR_HALT_Field := NRF_SVD.DMA.CR_HALT_Field_0;
      --  Continuous Link Mode
      CLM            : CR_CLM_Field := NRF_SVD.DMA.CR_CLM_Field_0;
      --  Enable Minor Loop Mapping
      EMLM           : CR_EMLM_Field := NRF_SVD.DMA.CR_EMLM_Field_0;
      --  Channel Group 0 Priority
      GRP0PRI        : Boolean := False;
      --  unspecified
      Reserved_9_9   : HAL.Bit := 16#0#;
      --  Channel Group 1 Priority
      GRP1PRI        : Boolean := True;
      --  unspecified
      Reserved_11_15 : HAL.UInt5 := 16#0#;
      --  Error Cancel Transfer
      ECX            : CR_ECX_Field := NRF_SVD.DMA.CR_ECX_Field_0;
      --  Cancel Transfer
      CX             : CR_CX_Field := NRF_SVD.DMA.CR_CX_Field_0;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMA_CR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      EDBG           at 0 range 1 .. 1;
      ERCA           at 0 range 2 .. 2;
      ERGA           at 0 range 3 .. 3;
      HOE            at 0 range 4 .. 4;
      HALT           at 0 range 5 .. 5;
      CLM            at 0 range 6 .. 6;
      EMLM           at 0 range 7 .. 7;
      GRP0PRI        at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      GRP1PRI        at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      ECX            at 0 range 16 .. 16;
      CX             at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   --  Destination Bus Error
   type ES_DBE_Field is
     (
      --  No destination bus error
      ES_DBE_Field_0,
      --  The last recorded error was a bus error on a destination write
      ES_DBE_Field_1)
     with Size => 1;
   for ES_DBE_Field use
     (ES_DBE_Field_0 => 0,
      ES_DBE_Field_1 => 1);

   --  Source Bus Error
   type ES_SBE_Field is
     (
      --  No source bus error
      ES_SBE_Field_0,
      --  The last recorded error was a bus error on a source read
      ES_SBE_Field_1)
     with Size => 1;
   for ES_SBE_Field use
     (ES_SBE_Field_0 => 0,
      ES_SBE_Field_1 => 1);

   --  Scatter/Gather Configuration Error
   type ES_SGE_Field is
     (
      --  No scatter/gather configuration error
      ES_SGE_Field_0,
      --  The last recorded error was a configuration error detected in the
      --  TCDn_DLASTSGA field. This field is checked at the beginning of a
      --  scatter/gather operation after major loop completion if TCDn_CSR[ESG]
      --  is enabled. TCDn_DLASTSGA is not on a 32 byte boundary.
      ES_SGE_Field_1)
     with Size => 1;
   for ES_SGE_Field use
     (ES_SGE_Field_0 => 0,
      ES_SGE_Field_1 => 1);

   --  NBYTES/CITER Configuration Error
   type ES_NCE_Field is
     (
      --  No NBYTES/CITER configuration error
      ES_NCE_Field_0,
      --  The last recorded error was a configuration error detected in the
      --  TCDn_NBYTES or TCDn_CITER fields. TCDn_NBYTES is not a multiple of
      --  TCDn_ATTR[SSIZE] and TCDn_ATTR[DSIZE], or TCDn_CITER[CITER] is equal
      --  to zero, or TCDn_CITER[ELINK] is not equal to TCDn_BITER[ELINK]
      ES_NCE_Field_1)
     with Size => 1;
   for ES_NCE_Field use
     (ES_NCE_Field_0 => 0,
      ES_NCE_Field_1 => 1);

   --  Destination Offset Error
   type ES_DOE_Field is
     (
      --  No destination offset configuration error
      ES_DOE_Field_0,
      --  The last recorded error was a configuration error detected in the
      --  TCDn_DOFF field. TCDn_DOFF is inconsistent with TCDn_ATTR[DSIZE].
      ES_DOE_Field_1)
     with Size => 1;
   for ES_DOE_Field use
     (ES_DOE_Field_0 => 0,
      ES_DOE_Field_1 => 1);

   --  Destination Address Error
   type ES_DAE_Field is
     (
      --  No destination address configuration error
      ES_DAE_Field_0,
      --  The last recorded error was a configuration error detected in the
      --  TCDn_DADDR field. TCDn_DADDR is inconsistent with TCDn_ATTR[DSIZE].
      ES_DAE_Field_1)
     with Size => 1;
   for ES_DAE_Field use
     (ES_DAE_Field_0 => 0,
      ES_DAE_Field_1 => 1);

   --  Source Offset Error
   type ES_SOE_Field is
     (
      --  No source offset configuration error
      ES_SOE_Field_0,
      --  The last recorded error was a configuration error detected in the
      --  TCDn_SOFF field. TCDn_SOFF is inconsistent with TCDn_ATTR[SSIZE].
      ES_SOE_Field_1)
     with Size => 1;
   for ES_SOE_Field use
     (ES_SOE_Field_0 => 0,
      ES_SOE_Field_1 => 1);

   --  Source Address Error
   type ES_SAE_Field is
     (
      --  No source address configuration error.
      ES_SAE_Field_0,
      --  The last recorded error was a configuration error detected in the
      --  TCDn_SADDR field. TCDn_SADDR is inconsistent with TCDn_ATTR[SSIZE].
      ES_SAE_Field_1)
     with Size => 1;
   for ES_SAE_Field use
     (ES_SAE_Field_0 => 0,
      ES_SAE_Field_1 => 1);

   subtype DMA_ES_ERRCHN_Field is HAL.UInt5;

   --  Channel Priority Error
   type ES_CPE_Field is
     (
      --  No channel priority error
      ES_CPE_Field_0,
      --  The last recorded error was a configuration error in the channel
      --  priorities within a group. Channel priorities within a group are not
      --  unique.
      ES_CPE_Field_1)
     with Size => 1;
   for ES_CPE_Field use
     (ES_CPE_Field_0 => 0,
      ES_CPE_Field_1 => 1);

   --  Group Priority Error
   type ES_GPE_Field is
     (
      --  No group priority error
      ES_GPE_Field_0,
      --  The last recorded error was a configuration error among the group
      --  priorities. All group priorities are not unique.
      ES_GPE_Field_1)
     with Size => 1;
   for ES_GPE_Field use
     (ES_GPE_Field_0 => 0,
      ES_GPE_Field_1 => 1);

   --  Transfer Canceled
   type ES_ECX_Field is
     (
      --  No canceled transfers
      ES_ECX_Field_0,
      --  The last recorded entry was a canceled transfer by the error cancel
      --  transfer input
      ES_ECX_Field_1)
     with Size => 1;
   for ES_ECX_Field use
     (ES_ECX_Field_0 => 0,
      ES_ECX_Field_1 => 1);

   --  Logical OR of all ERR status bits
   type ES_VLD_Field is
     (
      --  No ERR bits are set.
      ES_VLD_Field_0,
      --  At least one ERR bit is set indicating a valid error exists that has
      --  not been cleared.
      ES_VLD_Field_1)
     with Size => 1;
   for ES_VLD_Field use
     (ES_VLD_Field_0 => 0,
      ES_VLD_Field_1 => 1);

   --  Error Status Register
   type DMA_ES_Register is record
      --  Read-only. Destination Bus Error
      DBE            : ES_DBE_Field;
      --  Read-only. Source Bus Error
      SBE            : ES_SBE_Field;
      --  Read-only. Scatter/Gather Configuration Error
      SGE            : ES_SGE_Field;
      --  Read-only. NBYTES/CITER Configuration Error
      NCE            : ES_NCE_Field;
      --  Read-only. Destination Offset Error
      DOE            : ES_DOE_Field;
      --  Read-only. Destination Address Error
      DAE            : ES_DAE_Field;
      --  Read-only. Source Offset Error
      SOE            : ES_SOE_Field;
      --  Read-only. Source Address Error
      SAE            : ES_SAE_Field;
      --  Read-only. Error Channel Number or Canceled Channel Number
      ERRCHN         : DMA_ES_ERRCHN_Field;
      --  unspecified
      Reserved_13_13 : HAL.Bit;
      --  Read-only. Channel Priority Error
      CPE            : ES_CPE_Field;
      --  Read-only. Group Priority Error
      GPE            : ES_GPE_Field;
      --  Read-only. Transfer Canceled
      ECX            : ES_ECX_Field;
      --  unspecified
      Reserved_17_30 : HAL.UInt14;
      --  Read-only. Logical OR of all ERR status bits
      VLD            : ES_VLD_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMA_ES_Register use record
      DBE            at 0 range 0 .. 0;
      SBE            at 0 range 1 .. 1;
      SGE            at 0 range 2 .. 2;
      NCE            at 0 range 3 .. 3;
      DOE            at 0 range 4 .. 4;
      DAE            at 0 range 5 .. 5;
      SOE            at 0 range 6 .. 6;
      SAE            at 0 range 7 .. 7;
      ERRCHN         at 0 range 8 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      CPE            at 0 range 14 .. 14;
      GPE            at 0 range 15 .. 15;
      ECX            at 0 range 16 .. 16;
      Reserved_17_30 at 0 range 17 .. 30;
      VLD            at 0 range 31 .. 31;
   end record;

   --  Enable DMA Request 0
   type ERQ_ERQ0_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      ERQ_ERQ0_Field_0,
      --  The DMA request signal for the corresponding channel is enabled
      ERQ_ERQ0_Field_1)
     with Size => 1;
   for ERQ_ERQ0_Field use
     (ERQ_ERQ0_Field_0 => 0,
      ERQ_ERQ0_Field_1 => 1);

   --  DMA_ERQ_ERQ array
   type DMA_ERQ_ERQ_Field_Array is array (0 .. 31) of ERQ_ERQ0_Field
     with Component_Size => 1, Size => 32;

   --  Enable Request Register
   type DMA_ERQ_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ERQ as a value
            Val : HAL.UInt32;
         when True =>
            --  ERQ as an array
            Arr : DMA_ERQ_ERQ_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for DMA_ERQ_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  Enable Error Interrupt 0
   type EEI_EEI0_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      EEI_EEI0_Field_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      EEI_EEI0_Field_1)
     with Size => 1;
   for EEI_EEI0_Field use
     (EEI_EEI0_Field_0 => 0,
      EEI_EEI0_Field_1 => 1);

   --  DMA_EEI_EEI array
   type DMA_EEI_EEI_Field_Array is array (0 .. 31) of EEI_EEI0_Field
     with Component_Size => 1, Size => 32;

   --  Enable Error Interrupt Register
   type DMA_EEI_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EEI as a value
            Val : HAL.UInt32;
         when True =>
            --  EEI as an array
            Arr : DMA_EEI_EEI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for DMA_EEI_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   subtype DMA_CEEI_CEEI_Field is HAL.UInt5;

   --  Clear All Enable Error Interrupts
   type CEEI_CAEE_Field is
     (
      --  Clear only the EEI bit specified in the CEEI field
      CEEI_CAEE_Field_0,
      --  Clear all bits in EEI
      CEEI_CAEE_Field_1)
     with Size => 1;
   for CEEI_CAEE_Field use
     (CEEI_CAEE_Field_0 => 0,
      CEEI_CAEE_Field_1 => 1);

   --  No Op enable
   type CEEI_NOP_Field is
     (
      --  Normal operation
      CEEI_NOP_Field_0,
      --  No operation, ignore the other bits in this register
      CEEI_NOP_Field_1)
     with Size => 1;
   for CEEI_NOP_Field use
     (CEEI_NOP_Field_0 => 0,
      CEEI_NOP_Field_1 => 1);

   --  Clear Enable Error Interrupt Register
   type DMA_CEEI_Register is record
      --  Write-only. Clear Enable Error Interrupt
      CEEI         : DMA_CEEI_CEEI_Field := 16#0#;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Write-only. Clear All Enable Error Interrupts
      CAEE         : CEEI_CAEE_Field := NRF_SVD.DMA.CEEI_CAEE_Field_0;
      --  Write-only. No Op enable
      NOP          : CEEI_NOP_Field := NRF_SVD.DMA.CEEI_NOP_Field_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_CEEI_Register use record
      CEEI         at 0 range 0 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      CAEE         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   subtype DMA_SEEI_SEEI_Field is HAL.UInt5;

   --  Sets All Enable Error Interrupts
   type SEEI_SAEE_Field is
     (
      --  Set only the EEI bit specified in the SEEI field.
      SEEI_SAEE_Field_0,
      --  Sets all bits in EEI
      SEEI_SAEE_Field_1)
     with Size => 1;
   for SEEI_SAEE_Field use
     (SEEI_SAEE_Field_0 => 0,
      SEEI_SAEE_Field_1 => 1);

   --  No Op enable
   type SEEI_NOP_Field is
     (
      --  Normal operation
      SEEI_NOP_Field_0,
      --  No operation, ignore the other bits in this register
      SEEI_NOP_Field_1)
     with Size => 1;
   for SEEI_NOP_Field use
     (SEEI_NOP_Field_0 => 0,
      SEEI_NOP_Field_1 => 1);

   --  Set Enable Error Interrupt Register
   type DMA_SEEI_Register is record
      --  Write-only. Set Enable Error Interrupt
      SEEI         : DMA_SEEI_SEEI_Field := 16#0#;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Write-only. Sets All Enable Error Interrupts
      SAEE         : SEEI_SAEE_Field := NRF_SVD.DMA.SEEI_SAEE_Field_0;
      --  Write-only. No Op enable
      NOP          : SEEI_NOP_Field := NRF_SVD.DMA.SEEI_NOP_Field_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_SEEI_Register use record
      SEEI         at 0 range 0 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      SAEE         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   subtype DMA_CERQ_CERQ_Field is HAL.UInt5;

   --  Clear All Enable Requests
   type CERQ_CAER_Field is
     (
      --  Clear only the ERQ bit specified in the CERQ field
      CERQ_CAER_Field_0,
      --  Clear all bits in ERQ
      CERQ_CAER_Field_1)
     with Size => 1;
   for CERQ_CAER_Field use
     (CERQ_CAER_Field_0 => 0,
      CERQ_CAER_Field_1 => 1);

   --  No Op enable
   type CERQ_NOP_Field is
     (
      --  Normal operation
      CERQ_NOP_Field_0,
      --  No operation, ignore the other bits in this register
      CERQ_NOP_Field_1)
     with Size => 1;
   for CERQ_NOP_Field use
     (CERQ_NOP_Field_0 => 0,
      CERQ_NOP_Field_1 => 1);

   --  Clear Enable Request Register
   type DMA_CERQ_Register is record
      --  Write-only. Clear Enable Request
      CERQ         : DMA_CERQ_CERQ_Field := 16#0#;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Write-only. Clear All Enable Requests
      CAER         : CERQ_CAER_Field := NRF_SVD.DMA.CERQ_CAER_Field_0;
      --  Write-only. No Op enable
      NOP          : CERQ_NOP_Field := NRF_SVD.DMA.CERQ_NOP_Field_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_CERQ_Register use record
      CERQ         at 0 range 0 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      CAER         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   subtype DMA_SERQ_SERQ_Field is HAL.UInt5;

   --  Set All Enable Requests
   type SERQ_SAER_Field is
     (
      --  Set only the ERQ bit specified in the SERQ field
      SERQ_SAER_Field_0,
      --  Set all bits in ERQ
      SERQ_SAER_Field_1)
     with Size => 1;
   for SERQ_SAER_Field use
     (SERQ_SAER_Field_0 => 0,
      SERQ_SAER_Field_1 => 1);

   --  No Op enable
   type SERQ_NOP_Field is
     (
      --  Normal operation
      SERQ_NOP_Field_0,
      --  No operation, ignore the other bits in this register
      SERQ_NOP_Field_1)
     with Size => 1;
   for SERQ_NOP_Field use
     (SERQ_NOP_Field_0 => 0,
      SERQ_NOP_Field_1 => 1);

   --  Set Enable Request Register
   type DMA_SERQ_Register is record
      --  Write-only. Set Enable Request
      SERQ         : DMA_SERQ_SERQ_Field := 16#0#;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Write-only. Set All Enable Requests
      SAER         : SERQ_SAER_Field := NRF_SVD.DMA.SERQ_SAER_Field_0;
      --  Write-only. No Op enable
      NOP          : SERQ_NOP_Field := NRF_SVD.DMA.SERQ_NOP_Field_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_SERQ_Register use record
      SERQ         at 0 range 0 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      SAER         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   subtype DMA_CDNE_CDNE_Field is HAL.UInt5;

   --  Clears All DONE Bits
   type CDNE_CADN_Field is
     (
      --  Clears only the TCDn_CSR[DONE] bit specified in the CDNE field
      CDNE_CADN_Field_0,
      --  Clears all bits in TCDn_CSR[DONE]
      CDNE_CADN_Field_1)
     with Size => 1;
   for CDNE_CADN_Field use
     (CDNE_CADN_Field_0 => 0,
      CDNE_CADN_Field_1 => 1);

   --  No Op enable
   type CDNE_NOP_Field is
     (
      --  Normal operation
      CDNE_NOP_Field_0,
      --  No operation, ignore the other bits in this register
      CDNE_NOP_Field_1)
     with Size => 1;
   for CDNE_NOP_Field use
     (CDNE_NOP_Field_0 => 0,
      CDNE_NOP_Field_1 => 1);

   --  Clear DONE Status Bit Register
   type DMA_CDNE_Register is record
      --  Write-only. Clear DONE Bit
      CDNE         : DMA_CDNE_CDNE_Field := 16#0#;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Write-only. Clears All DONE Bits
      CADN         : CDNE_CADN_Field := NRF_SVD.DMA.CDNE_CADN_Field_0;
      --  Write-only. No Op enable
      NOP          : CDNE_NOP_Field := NRF_SVD.DMA.CDNE_NOP_Field_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_CDNE_Register use record
      CDNE         at 0 range 0 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      CADN         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   subtype DMA_SSRT_SSRT_Field is HAL.UInt5;

   --  Set All START Bits (activates all channels)
   type SSRT_SAST_Field is
     (
      --  Set only the TCDn_CSR[START] bit specified in the SSRT field
      SSRT_SAST_Field_0,
      --  Set all bits in TCDn_CSR[START]
      SSRT_SAST_Field_1)
     with Size => 1;
   for SSRT_SAST_Field use
     (SSRT_SAST_Field_0 => 0,
      SSRT_SAST_Field_1 => 1);

   --  No Op enable
   type SSRT_NOP_Field is
     (
      --  Normal operation
      SSRT_NOP_Field_0,
      --  No operation, ignore the other bits in this register
      SSRT_NOP_Field_1)
     with Size => 1;
   for SSRT_NOP_Field use
     (SSRT_NOP_Field_0 => 0,
      SSRT_NOP_Field_1 => 1);

   --  Set START Bit Register
   type DMA_SSRT_Register is record
      --  Write-only. Set START Bit
      SSRT         : DMA_SSRT_SSRT_Field := 16#0#;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Write-only. Set All START Bits (activates all channels)
      SAST         : SSRT_SAST_Field := NRF_SVD.DMA.SSRT_SAST_Field_0;
      --  Write-only. No Op enable
      NOP          : SSRT_NOP_Field := NRF_SVD.DMA.SSRT_NOP_Field_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_SSRT_Register use record
      SSRT         at 0 range 0 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      SAST         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   subtype DMA_CERR_CERR_Field is HAL.UInt5;

   --  Clear All Error Indicators
   type CERR_CAEI_Field is
     (
      --  Clear only the ERR bit specified in the CERR field
      CERR_CAEI_Field_0,
      --  Clear all bits in ERR
      CERR_CAEI_Field_1)
     with Size => 1;
   for CERR_CAEI_Field use
     (CERR_CAEI_Field_0 => 0,
      CERR_CAEI_Field_1 => 1);

   --  No Op enable
   type CERR_NOP_Field is
     (
      --  Normal operation
      CERR_NOP_Field_0,
      --  No operation, ignore the other bits in this register
      CERR_NOP_Field_1)
     with Size => 1;
   for CERR_NOP_Field use
     (CERR_NOP_Field_0 => 0,
      CERR_NOP_Field_1 => 1);

   --  Clear Error Register
   type DMA_CERR_Register is record
      --  Write-only. Clear Error Indicator
      CERR         : DMA_CERR_CERR_Field := 16#0#;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Write-only. Clear All Error Indicators
      CAEI         : CERR_CAEI_Field := NRF_SVD.DMA.CERR_CAEI_Field_0;
      --  Write-only. No Op enable
      NOP          : CERR_NOP_Field := NRF_SVD.DMA.CERR_NOP_Field_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_CERR_Register use record
      CERR         at 0 range 0 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      CAEI         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   subtype DMA_CINT_CINT_Field is HAL.UInt5;

   --  Clear All Interrupt Requests
   type CINT_CAIR_Field is
     (
      --  Clear only the INT bit specified in the CINT field
      CINT_CAIR_Field_0,
      --  Clear all bits in INT
      CINT_CAIR_Field_1)
     with Size => 1;
   for CINT_CAIR_Field use
     (CINT_CAIR_Field_0 => 0,
      CINT_CAIR_Field_1 => 1);

   --  No Op enable
   type CINT_NOP_Field is
     (
      --  Normal operation
      CINT_NOP_Field_0,
      --  No operation, ignore the other bits in this register
      CINT_NOP_Field_1)
     with Size => 1;
   for CINT_NOP_Field use
     (CINT_NOP_Field_0 => 0,
      CINT_NOP_Field_1 => 1);

   --  Clear Interrupt Request Register
   type DMA_CINT_Register is record
      --  Write-only. Clear Interrupt Request
      CINT         : DMA_CINT_CINT_Field := 16#0#;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Write-only. Clear All Interrupt Requests
      CAIR         : CINT_CAIR_Field := NRF_SVD.DMA.CINT_CAIR_Field_0;
      --  Write-only. No Op enable
      NOP          : CINT_NOP_Field := NRF_SVD.DMA.CINT_NOP_Field_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_CINT_Register use record
      CINT         at 0 range 0 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      CAIR         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   --  Interrupt Request 0
   type INT_INT0_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      INT_INT0_Field_0,
      --  The interrupt request for corresponding channel is active
      INT_INT0_Field_1)
     with Size => 1;
   for INT_INT0_Field use
     (INT_INT0_Field_0 => 0,
      INT_INT0_Field_1 => 1);

   --  DMA_INT_INT array
   type DMA_INT_INT_Field_Array is array (0 .. 31) of INT_INT0_Field
     with Component_Size => 1, Size => 32;

   --  Interrupt Request Register
   type DMA_INT_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  INT as a value
            Val : HAL.UInt32;
         when True =>
            --  INT as an array
            Arr : DMA_INT_INT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for DMA_INT_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  Error In Channel 0
   type ERR_ERR0_Field is
     (
      --  An error in this channel has not occurred
      ERR_ERR0_Field_0,
      --  An error in this channel has occurred
      ERR_ERR0_Field_1)
     with Size => 1;
   for ERR_ERR0_Field use
     (ERR_ERR0_Field_0 => 0,
      ERR_ERR0_Field_1 => 1);

   --  DMA_ERR_ERR array
   type DMA_ERR_ERR_Field_Array is array (0 .. 31) of ERR_ERR0_Field
     with Component_Size => 1, Size => 32;

   --  Error Register
   type DMA_ERR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ERR as a value
            Val : HAL.UInt32;
         when True =>
            --  ERR as an array
            Arr : DMA_ERR_ERR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for DMA_ERR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  Hardware Request Status Channel 0
   type HRS_HRS0_Field is
     (
      --  A hardware service request for channel 0 is not present
      HRS_HRS0_Field_0,
      --  A hardware service request for channel 0 is present
      HRS_HRS0_Field_1)
     with Size => 1;
   for HRS_HRS0_Field use
     (HRS_HRS0_Field_0 => 0,
      HRS_HRS0_Field_1 => 1);

   --  Hardware Request Status Channel 1
   type HRS_HRS1_Field is
     (
      --  A hardware service request for channel 1 is not present
      HRS_HRS1_Field_0,
      --  A hardware service request for channel 1 is present
      HRS_HRS1_Field_1)
     with Size => 1;
   for HRS_HRS1_Field use
     (HRS_HRS1_Field_0 => 0,
      HRS_HRS1_Field_1 => 1);

   --  Hardware Request Status Channel 2
   type HRS_HRS2_Field is
     (
      --  A hardware service request for channel 2 is not present
      HRS_HRS2_Field_0,
      --  A hardware service request for channel 2 is present
      HRS_HRS2_Field_1)
     with Size => 1;
   for HRS_HRS2_Field use
     (HRS_HRS2_Field_0 => 0,
      HRS_HRS2_Field_1 => 1);

   --  Hardware Request Status Channel 3
   type HRS_HRS3_Field is
     (
      --  A hardware service request for channel 3 is not present
      HRS_HRS3_Field_0,
      --  A hardware service request for channel 3 is present
      HRS_HRS3_Field_1)
     with Size => 1;
   for HRS_HRS3_Field use
     (HRS_HRS3_Field_0 => 0,
      HRS_HRS3_Field_1 => 1);

   --  Hardware Request Status Channel 4
   type HRS_HRS4_Field is
     (
      --  A hardware service request for channel 4 is not present
      HRS_HRS4_Field_0,
      --  A hardware service request for channel 4 is present
      HRS_HRS4_Field_1)
     with Size => 1;
   for HRS_HRS4_Field use
     (HRS_HRS4_Field_0 => 0,
      HRS_HRS4_Field_1 => 1);

   --  Hardware Request Status Channel 5
   type HRS_HRS5_Field is
     (
      --  A hardware service request for channel 5 is not present
      HRS_HRS5_Field_0,
      --  A hardware service request for channel 5 is present
      HRS_HRS5_Field_1)
     with Size => 1;
   for HRS_HRS5_Field use
     (HRS_HRS5_Field_0 => 0,
      HRS_HRS5_Field_1 => 1);

   --  Hardware Request Status Channel 6
   type HRS_HRS6_Field is
     (
      --  A hardware service request for channel 6 is not present
      HRS_HRS6_Field_0,
      --  A hardware service request for channel 6 is present
      HRS_HRS6_Field_1)
     with Size => 1;
   for HRS_HRS6_Field use
     (HRS_HRS6_Field_0 => 0,
      HRS_HRS6_Field_1 => 1);

   --  Hardware Request Status Channel 7
   type HRS_HRS7_Field is
     (
      --  A hardware service request for channel 7 is not present
      HRS_HRS7_Field_0,
      --  A hardware service request for channel 7 is present
      HRS_HRS7_Field_1)
     with Size => 1;
   for HRS_HRS7_Field use
     (HRS_HRS7_Field_0 => 0,
      HRS_HRS7_Field_1 => 1);

   --  Hardware Request Status Channel 8
   type HRS_HRS8_Field is
     (
      --  A hardware service request for channel 8 is not present
      HRS_HRS8_Field_0,
      --  A hardware service request for channel 8 is present
      HRS_HRS8_Field_1)
     with Size => 1;
   for HRS_HRS8_Field use
     (HRS_HRS8_Field_0 => 0,
      HRS_HRS8_Field_1 => 1);

   --  Hardware Request Status Channel 9
   type HRS_HRS9_Field is
     (
      --  A hardware service request for channel 9 is not present
      HRS_HRS9_Field_0,
      --  A hardware service request for channel 9 is present
      HRS_HRS9_Field_1)
     with Size => 1;
   for HRS_HRS9_Field use
     (HRS_HRS9_Field_0 => 0,
      HRS_HRS9_Field_1 => 1);

   --  Hardware Request Status Channel 10
   type HRS_HRS10_Field is
     (
      --  A hardware service request for channel 10 is not present
      HRS_HRS10_Field_0,
      --  A hardware service request for channel 10 is present
      HRS_HRS10_Field_1)
     with Size => 1;
   for HRS_HRS10_Field use
     (HRS_HRS10_Field_0 => 0,
      HRS_HRS10_Field_1 => 1);

   --  Hardware Request Status Channel 11
   type HRS_HRS11_Field is
     (
      --  A hardware service request for channel 11 is not present
      HRS_HRS11_Field_0,
      --  A hardware service request for channel 11 is present
      HRS_HRS11_Field_1)
     with Size => 1;
   for HRS_HRS11_Field use
     (HRS_HRS11_Field_0 => 0,
      HRS_HRS11_Field_1 => 1);

   --  Hardware Request Status Channel 12
   type HRS_HRS12_Field is
     (
      --  A hardware service request for channel 12 is not present
      HRS_HRS12_Field_0,
      --  A hardware service request for channel 12 is present
      HRS_HRS12_Field_1)
     with Size => 1;
   for HRS_HRS12_Field use
     (HRS_HRS12_Field_0 => 0,
      HRS_HRS12_Field_1 => 1);

   --  Hardware Request Status Channel 13
   type HRS_HRS13_Field is
     (
      --  A hardware service request for channel 13 is not present
      HRS_HRS13_Field_0,
      --  A hardware service request for channel 13 is present
      HRS_HRS13_Field_1)
     with Size => 1;
   for HRS_HRS13_Field use
     (HRS_HRS13_Field_0 => 0,
      HRS_HRS13_Field_1 => 1);

   --  Hardware Request Status Channel 14
   type HRS_HRS14_Field is
     (
      --  A hardware service request for channel 14 is not present
      HRS_HRS14_Field_0,
      --  A hardware service request for channel 14 is present
      HRS_HRS14_Field_1)
     with Size => 1;
   for HRS_HRS14_Field use
     (HRS_HRS14_Field_0 => 0,
      HRS_HRS14_Field_1 => 1);

   --  Hardware Request Status Channel 15
   type HRS_HRS15_Field is
     (
      --  A hardware service request for channel 15 is not present
      HRS_HRS15_Field_0,
      --  A hardware service request for channel 15 is present
      HRS_HRS15_Field_1)
     with Size => 1;
   for HRS_HRS15_Field use
     (HRS_HRS15_Field_0 => 0,
      HRS_HRS15_Field_1 => 1);

   --  Hardware Request Status Channel 16
   type HRS_HRS16_Field is
     (
      --  A hardware service request for channel 16 is not present
      HRS_HRS16_Field_0,
      --  A hardware service request for channel 16 is present
      HRS_HRS16_Field_1)
     with Size => 1;
   for HRS_HRS16_Field use
     (HRS_HRS16_Field_0 => 0,
      HRS_HRS16_Field_1 => 1);

   --  Hardware Request Status Channel 17
   type HRS_HRS17_Field is
     (
      --  A hardware service request for channel 17 is not present
      HRS_HRS17_Field_0,
      --  A hardware service request for channel 17 is present
      HRS_HRS17_Field_1)
     with Size => 1;
   for HRS_HRS17_Field use
     (HRS_HRS17_Field_0 => 0,
      HRS_HRS17_Field_1 => 1);

   --  Hardware Request Status Channel 18
   type HRS_HRS18_Field is
     (
      --  A hardware service request for channel 18 is not present
      HRS_HRS18_Field_0,
      --  A hardware service request for channel 18 is present
      HRS_HRS18_Field_1)
     with Size => 1;
   for HRS_HRS18_Field use
     (HRS_HRS18_Field_0 => 0,
      HRS_HRS18_Field_1 => 1);

   --  Hardware Request Status Channel 19
   type HRS_HRS19_Field is
     (
      --  A hardware service request for channel 19 is not present
      HRS_HRS19_Field_0,
      --  A hardware service request for channel 19 is present
      HRS_HRS19_Field_1)
     with Size => 1;
   for HRS_HRS19_Field use
     (HRS_HRS19_Field_0 => 0,
      HRS_HRS19_Field_1 => 1);

   --  Hardware Request Status Channel 20
   type HRS_HRS20_Field is
     (
      --  A hardware service request for channel 20 is not present
      HRS_HRS20_Field_0,
      --  A hardware service request for channel 20 is present
      HRS_HRS20_Field_1)
     with Size => 1;
   for HRS_HRS20_Field use
     (HRS_HRS20_Field_0 => 0,
      HRS_HRS20_Field_1 => 1);

   --  Hardware Request Status Channel 21
   type HRS_HRS21_Field is
     (
      --  A hardware service request for channel 21 is not present
      HRS_HRS21_Field_0,
      --  A hardware service request for channel 21 is present
      HRS_HRS21_Field_1)
     with Size => 1;
   for HRS_HRS21_Field use
     (HRS_HRS21_Field_0 => 0,
      HRS_HRS21_Field_1 => 1);

   --  Hardware Request Status Channel 22
   type HRS_HRS22_Field is
     (
      --  A hardware service request for channel 22 is not present
      HRS_HRS22_Field_0,
      --  A hardware service request for channel 22 is present
      HRS_HRS22_Field_1)
     with Size => 1;
   for HRS_HRS22_Field use
     (HRS_HRS22_Field_0 => 0,
      HRS_HRS22_Field_1 => 1);

   --  Hardware Request Status Channel 23
   type HRS_HRS23_Field is
     (
      --  A hardware service request for channel 23 is not present
      HRS_HRS23_Field_0,
      --  A hardware service request for channel 23 is present
      HRS_HRS23_Field_1)
     with Size => 1;
   for HRS_HRS23_Field use
     (HRS_HRS23_Field_0 => 0,
      HRS_HRS23_Field_1 => 1);

   --  Hardware Request Status Channel 24
   type HRS_HRS24_Field is
     (
      --  A hardware service request for channel 24 is not present
      HRS_HRS24_Field_0,
      --  A hardware service request for channel 24 is present
      HRS_HRS24_Field_1)
     with Size => 1;
   for HRS_HRS24_Field use
     (HRS_HRS24_Field_0 => 0,
      HRS_HRS24_Field_1 => 1);

   --  Hardware Request Status Channel 25
   type HRS_HRS25_Field is
     (
      --  A hardware service request for channel 25 is not present
      HRS_HRS25_Field_0,
      --  A hardware service request for channel 25 is present
      HRS_HRS25_Field_1)
     with Size => 1;
   for HRS_HRS25_Field use
     (HRS_HRS25_Field_0 => 0,
      HRS_HRS25_Field_1 => 1);

   --  Hardware Request Status Channel 26
   type HRS_HRS26_Field is
     (
      --  A hardware service request for channel 26 is not present
      HRS_HRS26_Field_0,
      --  A hardware service request for channel 26 is present
      HRS_HRS26_Field_1)
     with Size => 1;
   for HRS_HRS26_Field use
     (HRS_HRS26_Field_0 => 0,
      HRS_HRS26_Field_1 => 1);

   --  Hardware Request Status Channel 27
   type HRS_HRS27_Field is
     (
      --  A hardware service request for channel 27 is not present
      HRS_HRS27_Field_0,
      --  A hardware service request for channel 27 is present
      HRS_HRS27_Field_1)
     with Size => 1;
   for HRS_HRS27_Field use
     (HRS_HRS27_Field_0 => 0,
      HRS_HRS27_Field_1 => 1);

   --  Hardware Request Status Channel 28
   type HRS_HRS28_Field is
     (
      --  A hardware service request for channel 28 is not present
      HRS_HRS28_Field_0,
      --  A hardware service request for channel 28 is present
      HRS_HRS28_Field_1)
     with Size => 1;
   for HRS_HRS28_Field use
     (HRS_HRS28_Field_0 => 0,
      HRS_HRS28_Field_1 => 1);

   --  Hardware Request Status Channel 29
   type HRS_HRS29_Field is
     (
      --  A hardware service request for channel 29 is not preset
      HRS_HRS29_Field_0,
      --  A hardware service request for channel 29 is present
      HRS_HRS29_Field_1)
     with Size => 1;
   for HRS_HRS29_Field use
     (HRS_HRS29_Field_0 => 0,
      HRS_HRS29_Field_1 => 1);

   --  Hardware Request Status Channel 30
   type HRS_HRS30_Field is
     (
      --  A hardware service request for channel 30 is not present
      HRS_HRS30_Field_0,
      --  A hardware service request for for channel 30 is present
      HRS_HRS30_Field_1)
     with Size => 1;
   for HRS_HRS30_Field use
     (HRS_HRS30_Field_0 => 0,
      HRS_HRS30_Field_1 => 1);

   --  Hardware Request Status Channel 31
   type HRS_HRS31_Field is
     (
      --  A hardware service request for channel 31 is not present
      HRS_HRS31_Field_0,
      --  A hardware service request for channel 31 is present
      HRS_HRS31_Field_1)
     with Size => 1;
   for HRS_HRS31_Field use
     (HRS_HRS31_Field_0 => 0,
      HRS_HRS31_Field_1 => 1);

   --  Hardware Request Status Register
   type DMA_HRS_Register is record
      --  Read-only. Hardware Request Status Channel 0
      HRS0  : HRS_HRS0_Field;
      --  Read-only. Hardware Request Status Channel 1
      HRS1  : HRS_HRS1_Field;
      --  Read-only. Hardware Request Status Channel 2
      HRS2  : HRS_HRS2_Field;
      --  Read-only. Hardware Request Status Channel 3
      HRS3  : HRS_HRS3_Field;
      --  Read-only. Hardware Request Status Channel 4
      HRS4  : HRS_HRS4_Field;
      --  Read-only. Hardware Request Status Channel 5
      HRS5  : HRS_HRS5_Field;
      --  Read-only. Hardware Request Status Channel 6
      HRS6  : HRS_HRS6_Field;
      --  Read-only. Hardware Request Status Channel 7
      HRS7  : HRS_HRS7_Field;
      --  Read-only. Hardware Request Status Channel 8
      HRS8  : HRS_HRS8_Field;
      --  Read-only. Hardware Request Status Channel 9
      HRS9  : HRS_HRS9_Field;
      --  Read-only. Hardware Request Status Channel 10
      HRS10 : HRS_HRS10_Field;
      --  Read-only. Hardware Request Status Channel 11
      HRS11 : HRS_HRS11_Field;
      --  Read-only. Hardware Request Status Channel 12
      HRS12 : HRS_HRS12_Field;
      --  Read-only. Hardware Request Status Channel 13
      HRS13 : HRS_HRS13_Field;
      --  Read-only. Hardware Request Status Channel 14
      HRS14 : HRS_HRS14_Field;
      --  Read-only. Hardware Request Status Channel 15
      HRS15 : HRS_HRS15_Field;
      --  Read-only. Hardware Request Status Channel 16
      HRS16 : HRS_HRS16_Field;
      --  Read-only. Hardware Request Status Channel 17
      HRS17 : HRS_HRS17_Field;
      --  Read-only. Hardware Request Status Channel 18
      HRS18 : HRS_HRS18_Field;
      --  Read-only. Hardware Request Status Channel 19
      HRS19 : HRS_HRS19_Field;
      --  Read-only. Hardware Request Status Channel 20
      HRS20 : HRS_HRS20_Field;
      --  Read-only. Hardware Request Status Channel 21
      HRS21 : HRS_HRS21_Field;
      --  Read-only. Hardware Request Status Channel 22
      HRS22 : HRS_HRS22_Field;
      --  Read-only. Hardware Request Status Channel 23
      HRS23 : HRS_HRS23_Field;
      --  Read-only. Hardware Request Status Channel 24
      HRS24 : HRS_HRS24_Field;
      --  Read-only. Hardware Request Status Channel 25
      HRS25 : HRS_HRS25_Field;
      --  Read-only. Hardware Request Status Channel 26
      HRS26 : HRS_HRS26_Field;
      --  Read-only. Hardware Request Status Channel 27
      HRS27 : HRS_HRS27_Field;
      --  Read-only. Hardware Request Status Channel 28
      HRS28 : HRS_HRS28_Field;
      --  Read-only. Hardware Request Status Channel 29
      HRS29 : HRS_HRS29_Field;
      --  Read-only. Hardware Request Status Channel 30
      HRS30 : HRS_HRS30_Field;
      --  Read-only. Hardware Request Status Channel 31
      HRS31 : HRS_HRS31_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMA_HRS_Register use record
      HRS0  at 0 range 0 .. 0;
      HRS1  at 0 range 1 .. 1;
      HRS2  at 0 range 2 .. 2;
      HRS3  at 0 range 3 .. 3;
      HRS4  at 0 range 4 .. 4;
      HRS5  at 0 range 5 .. 5;
      HRS6  at 0 range 6 .. 6;
      HRS7  at 0 range 7 .. 7;
      HRS8  at 0 range 8 .. 8;
      HRS9  at 0 range 9 .. 9;
      HRS10 at 0 range 10 .. 10;
      HRS11 at 0 range 11 .. 11;
      HRS12 at 0 range 12 .. 12;
      HRS13 at 0 range 13 .. 13;
      HRS14 at 0 range 14 .. 14;
      HRS15 at 0 range 15 .. 15;
      HRS16 at 0 range 16 .. 16;
      HRS17 at 0 range 17 .. 17;
      HRS18 at 0 range 18 .. 18;
      HRS19 at 0 range 19 .. 19;
      HRS20 at 0 range 20 .. 20;
      HRS21 at 0 range 21 .. 21;
      HRS22 at 0 range 22 .. 22;
      HRS23 at 0 range 23 .. 23;
      HRS24 at 0 range 24 .. 24;
      HRS25 at 0 range 25 .. 25;
      HRS26 at 0 range 26 .. 26;
      HRS27 at 0 range 27 .. 27;
      HRS28 at 0 range 28 .. 28;
      HRS29 at 0 range 29 .. 29;
      HRS30 at 0 range 30 .. 30;
      HRS31 at 0 range 31 .. 31;
   end record;

   --  Enable asynchronous DMA request in stop mode for channel 0.
   type EARS_EDREQ_0_Field is
     (
      --  Disable asynchronous DMA request for channel 0.
      EARS_EDREQ_0_Field_0,
      --  Enable asynchronous DMA request for channel 0.
      EARS_EDREQ_0_Field_1)
     with Size => 1;
   for EARS_EDREQ_0_Field use
     (EARS_EDREQ_0_Field_0 => 0,
      EARS_EDREQ_0_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 1.
   type EARS_EDREQ_1_Field is
     (
      --  Disable asynchronous DMA request for channel 1
      EARS_EDREQ_1_Field_0,
      --  Enable asynchronous DMA request for channel 1.
      EARS_EDREQ_1_Field_1)
     with Size => 1;
   for EARS_EDREQ_1_Field use
     (EARS_EDREQ_1_Field_0 => 0,
      EARS_EDREQ_1_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 2.
   type EARS_EDREQ_2_Field is
     (
      --  Disable asynchronous DMA request for channel 2.
      EARS_EDREQ_2_Field_0,
      --  Enable asynchronous DMA request for channel 2.
      EARS_EDREQ_2_Field_1)
     with Size => 1;
   for EARS_EDREQ_2_Field use
     (EARS_EDREQ_2_Field_0 => 0,
      EARS_EDREQ_2_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 3.
   type EARS_EDREQ_3_Field is
     (
      --  Disable asynchronous DMA request for channel 3.
      EARS_EDREQ_3_Field_0,
      --  Enable asynchronous DMA request for channel 3.
      EARS_EDREQ_3_Field_1)
     with Size => 1;
   for EARS_EDREQ_3_Field use
     (EARS_EDREQ_3_Field_0 => 0,
      EARS_EDREQ_3_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 4
   type EARS_EDREQ_4_Field is
     (
      --  Disable asynchronous DMA request for channel 4.
      EARS_EDREQ_4_Field_0,
      --  Enable asynchronous DMA request for channel 4.
      EARS_EDREQ_4_Field_1)
     with Size => 1;
   for EARS_EDREQ_4_Field use
     (EARS_EDREQ_4_Field_0 => 0,
      EARS_EDREQ_4_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 5
   type EARS_EDREQ_5_Field is
     (
      --  Disable asynchronous DMA request for channel 5.
      EARS_EDREQ_5_Field_0,
      --  Enable asynchronous DMA request for channel 5.
      EARS_EDREQ_5_Field_1)
     with Size => 1;
   for EARS_EDREQ_5_Field use
     (EARS_EDREQ_5_Field_0 => 0,
      EARS_EDREQ_5_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 6
   type EARS_EDREQ_6_Field is
     (
      --  Disable asynchronous DMA request for channel 6.
      EARS_EDREQ_6_Field_0,
      --  Enable asynchronous DMA request for channel 6.
      EARS_EDREQ_6_Field_1)
     with Size => 1;
   for EARS_EDREQ_6_Field use
     (EARS_EDREQ_6_Field_0 => 0,
      EARS_EDREQ_6_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 7
   type EARS_EDREQ_7_Field is
     (
      --  Disable asynchronous DMA request for channel 7.
      EARS_EDREQ_7_Field_0,
      --  Enable asynchronous DMA request for channel 7.
      EARS_EDREQ_7_Field_1)
     with Size => 1;
   for EARS_EDREQ_7_Field use
     (EARS_EDREQ_7_Field_0 => 0,
      EARS_EDREQ_7_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 8
   type EARS_EDREQ_8_Field is
     (
      --  Disable asynchronous DMA request for channel 8.
      EARS_EDREQ_8_Field_0,
      --  Enable asynchronous DMA request for channel 8.
      EARS_EDREQ_8_Field_1)
     with Size => 1;
   for EARS_EDREQ_8_Field use
     (EARS_EDREQ_8_Field_0 => 0,
      EARS_EDREQ_8_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 9
   type EARS_EDREQ_9_Field is
     (
      --  Disable asynchronous DMA request for channel 9.
      EARS_EDREQ_9_Field_0,
      --  Enable asynchronous DMA request for channel 9.
      EARS_EDREQ_9_Field_1)
     with Size => 1;
   for EARS_EDREQ_9_Field use
     (EARS_EDREQ_9_Field_0 => 0,
      EARS_EDREQ_9_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 10
   type EARS_EDREQ_10_Field is
     (
      --  Disable asynchronous DMA request for channel 10.
      EARS_EDREQ_10_Field_0,
      --  Enable asynchronous DMA request for channel 10.
      EARS_EDREQ_10_Field_1)
     with Size => 1;
   for EARS_EDREQ_10_Field use
     (EARS_EDREQ_10_Field_0 => 0,
      EARS_EDREQ_10_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 11
   type EARS_EDREQ_11_Field is
     (
      --  Disable asynchronous DMA request for channel 11.
      EARS_EDREQ_11_Field_0,
      --  Enable asynchronous DMA request for channel 11.
      EARS_EDREQ_11_Field_1)
     with Size => 1;
   for EARS_EDREQ_11_Field use
     (EARS_EDREQ_11_Field_0 => 0,
      EARS_EDREQ_11_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 12
   type EARS_EDREQ_12_Field is
     (
      --  Disable asynchronous DMA request for channel 12.
      EARS_EDREQ_12_Field_0,
      --  Enable asynchronous DMA request for channel 12.
      EARS_EDREQ_12_Field_1)
     with Size => 1;
   for EARS_EDREQ_12_Field use
     (EARS_EDREQ_12_Field_0 => 0,
      EARS_EDREQ_12_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 13
   type EARS_EDREQ_13_Field is
     (
      --  Disable asynchronous DMA request for channel 13.
      EARS_EDREQ_13_Field_0,
      --  Enable asynchronous DMA request for channel 13.
      EARS_EDREQ_13_Field_1)
     with Size => 1;
   for EARS_EDREQ_13_Field use
     (EARS_EDREQ_13_Field_0 => 0,
      EARS_EDREQ_13_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 14
   type EARS_EDREQ_14_Field is
     (
      --  Disable asynchronous DMA request for channel 14.
      EARS_EDREQ_14_Field_0,
      --  Enable asynchronous DMA request for channel 14.
      EARS_EDREQ_14_Field_1)
     with Size => 1;
   for EARS_EDREQ_14_Field use
     (EARS_EDREQ_14_Field_0 => 0,
      EARS_EDREQ_14_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 15
   type EARS_EDREQ_15_Field is
     (
      --  Disable asynchronous DMA request for channel 15.
      EARS_EDREQ_15_Field_0,
      --  Enable asynchronous DMA request for channel 15.
      EARS_EDREQ_15_Field_1)
     with Size => 1;
   for EARS_EDREQ_15_Field use
     (EARS_EDREQ_15_Field_0 => 0,
      EARS_EDREQ_15_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 16
   type EARS_EDREQ_16_Field is
     (
      --  Disable asynchronous DMA request for channel 16
      EARS_EDREQ_16_Field_0,
      --  Enable asynchronous DMA request for channel 16
      EARS_EDREQ_16_Field_1)
     with Size => 1;
   for EARS_EDREQ_16_Field use
     (EARS_EDREQ_16_Field_0 => 0,
      EARS_EDREQ_16_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 17
   type EARS_EDREQ_17_Field is
     (
      --  Disable asynchronous DMA request for channel 17
      EARS_EDREQ_17_Field_0,
      --  Enable asynchronous DMA request for channel 17
      EARS_EDREQ_17_Field_1)
     with Size => 1;
   for EARS_EDREQ_17_Field use
     (EARS_EDREQ_17_Field_0 => 0,
      EARS_EDREQ_17_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 18
   type EARS_EDREQ_18_Field is
     (
      --  Disable asynchronous DMA request for channel 18
      EARS_EDREQ_18_Field_0,
      --  Enable asynchronous DMA request for channel 18
      EARS_EDREQ_18_Field_1)
     with Size => 1;
   for EARS_EDREQ_18_Field use
     (EARS_EDREQ_18_Field_0 => 0,
      EARS_EDREQ_18_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 19
   type EARS_EDREQ_19_Field is
     (
      --  Disable asynchronous DMA request for channel 19
      EARS_EDREQ_19_Field_0,
      --  Enable asynchronous DMA request for channel 19
      EARS_EDREQ_19_Field_1)
     with Size => 1;
   for EARS_EDREQ_19_Field use
     (EARS_EDREQ_19_Field_0 => 0,
      EARS_EDREQ_19_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 20
   type EARS_EDREQ_20_Field is
     (
      --  Disable asynchronous DMA request for channel 20
      EARS_EDREQ_20_Field_0,
      --  Enable asynchronous DMA request for channel 20
      EARS_EDREQ_20_Field_1)
     with Size => 1;
   for EARS_EDREQ_20_Field use
     (EARS_EDREQ_20_Field_0 => 0,
      EARS_EDREQ_20_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 21
   type EARS_EDREQ_21_Field is
     (
      --  Disable asynchronous DMA request for channel 21
      EARS_EDREQ_21_Field_0,
      --  Enable asynchronous DMA request for channel 21
      EARS_EDREQ_21_Field_1)
     with Size => 1;
   for EARS_EDREQ_21_Field use
     (EARS_EDREQ_21_Field_0 => 0,
      EARS_EDREQ_21_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 22
   type EARS_EDREQ_22_Field is
     (
      --  Disable asynchronous DMA request for channel 22
      EARS_EDREQ_22_Field_0,
      --  Enable asynchronous DMA request for channel 22
      EARS_EDREQ_22_Field_1)
     with Size => 1;
   for EARS_EDREQ_22_Field use
     (EARS_EDREQ_22_Field_0 => 0,
      EARS_EDREQ_22_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 23
   type EARS_EDREQ_23_Field is
     (
      --  Disable asynchronous DMA request for channel 23
      EARS_EDREQ_23_Field_0,
      --  Enable asynchronous DMA request for channel 23
      EARS_EDREQ_23_Field_1)
     with Size => 1;
   for EARS_EDREQ_23_Field use
     (EARS_EDREQ_23_Field_0 => 0,
      EARS_EDREQ_23_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 24
   type EARS_EDREQ_24_Field is
     (
      --  Disable asynchronous DMA request for channel 24
      EARS_EDREQ_24_Field_0,
      --  Enable asynchronous DMA request for channel 24
      EARS_EDREQ_24_Field_1)
     with Size => 1;
   for EARS_EDREQ_24_Field use
     (EARS_EDREQ_24_Field_0 => 0,
      EARS_EDREQ_24_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 25
   type EARS_EDREQ_25_Field is
     (
      --  Disable asynchronous DMA request for channel 25
      EARS_EDREQ_25_Field_0,
      --  Enable asynchronous DMA request for channel 25
      EARS_EDREQ_25_Field_1)
     with Size => 1;
   for EARS_EDREQ_25_Field use
     (EARS_EDREQ_25_Field_0 => 0,
      EARS_EDREQ_25_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 26
   type EARS_EDREQ_26_Field is
     (
      --  Disable asynchronous DMA request for channel 26
      EARS_EDREQ_26_Field_0,
      --  Enable asynchronous DMA request for channel 26
      EARS_EDREQ_26_Field_1)
     with Size => 1;
   for EARS_EDREQ_26_Field use
     (EARS_EDREQ_26_Field_0 => 0,
      EARS_EDREQ_26_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 27
   type EARS_EDREQ_27_Field is
     (
      --  Disable asynchronous DMA request for channel 27
      EARS_EDREQ_27_Field_0,
      --  Enable asynchronous DMA request for channel 27
      EARS_EDREQ_27_Field_1)
     with Size => 1;
   for EARS_EDREQ_27_Field use
     (EARS_EDREQ_27_Field_0 => 0,
      EARS_EDREQ_27_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 28
   type EARS_EDREQ_28_Field is
     (
      --  Disable asynchronous DMA request for channel 28
      EARS_EDREQ_28_Field_0,
      --  Enable asynchronous DMA request for channel 28
      EARS_EDREQ_28_Field_1)
     with Size => 1;
   for EARS_EDREQ_28_Field use
     (EARS_EDREQ_28_Field_0 => 0,
      EARS_EDREQ_28_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 29
   type EARS_EDREQ_29_Field is
     (
      --  Disable asynchronous DMA request for channel 29
      EARS_EDREQ_29_Field_0,
      --  Enable asynchronous DMA request for channel 29
      EARS_EDREQ_29_Field_1)
     with Size => 1;
   for EARS_EDREQ_29_Field use
     (EARS_EDREQ_29_Field_0 => 0,
      EARS_EDREQ_29_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 30
   type EARS_EDREQ_30_Field is
     (
      --  Disable asynchronous DMA request for channel 30
      EARS_EDREQ_30_Field_0,
      --  Enable asynchronous DMA request for channel 30
      EARS_EDREQ_30_Field_1)
     with Size => 1;
   for EARS_EDREQ_30_Field use
     (EARS_EDREQ_30_Field_0 => 0,
      EARS_EDREQ_30_Field_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 31
   type EARS_EDREQ_31_Field is
     (
      --  Disable asynchronous DMA request for channel 31
      EARS_EDREQ_31_Field_0,
      --  Enable asynchronous DMA request for channel 31
      EARS_EDREQ_31_Field_1)
     with Size => 1;
   for EARS_EDREQ_31_Field use
     (EARS_EDREQ_31_Field_0 => 0,
      EARS_EDREQ_31_Field_1 => 1);

   --  Enable Asynchronous Request in Stop Register
   type DMA_EARS_Register is record
      --  Enable asynchronous DMA request in stop mode for channel 0.
      EDREQ_0  : EARS_EDREQ_0_Field := NRF_SVD.DMA.EARS_EDREQ_0_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 1.
      EDREQ_1  : EARS_EDREQ_1_Field := NRF_SVD.DMA.EARS_EDREQ_1_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 2.
      EDREQ_2  : EARS_EDREQ_2_Field := NRF_SVD.DMA.EARS_EDREQ_2_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 3.
      EDREQ_3  : EARS_EDREQ_3_Field := NRF_SVD.DMA.EARS_EDREQ_3_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 4
      EDREQ_4  : EARS_EDREQ_4_Field := NRF_SVD.DMA.EARS_EDREQ_4_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 5
      EDREQ_5  : EARS_EDREQ_5_Field := NRF_SVD.DMA.EARS_EDREQ_5_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 6
      EDREQ_6  : EARS_EDREQ_6_Field := NRF_SVD.DMA.EARS_EDREQ_6_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 7
      EDREQ_7  : EARS_EDREQ_7_Field := NRF_SVD.DMA.EARS_EDREQ_7_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 8
      EDREQ_8  : EARS_EDREQ_8_Field := NRF_SVD.DMA.EARS_EDREQ_8_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 9
      EDREQ_9  : EARS_EDREQ_9_Field := NRF_SVD.DMA.EARS_EDREQ_9_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 10
      EDREQ_10 : EARS_EDREQ_10_Field := NRF_SVD.DMA.EARS_EDREQ_10_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 11
      EDREQ_11 : EARS_EDREQ_11_Field := NRF_SVD.DMA.EARS_EDREQ_11_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 12
      EDREQ_12 : EARS_EDREQ_12_Field := NRF_SVD.DMA.EARS_EDREQ_12_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 13
      EDREQ_13 : EARS_EDREQ_13_Field := NRF_SVD.DMA.EARS_EDREQ_13_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 14
      EDREQ_14 : EARS_EDREQ_14_Field := NRF_SVD.DMA.EARS_EDREQ_14_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 15
      EDREQ_15 : EARS_EDREQ_15_Field := NRF_SVD.DMA.EARS_EDREQ_15_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 16
      EDREQ_16 : EARS_EDREQ_16_Field := NRF_SVD.DMA.EARS_EDREQ_16_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 17
      EDREQ_17 : EARS_EDREQ_17_Field := NRF_SVD.DMA.EARS_EDREQ_17_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 18
      EDREQ_18 : EARS_EDREQ_18_Field := NRF_SVD.DMA.EARS_EDREQ_18_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 19
      EDREQ_19 : EARS_EDREQ_19_Field := NRF_SVD.DMA.EARS_EDREQ_19_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 20
      EDREQ_20 : EARS_EDREQ_20_Field := NRF_SVD.DMA.EARS_EDREQ_20_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 21
      EDREQ_21 : EARS_EDREQ_21_Field := NRF_SVD.DMA.EARS_EDREQ_21_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 22
      EDREQ_22 : EARS_EDREQ_22_Field := NRF_SVD.DMA.EARS_EDREQ_22_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 23
      EDREQ_23 : EARS_EDREQ_23_Field := NRF_SVD.DMA.EARS_EDREQ_23_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 24
      EDREQ_24 : EARS_EDREQ_24_Field := NRF_SVD.DMA.EARS_EDREQ_24_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 25
      EDREQ_25 : EARS_EDREQ_25_Field := NRF_SVD.DMA.EARS_EDREQ_25_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 26
      EDREQ_26 : EARS_EDREQ_26_Field := NRF_SVD.DMA.EARS_EDREQ_26_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 27
      EDREQ_27 : EARS_EDREQ_27_Field := NRF_SVD.DMA.EARS_EDREQ_27_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 28
      EDREQ_28 : EARS_EDREQ_28_Field := NRF_SVD.DMA.EARS_EDREQ_28_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 29
      EDREQ_29 : EARS_EDREQ_29_Field := NRF_SVD.DMA.EARS_EDREQ_29_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 30
      EDREQ_30 : EARS_EDREQ_30_Field := NRF_SVD.DMA.EARS_EDREQ_30_Field_0;
      --  Enable asynchronous DMA request in stop mode for channel 31
      EDREQ_31 : EARS_EDREQ_31_Field := NRF_SVD.DMA.EARS_EDREQ_31_Field_0;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMA_EARS_Register use record
      EDREQ_0  at 0 range 0 .. 0;
      EDREQ_1  at 0 range 1 .. 1;
      EDREQ_2  at 0 range 2 .. 2;
      EDREQ_3  at 0 range 3 .. 3;
      EDREQ_4  at 0 range 4 .. 4;
      EDREQ_5  at 0 range 5 .. 5;
      EDREQ_6  at 0 range 6 .. 6;
      EDREQ_7  at 0 range 7 .. 7;
      EDREQ_8  at 0 range 8 .. 8;
      EDREQ_9  at 0 range 9 .. 9;
      EDREQ_10 at 0 range 10 .. 10;
      EDREQ_11 at 0 range 11 .. 11;
      EDREQ_12 at 0 range 12 .. 12;
      EDREQ_13 at 0 range 13 .. 13;
      EDREQ_14 at 0 range 14 .. 14;
      EDREQ_15 at 0 range 15 .. 15;
      EDREQ_16 at 0 range 16 .. 16;
      EDREQ_17 at 0 range 17 .. 17;
      EDREQ_18 at 0 range 18 .. 18;
      EDREQ_19 at 0 range 19 .. 19;
      EDREQ_20 at 0 range 20 .. 20;
      EDREQ_21 at 0 range 21 .. 21;
      EDREQ_22 at 0 range 22 .. 22;
      EDREQ_23 at 0 range 23 .. 23;
      EDREQ_24 at 0 range 24 .. 24;
      EDREQ_25 at 0 range 25 .. 25;
      EDREQ_26 at 0 range 26 .. 26;
      EDREQ_27 at 0 range 27 .. 27;
      EDREQ_28 at 0 range 28 .. 28;
      EDREQ_29 at 0 range 29 .. 29;
      EDREQ_30 at 0 range 30 .. 30;
      EDREQ_31 at 0 range 31 .. 31;
   end record;

   subtype DMA_DCHPRI_CHPRI_Field is HAL.UInt4;
   subtype DMA_DCHPRI_GRPPRI_Field is HAL.UInt2;

   --  Disable Preempt Ability.
   type DCHPRI_DPA_Field is
     (
      --  Channel n can suspend a lower priority channel.
      DCHPRI_DPA_Field_0,
      --  Channel n cannot suspend any channel, regardless of channel priority.
      DCHPRI_DPA_Field_1)
     with Size => 1;
   for DCHPRI_DPA_Field use
     (DCHPRI_DPA_Field_0 => 0,
      DCHPRI_DPA_Field_1 => 1);

   --  Enable Channel Preemption.
   type DCHPRI_ECP_Field is
     (
      --  Channel n cannot be suspended by a higher priority channel's service
      --  request.
      DCHPRI_ECP_Field_0,
      --  Channel n can be temporarily suspended by the service request of a
      --  higher priority channel.
      DCHPRI_ECP_Field_1)
     with Size => 1;
   for DCHPRI_ECP_Field use
     (DCHPRI_ECP_Field_0 => 0,
      DCHPRI_ECP_Field_1 => 1);

   --  Channel n Priority Register
   type DMA_DCHPRI_Register is record
      --  Channel n Arbitration Priority
      CHPRI  : DMA_DCHPRI_CHPRI_Field := 16#0#;
      --  Read-only. Channel n Current Group Priority
      GRPPRI : DMA_DCHPRI_GRPPRI_Field := 16#0#;
      --  Disable Preempt Ability.
      DPA    : DCHPRI_DPA_Field := NRF_SVD.DMA.DCHPRI_DPA_Field_0;
      --  Enable Channel Preemption.
      ECP    : DCHPRI_ECP_Field := NRF_SVD.DMA.DCHPRI_ECP_Field_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_DCHPRI_Register use record
      CHPRI  at 0 range 0 .. 3;
      GRPPRI at 0 range 4 .. 5;
      DPA    at 0 range 6 .. 6;
      ECP    at 0 range 7 .. 7;
   end record;

   --  Channel n Priority Register
   type DMA_DCHPRI_Registers is array (0 .. 31) of DMA_DCHPRI_Register
     with Volatile;

   subtype TCD_ATTR_DSIZE_Field is HAL.UInt3;
   subtype TCD_ATTR_DMOD_Field is HAL.UInt5;

   --  Source data transfer size
   type TCD_ATTR0_SSIZE_Field is
     (
      --  8-bit
      TCD_ATTR0_SSIZE_Field_000,
      --  16-bit
      TCD_ATTR0_SSIZE_Field_001,
      --  32-bit
      TCD_ATTR0_SSIZE_Field_010,
      --  16-byte burst
      TCD_ATTR0_SSIZE_Field_100,
      --  32-byte burst
      TCD_ATTR0_SSIZE_Field_101)
     with Size => 3;
   for TCD_ATTR0_SSIZE_Field use
     (TCD_ATTR0_SSIZE_Field_000 => 0,
      TCD_ATTR0_SSIZE_Field_001 => 1,
      TCD_ATTR0_SSIZE_Field_010 => 2,
      TCD_ATTR0_SSIZE_Field_100 => 4,
      TCD_ATTR0_SSIZE_Field_101 => 5);

   --  Source Address Modulo
   type TCD_ATTR0_SMOD_Field is
     (
      --  Source address modulo feature is disabled
      TCD_ATTR0_SMOD_Field_0)
     with Size => 5;
   for TCD_ATTR0_SMOD_Field use
     (TCD_ATTR0_SMOD_Field_0 => 0);

   --  TCD Transfer Attributes
   type TCD_ATTR_Register is record
      --  Destination data transfer size
      DSIZE : TCD_ATTR_DSIZE_Field := 16#0#;
      --  Destination Address Modulo
      DMOD  : TCD_ATTR_DMOD_Field := 16#0#;
      --  Source data transfer size
      SSIZE : TCD_ATTR0_SSIZE_Field := NRF_SVD.DMA.TCD_ATTR0_SSIZE_Field_000;
      --  Source Address Modulo
      SMOD  : TCD_ATTR0_SMOD_Field := NRF_SVD.DMA.TCD_ATTR0_SMOD_Field_0;
   end record
     with Volatile_Full_Access, Size => 16,
          Bit_Order => System.Low_Order_First;

   for TCD_ATTR_Register use record
      DSIZE at 0 range 0 .. 2;
      DMOD  at 0 range 3 .. 7;
      SSIZE at 0 range 8 .. 10;
      SMOD  at 0 range 11 .. 15;
   end record;

   subtype TCD_NBYTES_MLOFFNO_NBYTES_Field is HAL.UInt30;

   --  Destination Minor Loop Offset enable
   type TCD_NBYTES_MLOFFNO0_DMLOE_Field is
     (
      --  The minor loop offset is not applied to the DADDR
      TCD_NBYTES_MLOFFNO0_DMLOE_Field_0,
      --  The minor loop offset is applied to the DADDR
      TCD_NBYTES_MLOFFNO0_DMLOE_Field_1)
     with Size => 1;
   for TCD_NBYTES_MLOFFNO0_DMLOE_Field use
     (TCD_NBYTES_MLOFFNO0_DMLOE_Field_0 => 0,
      TCD_NBYTES_MLOFFNO0_DMLOE_Field_1 => 1);

   --  Source Minor Loop Offset Enable
   type TCD_NBYTES_MLOFFNO0_SMLOE_Field is
     (
      --  The minor loop offset is not applied to the SADDR
      TCD_NBYTES_MLOFFNO0_SMLOE_Field_0,
      --  The minor loop offset is applied to the SADDR
      TCD_NBYTES_MLOFFNO0_SMLOE_Field_1)
     with Size => 1;
   for TCD_NBYTES_MLOFFNO0_SMLOE_Field use
     (TCD_NBYTES_MLOFFNO0_SMLOE_Field_0 => 0,
      TCD_NBYTES_MLOFFNO0_SMLOE_Field_1 => 1);

   --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and Offset
   --  Disabled)
   type TCD_NBYTES_MLOFFNO_Register is record
      --  Minor Byte Transfer Count
      NBYTES : TCD_NBYTES_MLOFFNO_NBYTES_Field := 16#0#;
      --  Destination Minor Loop Offset enable
      DMLOE  : TCD_NBYTES_MLOFFNO0_DMLOE_Field :=
                NRF_SVD.DMA.TCD_NBYTES_MLOFFNO0_DMLOE_Field_0;
      --  Source Minor Loop Offset Enable
      SMLOE  : TCD_NBYTES_MLOFFNO0_SMLOE_Field :=
                NRF_SVD.DMA.TCD_NBYTES_MLOFFNO0_SMLOE_Field_0;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCD_NBYTES_MLOFFNO_Register use record
      NBYTES at 0 range 0 .. 29;
      DMLOE  at 0 range 30 .. 30;
      SMLOE  at 0 range 31 .. 31;
   end record;

   subtype TCD_NBYTES_MLOFFYES_NBYTES_Field is HAL.UInt10;
   subtype TCD_NBYTES_MLOFFYES_MLOFF_Field is HAL.UInt20;

   --  Destination Minor Loop Offset enable
   type TCD_NBYTES_MLOFFYES0_DMLOE_Field is
     (
      --  The minor loop offset is not applied to the DADDR
      TCD_NBYTES_MLOFFYES0_DMLOE_Field_0,
      --  The minor loop offset is applied to the DADDR
      TCD_NBYTES_MLOFFYES0_DMLOE_Field_1)
     with Size => 1;
   for TCD_NBYTES_MLOFFYES0_DMLOE_Field use
     (TCD_NBYTES_MLOFFYES0_DMLOE_Field_0 => 0,
      TCD_NBYTES_MLOFFYES0_DMLOE_Field_1 => 1);

   --  Source Minor Loop Offset Enable
   type TCD_NBYTES_MLOFFYES0_SMLOE_Field is
     (
      --  The minor loop offset is not applied to the SADDR
      TCD_NBYTES_MLOFFYES0_SMLOE_Field_0,
      --  The minor loop offset is applied to the SADDR
      TCD_NBYTES_MLOFFYES0_SMLOE_Field_1)
     with Size => 1;
   for TCD_NBYTES_MLOFFYES0_SMLOE_Field use
     (TCD_NBYTES_MLOFFYES0_SMLOE_Field_0 => 0,
      TCD_NBYTES_MLOFFYES0_SMLOE_Field_1 => 1);

   --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset Enabled)
   type TCD_NBYTES_MLOFFYES_Register is record
      --  Minor Byte Transfer Count
      NBYTES : TCD_NBYTES_MLOFFYES_NBYTES_Field := 16#0#;
      --  If SMLOE or DMLOE is set, this field represents a sign-extended
      --  offset applied to the source or destination address to form the
      --  next-state value after the minor loop completes.
      MLOFF  : TCD_NBYTES_MLOFFYES_MLOFF_Field := 16#0#;
      --  Destination Minor Loop Offset enable
      DMLOE  : TCD_NBYTES_MLOFFYES0_DMLOE_Field :=
                NRF_SVD.DMA.TCD_NBYTES_MLOFFYES0_DMLOE_Field_0;
      --  Source Minor Loop Offset Enable
      SMLOE  : TCD_NBYTES_MLOFFYES0_SMLOE_Field :=
                NRF_SVD.DMA.TCD_NBYTES_MLOFFYES0_SMLOE_Field_0;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCD_NBYTES_MLOFFYES_Register use record
      NBYTES at 0 range 0 .. 9;
      MLOFF  at 0 range 10 .. 29;
      DMLOE  at 0 range 30 .. 30;
      SMLOE  at 0 range 31 .. 31;
   end record;

   subtype TCD_CITER_ELINKNO_CITER_Field is HAL.UInt15;

   --  Enable channel-to-channel linking on minor-loop complete
   type TCD_CITER_ELINKNO0_ELINK_Field is
     (
      --  The channel-to-channel linking is disabled
      TCD_CITER_ELINKNO0_ELINK_Field_0,
      --  The channel-to-channel linking is enabled
      TCD_CITER_ELINKNO0_ELINK_Field_1)
     with Size => 1;
   for TCD_CITER_ELINKNO0_ELINK_Field use
     (TCD_CITER_ELINKNO0_ELINK_Field_0 => 0,
      TCD_CITER_ELINKNO0_ELINK_Field_1 => 1);

   --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking Disabled)
   type TCD_CITER_ELINKNO_Register is record
      --  Current Major Iteration Count
      CITER : TCD_CITER_ELINKNO_CITER_Field := 16#0#;
      --  Enable channel-to-channel linking on minor-loop complete
      ELINK : TCD_CITER_ELINKNO0_ELINK_Field :=
               NRF_SVD.DMA.TCD_CITER_ELINKNO0_ELINK_Field_0;
   end record
     with Volatile_Full_Access, Size => 16,
          Bit_Order => System.Low_Order_First;

   for TCD_CITER_ELINKNO_Register use record
      CITER at 0 range 0 .. 14;
      ELINK at 0 range 15 .. 15;
   end record;

   subtype TCD_CITER_ELINKYES_CITER_Field is HAL.UInt9;
   subtype TCD_CITER_ELINKYES_LINKCH_Field is HAL.UInt5;

   --  Enable channel-to-channel linking on minor-loop complete
   type TCD_CITER_ELINKYES0_ELINK_Field is
     (
      --  The channel-to-channel linking is disabled
      TCD_CITER_ELINKYES0_ELINK_Field_0,
      --  The channel-to-channel linking is enabled
      TCD_CITER_ELINKYES0_ELINK_Field_1)
     with Size => 1;
   for TCD_CITER_ELINKYES0_ELINK_Field use
     (TCD_CITER_ELINKYES0_ELINK_Field_0 => 0,
      TCD_CITER_ELINKYES0_ELINK_Field_1 => 1);

   --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking Enabled)
   type TCD_CITER_ELINKYES_Register is record
      --  Current Major Iteration Count
      CITER          : TCD_CITER_ELINKYES_CITER_Field := 16#0#;
      --  Minor Loop Link Channel Number
      LINKCH         : TCD_CITER_ELINKYES_LINKCH_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : HAL.Bit := 16#0#;
      --  Enable channel-to-channel linking on minor-loop complete
      ELINK          : TCD_CITER_ELINKYES0_ELINK_Field :=
                        NRF_SVD.DMA.TCD_CITER_ELINKYES0_ELINK_Field_0;
   end record
     with Volatile_Full_Access, Size => 16,
          Bit_Order => System.Low_Order_First;

   for TCD_CITER_ELINKYES_Register use record
      CITER          at 0 range 0 .. 8;
      LINKCH         at 0 range 9 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      ELINK          at 0 range 15 .. 15;
   end record;

   --  Channel Start
   type TCD_CSR0_START_Field is
     (
      --  The channel is not explicitly started.
      TCD_CSR0_START_Field_0,
      --  The channel is explicitly started via a software initiated service
      --  request.
      TCD_CSR0_START_Field_1)
     with Size => 1;
   for TCD_CSR0_START_Field use
     (TCD_CSR0_START_Field_0 => 0,
      TCD_CSR0_START_Field_1 => 1);

   --  Enable an interrupt when major iteration count completes.
   type TCD_CSR0_INTMAJOR_Field is
     (
      --  The end-of-major loop interrupt is disabled.
      TCD_CSR0_INTMAJOR_Field_0,
      --  The end-of-major loop interrupt is enabled.
      TCD_CSR0_INTMAJOR_Field_1)
     with Size => 1;
   for TCD_CSR0_INTMAJOR_Field use
     (TCD_CSR0_INTMAJOR_Field_0 => 0,
      TCD_CSR0_INTMAJOR_Field_1 => 1);

   --  Enable an interrupt when major counter is half complete.
   type TCD_CSR0_INTHALF_Field is
     (
      --  The half-point interrupt is disabled.
      TCD_CSR0_INTHALF_Field_0,
      --  The half-point interrupt is enabled.
      TCD_CSR0_INTHALF_Field_1)
     with Size => 1;
   for TCD_CSR0_INTHALF_Field use
     (TCD_CSR0_INTHALF_Field_0 => 0,
      TCD_CSR0_INTHALF_Field_1 => 1);

   --  Disable Request
   type TCD_CSR0_DREQ_Field is
     (
      --  The channel's ERQ bit is not affected.
      TCD_CSR0_DREQ_Field_0,
      --  The channel's ERQ bit is cleared when the major loop is complete.
      TCD_CSR0_DREQ_Field_1)
     with Size => 1;
   for TCD_CSR0_DREQ_Field use
     (TCD_CSR0_DREQ_Field_0 => 0,
      TCD_CSR0_DREQ_Field_1 => 1);

   --  Enable Scatter/Gather Processing
   type TCD_CSR0_ESG_Field is
     (
      --  The current channel's TCD is normal format.
      TCD_CSR0_ESG_Field_0,
      --  The current channel's TCD specifies a scatter gather format. The
      --  DLASTSGA field provides a memory pointer to the next TCD to be loaded
      --  into this channel after the major loop completes its execution.
      TCD_CSR0_ESG_Field_1)
     with Size => 1;
   for TCD_CSR0_ESG_Field use
     (TCD_CSR0_ESG_Field_0 => 0,
      TCD_CSR0_ESG_Field_1 => 1);

   --  Enable channel-to-channel linking on major loop complete
   type TCD_CSR0_MAJORELINK_Field is
     (
      --  The channel-to-channel linking is disabled.
      TCD_CSR0_MAJORELINK_Field_0,
      --  The channel-to-channel linking is enabled.
      TCD_CSR0_MAJORELINK_Field_1)
     with Size => 1;
   for TCD_CSR0_MAJORELINK_Field use
     (TCD_CSR0_MAJORELINK_Field_0 => 0,
      TCD_CSR0_MAJORELINK_Field_1 => 1);

   subtype TCD_CSR_MAJORLINKCH_Field is HAL.UInt5;

   --  Bandwidth Control
   type TCD_CSR0_BWC_Field is
     (
      --  No eDMA engine stalls
      TCD_CSR0_BWC_Field_00,
      --  eDMA engine stalls for 4 cycles after each R/W.
      TCD_CSR0_BWC_Field_10,
      --  eDMA engine stalls for 8 cycles after each R/W.
      TCD_CSR0_BWC_Field_11)
     with Size => 2;
   for TCD_CSR0_BWC_Field use
     (TCD_CSR0_BWC_Field_00 => 0,
      TCD_CSR0_BWC_Field_10 => 2,
      TCD_CSR0_BWC_Field_11 => 3);

   --  TCD Control and Status
   type TCD_CSR_Register is record
      --  Channel Start
      START          : TCD_CSR0_START_Field :=
                        NRF_SVD.DMA.TCD_CSR0_START_Field_0;
      --  Enable an interrupt when major iteration count completes.
      INTMAJOR       : TCD_CSR0_INTMAJOR_Field :=
                        NRF_SVD.DMA.TCD_CSR0_INTMAJOR_Field_0;
      --  Enable an interrupt when major counter is half complete.
      INTHALF        : TCD_CSR0_INTHALF_Field :=
                        NRF_SVD.DMA.TCD_CSR0_INTHALF_Field_0;
      --  Disable Request
      DREQ           : TCD_CSR0_DREQ_Field :=
                        NRF_SVD.DMA.TCD_CSR0_DREQ_Field_0;
      --  Enable Scatter/Gather Processing
      ESG            : TCD_CSR0_ESG_Field := NRF_SVD.DMA.TCD_CSR0_ESG_Field_0;
      --  Enable channel-to-channel linking on major loop complete
      MAJORELINK     : TCD_CSR0_MAJORELINK_Field :=
                        NRF_SVD.DMA.TCD_CSR0_MAJORELINK_Field_0;
      --  Channel Active
      ACTIVE         : Boolean := False;
      --  Channel Done
      DONE           : Boolean := False;
      --  Major Loop Link Channel Number
      MAJORLINKCH    : TCD_CSR_MAJORLINKCH_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : HAL.Bit := 16#0#;
      --  Bandwidth Control
      BWC            : TCD_CSR0_BWC_Field :=
                        NRF_SVD.DMA.TCD_CSR0_BWC_Field_00;
   end record
     with Volatile_Full_Access, Size => 16,
          Bit_Order => System.Low_Order_First;

   for TCD_CSR_Register use record
      START          at 0 range 0 .. 0;
      INTMAJOR       at 0 range 1 .. 1;
      INTHALF        at 0 range 2 .. 2;
      DREQ           at 0 range 3 .. 3;
      ESG            at 0 range 4 .. 4;
      MAJORELINK     at 0 range 5 .. 5;
      ACTIVE         at 0 range 6 .. 6;
      DONE           at 0 range 7 .. 7;
      MAJORLINKCH    at 0 range 8 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      BWC            at 0 range 14 .. 15;
   end record;

   subtype TCD_BITER_ELINKNO_BITER_Field is HAL.UInt15;

   --  Enables channel-to-channel linking on minor loop complete
   type TCD_BITER_ELINKNO0_ELINK_Field is
     (
      --  The channel-to-channel linking is disabled
      TCD_BITER_ELINKNO0_ELINK_Field_0,
      --  The channel-to-channel linking is enabled
      TCD_BITER_ELINKNO0_ELINK_Field_1)
     with Size => 1;
   for TCD_BITER_ELINKNO0_ELINK_Field use
     (TCD_BITER_ELINKNO0_ELINK_Field_0 => 0,
      TCD_BITER_ELINKNO0_ELINK_Field_1 => 1);

   --  TCD Beginning Minor Loop Link, Major Loop Count (Channel Linking
   --  Disabled)
   type TCD_BITER_ELINKNO_Register is record
      --  Starting Major Iteration Count
      BITER : TCD_BITER_ELINKNO_BITER_Field := 16#0#;
      --  Enables channel-to-channel linking on minor loop complete
      ELINK : TCD_BITER_ELINKNO0_ELINK_Field :=
               NRF_SVD.DMA.TCD_BITER_ELINKNO0_ELINK_Field_0;
   end record
     with Volatile_Full_Access, Size => 16,
          Bit_Order => System.Low_Order_First;

   for TCD_BITER_ELINKNO_Register use record
      BITER at 0 range 0 .. 14;
      ELINK at 0 range 15 .. 15;
   end record;

   subtype TCD_BITER_ELINKYES_BITER_Field is HAL.UInt9;
   subtype TCD_BITER_ELINKYES_LINKCH_Field is HAL.UInt5;

   --  Enables channel-to-channel linking on minor loop complete
   type TCD_BITER_ELINKYES0_ELINK_Field is
     (
      --  The channel-to-channel linking is disabled
      TCD_BITER_ELINKYES0_ELINK_Field_0,
      --  The channel-to-channel linking is enabled
      TCD_BITER_ELINKYES0_ELINK_Field_1)
     with Size => 1;
   for TCD_BITER_ELINKYES0_ELINK_Field use
     (TCD_BITER_ELINKYES0_ELINK_Field_0 => 0,
      TCD_BITER_ELINKYES0_ELINK_Field_1 => 1);

   --  TCD Beginning Minor Loop Link, Major Loop Count (Channel Linking
   --  Enabled)
   type TCD_BITER_ELINKYES_Register is record
      --  Starting major iteration count
      BITER          : TCD_BITER_ELINKYES_BITER_Field := 16#0#;
      --  Link Channel Number
      LINKCH         : TCD_BITER_ELINKYES_LINKCH_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : HAL.Bit := 16#0#;
      --  Enables channel-to-channel linking on minor loop complete
      ELINK          : TCD_BITER_ELINKYES0_ELINK_Field :=
                        NRF_SVD.DMA.TCD_BITER_ELINKYES0_ELINK_Field_0;
   end record
     with Volatile_Full_Access, Size => 16,
          Bit_Order => System.Low_Order_First;

   for TCD_BITER_ELINKYES_Register use record
      BITER          at 0 range 0 .. 8;
      LINKCH         at 0 range 9 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      ELINK          at 0 range 15 .. 15;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type DMA_Disc is
     (
      No0,
      Offno0,
      Offyes0,
      Yes0,
      No1,
      Offno1,
      Offyes1,
      Yes1,
      No2,
      Offno2,
      Offyes2,
      Yes2,
      No3,
      Offno3,
      Offyes3,
      Yes3,
      No4,
      Offno4,
      Offyes4,
      Yes4,
      No5,
      Offno5,
      Offyes5,
      Yes5,
      No6,
      Offno6,
      Offyes6,
      Yes6,
      No7,
      Offno7,
      Offyes7,
      Yes7,
      No8,
      Offno8,
      Offyes8,
      Yes8,
      No9,
      Offno9,
      Offyes9,
      Yes9,
      No10,
      Offno10,
      Offyes10,
      Yes10,
      No11,
      Offno11,
      Offyes11,
      Yes11,
      No12,
      Offno12,
      Offyes12,
      Yes12,
      No13,
      Offno13,
      Offyes13,
      Yes13,
      No14,
      Offno14,
      Offyes14,
      Yes14,
      No15,
      Offno15,
      Offyes15,
      Yes15,
      No16,
      Offno16,
      Offyes16,
      Yes16,
      No17,
      Offno17,
      Offyes17,
      Yes17,
      No18,
      Offno18,
      Offyes18,
      Yes18,
      No19,
      Offno19,
      Offyes19,
      Yes19,
      No20,
      Offno20,
      Offyes20,
      Yes20,
      No21,
      Offno21,
      Offyes21,
      Yes21,
      No22,
      Offno22,
      Offyes22,
      Yes22,
      No23,
      Offno23,
      Offyes23,
      Yes23,
      No24,
      Offno24,
      Offyes24,
      Yes24,
      No25,
      Offno25,
      Offyes25,
      Yes25,
      No26,
      Offno26,
      Offyes26,
      Yes26,
      No27,
      Offno27,
      Offyes27,
      Yes27,
      No28,
      Offno28,
      Offyes28,
      Yes28,
      No29,
      Offno29,
      Offyes29,
      Yes29,
      No30,
      Offno30,
      Offyes30,
      Yes30,
      No31,
      Offno31,
      Offyes31,
      Yes31);

   --  Enhanced direct memory access controller
   type DMA_Peripheral
     (Discriminent : DMA_Disc := No0)
   is record
      --  Control Register
      CR                    : aliased DMA_CR_Register;
      --  Error Status Register
      ES                    : aliased DMA_ES_Register;
      --  Enable Request Register
      ERQ                   : aliased DMA_ERQ_Register;
      --  Enable Error Interrupt Register
      EEI                   : aliased DMA_EEI_Register;
      --  Clear Enable Error Interrupt Register
      CEEI                  : aliased DMA_CEEI_Register;
      --  Set Enable Error Interrupt Register
      SEEI                  : aliased DMA_SEEI_Register;
      --  Clear Enable Request Register
      CERQ                  : aliased DMA_CERQ_Register;
      --  Set Enable Request Register
      SERQ                  : aliased DMA_SERQ_Register;
      --  Clear DONE Status Bit Register
      CDNE                  : aliased DMA_CDNE_Register;
      --  Set START Bit Register
      SSRT                  : aliased DMA_SSRT_Register;
      --  Clear Error Register
      CERR                  : aliased DMA_CERR_Register;
      --  Clear Interrupt Request Register
      CINT                  : aliased DMA_CINT_Register;
      --  Interrupt Request Register
      INT                   : aliased DMA_INT_Register;
      --  Error Register
      ERR                   : aliased DMA_ERR_Register;
      --  Hardware Request Status Register
      HRS                   : aliased DMA_HRS_Register;
      --  Enable Asynchronous Request in Stop Register
      EARS                  : aliased DMA_EARS_Register;
      --  Channel n Priority Register
      DCHPRI                : aliased DMA_DCHPRI_Registers;
      --  TCD Source Address
      TCD_SADDR0            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF0             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR0             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST0            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR0            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF0             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA0         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR0              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR1            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF1             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR1             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST1            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR1            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF1             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA1         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR1              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR2            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF2             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR2             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST2            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR2            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF2             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA2         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR2              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR3            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF3             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR3             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST3            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR3            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF3             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA3         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR3              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR4            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF4             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR4             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST4            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR4            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF4             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA4         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR4              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR5            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF5             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR5             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST5            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR5            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF5             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA5         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR5              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR6            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF6             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR6             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST6            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR6            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF6             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA6         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR6              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR7            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF7             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR7             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST7            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR7            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF7             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA7         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR7              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR8            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF8             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR8             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST8            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR8            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF8             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA8         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR8              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR9            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF9             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR9             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST9            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR9            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF9             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA9         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR9              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR10           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF10            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR10            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST10           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR10           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF10            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA10        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR10             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR11           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF11            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR11            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST11           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR11           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF11            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA11        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR11             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR12           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF12            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR12            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST12           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR12           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF12            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA12        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR12             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR13           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF13            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR13            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST13           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR13           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF13            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA13        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR13             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR14           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF14            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR14            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST14           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR14           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF14            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA14        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR14             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR15           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF15            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR15            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST15           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR15           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF15            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA15        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR15             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR16           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF16            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR16            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST16           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR16           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF16            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA16        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR16             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR17           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF17            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR17            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST17           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR17           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF17            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA17        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR17             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR18           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF18            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR18            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST18           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR18           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF18            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA18        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR18             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR19           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF19            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR19            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST19           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR19           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF19            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA19        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR19             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR20           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF20            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR20            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST20           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR20           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF20            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA20        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR20             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR21           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF21            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR21            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST21           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR21           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF21            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA21        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR21             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR22           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF22            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR22            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST22           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR22           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF22            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA22        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR22             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR23           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF23            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR23            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST23           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR23           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF23            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA23        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR23             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR24           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF24            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR24            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST24           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR24           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF24            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA24        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR24             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR25           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF25            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR25            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST25           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR25           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF25            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA25        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR25             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR26           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF26            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR26            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST26           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR26           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF26            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA26        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR26             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR27           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF27            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR27            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST27           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR27           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF27            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA27        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR27             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR28           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF28            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR28            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST28           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR28           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF28            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA28        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR28             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR29           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF29            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR29            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST29           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR29           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF29            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA29        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR29             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR30           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF30            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR30            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST30           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR30           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF30            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA30        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR30             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR31           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF31            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR31            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST31           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR31           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF31            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA31        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR31             : aliased TCD_CSR_Register;
      case Discriminent is
         when No0 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO0 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO0 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO0 : aliased TCD_BITER_ELINKNO_Register;
         when Offno0 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO0 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes0 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES0 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes0 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES0 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES0 : aliased TCD_BITER_ELINKYES_Register;
         when No1 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO1 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO1 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO1 : aliased TCD_BITER_ELINKNO_Register;
         when Offno1 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO1 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes1 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES1 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes1 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES1 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES1 : aliased TCD_BITER_ELINKYES_Register;
         when No2 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO2 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO2 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO2 : aliased TCD_BITER_ELINKNO_Register;
         when Offno2 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO2 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes2 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES2 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes2 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES2 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES2 : aliased TCD_BITER_ELINKYES_Register;
         when No3 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO3 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO3 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO3 : aliased TCD_BITER_ELINKNO_Register;
         when Offno3 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO3 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes3 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES3 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes3 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES3 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES3 : aliased TCD_BITER_ELINKYES_Register;
         when No4 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO4 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO4 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO4 : aliased TCD_BITER_ELINKNO_Register;
         when Offno4 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO4 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes4 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES4 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes4 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES4 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES4 : aliased TCD_BITER_ELINKYES_Register;
         when No5 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO5 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO5 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO5 : aliased TCD_BITER_ELINKNO_Register;
         when Offno5 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO5 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes5 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES5 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes5 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES5 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES5 : aliased TCD_BITER_ELINKYES_Register;
         when No6 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO6 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO6 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO6 : aliased TCD_BITER_ELINKNO_Register;
         when Offno6 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO6 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes6 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES6 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes6 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES6 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES6 : aliased TCD_BITER_ELINKYES_Register;
         when No7 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO7 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO7 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO7 : aliased TCD_BITER_ELINKNO_Register;
         when Offno7 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO7 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes7 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES7 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes7 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES7 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES7 : aliased TCD_BITER_ELINKYES_Register;
         when No8 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO8 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO8 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO8 : aliased TCD_BITER_ELINKNO_Register;
         when Offno8 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO8 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes8 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES8 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes8 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES8 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES8 : aliased TCD_BITER_ELINKYES_Register;
         when No9 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO9 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO9 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO9 : aliased TCD_BITER_ELINKNO_Register;
         when Offno9 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO9 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes9 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES9 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes9 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES9 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES9 : aliased TCD_BITER_ELINKYES_Register;
         when No10 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO10 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO10 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO10 : aliased TCD_BITER_ELINKNO_Register;
         when Offno10 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO10 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes10 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES10 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes10 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES10 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES10 : aliased TCD_BITER_ELINKYES_Register;
         when No11 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO11 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO11 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO11 : aliased TCD_BITER_ELINKNO_Register;
         when Offno11 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO11 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes11 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES11 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes11 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES11 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES11 : aliased TCD_BITER_ELINKYES_Register;
         when No12 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO12 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO12 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO12 : aliased TCD_BITER_ELINKNO_Register;
         when Offno12 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO12 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes12 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES12 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes12 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES12 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES12 : aliased TCD_BITER_ELINKYES_Register;
         when No13 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO13 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO13 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO13 : aliased TCD_BITER_ELINKNO_Register;
         when Offno13 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO13 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes13 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES13 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes13 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES13 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES13 : aliased TCD_BITER_ELINKYES_Register;
         when No14 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO14 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO14 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO14 : aliased TCD_BITER_ELINKNO_Register;
         when Offno14 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO14 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes14 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES14 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes14 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES14 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES14 : aliased TCD_BITER_ELINKYES_Register;
         when No15 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO15 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO15 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO15 : aliased TCD_BITER_ELINKNO_Register;
         when Offno15 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO15 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes15 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES15 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes15 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES15 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES15 : aliased TCD_BITER_ELINKYES_Register;
         when No16 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO16 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO16 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO16 : aliased TCD_BITER_ELINKNO_Register;
         when Offno16 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO16 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes16 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES16 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes16 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES16 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES16 : aliased TCD_BITER_ELINKYES_Register;
         when No17 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO17 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO17 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO17 : aliased TCD_BITER_ELINKNO_Register;
         when Offno17 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO17 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes17 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES17 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes17 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES17 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES17 : aliased TCD_BITER_ELINKYES_Register;
         when No18 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO18 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO18 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO18 : aliased TCD_BITER_ELINKNO_Register;
         when Offno18 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO18 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes18 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES18 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes18 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES18 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES18 : aliased TCD_BITER_ELINKYES_Register;
         when No19 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO19 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO19 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO19 : aliased TCD_BITER_ELINKNO_Register;
         when Offno19 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO19 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes19 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES19 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes19 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES19 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES19 : aliased TCD_BITER_ELINKYES_Register;
         when No20 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO20 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO20 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO20 : aliased TCD_BITER_ELINKNO_Register;
         when Offno20 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO20 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes20 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES20 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes20 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES20 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES20 : aliased TCD_BITER_ELINKYES_Register;
         when No21 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO21 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO21 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO21 : aliased TCD_BITER_ELINKNO_Register;
         when Offno21 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO21 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes21 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES21 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes21 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES21 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES21 : aliased TCD_BITER_ELINKYES_Register;
         when No22 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO22 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO22 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO22 : aliased TCD_BITER_ELINKNO_Register;
         when Offno22 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO22 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes22 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES22 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes22 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES22 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES22 : aliased TCD_BITER_ELINKYES_Register;
         when No23 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO23 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO23 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO23 : aliased TCD_BITER_ELINKNO_Register;
         when Offno23 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO23 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes23 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES23 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes23 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES23 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES23 : aliased TCD_BITER_ELINKYES_Register;
         when No24 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO24 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO24 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO24 : aliased TCD_BITER_ELINKNO_Register;
         when Offno24 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO24 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes24 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES24 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes24 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES24 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES24 : aliased TCD_BITER_ELINKYES_Register;
         when No25 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO25 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO25 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO25 : aliased TCD_BITER_ELINKNO_Register;
         when Offno25 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO25 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes25 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES25 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes25 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES25 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES25 : aliased TCD_BITER_ELINKYES_Register;
         when No26 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO26 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO26 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO26 : aliased TCD_BITER_ELINKNO_Register;
         when Offno26 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO26 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes26 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES26 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes26 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES26 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES26 : aliased TCD_BITER_ELINKYES_Register;
         when No27 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO27 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO27 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO27 : aliased TCD_BITER_ELINKNO_Register;
         when Offno27 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO27 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes27 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES27 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes27 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES27 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES27 : aliased TCD_BITER_ELINKYES_Register;
         when No28 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO28 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO28 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO28 : aliased TCD_BITER_ELINKNO_Register;
         when Offno28 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO28 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes28 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES28 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes28 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES28 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES28 : aliased TCD_BITER_ELINKYES_Register;
         when No29 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO29 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO29 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO29 : aliased TCD_BITER_ELINKNO_Register;
         when Offno29 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO29 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes29 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES29 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes29 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES29 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES29 : aliased TCD_BITER_ELINKYES_Register;
         when No30 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO30 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO30 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO30 : aliased TCD_BITER_ELINKNO_Register;
         when Offno30 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO30 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes30 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES30 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes30 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES30 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES30 : aliased TCD_BITER_ELINKYES_Register;
         when No31 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO31 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO31 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO31 : aliased TCD_BITER_ELINKNO_Register;
         when Offno31 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO31 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes31 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES31 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes31 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES31 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES31 : aliased TCD_BITER_ELINKYES_Register;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for DMA_Peripheral use record
      CR                    at 16#0# range 0 .. 31;
      ES                    at 16#4# range 0 .. 31;
      ERQ                   at 16#C# range 0 .. 31;
      EEI                   at 16#14# range 0 .. 31;
      CEEI                  at 16#18# range 0 .. 7;
      SEEI                  at 16#19# range 0 .. 7;
      CERQ                  at 16#1A# range 0 .. 7;
      SERQ                  at 16#1B# range 0 .. 7;
      CDNE                  at 16#1C# range 0 .. 7;
      SSRT                  at 16#1D# range 0 .. 7;
      CERR                  at 16#1E# range 0 .. 7;
      CINT                  at 16#1F# range 0 .. 7;
      INT                   at 16#24# range 0 .. 31;
      ERR                   at 16#2C# range 0 .. 31;
      HRS                   at 16#34# range 0 .. 31;
      EARS                  at 16#44# range 0 .. 31;
      DCHPRI                at 16#100# range 0 .. 255;
      TCD_SADDR0            at 16#1000# range 0 .. 31;
      TCD_SOFF0             at 16#1004# range 0 .. 15;
      TCD_ATTR0             at 16#1006# range 0 .. 15;
      TCD_SLAST0            at 16#100C# range 0 .. 31;
      TCD_DADDR0            at 16#1010# range 0 .. 31;
      TCD_DOFF0             at 16#1014# range 0 .. 15;
      TCD_DLASTSGA0         at 16#1018# range 0 .. 31;
      TCD_CSR0              at 16#101C# range 0 .. 15;
      TCD_SADDR1            at 16#1020# range 0 .. 31;
      TCD_SOFF1             at 16#1024# range 0 .. 15;
      TCD_ATTR1             at 16#1026# range 0 .. 15;
      TCD_SLAST1            at 16#102C# range 0 .. 31;
      TCD_DADDR1            at 16#1030# range 0 .. 31;
      TCD_DOFF1             at 16#1034# range 0 .. 15;
      TCD_DLASTSGA1         at 16#1038# range 0 .. 31;
      TCD_CSR1              at 16#103C# range 0 .. 15;
      TCD_SADDR2            at 16#1040# range 0 .. 31;
      TCD_SOFF2             at 16#1044# range 0 .. 15;
      TCD_ATTR2             at 16#1046# range 0 .. 15;
      TCD_SLAST2            at 16#104C# range 0 .. 31;
      TCD_DADDR2            at 16#1050# range 0 .. 31;
      TCD_DOFF2             at 16#1054# range 0 .. 15;
      TCD_DLASTSGA2         at 16#1058# range 0 .. 31;
      TCD_CSR2              at 16#105C# range 0 .. 15;
      TCD_SADDR3            at 16#1060# range 0 .. 31;
      TCD_SOFF3             at 16#1064# range 0 .. 15;
      TCD_ATTR3             at 16#1066# range 0 .. 15;
      TCD_SLAST3            at 16#106C# range 0 .. 31;
      TCD_DADDR3            at 16#1070# range 0 .. 31;
      TCD_DOFF3             at 16#1074# range 0 .. 15;
      TCD_DLASTSGA3         at 16#1078# range 0 .. 31;
      TCD_CSR3              at 16#107C# range 0 .. 15;
      TCD_SADDR4            at 16#1080# range 0 .. 31;
      TCD_SOFF4             at 16#1084# range 0 .. 15;
      TCD_ATTR4             at 16#1086# range 0 .. 15;
      TCD_SLAST4            at 16#108C# range 0 .. 31;
      TCD_DADDR4            at 16#1090# range 0 .. 31;
      TCD_DOFF4             at 16#1094# range 0 .. 15;
      TCD_DLASTSGA4         at 16#1098# range 0 .. 31;
      TCD_CSR4              at 16#109C# range 0 .. 15;
      TCD_SADDR5            at 16#10A0# range 0 .. 31;
      TCD_SOFF5             at 16#10A4# range 0 .. 15;
      TCD_ATTR5             at 16#10A6# range 0 .. 15;
      TCD_SLAST5            at 16#10AC# range 0 .. 31;
      TCD_DADDR5            at 16#10B0# range 0 .. 31;
      TCD_DOFF5             at 16#10B4# range 0 .. 15;
      TCD_DLASTSGA5         at 16#10B8# range 0 .. 31;
      TCD_CSR5              at 16#10BC# range 0 .. 15;
      TCD_SADDR6            at 16#10C0# range 0 .. 31;
      TCD_SOFF6             at 16#10C4# range 0 .. 15;
      TCD_ATTR6             at 16#10C6# range 0 .. 15;
      TCD_SLAST6            at 16#10CC# range 0 .. 31;
      TCD_DADDR6            at 16#10D0# range 0 .. 31;
      TCD_DOFF6             at 16#10D4# range 0 .. 15;
      TCD_DLASTSGA6         at 16#10D8# range 0 .. 31;
      TCD_CSR6              at 16#10DC# range 0 .. 15;
      TCD_SADDR7            at 16#10E0# range 0 .. 31;
      TCD_SOFF7             at 16#10E4# range 0 .. 15;
      TCD_ATTR7             at 16#10E6# range 0 .. 15;
      TCD_SLAST7            at 16#10EC# range 0 .. 31;
      TCD_DADDR7            at 16#10F0# range 0 .. 31;
      TCD_DOFF7             at 16#10F4# range 0 .. 15;
      TCD_DLASTSGA7         at 16#10F8# range 0 .. 31;
      TCD_CSR7              at 16#10FC# range 0 .. 15;
      TCD_SADDR8            at 16#1100# range 0 .. 31;
      TCD_SOFF8             at 16#1104# range 0 .. 15;
      TCD_ATTR8             at 16#1106# range 0 .. 15;
      TCD_SLAST8            at 16#110C# range 0 .. 31;
      TCD_DADDR8            at 16#1110# range 0 .. 31;
      TCD_DOFF8             at 16#1114# range 0 .. 15;
      TCD_DLASTSGA8         at 16#1118# range 0 .. 31;
      TCD_CSR8              at 16#111C# range 0 .. 15;
      TCD_SADDR9            at 16#1120# range 0 .. 31;
      TCD_SOFF9             at 16#1124# range 0 .. 15;
      TCD_ATTR9             at 16#1126# range 0 .. 15;
      TCD_SLAST9            at 16#112C# range 0 .. 31;
      TCD_DADDR9            at 16#1130# range 0 .. 31;
      TCD_DOFF9             at 16#1134# range 0 .. 15;
      TCD_DLASTSGA9         at 16#1138# range 0 .. 31;
      TCD_CSR9              at 16#113C# range 0 .. 15;
      TCD_SADDR10           at 16#1140# range 0 .. 31;
      TCD_SOFF10            at 16#1144# range 0 .. 15;
      TCD_ATTR10            at 16#1146# range 0 .. 15;
      TCD_SLAST10           at 16#114C# range 0 .. 31;
      TCD_DADDR10           at 16#1150# range 0 .. 31;
      TCD_DOFF10            at 16#1154# range 0 .. 15;
      TCD_DLASTSGA10        at 16#1158# range 0 .. 31;
      TCD_CSR10             at 16#115C# range 0 .. 15;
      TCD_SADDR11           at 16#1160# range 0 .. 31;
      TCD_SOFF11            at 16#1164# range 0 .. 15;
      TCD_ATTR11            at 16#1166# range 0 .. 15;
      TCD_SLAST11           at 16#116C# range 0 .. 31;
      TCD_DADDR11           at 16#1170# range 0 .. 31;
      TCD_DOFF11            at 16#1174# range 0 .. 15;
      TCD_DLASTSGA11        at 16#1178# range 0 .. 31;
      TCD_CSR11             at 16#117C# range 0 .. 15;
      TCD_SADDR12           at 16#1180# range 0 .. 31;
      TCD_SOFF12            at 16#1184# range 0 .. 15;
      TCD_ATTR12            at 16#1186# range 0 .. 15;
      TCD_SLAST12           at 16#118C# range 0 .. 31;
      TCD_DADDR12           at 16#1190# range 0 .. 31;
      TCD_DOFF12            at 16#1194# range 0 .. 15;
      TCD_DLASTSGA12        at 16#1198# range 0 .. 31;
      TCD_CSR12             at 16#119C# range 0 .. 15;
      TCD_SADDR13           at 16#11A0# range 0 .. 31;
      TCD_SOFF13            at 16#11A4# range 0 .. 15;
      TCD_ATTR13            at 16#11A6# range 0 .. 15;
      TCD_SLAST13           at 16#11AC# range 0 .. 31;
      TCD_DADDR13           at 16#11B0# range 0 .. 31;
      TCD_DOFF13            at 16#11B4# range 0 .. 15;
      TCD_DLASTSGA13        at 16#11B8# range 0 .. 31;
      TCD_CSR13             at 16#11BC# range 0 .. 15;
      TCD_SADDR14           at 16#11C0# range 0 .. 31;
      TCD_SOFF14            at 16#11C4# range 0 .. 15;
      TCD_ATTR14            at 16#11C6# range 0 .. 15;
      TCD_SLAST14           at 16#11CC# range 0 .. 31;
      TCD_DADDR14           at 16#11D0# range 0 .. 31;
      TCD_DOFF14            at 16#11D4# range 0 .. 15;
      TCD_DLASTSGA14        at 16#11D8# range 0 .. 31;
      TCD_CSR14             at 16#11DC# range 0 .. 15;
      TCD_SADDR15           at 16#11E0# range 0 .. 31;
      TCD_SOFF15            at 16#11E4# range 0 .. 15;
      TCD_ATTR15            at 16#11E6# range 0 .. 15;
      TCD_SLAST15           at 16#11EC# range 0 .. 31;
      TCD_DADDR15           at 16#11F0# range 0 .. 31;
      TCD_DOFF15            at 16#11F4# range 0 .. 15;
      TCD_DLASTSGA15        at 16#11F8# range 0 .. 31;
      TCD_CSR15             at 16#11FC# range 0 .. 15;
      TCD_SADDR16           at 16#1200# range 0 .. 31;
      TCD_SOFF16            at 16#1204# range 0 .. 15;
      TCD_ATTR16            at 16#1206# range 0 .. 15;
      TCD_SLAST16           at 16#120C# range 0 .. 31;
      TCD_DADDR16           at 16#1210# range 0 .. 31;
      TCD_DOFF16            at 16#1214# range 0 .. 15;
      TCD_DLASTSGA16        at 16#1218# range 0 .. 31;
      TCD_CSR16             at 16#121C# range 0 .. 15;
      TCD_SADDR17           at 16#1220# range 0 .. 31;
      TCD_SOFF17            at 16#1224# range 0 .. 15;
      TCD_ATTR17            at 16#1226# range 0 .. 15;
      TCD_SLAST17           at 16#122C# range 0 .. 31;
      TCD_DADDR17           at 16#1230# range 0 .. 31;
      TCD_DOFF17            at 16#1234# range 0 .. 15;
      TCD_DLASTSGA17        at 16#1238# range 0 .. 31;
      TCD_CSR17             at 16#123C# range 0 .. 15;
      TCD_SADDR18           at 16#1240# range 0 .. 31;
      TCD_SOFF18            at 16#1244# range 0 .. 15;
      TCD_ATTR18            at 16#1246# range 0 .. 15;
      TCD_SLAST18           at 16#124C# range 0 .. 31;
      TCD_DADDR18           at 16#1250# range 0 .. 31;
      TCD_DOFF18            at 16#1254# range 0 .. 15;
      TCD_DLASTSGA18        at 16#1258# range 0 .. 31;
      TCD_CSR18             at 16#125C# range 0 .. 15;
      TCD_SADDR19           at 16#1260# range 0 .. 31;
      TCD_SOFF19            at 16#1264# range 0 .. 15;
      TCD_ATTR19            at 16#1266# range 0 .. 15;
      TCD_SLAST19           at 16#126C# range 0 .. 31;
      TCD_DADDR19           at 16#1270# range 0 .. 31;
      TCD_DOFF19            at 16#1274# range 0 .. 15;
      TCD_DLASTSGA19        at 16#1278# range 0 .. 31;
      TCD_CSR19             at 16#127C# range 0 .. 15;
      TCD_SADDR20           at 16#1280# range 0 .. 31;
      TCD_SOFF20            at 16#1284# range 0 .. 15;
      TCD_ATTR20            at 16#1286# range 0 .. 15;
      TCD_SLAST20           at 16#128C# range 0 .. 31;
      TCD_DADDR20           at 16#1290# range 0 .. 31;
      TCD_DOFF20            at 16#1294# range 0 .. 15;
      TCD_DLASTSGA20        at 16#1298# range 0 .. 31;
      TCD_CSR20             at 16#129C# range 0 .. 15;
      TCD_SADDR21           at 16#12A0# range 0 .. 31;
      TCD_SOFF21            at 16#12A4# range 0 .. 15;
      TCD_ATTR21            at 16#12A6# range 0 .. 15;
      TCD_SLAST21           at 16#12AC# range 0 .. 31;
      TCD_DADDR21           at 16#12B0# range 0 .. 31;
      TCD_DOFF21            at 16#12B4# range 0 .. 15;
      TCD_DLASTSGA21        at 16#12B8# range 0 .. 31;
      TCD_CSR21             at 16#12BC# range 0 .. 15;
      TCD_SADDR22           at 16#12C0# range 0 .. 31;
      TCD_SOFF22            at 16#12C4# range 0 .. 15;
      TCD_ATTR22            at 16#12C6# range 0 .. 15;
      TCD_SLAST22           at 16#12CC# range 0 .. 31;
      TCD_DADDR22           at 16#12D0# range 0 .. 31;
      TCD_DOFF22            at 16#12D4# range 0 .. 15;
      TCD_DLASTSGA22        at 16#12D8# range 0 .. 31;
      TCD_CSR22             at 16#12DC# range 0 .. 15;
      TCD_SADDR23           at 16#12E0# range 0 .. 31;
      TCD_SOFF23            at 16#12E4# range 0 .. 15;
      TCD_ATTR23            at 16#12E6# range 0 .. 15;
      TCD_SLAST23           at 16#12EC# range 0 .. 31;
      TCD_DADDR23           at 16#12F0# range 0 .. 31;
      TCD_DOFF23            at 16#12F4# range 0 .. 15;
      TCD_DLASTSGA23        at 16#12F8# range 0 .. 31;
      TCD_CSR23             at 16#12FC# range 0 .. 15;
      TCD_SADDR24           at 16#1300# range 0 .. 31;
      TCD_SOFF24            at 16#1304# range 0 .. 15;
      TCD_ATTR24            at 16#1306# range 0 .. 15;
      TCD_SLAST24           at 16#130C# range 0 .. 31;
      TCD_DADDR24           at 16#1310# range 0 .. 31;
      TCD_DOFF24            at 16#1314# range 0 .. 15;
      TCD_DLASTSGA24        at 16#1318# range 0 .. 31;
      TCD_CSR24             at 16#131C# range 0 .. 15;
      TCD_SADDR25           at 16#1320# range 0 .. 31;
      TCD_SOFF25            at 16#1324# range 0 .. 15;
      TCD_ATTR25            at 16#1326# range 0 .. 15;
      TCD_SLAST25           at 16#132C# range 0 .. 31;
      TCD_DADDR25           at 16#1330# range 0 .. 31;
      TCD_DOFF25            at 16#1334# range 0 .. 15;
      TCD_DLASTSGA25        at 16#1338# range 0 .. 31;
      TCD_CSR25             at 16#133C# range 0 .. 15;
      TCD_SADDR26           at 16#1340# range 0 .. 31;
      TCD_SOFF26            at 16#1344# range 0 .. 15;
      TCD_ATTR26            at 16#1346# range 0 .. 15;
      TCD_SLAST26           at 16#134C# range 0 .. 31;
      TCD_DADDR26           at 16#1350# range 0 .. 31;
      TCD_DOFF26            at 16#1354# range 0 .. 15;
      TCD_DLASTSGA26        at 16#1358# range 0 .. 31;
      TCD_CSR26             at 16#135C# range 0 .. 15;
      TCD_SADDR27           at 16#1360# range 0 .. 31;
      TCD_SOFF27            at 16#1364# range 0 .. 15;
      TCD_ATTR27            at 16#1366# range 0 .. 15;
      TCD_SLAST27           at 16#136C# range 0 .. 31;
      TCD_DADDR27           at 16#1370# range 0 .. 31;
      TCD_DOFF27            at 16#1374# range 0 .. 15;
      TCD_DLASTSGA27        at 16#1378# range 0 .. 31;
      TCD_CSR27             at 16#137C# range 0 .. 15;
      TCD_SADDR28           at 16#1380# range 0 .. 31;
      TCD_SOFF28            at 16#1384# range 0 .. 15;
      TCD_ATTR28            at 16#1386# range 0 .. 15;
      TCD_SLAST28           at 16#138C# range 0 .. 31;
      TCD_DADDR28           at 16#1390# range 0 .. 31;
      TCD_DOFF28            at 16#1394# range 0 .. 15;
      TCD_DLASTSGA28        at 16#1398# range 0 .. 31;
      TCD_CSR28             at 16#139C# range 0 .. 15;
      TCD_SADDR29           at 16#13A0# range 0 .. 31;
      TCD_SOFF29            at 16#13A4# range 0 .. 15;
      TCD_ATTR29            at 16#13A6# range 0 .. 15;
      TCD_SLAST29           at 16#13AC# range 0 .. 31;
      TCD_DADDR29           at 16#13B0# range 0 .. 31;
      TCD_DOFF29            at 16#13B4# range 0 .. 15;
      TCD_DLASTSGA29        at 16#13B8# range 0 .. 31;
      TCD_CSR29             at 16#13BC# range 0 .. 15;
      TCD_SADDR30           at 16#13C0# range 0 .. 31;
      TCD_SOFF30            at 16#13C4# range 0 .. 15;
      TCD_ATTR30            at 16#13C6# range 0 .. 15;
      TCD_SLAST30           at 16#13CC# range 0 .. 31;
      TCD_DADDR30           at 16#13D0# range 0 .. 31;
      TCD_DOFF30            at 16#13D4# range 0 .. 15;
      TCD_DLASTSGA30        at 16#13D8# range 0 .. 31;
      TCD_CSR30             at 16#13DC# range 0 .. 15;
      TCD_SADDR31           at 16#13E0# range 0 .. 31;
      TCD_SOFF31            at 16#13E4# range 0 .. 15;
      TCD_ATTR31            at 16#13E6# range 0 .. 15;
      TCD_SLAST31           at 16#13EC# range 0 .. 31;
      TCD_DADDR31           at 16#13F0# range 0 .. 31;
      TCD_DOFF31            at 16#13F4# range 0 .. 15;
      TCD_DLASTSGA31        at 16#13F8# range 0 .. 31;
      TCD_CSR31             at 16#13FC# range 0 .. 15;
      TCD_NBYTES_MLNO0      at 16#1008# range 0 .. 31;
      TCD_CITER_ELINKNO0    at 16#1016# range 0 .. 15;
      TCD_BITER_ELINKNO0    at 16#101E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO0   at 16#1008# range 0 .. 31;
      TCD_NBYTES_MLOFFYES0  at 16#1008# range 0 .. 31;
      TCD_CITER_ELINKYES0   at 16#1016# range 0 .. 15;
      TCD_BITER_ELINKYES0   at 16#101E# range 0 .. 15;
      TCD_NBYTES_MLNO1      at 16#1028# range 0 .. 31;
      TCD_CITER_ELINKNO1    at 16#1036# range 0 .. 15;
      TCD_BITER_ELINKNO1    at 16#103E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO1   at 16#1028# range 0 .. 31;
      TCD_NBYTES_MLOFFYES1  at 16#1028# range 0 .. 31;
      TCD_CITER_ELINKYES1   at 16#1036# range 0 .. 15;
      TCD_BITER_ELINKYES1   at 16#103E# range 0 .. 15;
      TCD_NBYTES_MLNO2      at 16#1048# range 0 .. 31;
      TCD_CITER_ELINKNO2    at 16#1056# range 0 .. 15;
      TCD_BITER_ELINKNO2    at 16#105E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO2   at 16#1048# range 0 .. 31;
      TCD_NBYTES_MLOFFYES2  at 16#1048# range 0 .. 31;
      TCD_CITER_ELINKYES2   at 16#1056# range 0 .. 15;
      TCD_BITER_ELINKYES2   at 16#105E# range 0 .. 15;
      TCD_NBYTES_MLNO3      at 16#1068# range 0 .. 31;
      TCD_CITER_ELINKNO3    at 16#1076# range 0 .. 15;
      TCD_BITER_ELINKNO3    at 16#107E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO3   at 16#1068# range 0 .. 31;
      TCD_NBYTES_MLOFFYES3  at 16#1068# range 0 .. 31;
      TCD_CITER_ELINKYES3   at 16#1076# range 0 .. 15;
      TCD_BITER_ELINKYES3   at 16#107E# range 0 .. 15;
      TCD_NBYTES_MLNO4      at 16#1088# range 0 .. 31;
      TCD_CITER_ELINKNO4    at 16#1096# range 0 .. 15;
      TCD_BITER_ELINKNO4    at 16#109E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO4   at 16#1088# range 0 .. 31;
      TCD_NBYTES_MLOFFYES4  at 16#1088# range 0 .. 31;
      TCD_CITER_ELINKYES4   at 16#1096# range 0 .. 15;
      TCD_BITER_ELINKYES4   at 16#109E# range 0 .. 15;
      TCD_NBYTES_MLNO5      at 16#10A8# range 0 .. 31;
      TCD_CITER_ELINKNO5    at 16#10B6# range 0 .. 15;
      TCD_BITER_ELINKNO5    at 16#10BE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO5   at 16#10A8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES5  at 16#10A8# range 0 .. 31;
      TCD_CITER_ELINKYES5   at 16#10B6# range 0 .. 15;
      TCD_BITER_ELINKYES5   at 16#10BE# range 0 .. 15;
      TCD_NBYTES_MLNO6      at 16#10C8# range 0 .. 31;
      TCD_CITER_ELINKNO6    at 16#10D6# range 0 .. 15;
      TCD_BITER_ELINKNO6    at 16#10DE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO6   at 16#10C8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES6  at 16#10C8# range 0 .. 31;
      TCD_CITER_ELINKYES6   at 16#10D6# range 0 .. 15;
      TCD_BITER_ELINKYES6   at 16#10DE# range 0 .. 15;
      TCD_NBYTES_MLNO7      at 16#10E8# range 0 .. 31;
      TCD_CITER_ELINKNO7    at 16#10F6# range 0 .. 15;
      TCD_BITER_ELINKNO7    at 16#10FE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO7   at 16#10E8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES7  at 16#10E8# range 0 .. 31;
      TCD_CITER_ELINKYES7   at 16#10F6# range 0 .. 15;
      TCD_BITER_ELINKYES7   at 16#10FE# range 0 .. 15;
      TCD_NBYTES_MLNO8      at 16#1108# range 0 .. 31;
      TCD_CITER_ELINKNO8    at 16#1116# range 0 .. 15;
      TCD_BITER_ELINKNO8    at 16#111E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO8   at 16#1108# range 0 .. 31;
      TCD_NBYTES_MLOFFYES8  at 16#1108# range 0 .. 31;
      TCD_CITER_ELINKYES8   at 16#1116# range 0 .. 15;
      TCD_BITER_ELINKYES8   at 16#111E# range 0 .. 15;
      TCD_NBYTES_MLNO9      at 16#1128# range 0 .. 31;
      TCD_CITER_ELINKNO9    at 16#1136# range 0 .. 15;
      TCD_BITER_ELINKNO9    at 16#113E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO9   at 16#1128# range 0 .. 31;
      TCD_NBYTES_MLOFFYES9  at 16#1128# range 0 .. 31;
      TCD_CITER_ELINKYES9   at 16#1136# range 0 .. 15;
      TCD_BITER_ELINKYES9   at 16#113E# range 0 .. 15;
      TCD_NBYTES_MLNO10     at 16#1148# range 0 .. 31;
      TCD_CITER_ELINKNO10   at 16#1156# range 0 .. 15;
      TCD_BITER_ELINKNO10   at 16#115E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO10  at 16#1148# range 0 .. 31;
      TCD_NBYTES_MLOFFYES10 at 16#1148# range 0 .. 31;
      TCD_CITER_ELINKYES10  at 16#1156# range 0 .. 15;
      TCD_BITER_ELINKYES10  at 16#115E# range 0 .. 15;
      TCD_NBYTES_MLNO11     at 16#1168# range 0 .. 31;
      TCD_CITER_ELINKNO11   at 16#1176# range 0 .. 15;
      TCD_BITER_ELINKNO11   at 16#117E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO11  at 16#1168# range 0 .. 31;
      TCD_NBYTES_MLOFFYES11 at 16#1168# range 0 .. 31;
      TCD_CITER_ELINKYES11  at 16#1176# range 0 .. 15;
      TCD_BITER_ELINKYES11  at 16#117E# range 0 .. 15;
      TCD_NBYTES_MLNO12     at 16#1188# range 0 .. 31;
      TCD_CITER_ELINKNO12   at 16#1196# range 0 .. 15;
      TCD_BITER_ELINKNO12   at 16#119E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO12  at 16#1188# range 0 .. 31;
      TCD_NBYTES_MLOFFYES12 at 16#1188# range 0 .. 31;
      TCD_CITER_ELINKYES12  at 16#1196# range 0 .. 15;
      TCD_BITER_ELINKYES12  at 16#119E# range 0 .. 15;
      TCD_NBYTES_MLNO13     at 16#11A8# range 0 .. 31;
      TCD_CITER_ELINKNO13   at 16#11B6# range 0 .. 15;
      TCD_BITER_ELINKNO13   at 16#11BE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO13  at 16#11A8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES13 at 16#11A8# range 0 .. 31;
      TCD_CITER_ELINKYES13  at 16#11B6# range 0 .. 15;
      TCD_BITER_ELINKYES13  at 16#11BE# range 0 .. 15;
      TCD_NBYTES_MLNO14     at 16#11C8# range 0 .. 31;
      TCD_CITER_ELINKNO14   at 16#11D6# range 0 .. 15;
      TCD_BITER_ELINKNO14   at 16#11DE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO14  at 16#11C8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES14 at 16#11C8# range 0 .. 31;
      TCD_CITER_ELINKYES14  at 16#11D6# range 0 .. 15;
      TCD_BITER_ELINKYES14  at 16#11DE# range 0 .. 15;
      TCD_NBYTES_MLNO15     at 16#11E8# range 0 .. 31;
      TCD_CITER_ELINKNO15   at 16#11F6# range 0 .. 15;
      TCD_BITER_ELINKNO15   at 16#11FE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO15  at 16#11E8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES15 at 16#11E8# range 0 .. 31;
      TCD_CITER_ELINKYES15  at 16#11F6# range 0 .. 15;
      TCD_BITER_ELINKYES15  at 16#11FE# range 0 .. 15;
      TCD_NBYTES_MLNO16     at 16#1208# range 0 .. 31;
      TCD_CITER_ELINKNO16   at 16#1216# range 0 .. 15;
      TCD_BITER_ELINKNO16   at 16#121E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO16  at 16#1208# range 0 .. 31;
      TCD_NBYTES_MLOFFYES16 at 16#1208# range 0 .. 31;
      TCD_CITER_ELINKYES16  at 16#1216# range 0 .. 15;
      TCD_BITER_ELINKYES16  at 16#121E# range 0 .. 15;
      TCD_NBYTES_MLNO17     at 16#1228# range 0 .. 31;
      TCD_CITER_ELINKNO17   at 16#1236# range 0 .. 15;
      TCD_BITER_ELINKNO17   at 16#123E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO17  at 16#1228# range 0 .. 31;
      TCD_NBYTES_MLOFFYES17 at 16#1228# range 0 .. 31;
      TCD_CITER_ELINKYES17  at 16#1236# range 0 .. 15;
      TCD_BITER_ELINKYES17  at 16#123E# range 0 .. 15;
      TCD_NBYTES_MLNO18     at 16#1248# range 0 .. 31;
      TCD_CITER_ELINKNO18   at 16#1256# range 0 .. 15;
      TCD_BITER_ELINKNO18   at 16#125E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO18  at 16#1248# range 0 .. 31;
      TCD_NBYTES_MLOFFYES18 at 16#1248# range 0 .. 31;
      TCD_CITER_ELINKYES18  at 16#1256# range 0 .. 15;
      TCD_BITER_ELINKYES18  at 16#125E# range 0 .. 15;
      TCD_NBYTES_MLNO19     at 16#1268# range 0 .. 31;
      TCD_CITER_ELINKNO19   at 16#1276# range 0 .. 15;
      TCD_BITER_ELINKNO19   at 16#127E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO19  at 16#1268# range 0 .. 31;
      TCD_NBYTES_MLOFFYES19 at 16#1268# range 0 .. 31;
      TCD_CITER_ELINKYES19  at 16#1276# range 0 .. 15;
      TCD_BITER_ELINKYES19  at 16#127E# range 0 .. 15;
      TCD_NBYTES_MLNO20     at 16#1288# range 0 .. 31;
      TCD_CITER_ELINKNO20   at 16#1296# range 0 .. 15;
      TCD_BITER_ELINKNO20   at 16#129E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO20  at 16#1288# range 0 .. 31;
      TCD_NBYTES_MLOFFYES20 at 16#1288# range 0 .. 31;
      TCD_CITER_ELINKYES20  at 16#1296# range 0 .. 15;
      TCD_BITER_ELINKYES20  at 16#129E# range 0 .. 15;
      TCD_NBYTES_MLNO21     at 16#12A8# range 0 .. 31;
      TCD_CITER_ELINKNO21   at 16#12B6# range 0 .. 15;
      TCD_BITER_ELINKNO21   at 16#12BE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO21  at 16#12A8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES21 at 16#12A8# range 0 .. 31;
      TCD_CITER_ELINKYES21  at 16#12B6# range 0 .. 15;
      TCD_BITER_ELINKYES21  at 16#12BE# range 0 .. 15;
      TCD_NBYTES_MLNO22     at 16#12C8# range 0 .. 31;
      TCD_CITER_ELINKNO22   at 16#12D6# range 0 .. 15;
      TCD_BITER_ELINKNO22   at 16#12DE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO22  at 16#12C8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES22 at 16#12C8# range 0 .. 31;
      TCD_CITER_ELINKYES22  at 16#12D6# range 0 .. 15;
      TCD_BITER_ELINKYES22  at 16#12DE# range 0 .. 15;
      TCD_NBYTES_MLNO23     at 16#12E8# range 0 .. 31;
      TCD_CITER_ELINKNO23   at 16#12F6# range 0 .. 15;
      TCD_BITER_ELINKNO23   at 16#12FE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO23  at 16#12E8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES23 at 16#12E8# range 0 .. 31;
      TCD_CITER_ELINKYES23  at 16#12F6# range 0 .. 15;
      TCD_BITER_ELINKYES23  at 16#12FE# range 0 .. 15;
      TCD_NBYTES_MLNO24     at 16#1308# range 0 .. 31;
      TCD_CITER_ELINKNO24   at 16#1316# range 0 .. 15;
      TCD_BITER_ELINKNO24   at 16#131E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO24  at 16#1308# range 0 .. 31;
      TCD_NBYTES_MLOFFYES24 at 16#1308# range 0 .. 31;
      TCD_CITER_ELINKYES24  at 16#1316# range 0 .. 15;
      TCD_BITER_ELINKYES24  at 16#131E# range 0 .. 15;
      TCD_NBYTES_MLNO25     at 16#1328# range 0 .. 31;
      TCD_CITER_ELINKNO25   at 16#1336# range 0 .. 15;
      TCD_BITER_ELINKNO25   at 16#133E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO25  at 16#1328# range 0 .. 31;
      TCD_NBYTES_MLOFFYES25 at 16#1328# range 0 .. 31;
      TCD_CITER_ELINKYES25  at 16#1336# range 0 .. 15;
      TCD_BITER_ELINKYES25  at 16#133E# range 0 .. 15;
      TCD_NBYTES_MLNO26     at 16#1348# range 0 .. 31;
      TCD_CITER_ELINKNO26   at 16#1356# range 0 .. 15;
      TCD_BITER_ELINKNO26   at 16#135E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO26  at 16#1348# range 0 .. 31;
      TCD_NBYTES_MLOFFYES26 at 16#1348# range 0 .. 31;
      TCD_CITER_ELINKYES26  at 16#1356# range 0 .. 15;
      TCD_BITER_ELINKYES26  at 16#135E# range 0 .. 15;
      TCD_NBYTES_MLNO27     at 16#1368# range 0 .. 31;
      TCD_CITER_ELINKNO27   at 16#1376# range 0 .. 15;
      TCD_BITER_ELINKNO27   at 16#137E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO27  at 16#1368# range 0 .. 31;
      TCD_NBYTES_MLOFFYES27 at 16#1368# range 0 .. 31;
      TCD_CITER_ELINKYES27  at 16#1376# range 0 .. 15;
      TCD_BITER_ELINKYES27  at 16#137E# range 0 .. 15;
      TCD_NBYTES_MLNO28     at 16#1388# range 0 .. 31;
      TCD_CITER_ELINKNO28   at 16#1396# range 0 .. 15;
      TCD_BITER_ELINKNO28   at 16#139E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO28  at 16#1388# range 0 .. 31;
      TCD_NBYTES_MLOFFYES28 at 16#1388# range 0 .. 31;
      TCD_CITER_ELINKYES28  at 16#1396# range 0 .. 15;
      TCD_BITER_ELINKYES28  at 16#139E# range 0 .. 15;
      TCD_NBYTES_MLNO29     at 16#13A8# range 0 .. 31;
      TCD_CITER_ELINKNO29   at 16#13B6# range 0 .. 15;
      TCD_BITER_ELINKNO29   at 16#13BE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO29  at 16#13A8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES29 at 16#13A8# range 0 .. 31;
      TCD_CITER_ELINKYES29  at 16#13B6# range 0 .. 15;
      TCD_BITER_ELINKYES29  at 16#13BE# range 0 .. 15;
      TCD_NBYTES_MLNO30     at 16#13C8# range 0 .. 31;
      TCD_CITER_ELINKNO30   at 16#13D6# range 0 .. 15;
      TCD_BITER_ELINKNO30   at 16#13DE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO30  at 16#13C8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES30 at 16#13C8# range 0 .. 31;
      TCD_CITER_ELINKYES30  at 16#13D6# range 0 .. 15;
      TCD_BITER_ELINKYES30  at 16#13DE# range 0 .. 15;
      TCD_NBYTES_MLNO31     at 16#13E8# range 0 .. 31;
      TCD_CITER_ELINKNO31   at 16#13F6# range 0 .. 15;
      TCD_BITER_ELINKNO31   at 16#13FE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO31  at 16#13E8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES31 at 16#13E8# range 0 .. 31;
      TCD_CITER_ELINKYES31  at 16#13F6# range 0 .. 15;
      TCD_BITER_ELINKYES31  at 16#13FE# range 0 .. 15;
   end record;

   --  Enhanced direct memory access controller
   DMA_Periph : aliased DMA_Peripheral
     with Import, Address => DMA_Base;

end NRF_SVD.DMA;
