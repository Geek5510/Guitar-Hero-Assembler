; Input: A value in ax
; Output: The absolute of that value in ax
proc AbsoluteValueAX
	
	cmp ax, 0
	jg endAbs	
	neg ax
	endAbs:
	ret
endp

; Resetting all relevant variables for a new game
proc InitVars
	
	closeSpeaker
	
	mov [Cube1Pos], 0
	mov [Cube2Pos], 0
	mov [Cube3Pos], 0
	mov [Cube4Pos], 0
	
	mov [Cube1Pressed], 1
	mov [Cube2Pressed], 1
	mov [Cube3Pressed], 1
	mov [Cube4Pressed], 1
	
	mov [Cube1Stopped], 0
	mov [Cube2Stopped], 0
	mov [Cube3Stopped], 0
	mov [Cube4Stopped], 0
	
	mov [spawnIndex], 40
	
	mov [musicIndex], 0
	
	mov [Score], 0
	mov [decimalValue], 0
	
	mov [EasyMode], 0
	
	call stop_fast_clock
	
	ret
endp

; Makes the clock tick faster
proc 	start_fast_clock
			cli
			mov al, 36h
			out 43h, al
			mov al, 6fh ; low 
			out 40h, al
			mov al, 0bah ; high
			out 40h, al
			sti
			ret
endp

; Return the clock to it's original state
proc stop_fast_clock
			cli
			mov al, 36h
			out 43h, al
			mov al, 0h ; low 
			out 40h, al
			mov al, 0h ; high
			out 40h, al
			sti
			ret
endp

; Input: a frequency in ax
; Output: sending a the given frequency to the speaker
proc note_on
	; change frequency
	mov dx, ax
	mov al, 0b6h
	out 43h, al
	mov ax, dx
	out 42h, al
	mov al, ah
	out 42h, al

	; start the sound
	in al, 61h
	or al, 3h
	out 61h, al
ret
endp note_on

; Stops any currently playing sound
proc note_off
	in al, 61h
	and al, 0fch
	out 61h, al
ret
endp note_off



;input: row in dh, col in dl, number in decimalValue
;output: prints the number
proc printDWnumber
    push bx
    push dx
    add dl, 2
    xor bh, bh
    mov ah, 2h
    int 10h
    
    push dx
    mov dl, [byte ptr decimalValue]
    mov si, 25h
    call printHexNumber
    pop dx
    
    sub dl, 2
    mov ah, 2h
    int 10h
    
    mov dl, [byte ptr decimalValue + 1]
    mov si, 25h
    call printHexNumber
    pop dx
    pop bx
ret
endp printDWnumber
    
; input: number in dl, color in si
; output: printing the numbers digit by digit. changes dh.
proc printHexNumber
    push ax
    push bx
    mov dh,dl
    ;left digit:
    and dh, 11110000B
    shr dh,4
    xor bh,bh
    mov bl,dh
    mov al, [hexDigits+bx]
    ;call printCharacter
    mov bx,si
    call printGfxChar
    ;right digit:
    and dl, 00001111B
    xor bh,bh
    mov bl,dl
    mov al, [hexDigits+bx]
        ;call printCharacter
    mov bx,si
    call printGfxChar

    pop bx
    pop ax
    ret
endp printHexNumber



; input: character in al, color in bx
; output: printing the character
proc printGfxChar
    mov bl, 0FFh
    mov ah, 0eh           ;0eh = 14
    int 10h
    ret
endp printGfxChar

; input: hex value in
; output: decimal value in decimalValue
proc hexToDec
    xor cx,cx
    mov [decimalValue], 0
hunderds:
    cmp ax, 64h
    jb tens
    inc cx
    add [decimalValue], 100h
    sub ax, 64h
    loop hunderds
tens:
    mov cx, 1
    cmp ax, 0Ah
    jb singles
    inc cx
    add [decimalValue], 10h
	mov bx, [decimalValue]
    cmp bl, 99h
    jb under0A0h
    sub [decimalValue], 0A0h
    add [decimalValue], 100h
    under0A0h:
    sub ax, 0Ah
    loop tens
