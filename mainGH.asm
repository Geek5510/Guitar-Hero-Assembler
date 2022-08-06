; ================ MACROS ================

; System Macros
SwitchToTextMode macro
	mov ax, 3
	int 10h
endm

SwitchToGraphicMode macro
	mov ax, 13h
	int 10h
endm

WaitForKey macro
	mov ah,00h
	int 16h
endm

OpenSpeaker macro
	in al,61h
	or al,00000011b
	out 61h,al
endm

CloseSpeaker macro
	in al,61h
	and al,11111100b
	out 61h,al
endm

printChar macro char
	mov dl, char
	mov ah, 2h 
	int 21h
endm

MoveTextCursor macro Line, Column
		mov bh, 0
		mov dh, Line
		mov dl, Column
		mov ah,2h
		int 10h
endm

; Macros to quickly set up registers for procedures
SetXLineDimensions macro StartX, LineY, LineLength
	
	mov cx, StartX
	mov dx, LineY
	mov [word ptr endX], LineLength
	
endm

SetYLineDimensions macro StartY, LineX, LineLength
	
	mov dx, StartY
	mov cx, LineX
	mov [word ptr endY], LineLength
	
endm

SetIscoTriangleDimensions macro StartX, StartY, EndYValue

	mov cx, StartX
	mov dx, StartY
	mov [word ptr endY], EndYValue
	
endm

SetRecDimensions macro StartX, StartY, EndXValue, EndYValue
		
	mov cx, StartX
	mov dx, StartY
	mov [word ptr endX], EndXValue
	mov [word ptr endY], EndYValue
	
endm

SetDrawColor macro color
	mov al, color
endm


drawBMP macro
	Call OpenFile
	Call ReadHeader
	Call ReadPalette
	Call CopyPal
	Call CopyBitmap
	Call CloseFile
	
	WaitForKey
endm

JUMPS
IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------

include "GHVars.asm"

include "musicVar.asm"

CODESEG

include "DrawPro.asm"
include "picPro.asm"
include "GHPro.asm"

start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
; --------------------------
	
	SwitchToGraphicMode
DrawMainMenu:
	
	call InitVars
	
	call clearScreen
	
	
	mov dx, offset filename1
	call PrintPic
	
	
	MainMenu:
		
	mov ah, 0Bh ; Getting the keyboards status
	int 21h
	cmp al, 0
	je MainMenu
			
	mov ah, 0h
	int 16h
			
	; Checking for escape
	cmp ah, 1h			
	je exit
	
	; Checking for s
	cmp ah, 1Fh			
	je GameModeSelection
	
	; Checking for i
	cmp ah, 17h			
	je InstructionsScreen
	
	jmp MainMenu
	
InstructionsScreen:
	
	call clearScreen
	
	
	mov dx, offset filename4
	call PrintPic
	
WaitForReturn:
	
	mov ah, 0Bh ; Getting the keyboards status
	int 21h
	cmp al, 0
	je WaitForReturn
			
	mov ah, 0h
	int 16h
	
	; Checking for escape
	cmp ah, 1h			
	je DrawMainMenu
	jmp WaitForReturn
	
GameModeSelection:
	
	call clearScreen
	
	
	mov dx, offset filename3
	call PrintPic
	
	waitForSelection:
	
	mov ah, 0Bh ; Getting the keyboards status
	int 21h
	cmp al, 0
	je waitForSelection
			
	mov ah, 0h
	int 16h
	
	; Checking for escape
	cmp ah, 1h			
	je DrawMainMenu
	
	; Checking for R key
	cmp ah, 13h
	jne NotNormalMario
	mov dx, offset 	mario_music
	mov [music_pointer], dx
	mov ax, [mario_music_size]
	mov [music_size], ax
	jmp StartGame
NotNormalMario:
	; Checking for F key
	cmp ah, 21h
	jne NotEasyMario
	mov dx, offset 	mario_music
	mov [music_pointer], dx
	mov [EasyMode], 1
	mov ax, [mario_music_size]
	mov [music_size], ax
	jmp StartGame
