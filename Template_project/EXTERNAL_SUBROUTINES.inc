/*
MIT License
Copyright (c) 2021 Attila Kiss

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

        $INCLUDE (CONFIG.INC)

$IF(ASSEMBLE_I2C_IO_LIB = 1)

        EXTRN   CODE    (INIT_I2C_IO)
        EXTRN   CODE    (WRITE_I2C_IO)
        EXTRN   CODE    (READ_I2C_IO)

$ENDIF

$IF(ASSEMBLE_SUBROUTINES = 1)

        EXTRN   CODE    (S_NOP)
        EXTRN   CODE    (S_INIT_SERIAL_PORT)
        EXTRN   CODE    (S_SERIAL_WRITE_BYTE)
        EXTRN   CODE    (S_SERIAL_READ_BYTE)
        EXTRN   CODE    (S_SERIAL_WRITE_TEXT_AT_DPTR)
        EXTRN   CODE    (S_GET_NEXT_INSTR_PC_VALUE_IN_DPTR)
        EXTRN   CODE    (S_INIT_INTERRUPT_SYSTEM)
        EXTRN   CODE    (S_WRITE_XDATA_PERIPH_LEDS_FROM_ACC)
        EXTRN   CODE    (S_READ_XDATA_PERIPH_BUTTONS_INTO_ACC)
        EXTRN   CODE    (S_INIT_TIMER_0)
        EXTRN   CODE    (S_COUNTER_ON_P2)
        EXTRN   CODE    (S_CHASER_ON_P1)
        EXTRN   CODE    (S_DEC_DPTR)
        EXTRN   CODE    (S_SERIAL_WRITE_NEWLINE)
        EXTRN   CODE    (S_SERIAL_DECIMAL_READ_TO_ACC)
        EXTRN   CODE    (S_SERIAL_DECIMAL_WRITE_FROM_ACC)
        EXTRN   CODE    (S_SERIAL_TRY_GET)
        EXTRN   CODE    (S_SERIAL_TRY_PUT)
        EXTRN   CODE    (S_SERIAL_CAN_GET)
        EXTRN   CODE    (S_SERIAL_CAN_PUT)
$ENDIF