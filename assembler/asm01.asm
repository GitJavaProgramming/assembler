;��һ�����Դ����
;������ ������32λ�������
;��ʼ���ԣ��ڶϵ㴦ѡ����Դ���Ϊ�Ĵ����ɹ۲�����Ĵ�����ֵ�ı仯
;�۲쵽�Ĵ���EAX EIP EFLֵ�仯
;EAX=0000000B
;EIP=00251018
;�ڼĴ������Դ����Ҽ����Բ鿴ÿ���Ĵ����ľ�������
;EFL��
;ZR PE����Ϊ0

.386  ;αָ���ʾ����һ��32λ�����룬�ܷ���32λ�Ĵ����͵�ַ
.model flat,stdcall
.stack 4096  
ExitProcess proto,dwExitCode:dword

.data
val1 DWORD 20002000h
val2 DWORD 11111111h
val3 DWORD 22222222h
sum DWORD 0

.code  
main proc  
	mov eax,val1  ;breakpoint�鿴�Ĵ���ֵ�仯                 
	add eax,val2
	add eax,val3
	mov sum,eax
	invoke ExitProcess,0  
main endp  
end main