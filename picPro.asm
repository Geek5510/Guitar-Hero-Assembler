proc OpenFile
	;enter – file name in filename
	;exit - Open file, put handle in filehandle
	mov ah, 3Dh
	xor al, al
	int 21h
	jc openerror
	mov [filehandle], ax
	ret
	openerror:
		mov dx, offset ErrorMsg
		mov ah, 9h
		int 21h
		mov ax, 4c00h ; exit the program
		int 21h
endp OpenFile

proc ReadHeader
; Read BMP file header, 54 bytes
      mov ah,3fh
      mov bx, [filehandle]
      mov cx , 54
      mov dx,offset Header
      int 21h 
      ret
endp ReadHeader

proc ReadPalette
; Read BMP file color palette, 256 ; colors * 4 bytes (400h)
    mov ah,3fh
    mov bx, [filehandle]
    mov cx , 400h 
    mov dx,offset Palette
    int 21h 
    ret
endp ReadPalette

proc CopyPal
; Copy the colors palette to the video memory registers 
; The number of the first color should be sent to port 3C8h
; The palette is sent to port 3C9h
	mov si,offset Palette 
	mov cx,256 
	mov dx,3C8h
	mov al,0 
	; Copy starting color to port 3C8h
	out dx,al
	; Copy palette itself to port 3C9h
	inc dx 
	PalLoop:
	; Note: Colors in a BMP file are saved as BGR values rather than RGB.
	mov al,[si+2] 	; Get red value.
	shr al,2 		; Max. is 255, but video palette maximal
	; value is 63. Therefore dividing by 4.
	out dx,al		 ; Send it.
	mov al,[si+1] 	; Get green value.
	shr al,2
	out dx,al 		; Send it.
	mov al,[si] 	; Get blue value.
	shr al,2
	out dx,al 		; Send it.
	add si,4		 ; Point to next color.
	; (There is a null chr. after every color.)
	loop PalLoop
	ret
endp CopyPal

proc CopyBitmap
; BMP graphics are saved upside-down.
; Read the graphic line by line (200 lines in VGA format),
; displaying the lines from bottom to top.
	mov ax, 0A000h
	mov es, ax
	mov cx,[picHigh] 
	PrintBMPLoop:
	push cx
; di = cx*320, point to the correct screen line
	mov di,cx 
	shl cx,6 
	shl di,8 
	add di,cx
	add di,[leftGap]
	add di,[topGap]
; Read one line
	mov ah,3fh
	mov cx,[picWidth]
	mov dx,offset ScrLine
	int 21h 
; Copy one line into video memory
	cld 		; Clear direction flag, for movsb
	mov cx,[picWidth]
	mov si,offset ScrLine
	rep movsb 	; Copy line to the screen
	pop cx
	loop PrintBMPLoop
	Ret
endp CopyBitmap


proc CloseFile
;enter – filehandle
;exit – close the 
	mov ah,3Eh
	mov bx, [filehandle]
	int 21h
	ret
endp CloseFile

proc printPic
	call OpenFile
    call ReadHeader
    call ReadPalette
    call CopyPal
    call CopyBitmap
    call CloseFile
	ret
endp

proc clearScreen
	mov al, 00h
	mov cx, 0
	mov dx, 0
	mov [endX], 320
	mov [endY], 200
	call drawRectangle
	ret
endp