NotEasyMario:
	; Checking for T key
	cmp ah, 14h
	jne NotNormalSpider
	mov dx, offset 	spider_music
	mov [music_pointer], dx
	mov ax, [spider_music_size]
	mov [music_size], ax
	jmp StartGame
NotNormalSpider:
	; Checking for G key
	cmp ah, 22h
	jne NotEasySpider
	mov dx, offset 	spider_music
	mov [music_pointer], dx
	mov [EasyMode], 1
	mov ax, [spider_music_size]
	mov [music_size], ax
	jmp StartGame
NotEasySpider:
	
	jmp waitForSelection
	
	StartGame:
	
	call clearScreen
	
	
	
	cmp [EasyMode], 1
	je Easy
		
	call start_fast_clock ; Make the clock go faster, === -> Disable for easier game <- ===
Easy:
	
	; Setting up values for the delay
	mov ax, 40h
	mov es, ax
	mov ax, [es:6ch]
	; Storing the current ax for later usage
	push ax
	
	mov dx, offset filename2
	call PrintPic
	
	OpenSpeaker
	
	; === Main game loop ===
	gameLoop:
		
		; Restoring the value of ax
		pop ax
		
		; Checking if ax is changed meaning the internal clock has ticked 
		cmp ax, [es:6ch]
		push ax
		je input ; If the clock hasent changed we can check for input
	
TickLoop:
		
		; Else we update ax and processes the cubes' movement 
		
		mov ax, 40h
		mov es, ax
		mov ax, [es:6ch]
		
		push ax
		
		;Drawing the Bottom two lines
		
		SetDrawColor 18h
		SetXLineDimensions 90, 160, 229
		call drawXLine
		SetDrawColor 18h
		SetXLineDimensions 90, 185, 229
		call drawXLine

	
WriteScore:
		;Drawing the score
		cmp [score], 999
		jb NotMaxScore
		mov [score], 999
