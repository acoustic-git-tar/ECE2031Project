; ; Simple test for the NeoPixel peripheral

; ORG 0
    ; LOADI  3
    ; OUT    PXL_A
; Loop:
    ; IN     Switches
    ; OUT    PXL_D
    ; JUMP   Loop

; ; IO address constants
; Switches:  EQU 000
; LEDs:      EQU 001
; Timer:     EQU 002
; Hex0:      EQU 004
; Hex1:      EQU 005
; PXL_A:     EQU &H0B0
; PXL_D:     EQU &H0B1

; Simple test for the NeoPixel peripheral

ORG 0
Loop:

    ; IN     Switches
ALL:

	
	LOAD   red
	OUT    PXL_ALL
	JUMP   Loop

Delay:
    OUT    Timer
	DelayLoop:
	IN     Timer
	ADDI   -10
	JNEG   DelayLoop
	
	RETURN
	
; IO address constants
Switches:  EQU 000
LEDs:      EQU 001
Timer:     EQU 002
Hex0:      EQU 004
Hex1:      EQU 005
uh:        DW  &B1100001100011000
green:	   DW  &B0000011111100000
red:       DW  &B1111100000000000
blue:	   DW  &B0000000000011111
PXL_A:     EQU &H0B0
PXL_D:     EQU &H0B1
PXL_SET:   EQU &H0B2
PXL_R:     EQU &H0B3
PXL_G:     EQU &H0B4
PXL_B:     EQU &H0B5
PXL_ALL:   EQU &H0B6