include Irvine32.inc 
 
.data 
 N DWORD ? 
 closestPrime DWORD ? 
 nthMember DWORD 0 
 
.code 
 
; проверка на простое 
isPrime PROC 
 mov ebx, 2 
 mov edx, 0 
 
 ; вычисление корня 
 mov edi, ecx 
 shr edi, 1 ; приближенное значение 
 while_prime_check: 
 cmp ebx, edi 
 jg is_prime_result 
 
 ; проверка на делимость 
 mov edx, 0 
 div ebx 
 cmp edx, 0 
 je not_prime 
 
 inc ebx 
 jmp while_prime_check 
 
 is_prime_result: 
 mov eax, 1 ; простое 
 ret 
 
 not_prime: 
 mov eax, 0 ; не простое 
 ret 
isPrime ENDP 
 
 
main PROC 
 ; ввод числа 
 mov edx, OFFSET promptN 
 call WriteString 
 call ReadDec 
 mov N, eax 
 
 ; нахождение на ближайшего просто 
 mov eax, N 
 find_prime_loop: 
 push eax 
 mov ecx, eax 
 call isPrime 
 pop eax 
 cmp eax, 1 ; проверка на простое 
 je prime_found 
 inc eax 
 jmp find_prime_loop 
 
prime_found: 
 mov closestPrime, eax 
 
 ; вычисление разницы простого и введенного 
 mov eax, N 
 sub eax, closestPrime 
 js negative_difference 
 jmp calculate_result 
 
negative_difference: 
 neg eax 
 
calculate_result: 
 mov nthMember, eax 
 
 mov edx, OFFSET closestPrimeMsg 
 call WriteString 
 mov eax, closestPrime 
 call WriteDec 
 call Crlf 
 
 
 
 exit 
main ENDP 
 
closestPrimeMsg BYTE "RESULT = ", 0 
 
promptN BYTE "Enter N: ", 0 
END main