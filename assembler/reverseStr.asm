;�ַ�����ת
.386
.model flat,stdcall
.stack 4096  
ExitProcess proto,dwExitCode:dword

.data
aName BYTE "����",0
nameSize=($-aName)-1

.code
main proc
	mov ecx,nameSize
	mov esi,0
L1:
	movzx eax,aName[esi]  ;��չΪ32λ�����ͣ�ֻ�����޷�������
	push eax
	inc esi
	loop L1

	mov ecx,nameSize
	mov esi,0
L2:
	pop eax
	mov aName[esi],al  ;���ʹ��eax�����±������ ���ݴ�С��һ��
	inc esi
	LOOP L2

	invoke ExitProcess,0
main endp
end main