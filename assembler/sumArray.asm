;代码见 汇编语言 基于x86处理器 ch4.5.3 在VS调试器中显示数组
;伪指令
;offset 变量与段起始地址的距离
;lengthof 返回数组中元素的个数
;type  返回操作数或数组中每个元素的大小（按字节计）
;edi 目的变址寄存器
.386
.model flat,stdcall
.stack 4096  
ExitProcess proto,dwExitCode:dword

.data
intarray DWORD 1000h,2000h,3000h,4000h

.code
main proc
	mov edi,offset intarray
	mov ecx,lengthof intarray
	mov eax,0  ; breakpoint
L1:
	add eax,[edi]
	add edi,type intarray
	loop L1

	invoke ExitProcess,0
main endp
end main