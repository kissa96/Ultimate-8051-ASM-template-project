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
        $NOMOD51
        $INCLUDE(ALIASES.INC)
        $INCLUDE(CONFIG.INC)
        $INCLUDE(REG552.INC)
        $INCLUDE(MACROS.INC)
        $INCLUDE(EXTERNALS.INC)

        NAME    ISR_TIMER2_OVERFLOW

$IF    (ASSEMBLE_ISR_ALL = 1)
$IF    (ASSEMBLE_ISR_T2_OVF = 1)

$IF IN_PIR_LAB <> 1
        CSEG    AT      0073H
$ELSE
        CSEG    AT      MONITOR_PROGRAM_OFFSET+0073H
$ENDIF
        LJMP    ISR_VECT_TIMER_2_OVF
        ISR_TIMER2_OVF SEGMENT CODE
        RSEG    ISR_TIMER2_OVF
ISR_VECT_TIMER_2_OVF:
        USING   0
        CLR     T2OV


        RETI

$ENDIF
$ENDIF

        END

