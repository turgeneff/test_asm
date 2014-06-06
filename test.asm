
; .386

data segment
    ; org 100h
    id1 db 0h
    id2 db 06h
    
    ; id3 dw 0ah
    
    ; org 100h
    id4 dd 0fffh
    
    var1 dd 0feabch
    var2 db 0fh
    var3 dd 010h
    var4 db 0h
    
data ends


code segment
        ; assume cs:code , ds:data
start:

    ; mov ax,data
    ; mov ds,ax
    
    clc 
    
    
    
    
    clc
    
    
lable1: jmp lable1
    
    
    jmp end_l
    clc 
    
    ; mov ax,4c00h 
	; int 21h
end_l:
    
code ends 
    end start
