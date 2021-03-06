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

        $INCLUDE(EXTERNALS.INC)
        $INCLUDE(CONFIG.INC)

        NAME    RESERVED_ADDRESSES
        ;Code space can be reserved here
$IF     (RESERVE_CODE_SPACE == 1)
$IF IN_PIR_LAB <> 1
        CSEG    AT      LAST_INTERRUPT_ADDRESS+3H
$ELSE
        CSEG    AT      LAST_INTERRUPT_ADDRESS+MONITOR_PROGRAM_OFFSET+3H
$ENDIF
        ;Omit addresses after last interrupt vector up until main program
        DS      (100H-(LAST_INTERRUPT_ADDRESS+3H))
$ENDIF
END