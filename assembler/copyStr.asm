;�ַ�������
.386
.model flat,stdcall
.stack 4096  
ExitProcess proto,dwExitCode:dword

.data
source BYTE "this is source string",0 ;����sourceΪBYTE���ͣ���ʼֵΪ�ַ�����һ���ַ� ���Կ���sourceΪָ��
target BYTE sizeof source dup(0) ; sizeof source 0x00000001 unsigned int

.code
main proc
	mov esi,0
	mov ecx,sizeof source
L1:
	mov al,source[esi] ;���� ���Կ���alֵ�仯
	mov target[esi],al
	inc esi ;Դ��ַ�Ĵ���
	loop L1

	invoke ExitProcess,0
main endp
end main