singles:
    mov cx, 1
    cmp ax, 1h
    jb hexToDecEnd
    inc cx
    add [decimalValue], 1h
    mov bx, [decimalValue]
    and bl, 00001111b
    cmp bl, 0Ah
    jb under0Ah
    sub [decimalValue], 0Ah
    add [decimalValue], 10h
    cmp [decimalValue], 99h
    jb under0Ah
    sub [decimalValue], 0A0h
    add [decimalValue], 100h
    under0Ah:
    sub ax, 1h
    loop singles
	hexToDecEnd:
ret
endp hexToDec

; === Procedures to move each cube ===
; Each of them moves the according cube the number of pixels saved in the speed variables

proc moveCube1
		
		cmp [cube1Pos], 180
		jae done1
		cmp [cube1Stopped], 1
		je done1
		
		mov [endX], 118
		mov dx, [Cube1Pos]
		mov [LastPOS], dx
		mov cx, 98
		mov [endy], dx
		add [endy], 20
		
		; Deleting last rec
		SetDrawColor 00h
		call drawRectangle
		
		
		mov cx, [Speed1]
		add [LastPOS], cx
		add [endY], cx
		mov dx, [LastPOS]
		
		mov cx, 98

		
		SetDrawColor 01h
		call drawRectangle
		mov dx, [LastPOS]
		mov cx, 98
	
		
		mov ax, [LastPOS]
		mov [Cube1Pos], ax
		
		
		done1:
		
	ret
endp

proc moveCube2
		
		cmp [cube2Pos], 180
		jae done2
		
		mov [endX], 153
		mov dx, [Cube2Pos]
		mov [LastPOS], dx
		mov cx, 133
		mov [endy], dx
		add [endy], 20
		
		; Deleting last rec
		SetDrawColor 00h
		call drawRectangle
		
		
		mov cx, [Speed1]
		add [LastPOS], cx
		add [endY], cx
		mov dx, [LastPOS]
		
		mov cx, 133

		
		SetDrawColor 01h
		call drawRectangle
		mov dx, [LastPOS]
		mov cx, 133
	
		
		mov ax, [LastPOS]
		mov [Cube2Pos], ax
	
		done2:
		
	ret
endp

proc moveCube3
		
		cmp [cube3Pos], 180
		jae done3
		
		mov [endX], 188
		mov dx, [Cube3Pos]
		mov [LastPOS], dx
		mov cx, 168
		mov [endy], dx
		add [endy], 20
		
		; Deleting last rec
		SetDrawColor 00h
		call drawRectangle
		
		
		mov cx, [Speed1]
		add [LastPOS], cx
		add [endY], cx
		mov dx, [LastPOS]
		
		mov cx, 168

		
		SetDrawColor 01h
		call drawRectangle
		mov dx, [LastPOS]
		mov cx, 168
	
		
		mov ax, [LastPOS]
		mov [Cube3Pos], ax
	
		done3:
		
	ret
endp

proc moveCube4
		
		cmp [cube4Pos], 180
		jae done3
		
		mov [endX], 223
		mov dx, [Cube4Pos]
		mov [LastPOS], dx
		mov cx, 203
		mov [endy], dx
		add [endy], 20
		
		; Deleting last rec
		SetDrawColor 00h
		call drawRectangle
		
		
		mov cx, [Speed1]
		add [LastPOS], cx
		add [endY], cx
		mov dx, [LastPOS]
		
		mov cx, 203

		
		SetDrawColor 01h
		call drawRectangle
		mov dx, [LastPOS]
		mov cx, 203
	
		
		mov ax, [LastPOS]
		mov [Cube4Pos], ax
	
		done4:
		
	ret
endp

; === Procedures to stop each cube's movment ===
; Stops the cube, changes the according variables and calculates score, called on when the player presses a according key

proc stopCube1
		
		mov [endX], 118
		mov dx, [Cube1Pos]
		mov [LastPOS], dx
		mov cx, 98
		mov [endy], dx
		add [endy], 20
		
		; Deleting last rec
		SetDrawColor 00h
		call drawRectangle
		
		mov dx, [LastPOS]
		
		mov cx, 98
		
		SetDrawColor 02h
		call drawRectangle
		mov dx, [LastPOS]
		mov cx, 98	
		
		; == Cube 1 scoring ==
		
		; Firstly well be checking if the cube is at least 15 pixels in, we can skip scoring if the cube is that far
		mov ax, [cube1Pos]
		cmp ax, 145
		jl endScoring1
		
		; Then well check if its lower than 160, if it is we know for sure it wasn't perfect so we can skip that 
		cmp ax, 160
		jl NotPerfect1
		
		; If it is less 160 well check the diffrence between 160 and the position to make sure the cube hasn't passed the lower line, if it did than the press wasn't perfect
		sub ax, 160
		call AbsoluteValueAX
		cmp ax, 5
		jg NotPerfect1
		
		; When we know the press was perfect we can add 7 points
		add [score], 7		
		
		jmp endScoring1
		
		; if the press wasn't prefect we need to check if at least half was in or less than a half
