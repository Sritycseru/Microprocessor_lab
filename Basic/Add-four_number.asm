.model small
.stack 100h
.data
 
 a db 'first Input:$'
 b db 'second Input:$' 
 d db 'third Input:$' 
 e db 'fourth Input:$' 
 
 c db 'result:$'
 
 .code
 
main proc 
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h

    mov ah,1
    int 21h;
    mov bl,al 
    
    call new 
    mov ah,9
    lea dx,b
    int 21h

    mov ah,1
    int 21h
    mov bh,al
    
    
    
    call new
    
    mov ah,9
    lea dx,d
    int 21h 

    mov ah,1
    int 21h 
    mov cl,al
     
    call new
    
    mov ah,9
    lea dx,e
    int 21h 

    mov ah,1
    int 21h 
    mov ch,al
     
     
    call new 
    mov ah,9
    lea dx,c
    int 21h
    
     
    add bl,bh
    sub bl,48
    mov a,bl 
     
    add a,cl  ;cl r sathe add korlam  
    sub a,48 
    mov bl,a
    
    add bl,ch
    sub bl,48
    ;mov b,bl
    
   
    mov ah,2
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