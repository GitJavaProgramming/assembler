;数组求和
.386
.model flat,stdcall
.stack 4096  
ExitProcess proto,dwExitCode:dword

.data
array DWORD 1000h,2000h,3000h,4000h,5000h,6000h
sum DWORD ?

.code
main proc
	mov esi,OFFSET array  ;数组首地址  源变址寄存器
	mov ecx,LENGTHOF array  ;数组长度  计数器
	call ArraySum  ;调用过程ArraySum 注意堆栈操作时ESP的变化 ESP表示堆栈指针 存放栈顶的逻辑偏移地址
	mov sum,eax
	invoke ExitProcess,0
main endp
;定义数组求和过程
ArraySum proc ;uses esi ecx 保存寄存器esi ecx到堆栈，过程结束时恢复
	;求和前初始化工作
	push esi
	push ecx
	mov eax,0 ;保存和值 初始值为0

L1:
	add eax,[esi] ;内存访问 求和
	add esi,TYPE DWORD ;移动esi
	LOOP L1

	pop ecx
	pop esi
	ret  ;过程返回
ArraySum endp

end main