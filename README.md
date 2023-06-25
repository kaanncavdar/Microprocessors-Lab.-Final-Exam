[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/W2h3gMYX)
[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=11297608&assignment_repo_type=AssignmentRepo)
# Project Work which will replace the Final Exam

Write an assembly code which will create similar outputs described and shown below.

1- Store your student number in memory adresses starting from 0100:2000h. Every number(char) will be stored in one byte address. (Hint DB)
![image](https://github.com/abbaselmas/CEN214-Microprocessors-Lab-Final/assets/28142617/6d6d992e-1227-4ebf-9102-eb545d8b1f97)

2- Move your student number 0100:2000h memory array starting from to 0200:2000h memory address.  (MOVSB)
![image](https://github.com/abbaselmas/CEN214-Microprocessors-Lab-Final/assets/28142617/a4826247-27fc-43c3-9b88-7f4ab0a655c0)

3- Display your student number and decide education status either 'Morning' or 'Evening' education. Print to the screen. (Hint: CMP, INT)  
![image](https://github.com/abbaselmas/CEN214-Microprocessors-Lab-Final/assets/28142617/09e9e799-a5b7-46ef-a472-92c81b70b747)
![image](https://github.com/abbaselmas/CEN214-Microprocessors-Lab-Final/assets/28142617/0ba7dd90-ddf7-4e95-ae00-be837ccaf9f6)


Update this README.md file with your own screenshots and explanations. Do not upload new README.md file.   
Update final.asm file with your own code.  
**Do not cheat. Do not copy. Do not share your work with your friends.**

Use git commands to upload your work to your own repository. Do not use file upload option on the web interface of the github.

# CEN214 - Microprocessors Lab. Final Exam solutions
## 1. Step
![Alt text](1.png)

## 2. Step
![Alt text](2.png)

## 3. Step
![Alt text](3.png)

## 4. The Code



    include 'emu8086.inc'          ;At the beginning of the code, an inclusion of the file named "emu8086.inc" is requested.
    .code                          ;Used to specify the code section where the code will run.

    student_Number db '2020555022'
    mov di, offset student_Number      ;The memory address of the "student_Number" variable is assigned to the "di" (destination index) register.

    mov bx, 0                      ;The "bx" (base register) is set to 0, and the "cx" (count register) is set to 10. Then, a procedure named "sendMemory" is called.
    mov cx, 10  
    call sendMemory  
    mov cx, 10                     ;The "cx" register is set to 10, the "bx" register is set to 200h (hexadecimal), and the "es" (extra segment) register is assigned the value of "bx". The "di" register is set to 2000h (hexadecimal). Finally, a procedure named "moveMemory" is called.
    mov bx, 200h
    mov es, bx
    mov di, 2000h
    call moveMemory

    mov al, byte ptr [2006h]       ;The value at address [2006h] is loaded into the "al" (accumulator low) register. Then, the "al" register is compared to '6'. If they are not equal, jump to the "mornings" label; otherwise, jump to the "evening" label.
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
