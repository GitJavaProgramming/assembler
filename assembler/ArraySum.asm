;�������
.386
.model flat,stdcall
.stack 4096  
ExitProcess proto,dwExitCode:dword

.data
array DWORD 1000h,2000h,3000h,4000h,5000h,6000h
sum DWORD ?

.code
main proc
	mov esi,OFFSET array  ;�����׵�ַ  Դ��ַ�Ĵ���
	mov ecx,LENGTHOF array  ;���鳤��  ������
	call ArraySum  ;���ù���ArraySum ע���ջ����ʱESP�ı仯 ESP��ʾ��ջָ�� ���ջ�����߼�ƫ�Ƶ�ַ
	mov sum,eax
	invoke ExitProcess,0
main endp
;����������͹���
ArraySum proc ;uses esi ecx ����Ĵ���esi ecx����ջ�����̽���ʱ�ָ�
	;���ǰ��ʼ������
	push esi
	push ecx
	mov eax,0 ;�����ֵ ��ʼֵΪ0

L1:
	add eax,[esi] ;�ڴ���� ���
	add esi,TYPE DWORD ;�ƶ�esi
	LOOP L1

	pop ecx
	pop esi
	ret  ;���̷���
ArraySum endp

end main