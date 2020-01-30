;------------------------------------------------------------------------------------
;Irvine32库测试
;include包含的是INC头文件，里面有结构等声明还有一些宏定义 声明只是声明有这个东西而已 
;includelib 包含LIB静态库，这种LIB中有函数的实现代码 会在链接时将实现代码加入目标模块
;以供调用 相当于存子程序代码
;------------------------------------------------------------------------------------
include Irvine32.inc

.data
COUNT=4
BlueTextOnGray = blue+(lightGray*16)
DefaultColor = lightGray + (black*16)
arrayD SWORD 12345678h,1A4B2000h,3434h,7AB9h
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