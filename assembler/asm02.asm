;64λ���
;��Ҫ��������ָ����ڵ� ������main

ExitProcess proto

.data
sum QWORD 0

.code  
main proc  
	mov rax,5  ;breakpoint�鿴�Ĵ���ֵ�仯                 
	add rax,6
	add rax,7
	mov sum,rax

	mov rcx,0
	call ExitProcess
main endp  
end