NotMaxScore:
		mov dh, 4
		mov dl, 32
		mov ax, [score]
		call hexToDec
		call printDWnumber 
		
		
		; == Cube 1 ==
		
		cmp [Cube1Pressed], 1 ; Checking if the player pressed the according key (in this case the left arrow)
		je stop1 ; If we did then we need to stop the cube
		call moveCube1 ; If not then we need to countine moving the cube
		jmp ddone1 ; Jumping to the next cube since were done with this one
		stop1: 							
			cmp [Cube1Stopped], 1 ; Checking if we already stopped this cube
			jne dostop1 ; If we did we can continue
			jmp ddone1
			dostop1:
			call stopCube1 ; Else we stop the cube and update it for next time
			mov [Cube1Stopped], 1
		ddone1:
		

		; == Cube 2 ==
		
		cube2:
		cmp [Cube2Pressed], 1 ; Checking if the player pressed the according key (in this case the left arrow)
		je stop2 ; If we did then we need to stop the cube
		call moveCube2 ; If not then we need to countine moving the cube
		jmp ddone2 ; Jumping to the next cube since were done with this one
		stop2: 
			cmp [Cube2Stopped], 1 ; Checking if we already stopped this cube
			jne dostop2 ; If we did we can continue
			jmp ddone2
			dostop2:
			call stopCube2 ; Else we stop the cube and update it for next time
			mov [Cube2Stopped], 1
		ddone2:
		
		
		; == Cube 3 ==
		
		cube3:
		cmp [Cube3Pressed], 1 ; Checking if the player pressed the according key (in this case the left arrow)
		je stop3 ; If we did then we need to stop the cube
		call moveCube3 ; If not then we need to countine moving the cube
		jmp ddone3 ; Jumping to the next cube since were done with this one
		stop3: 
			cmp [Cube3Stopped], 1 ; Checking if we already stopped this cube
			jne dostop3 ; If we did we can continue
			jmp ddone3
			dostop3:
			call stopCube3 ; Else we stop the cube and update it for next time
			mov [Cube3Stopped], 1
		ddone3:
		
		
		; == Cube 4 ==
		cube4:
		cmp [Cube4Pressed], 1 ; Checking if the player pressed the according key (in this case the left arrow)
		je stop4 ; If we did then we need to stop the cube
		call moveCube4 ; If not then we need to countine moving the cube
		jmp ddone4 ; Jumping to the next cube since were done with this one
		stop4: 
			cmp [Cube4Stopped], 1 ; Checking if we already stopped this cube
			jne dostop4 ; If we did we can continue
			jmp ddone4
			dostop4:
			call stopCube4 ; Else we stop the cube and update it for next time
			mov [Cube4Stopped], 1
		ddone4:
		
		music:

			mov si, [musicIndex]
			cmp si, [music_size]
			jae doneMusic
			next_note:
			xor bh, bh
			
			mov di, [music_pointer]
			add di, si
			mov bl, [di]


			cmp bl, 255 ; ignore
			jz ignoreMusic
			cmp bl, 254 ; note off
			jz turn_note_off
			
			play_midi_note:
			shl bx, 1
			mov al, [midi_note_to_freq_table + bx]
			mov ah, [midi_note_to_freq_table + bx + 1]
			call note_on
			jmp ignoreMusic
	
			turn_note_off:
				call note_off
			ignoreMusic:
			inc si
			mov [musicIndex], si

			
			spawnMusic:
			
			add si, 39
			
			xor bh, bh
			mov di, [music_pointer]
			add di, si
			mov bl, [di]
			
			cmp bl, 254
			jne ignoreSpawn
			
			cmp [cube1Stopped], 1
			jne cube1ocu
			call spawnCube1
			jmp ignoreSpawn
			cube1ocu:
			cmp [cube2Stopped], 1
			jne cube2ocu
			call spawnCube2
			jmp ignoreSpawn
			cube2ocu:
			cmp [cube3Stopped], 1
			jne cube3ocu
			call spawnCube3
			jmp ignoreSpawn
			cube3ocu:
			cmp [cube4Stopped], 1
			jne ignoreSpawn
			call spawnCube4
			jmp ignoreSpawn
			
			ignoreSpawn:
			inc si
			mov [spawnIndex], si
			
			doneMusic:
			
		
		
		cmp [cube1Pos], 180 ; Checking if any cube has reached the end and if it has we can stop the program
		jb	 mis2
		cmp [cube1Stopped], 1
		je mis2
		mov [Cube1Pressed], 1
		
		mis2:
		cmp [cube2Pos], 180
		jb mis3
		cmp [cube2Stopped], 1
		je mis3
		mov [Cube2Pressed], 1
		
		mis3:
		cmp [cube3Pos], 180
		jb mis4
		cmp [cube3Stopped], 1
		je mis4
		mov [Cube3Pressed], 1
		
		mis4:	
		cmp [cube4Pos], 180
		jb input
		cmp [cube4Stopped], 1
		je input
		mov [Cube4Pressed], 1
		
		input:
			
			mov ah, 0Bh ; Getting the keyboards status
			int 21h
			cmp al, 0
			je gameLoop
			
			mov ah, 0h
			int 16h
			
			; Checking for escape
			cmp ah, 1h			
			je DrawMainMenu			
			
			; Checking for each arrow key
			cmp ah, 4bh 
			jne NotLArr
			mov [Cube1Pressed], 1
			jmp gameLoop
			NotLArr:
			
			cmp ah, 50h 
			jne NotDArr
			mov [Cube3Pressed], 1
			jmp gameLoop
			NotDArr:
			
			cmp ah, 48h 
			jne NotUArr
			mov [Cube2Pressed], 1
			jmp gameLoop
			NotUArr:
			
			cmp ah, 4Dh 
			jne NotRArr
			mov [Cube4Pressed], 1
			jmp gameLoop
			NotRArr:
			
			
		jmp gameLoop
		
	waitl:

	
	
exit:
	CloseSpeaker
	call stop_fast_clock
	SwitchToTextMode
	mov ax, 4c00h
	int 21h
END start