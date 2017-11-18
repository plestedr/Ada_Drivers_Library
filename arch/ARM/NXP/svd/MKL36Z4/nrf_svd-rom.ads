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

--  System ROM
package NRF_SVD.ROM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Entry

   --  Entry
   type ROM_ENTRY_Registers is array (0 .. 2) of HAL.UInt32
     with Volatile;

   --  Peripheral ID Register

   --  Peripheral ID Register
   type ROM_PERIPHID_Registers is array (0 .. 7) of HAL.UInt32
     with Volatile;

   --  Component ID Register

   --  Component ID Register
   type ROM_COMPID_Registers is array (0 .. 3) of HAL.UInt32
     with Volatile;

   -----------------
   -- Peripherals --
   -----------------

   --  System ROM
   type ROM_Peripheral is record
      --  Entry
      ENTRY_k   : aliased ROM_ENTRY_Registers;
      --  End of Table Marker Register
      TABLEMARK : aliased HAL.UInt32;
      --  System Access Register
      SYSACCESS : aliased HAL.UInt32;
      --  Peripheral ID Register
      PERIPHID  : aliased ROM_PERIPHID_Registers;
      --  Component ID Register
      COMPID    : aliased ROM_COMPID_Registers;
   end record
     with Volatile;

   for ROM_Peripheral use record
      ENTRY_k   at 16#0# range 0 .. 95;
      TABLEMARK at 16#C# range 0 .. 31;
      SYSACCESS at 16#FCC# range 0 .. 31;
      PERIPHID  at 16#FD0# range 0 .. 255;
      COMPID    at 16#FF0# range 0 .. 127;
   end record;

   --  System ROM
   ROM_Periph : aliased ROM_Peripheral
     with Import, Address => ROM_Base;

end NRF_SVD.ROM;
