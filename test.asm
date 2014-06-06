
.386

data segment
    org 0f0h
    id1 db 0h
    id2 db 06h
    org 0effh
    id4 dd 0fffh
    var1 dd 0feabch
    var2 db 0fh
    var3 dd 010h
    var4 db 0h
    
data ends


code segment
        assume cs:code , ds:data
        
    org 100h
start:

    jmp end_l
    jnbe end_l
    clc
    
    jmp div_skip
    div al
    div ah
    div bl
    div dl
    div dh
  div_skip:
    
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
    mul byte ptr ds : [ esp + edx ]
  skip_mul:
  
  rep_1:
    and ecx,dword ptr es:[esp][ecx]
    and al,es:[edi + esi]
    and ebx,ds:[ebx + esi]
    and ebx,fs : [ ebx + esi ]
    and edi,gs : [ ecx + edi ]
    and ecx,gs : [ eax + eax ]
    jnbe rep_1
    
    mov byte ptr fs:[ecx + edi],al
    mov  cs : [edi + esi], ebx
    mov gs:[edx + esi],cl
    mov ds : [ ebx + ebp ] , esi
    mov ss : [ eax + edx ] , ecx 
    mov gs : [ esi + esi ] , esi
    
     
    ; mov edi , 4h
    ; mov al , 0h
    ; mov ebx , 15h
    ; mov cl, 0efh
    ; mov esi, 1ffh
    ; mov ecx, 0efffabc2h
    ; mov esi, 2515fecah
    ; mov bh , 1h
    ; mov ch , 080h
    
    mov dword ptr es : [ ecx + ecx ] , 4h
    mov byte ptr fs:[ecx + edi], 0h
    mov dword ptr cs : [edi + esi], 15h
    mov byte  ptr gs: [edx + esi] , 0efh
    mov dword ptr ds : [ ebx + ebp ] , 1ffh
    mov dword ptr ss : [ eax + edx ] , 0efffabc2h 
    mov dword ptr gs : [ esi + esi ] , 2515fecah
    mov byte ptr ds : [ ebx + eax ], 1h
    mov byte ptr gs : [ esi + edi ] , 080h
    
    add al,dl
    add bh,cl
    add cl,cl
    add bl,dh
    add eax,edx
    add eax,esi
    add ebx,edi
    add edi,esi
    add esp,eax
        
    
    jmp af_inf_l
    clc
    
    
lable1: jmp lable1
  af_inf_l:
    
    clc 
    
        
end_l:
    jmp af_inf_l
    jnbe start
    jmp start 
    
code ends 
    end start
