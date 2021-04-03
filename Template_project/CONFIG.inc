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

#ifndef CONFIG_H
#define CONFIG_H

IN_PIR_LAB      EQU     0

$SET    (ASSEMBLE_SUBROUTINES              = 1)
$SET    (ASSEMBLE_I2C_IO_LIB               = 0)
$SET    (ASSEMBLE_VARIABLES                = 1)
$SET    (ASSEMBLE_ISR_ALL                  = 1)
            
            
$SET    (ASSEMBLE_ISR_T2_OVF               = 0)                                           
$SET    (ASSEMBLE_ISR_T2_COMPARE_0         = 0)
$SET    (ASSEMBLE_ISR_T2_COMPARE_1         = 0)
$SET    (ASSEMBLE_ISR_T2_COMPARE_2         = 0)                                                                                     
$SET    (ASSEMBLE_ISR_T2_CAPTURE_0         = 0)
$SET    (ASSEMBLE_ISR_T2_CAPTURE_1         = 0)
$SET    (ASSEMBLE_ISR_T2_CAPTURE_2         = 0)
$SET    (ASSEMBLE_ISR_T2_CAPTURE_3         = 0) 

$SET    (ASSEMBLE_ISR_ADC                  = 0) 
                                         
$SET    (ASSEMBLE_ISR_SERIAL               = 0)

$SET    (ASSEMBLE_ISR_TIMER1_OVF           = 0)

$SET    (ASSEMBLE_ISR_EXTERNAL1            = 0)

$SET    (ASSEMBLE_ISR_TIMER0_OVF           = 1)

$SET    (ASSEMBLE_ISR_EXTERNAL0            = 0)   

                                        
$SET    (ASSEMBLE_BIT_VARIABLES            = 1)
$SET    (ASSEMBLE_CONSTANTS                = 1)
$SET    (ASSEMBLE_DATA_VARIABLES           = 1)
$SET    (ASSEMBLE_IDATA_VARIABLES          = 1)
$SET    (ASSEMBLE_BITADDRESSABLE_VARIABLES = 1)
$SET    (ASSEMBLE_XDATA_VARIABLES          = 1)


STACKLEN1       EQU     20

IDATALEN        EQU     80H

XDATASTART      EQU     0000H     
XDATALEN        EQU     3E00H      

XDATA_PERIPH    EQU     0C000H
XDATA_PERIPHLEN EQU     4000H

PDATASTART      EQU     0H
PDATALEN        EQU     0H

IBPSTACK        EQU     0       
IBPSTACKTOP     EQU     0xFF +1   

XBPSTACK        EQU     0       
XBPSTACKTOP     EQU     0xFFFF +1   

PBPSTACK        EQU     0      
PBPSTACKTOP     EQU     0xFF +1    

PPAGEENABLE     EQU     0      
PPAGE           EQU     0
PPAGE_SFR       DATA    0A0H


#endif