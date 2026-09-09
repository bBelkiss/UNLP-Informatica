; Los siguientes programas leen e imprimen carácteres. Indicar cuáles tienen errores y cómo solucionarlos.

ORG 1000H 
    A DB “HO LA” 
    B DB ? 
ORG 2000H 
    mov bx, offset A 
    mov al, 4 
    int 7 
    int 0 
END 
; La longitud en AL debe ser 5 (por el espacio)


ORG 1000H 
    A DB “ARQ” 
    B DB ?
ORG 2000H 
    mov al, 3 
    mov bx, A 
    int 7 
    int 0 
END 
; A BX se le tiene que pasar la dirección, no el contenido (usar offset)


ORG 1000H 
    A DB “HOLA” 
    B DB ? 
ORG 2000H 
    mov al, offset A - offset B 
    mov bx, offset A 
    int 7 
    int 0 
END
; A AL se le debe pasar la longitud del string, no la diferencia de direcciones (usar 4)


ORG 1000H 
    A DB ?
ORG 2000H 
    mov al, 3 
    mov bx, A 
    int 6 
    int 0 
END 
; A BX se le tiene que pasar la dirección, no el contenido (usar offset)


ORG 1000H 
    A DB ? 
ORG 2000H 
    int 6 
    mov bx, offset A 
    int 0 
END 
; Se tiene que poner el int 6 despues de otorgarle la direccion a BX (usar offset) y otorgar la longitud del string a AL (usar 1)


ORG 1000H 
    A DB ? 
ORG 2000H 
    mov bx, A 
    int 6 
    mov al, 1 
    int 7 
    int 0 
END
; A BX se le tiene que pasar la dirección, no el contenido (usar offset)