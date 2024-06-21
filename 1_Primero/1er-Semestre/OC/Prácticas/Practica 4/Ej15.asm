; Escribir un programa que efectúe la suma de dos vectores de 6 elementos cada uno (donde cada elemento es un
; número de 32 bits) almacenados en memoria de datos y etiquetados TAB1 y TAB2 y guarde el resultado en TAB3.
; Suponer en primera instancia que no existirán errores de tipo aritmético (ni carry ni overflow), luego analizar y definir
; los cambios y agregados necesarios que deberían realizarse al programa para tenerlos en cuenta.

ORG 1000H
CANT DB 12 
DIR3 DW ? 
TAB1 DW 1,1,2,2,3,3,4,4,5,5,6,6
TAB2 DW 01,01,02,02,03,03,04,04,05,05,06,06
TAB3 DW ?

ORG 2000H

MOV AX, OFFSET TAB1
MOV CX, OFFSET TAB2
MOV DIR3, OFFSET TAB3
INICIO: MOV BX, AX
MOV DX, [BX] ;guarda primer valor de TAB1 en DX
MOV BX, CX
ADD DX, [BX] ;Hacemos la suma de valores de TAB1 Y TAB2

MOV BX, DIR3
MOV [BX], DX ; guardo la suma en TAB3

ADD AX, 2
ADD CX, 2
ADD DIR3, 2

DEC CANT
JNZ INICIO
hlt

end