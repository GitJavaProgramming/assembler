;------------------------------------------------------------------------------------
;Irvine32�����
;include��������INCͷ�ļ��������нṹ����������һЩ�궨�� ����ֻ������������������� 
;includelib ����LIB��̬�⣬����LIB���к�����ʵ�ִ��� ��������ʱ��ʵ�ִ������Ŀ��ģ��
;�Թ����� �൱�ڴ��ӳ������
;
;https://baike.baidu.com/item/lib%E6%96%87%E4%BB%B6/2108657?fr=aladdin
;LIB�ļ��д�ŵ��Ǻ������õ���Ϣ��ֵ��һ��������ݿ��о�̬���ݿ⣨.lib�ļ����Ͷ�̬���ݿ⣨.dll�ļ�����
;
;��Ҫ����ⲿ���������Ŀ������
;����������-�����桿-�����ӿ�Ŀ¼��
;����������-�����롿-�����������
;��Microsoft Macro assemble��-��IncludePaths��
;
;ʹ��VS2017����ʱ����������ֲ�����Ҫ�������ж��Ƿ�vs2017�����˲�������·��
;�����ߡ�-��ѡ�-��������-���������á�
;windows�Ƿ������������������  ����win10
;��windows��ȫ���ġ�-����������в������-����������в�������á�-����ӻ�ɾ���ų��
;------------------------------------------------------------------------------------
include Irvine32.inc

.data
COUNT=4
BlueTextOnGray = blue+(lightGray*16)
DefaultColor = lightGray + (black*16)
arrayD SDWORD 12345678h,1A4B2000h,3434h,7AB9h
prompt BYTE "Enter a 32bit signed integer:",0

.code
main proc
	mov eax,BlueTextOnGray
	call setTextColor
	call Clrscr

	mov esi, OFFSET arrayD
	mov ebx, TYPE arrayD
	mov ecx, LENGTHOF arrayD
	call DumpMem

	call Crlf
	mov ecx, COUNT
L1:
	mov edx,OFFSET prompt
	call WriteString
	call ReadInt
	call Crlf
	call WriteInt
	call Crlf
	call WriteHex
	call Crlf
	call WriteBin
	call Crlf
	call Crlf
	LOOP L1

	call WaitMsg
	mov eax,DefaultColor
	call SetTextColor
	call Clrscr

	exit
main endp
end main