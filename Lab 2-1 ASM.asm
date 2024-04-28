include Irvine32.inc 
 
.data 
 N DWORD ? 
 closestPrime DWORD ? 
 nthMember DWORD 0 
 
.code 
 
; �������� �� ������� 
isPrime PROC 
 mov ebx, 2 
 mov edx, 0 
 
 ; ���������� ����� 
 mov edi, ecx 
 shr edi, 1 ; ������������ �������� 
 while_prime_check: 
 cmp ebx, edi 
 jg is_prime_result 
 
 ; �������� �� ��������� 
 mov edx, 0 
 div ebx 
 cmp edx, 0 
 je not_prime 
 
 inc ebx 
 jmp while_prime_check 
 
 is_prime_result: 
 mov eax, 1 ; ������� 
 ret 
 
 not_prime: 
 mov eax, 0 ; �� ������� 
 ret 
isPrime ENDP 
 
 
main PROC 
 ; ���� ����� 
 mov edx, OFFSET promptN 
 call WriteString 
 call ReadDec 
 mov N, eax 
 
 ; ���������� �� ���������� ������ 
 mov eax, N 
 find_prime_loop: 
 push eax 
 mov ecx, eax 
 call isPrime 
 pop eax 
 cmp eax, 1 ; �������� �� ������� 
 je prime_found 
 inc eax 
 jmp find_prime_loop 
 
prime_found: 
 mov closestPrime, eax 
 
 ; ���������� ������� �������� � ���������� 
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