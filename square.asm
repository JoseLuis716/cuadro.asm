PILA    SEGMENT STACK
        DB 64 DUP('PILA')
PILA    ENDS

DATA SEGMENT
;Aqui se declaran las variables
nombre db 'Jose$'
nombre2 db 'Luis$'
apellido db 'Rivera$'
apellido2 db 'Avelino$'
DATA ENDS

CODIGO  SEGMENT
        ASSUME CS:CODIGO,SS:PILA,DS:DATA
INICIO: 
    mov ax,DATA
	MOV DS,AX
	
; borramos pantalla.
       mov  ah,06h
       mov  bh,00h; 
       mov  dh,10
       mov  dl,10
       mov  al,0h
       mov  cx,00h
       mov dx,30a0h
       int  10h
	   
	   	
	   ;creamos primer cuadro
        mov cx, 0303h ;coordenadas de la esquina superior izquierda (renglon,columna) (0,0)
        mov dx, 0914h ;coordenadas de la esquina superior derecha (renglon,columna) (9,37)
        xor al, al;AL es el numero de lineas
        mov bh, 4Eh ;atributo a utilizar para las lineas: ()
        mov ah, 6 ;Cambio a la pagina anterior activa
        int 10h  
	   ;creamos segundo cuadro
        mov cx, 0315h ;coordenadas de la esquina superior izquierda (renglon,columna) (0,0)
        mov dx, 0926h ;coordenadas de la esquina superior derecha (renglon,columna) (9,37)
        xor al, al; limpia
        mov bh, 3Fh ;atributo a utilizar para las lineas: letras , fondo 
        mov ah, 6 ;Cambio a la pagina anterior activa
        int 10h
  		
		;creamos tercer cuadro
        mov cx, 0A03h ;coordenadas de la esquina superior izquierda (renglon,columna) 
        mov dx, 1014h ;coordenadas de la esquina superior derecha (renglon,columna) (
        xor al, al; limpia
        mov bh, 1Fh ;atributo a utilizar para las lineas
        mov ah, 6 ;Cambio a la pagina anterior activa
        int 10h
        ;creamos cuarto cuadro
        mov cx, 0A15h ;coordenadas de la esquina superior izquierda (renglon,columna) (0,0)
        mov dx, 1026h ;coordenadas de la esquina superior derecha (renglon,columna) (9,37)
        xor al, al; limpia
        mov bh, 5Ah ;atributo a utilizar para las lineas: letras , fondo 
        mov ah, 6 ;Cambio a la pagina anterior activa
        int 10h	
		
	; manipulamos el cursor para poder poner los nombres
		mov ah,02h ;Selección de posición del cursor:BH = numero de pagina 
		mov dh,06h ;renglón
		mov dl,09h ;columna
		mov bx,00h ;para gráficos
		int 10h
		mov ah,09h
		mov dx,offset nombre
		int 21h		
		
		mov ah,02h ;Selección de posición del cursor:BH = numero de pagina 
		mov dh,06h ;renglón
		mov dl,19h ;columna
		mov bx,00h ;para gráficos
		int 10h
		mov ah,09h
		mov dx,offset nombre2
		int 21h
		
		mov ah,02h ;Selección de posición del cursor:BH = numero de pagina 
		mov dh,0Dh ;renglón
		mov dl,09h ;columna
		mov bx,00h ;para gráficos
		int 10h
		mov ah,09h
		mov dx,offset apellido
		int 21h		
		
		mov ah,02h ;Selección de posición del cursor:BH = numero de pagina 
		mov dh,0Dh ;renglón
		mov dl,19h ;columna
		mov bx,00h ;para gráficos
		int 10h
		mov ah,09h
		mov dx,offset apellido2
		int 21h	
		
		mov ah,02h
		mov bx,00h
		mov dl,18 ;columna
		mov dh,25 ;renglon
		int 10h
		

mov ah, 4ch
int 21h
CODIGO  ENDS
        END INICIO 