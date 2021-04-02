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
#ifndef ALIASES_H
#define ALIASES_H

;ALIASES FOR REGISTERS

        SBUF EQU S0BUF
        SCON EQU S0CON
        IE   EQU IEN0
        IP   EQU IP0   
        


//ABSOLUTE ADDRESSES FOR GP REGISTERS IN BANKS 0 TO 3
        R0B0 EQU 00H
        R1B0 EQU 01H
        R2B0 EQU 02H
        R3B0 EQU 03H
        R4B0 EQU 04H
        R5B0 EQU 05H
        R6B0 EQU 06H
        R7B0 EQU 07H
        
        R0B1 EQU 08H
        R1B1 EQU 09H
        R2B1 EQU 0AH
        R3B1 EQU 0BH
        R4B1 EQU 0CH
        R5B1 EQU 0DH
        R6B1 EQU 0EH
        R7B1 EQU 0FH

        R0B2 EQU 10H
        R1B2 EQU 11H
        R2B2 EQU 12H
        R3B2 EQU 13H
        R4B2 EQU 14H
        R5B2 EQU 15H
        R6B2 EQU 16H
        R7B2 EQU 17H
        
        R0B3 EQU 18H
        R1B3 EQU 19H
        R2B3 EQU 1AH
        R3B3 EQU 1BH
        R4B3 EQU 1CH
        R5B3 EQU 1DH
        R6B3 EQU 1EH
        R7B3 EQU 1FH

        
#endif