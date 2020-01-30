;字符串反转
.386
.model flat,stdcall
.stack 4096  
ExitProcess proto,dwExitCode:dword

.data
aName BYTE "鹏鹏",0
nameSize=($-aName)-1

.code
main proc
	mov ecx,nameSize
	mov esi,0
L1:
	movzx eax,aName[esi]  ;扩展为32位并传送，只用于无符号整数
	push eax
	inc esi
	loop L1

	mov ecx,nameSize
	mov esi,0
L2:
	pop eax
	mov aName[esi],al  ;如果使用eax将导致编译错误 数据大小不一致
	inc esi
	LOOP L2

	invoke ExitProcess,0
main endp
end main