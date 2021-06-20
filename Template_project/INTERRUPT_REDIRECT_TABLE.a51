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

        $INCLUDE(CONFIG.INC)

IF IN_PIR_LAB_SIMULATE <> 1
        ;In this case, all vectors are at their correct address
ELSE
        CSEG    AT      0
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x0003
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x000B
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x0013
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x001B
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x0023
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x002B
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x0033
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x003B
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x0043
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x004B
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x0053
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x005B
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x0063
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x006B
        LJMP    $+MONITOR_PROGRAM_OFFSET
        CSEG    AT      0x0073
        LJMP    $+MONITOR_PROGRAM_OFFSET
ENDIF

END