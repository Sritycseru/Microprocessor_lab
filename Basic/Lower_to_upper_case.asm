.model small
.stack 100h
.data
 
 a db 'lower case:$'
 b db 'upper Input:$'

 
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
    
    call new 
    mov ah,9
    lea dx,b
    int 21h

    sub bl,32 
    mov ah,2 ;bl=bl-32
    mov dl,bl
    int 21h
    
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
