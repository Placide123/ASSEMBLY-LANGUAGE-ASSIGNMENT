; assignment done by placide twiringiyimana and thomas rukundo
; PIC16F877A Configuration Bit Settings

; Assembly source line config statements

#include "p16f877a.inc"

; CONFIG
; __config 0x3FFF
 __CONFIG _FOSC_EXTRC & _WDTE_ON & _PWRTE_OFF & _BOREN_ON & _LVP_ON & _CPD_OFF & _WRT_OFF & _CP_OFF
STATUS equ 03h
 RP0 equ 05
 RP1 equ 06
 
 PORTA equ 05h
 TRISA equ 85h
 
 COUNTER1 equ 20h
 COUNTER2 equ 21h
 
org 00h
 
    clrw
    ;selecting BANK0
    BCF STATUS, RP0;RP0=0
    BCF STATUS, RP1;RP1=0
 
    CLRF PORTA;initialise PORTA
 
;switch to bank 1 for TRISA register
    BSF STATUS, RP0; RP0=1
    
    MOVLW 0x00 ; clear W register
    
    MOVWF TRISA; set PORTA as output

    BCF STATUS, RP0
    
 


 START MOVLW 0x04
    MOVWF PORTA ;turn on pin 3 on PORTA
    ; delay
    MOVLW 0xff
    MOVWF COUNTER1  ;SET counter1 to 0xff 
LOOP1  MOVLW 0xff
    MOVWF COUNTER2 ;SET counter2 to 0xff 
LOOP3 DECFSZ COUNTER2,1; subtract 1 to 255
    GOTO LOOP3;it will loop until reaching 0
    DECFSZ COUNTER1,1;subtract 1 to 255 
    GOTO LOOP1;it will loop until reaching 0
     ;end of delay 
    MOVLW 0x02
    MOVWF PORTA ;turn on pin 2 on PORTA
    ; delay
    MOVLW 0xC8
    MOVWF COUNTER1 ;SET counter1 to 0xC8    
LOOP4  MOVLW 0xff; all steps looks like in the above delay
    MOVWF COUNTER2
LOOP5 DECFSZ COUNTER2,1
    GOTO LOOP5
    DECFSZ COUNTER1,1
    GOTO LOOP4
     ;end of delay
    MOVLW 0x01
    MOVWF PORTA;turn on pin 1 on PORTA
    ; delay 
    MOVLW 0xff
    MOVWF COUNTER1       
LOOP2 MOVLW 0xff
    MOVWF COUNTER2 
LOOP6 DECFSZ COUNTER2,1
    GOTO LOOP6
    DECFSZ COUNTER1,1
    GOTO LOOP2
    ;end of delay
    
    GOTO START
	 
END





