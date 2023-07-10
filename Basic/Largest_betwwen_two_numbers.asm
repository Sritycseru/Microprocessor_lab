.model small
.stack 100h
.data
 
 a db 'Input Numbers:$'
 b db 'Largest Number:$'

 
 .code
 
main proc 
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h

    mov ah,1
    int 21h
    mov bl,al
    int 21h 
    mov bh,al
 biggest:
    cmp bl,bh
    jg l1
    jmp l2 
    
    l2: 
    
    call new 
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,2 
    mov dl,bh
    int 21h
    jmp exit  
    
    l1:
    call new 
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,2 
    mov dl,bl
    int 21h
    jmp exit
    
    exit:
    mov ah,4ch
    int 21h
     
    
 main endp

 new proc 
 mov ah,2
 mov dl,10
 int 21h
 mov ah,2
 mov dl,13
 int 21h
 ret
 new endp 
 
 
end main