NotPerfect1:
		
		; If the diffrence is more than ten we know the cube was less than halfway in
		mov ax, [cube1Pos]
		sub ax, 160
		call AbsoluteValueAX
		cmp ax, 10
		jg QuarterIn1
		
		; If it's not we can add 4 points
		add [score], 4
		
		jmp endScoring1
		
QuarterIn1:
	; If the cube wasn't perfect and wasn't more than halfway in then we know it's between a quarter and a half which means we add 2 points
	add [score], 2
	
endScoring1:
		
		
	ret
endP

proc stopCube2
			
		mov [endX], 153
		mov dx, [Cube2Pos]
		mov [LastPOS], dx
		mov cx, 133
		mov [endy], dx
		add [endy], 20
		
		; Deleting last rec
		SetDrawColor 00h
		call drawRectangle
		
		mov dx, [LastPOS]
		
		mov cx, 133
		
		SetDrawColor 02h
		call drawRectangle
		mov dx, [LastPOS]
		mov cx, 133
		
		; == Cube 2 scoring ==
		
		; Firstly well be checking if the cube is at least 25 pixels in, we can skip scoring if the cube is that far
		mov ax, [cube2Pos]
		cmp ax, 145
		jl endScoring2
		
		; Then well check if its lower than 260, if it is we know for sure it wasn't perfect so we can skip that 
		cmp ax, 160
		jl NotPerfect2
		
		; If it is less 260 well check the diffrence between 260 and the position to make sure the cube hasn't passed the lower line, if it did than the press wasn't perfect
		sub ax, 160
		call AbsoluteValueAX
		cmp ax, 5
		jg NotPerfect2
		
		; When we know the press was perfect we can add 7 points
		add [score], 7
		
		jmp endScoring2
		
		; if the press wasn't prefect we need to check if at least half was in or less than a half
NotPerfect2:
		
		; If the diffrence is more than ten we know the cube was less than halfway in
		mov ax, [cube2Pos]
		sub ax, 260
		call AbsoluteValueAX
		cmp ax, 20
		jg QuarterIn2
		
		; If it's not we can add 4 points
		add [score], 4
		
		jmp endScoring2
		
QuarterIn2:
	; If the cube wasn't perfect and wasn't more than halfway in then we know it's between a quarter and a half which means we add 2 points
	add [score], 2
	
endScoring2:
		
	ret
endp

proc stopCube3
			
		mov [endX], 188
		mov dx, [Cube3Pos]
		mov [LastPOS], dx
		mov cx, 168
		mov [endy], dx
		add [endy], 20
		
		; Deleting last rec
		SetDrawColor 00h
		call drawRectangle
		
		mov dx, [LastPOS]
		
		mov cx, 168
		
		SetDrawColor 02h
		call drawRectangle
		mov dx, [LastPOS]
		mov cx, 168
		
		
		; == Cube 3 scoring ==
		
		; Firstly well be checking if the cube is at least 35 pixels in, we can skip scoring if the cube is that far
		mov ax, [cube3Pos]
		cmp ax, 145
		jl endScoring3
		
		; Then well check if its lower than 360, if it is we know for sure it wasn't perfect so we can skip that 
		cmp ax, 160
		jl NotPerfect3
		
		; If it is less 360 well check the diffrence between 360 and the position to make sure the cube hasn't passed the lower line, if it did than the press wasn't perfect
		sub ax, 160
		call AbsoluteValueAX
		cmp ax, 5
		jg NotPerfect3
		
		; When we know the press was perfect we can add 7 points
		add [score], 7
		
		jmp endScoring3
		
		; if the press wasn't prefect we need to check if at least half was in or less than a half
NotPerfect3:
		
		; If the diffrence is more than ten we know the cube was less than halfway in
		mov ax, [cube3Pos]
		sub ax, 360
		call AbsoluteValueAX
		cmp ax, 30
		jg QuarterIn3
		
		; If it's not we can add 4 points
		add [score], 4
		
		jmp endScoring3
		
