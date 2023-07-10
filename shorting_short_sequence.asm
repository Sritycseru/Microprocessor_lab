.model small
.stack 100h
.data

  msg1 db 'Enter Numbers:$'
  msg2 db 'Largest Number:$' 
  arr db 100 dup('$')
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov si,0 
   
 input:
    mov ah,1
    int 21h
     
    
    cmp al,13
    je end_input
    
    sub al,48
    mov arr[si],al
    inc si
    
    jmp input
     
  end_input:  
    mov arr[si],'$'
    mov si,0
    mov bl,9 
    
  find_largest:
     cmp arr[si],'$'
     je output
        
     cmp bl,arr[si]
     jg update_largest
        
     inc si
     jmp find_largest
        
  update_largest:
     mov bl,arr[si]
     inc si
     jmp find_largest
 
 
 output:
   call newline
   mov ah,9
   lea dx,msg2
   int 21h
   mov ah,2
   mov dl,bl
   add dl,48
   int 21h 
 
 exit:
 mov ah,4ch
 int 21h
    
    
 main endp 

newline proc
    mov ah,2
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h
    ret
    newline endp

end main

    
