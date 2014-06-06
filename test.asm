
; .386

data segment
    ; org 100h
    id1 db 0h
    id2 db 06h
    
    id3 dw 0ah
    
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
    
    div al
    div ah
    div bl
    div dl
    div dh
    
    div ecx
    div edx
    div ebx
    div esi
    div edi
    div ecx
    div esp
    div ebp
    
    jnbe skip_mul
    mul byte ptr fs : [ ecx + ebx ]
    mul dword ptr gs : [ esi + esi ]
    mul byte ptr es : [ esi + edi ]
    mul dword ptr  ds : [ ebx + ecx ] 
    mul dword ptr ss : [ eax + edx ]
    mul byte ptr fs : [ ecx + esi ]
    mul byte ptr gs : [ edi + edi ] 
    mul dword ptr gs : [ esi + esi ]
    mul dword ptr fs : [ esi + ebx ]
    mul byte ptr es : [ ebx + ecx ] 
    mul dword ptr gs : [ esi + esi ]
    mul dword ptr fs : [ esp + ebx ]
    mul byte ptr ds : [ ebx + ebp ] 
    mul dword ptr gs : [ esi + esi ]
  skip_mul:
    
    ; add al,dl
    
    ; add eax,edx
    ; add eax,esi
    ; add ebx,edi
    
    
    
    
    clc
    
    
lable1: jmp lable1
    
    
    jmp end_l
    clc 
    
    ; mov ax,4c00h 
	; int 21h
end_l:
    
code ends 
    end start
