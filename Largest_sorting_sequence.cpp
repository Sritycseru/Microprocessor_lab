.model small
.stack 100h
.data
    msg1 db "Enter the input:$"
    msg2 db "Shorted output:$" 
    str db 100 dup ('$')
    size dw ?    
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
        mov str[si],al
        inc si
    jmp input 
        
    end_input:
    mov size,si 
     
    mov si,0
    
    first: 
        mov di,si
        second:
            inc di
            cmp di,size
            je gofirst
              
            mov al,str[si]
            mov bl,str[di]
            cmp al,bl
            jg second
            
            mov str[si],bl
            mov str[di],al
            jmp second
            
         gofirst:
         inc si
         cmp si,size
         je end_loop
     jmp first
                
        
    end_loop:
    call new
    mov ah,9
    lea dx,msg2
    int 21h
    mov ah,9
    lea dx,str
    int 21h
    
       
    exit:
    mov ah,4ch
    int 21h    
    main endp

    new proc
    mov ah,2
    mov dl,13
    int 21h
    mov ah,2
    mov dl,10
    int 21h
    ret 
    new endp
end main  .model small
.stack 100h
.data
    msg1 db "Enter the input:$"
    msg2 db "Shorted output:$" 
    str db 100 dup ('$')
    size dw ?    
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
        mov str[si],al
        inc si
    jmp input 
        
    end_input:
    mov size,si 
     
    mov si,0
    
    first: 
        mov di,si
        second:
            inc di
            cmp di,size
            je gofirst
              
            mov al,str[si]
            mov bl,str[di]
            cmp al,bl
            jl second
            
            mov str[si],bl
            mov str[di],al
            jmp second
            
         gofirst:
         inc si
         cmp si,size
         je end_loop
     jmp first
                
        
    end_loop:
    call new
    mov ah,9
    lea dx,msg2
    int 21h
    mov ah,9
    lea dx,str
    int 21h
    
       
    exit:
    mov ah,4ch
    int 21h    
    main endp

    new proc
    mov ah,2
    mov dl,13
    int 21h
    mov ah,2
    mov dl,10
    int 21h
    ret 
    new endp
end main