QuarterIn3:
	; If the cube wasn't perfect and wasn't more than halfway in then we know it's between a quarter and a half which means we add 3 points
	add [score], 3
	
endScoring3:
		
	ret
endp

proc stopCube4
			
		mov [endX], 223
		mov dx, [Cube4Pos]
		mov [LastPOS], dx
		mov cx, 203
		mov [endy], dx
		add [endy], 20
		
		; Deleting last rec
		SetDrawColor 00h
		call drawRectangle
		
		mov dx, [LastPOS]
		
		mov cx, 203
		
		SetDrawColor 02h
		call drawRectangle
		mov dx, [LastPOS]
		mov cx, 203
		
		
		; == Cube 4 scoring ==
		
		; Firstly well be checking if the cube is at least 45 pixels in, we can skip scoring if the cube is that far
		mov ax, [cube4Pos]
		cmp ax, 145
		jl endScoring4
		
		; Then well check if its lower than 460, if it is we know for sure it wasn't perfect so we can skip that 
		cmp ax, 160
		jl NotPerfect4
		
		; If it is less 460 well check the diffrence between 460 and the position to make sure the cube hasn't passed the lower line, if it did than the press wasn't perfect
		sub ax, 160
		call AbsoluteValueAX
		cmp ax, 5
		jg NotPerfect4
		
		; When we know the press was perfect we can add 7 points
		add [score], 7
		
		jmp endScoring4
		
		; if the press wasn't prefect we need to check if at least half was in or less than a half
NotPerfect4:
		
		; If the diffrence is more than ten we know the cube was less than halfway in
		mov ax, [cube4Pos]
		sub ax, 460
		call AbsoluteValueAX
		cmp ax, 40
		jg QuarterIn4
		
		; If it's not we can add 4 points
		add [score], 4
		
		jmp endScoring4
		
QuarterIn4:
	; If the cube wasn't perfect and wasn't more than halfway in then we know it's between a quarter and a half which means we add 4 points
	add [score], 4
	
endScoring4:
		
	ret
endp

; === Procedures to spawn each cube ===
; Called on whenever a cube is stopped and a note is coming up

proc spawnCube1
	
	cmp [cube1Stopped], 1
	jne endspa1
	
	; Setting up variables for deletion
	mov [endX], 118
	mov dx, [Cube1Pos]
	mov [LastPOS], dx
	mov cx, 98
	mov [endy], dx
	add [endy], 20
		
	; Deleting last rec
	SetDrawColor 00h
	call drawRectangle
	
	mov [cube1Pos], 0
	mov [cube1Stopped], 0
	mov [Cube1Pressed], 0
	
	endspa1:
	ret
endp

proc spawnCube2
	
	cmp [cube2Stopped], 1
	jne endspa2
	
	; Setting up variables for deletion
	mov [endX], 153
	mov dx, [Cube2Pos]
	mov [LastPOS], dx
	mov cx, 133
	mov [endy], dx
	add [endy], 20
		
	; Deleting last rec
	SetDrawColor 00h
	call drawRectangle
	
	mov [cube2Pos], 0
	mov [cube2Stopped], 0
	mov [Cube2Pressed], 0
	
	endspa2:
	ret
endp

proc spawnCube3
	
	cmp [cube3Stopped], 1
	jne endspa3
	
	; Setting up variables for deletion
	mov [endX], 188
	mov dx, [Cube3Pos]
	mov [LastPOS], dx
	mov cx, 168
	mov [endy], dx
	add [endy], 20
		
	; Deleting last rec
	SetDrawColor 00h
	call drawRectangle
	
	mov [cube3Pos], 0
	mov [cube3Stopped], 0
	mov [Cube3Pressed], 0
	
	endspa3:
	ret
endp

proc spawnCube4
	
	cmp [cube4Stopped], 1
	jne endspa4
	
	; Setting up variables for deletion
	mov [endX], 223
	mov dx, [Cube4Pos]
	mov [LastPOS], dx
	mov cx, 203
	mov [endy], dx
	add [endy], 20
		
	; Deleting last rec
	SetDrawColor 00h
	call drawRectangle
	
	mov [cube4Pos], 0
	mov [cube4Stopped], 0
	mov [Cube4Pressed], 0
	
	endspa4:
	ret
endp

