;Student Number 2020555022
;Student Name and Surname Kaan Çavdar
;Github Username kaanncavdar

include 'emu8086.inc'

.code 
student_Number db '2020555022'

mov di, offset student_Number


mov bx, 0
mov cx, 10  
call sendMemory
  
 
  
mov cx, 10
mov bx, 200h
mov es, bx
mov di, 2000h
call moveMemory

mov al, byte ptr [2006h]
cmp al, '6'
jne mornings
jmp exit

mornings:
mov ah, 0eh
mov al, ' '
int 10h
mov al, 'M'
int 10h
mov al, 'o'
int 10h
mov al, 'r'
int 10h
mov al, 'n'
int 10h
mov al, 'i'
int 10h
mov al, 'n'
int 10h
mov al, 'g'
int 10h
jmp exit
     
exit:
ret

sendMemory proc 
    
    mov al, [di]
    mov [2000h+bx],al
    
    mov ah, 0eh
    int 10h
    inc di
    inc bx
    loop sendMemory
    ret
sendMemory endp

moveMemory proc
    rep movsb
    ret
moveMemory endp

end
