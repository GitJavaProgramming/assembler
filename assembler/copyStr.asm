;字符串复制
.386
.model flat,stdcall
.stack 4096  
ExitProcess proto,dwExitCode:dword

.data
source BYTE "this is source string",0 ;定义source为BYTE类型，初始值为字符串第一个字符 可以看出source为指针
target BYTE sizeof source dup(0) ; sizeof source 0x00000001 unsigned int

.code
main proc
	mov esi,0
	mov ecx,sizeof source
L1:
	mov al,source[esi] ;调试 可以看到al值变化
	mov target[esi],al
	inc esi ;源变址寄存器
	loop L1

	invoke ExitProcess,0
main endp
end main