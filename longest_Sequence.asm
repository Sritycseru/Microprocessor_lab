.model small
.stack 100h
.data
    msg1 db 'Enter the input:$' 
    large db 1
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h 
    
    mov bl,1;temporary value 
    mov bh,1;comparing bit
    mov ch,1;start bit
    
    input:
        mov ah,1
        int 21h
        cmp al,13
        je end_input 

        inc bh
        cmp bh,al
        jne update
        inc bl
        jmp input
        
        update:
        mov bh,al
        mov ch,al 
        
        cmp bl,large
        jl resetemp
        mov large,bl
        resetemp:
        mov bl,1  
    jmp input
    end_input:
    
    cmp bl,large
    jl finish
    mov large,bl 
    
    finish:
    call new
    mov cl,0
    output:
        cmp cl,large
        je exit
        mov ah,2
        mov dl,ch
        int 21h 
        inc cl
        inc ch
    jmp output
        
    
    exit:
    mov ah,4ch
    int 21h
    main endp

    new proc
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        ret
    new endp
end main