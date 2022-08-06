; ====== Drawing Variables ======

endX dw 1 ; General variable that usually stores the final x coordinate of a shape
endy dw 1 ; General variable that usually stores the final y coordinate of a shape

Speed1 dw 4 ; How much each cube moves every clock tick

; ====== Score Variables ======

Score dw 0
decimalValue dw 0
hexDigits db "0123456789ABCDEF" ;all the hexadecimal digits

; Gamemode variable
EasyMode db 0 ; 0 For normal and 1 For easy

; ============ CUBE VARIABLES ============
; ====== Position Variables =====
; Variabls to save postion of each cube
Cube1Pos dw 0
Cube2Pos dw 0
Cube3Pos dw 0
Cube4Pos dw 0

LastPOS dw 0 

; ====== Input Variables =====
; Variables to temperoraly store 1 when a according key to a cube is pressed
Cube1Pressed db 1
Cube2Pressed db 1
Cube3Pressed db 1
Cube4Pressed db 1

; ====== Logic Variables =====
; Variables to store 1 when a cube has been stopped
Cube1Stopped db 0
Cube2Stopped db 0
Cube3Stopped db 0
Cube4Stopped db 0



spawnIndex dw 40 ; Variable used to read ahead in the music to know when to spawn the next cube


; ====== Picture Variables =====
Header dw 54 dup (0)
filename1 db 'MMGH.bmp', 0 ; Main Menu
filename2 db 'GSGH.bmp', 0 ; Game Screen
filename3 db 'GMGH.bmp', 0 ; Game Mode Selection
filename4 db 'IGH.bmp', 0  ; Instruction Screen
filehandle dw ?
Palette db 256*4 dup (0)
ScrLine db 320 dup (0)
ErrorMsg db 'Error in open file', 13, 10, '$'
	
	
picHigh dw 200
picWidth dw 320
leftGap dw 0
topGap dw 0