;Dada la frase "Organización y la Computación", almacenada en la memoria, escriba un programa que determine
;cuantas letras ‘a’ seguidas de ‘c’ hay en ella.

ORG 1000H
pal DB "Organización y la Computación"
total DB 0

ORG 3000H
revisarC: INC BX
CMP BYTE PTR [BX], 63h
JZ ocurrencia
JMP re
ocurrencia: INC total
re: RET
revisarA: CMP BYTE PTR [BX], 61h
          JZ verC
          JMP r
verC: CALL revisarC
r: RET

ORG 2000H
MOV BX, OFFSET pal
inicio: CALL revisarA
INC BX
CMP BX, OFFSET total
JNZ inicio

hlt
end