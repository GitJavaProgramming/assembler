;����� ������� ����x86������ ch4.5.3 ��VS����������ʾ����
;αָ��
;offset ���������ʼ��ַ�ľ���
;lengthof ����������Ԫ�صĸ���
;type  ���ز�������������ÿ��Ԫ�صĴ�С�����ֽڼƣ�
;edi Ŀ�ı�ַ�Ĵ���
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