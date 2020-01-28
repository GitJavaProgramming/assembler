;64位汇编
;需要在链接器指定入口点 这里是main

ExitProcess proto

.data
sum QWORD 0

.code  
main proc  
	mov rax,5  ;breakpoint查看寄存器值变化                 
	add rax,6
	add rax,7
	mov sum,rax

	mov rcx,0
	call ExitProcess
main endp  
end