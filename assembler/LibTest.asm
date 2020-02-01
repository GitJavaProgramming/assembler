;------------------------------------------------------------------------------------
;Irvine32库测试
;include包含的是INC头文件，里面有结构等声明还有一些宏定义 声明只是声明有这个东西而已 
;includelib 包含LIB静态库，这种LIB中有函数的实现代码 会在链接时将实现代码加入目标模块
;以供调用 相当于存子程序代码
;
;https://baike.baidu.com/item/lib%E6%96%87%E4%BB%B6/2108657?fr=aladdin
;LIB文件中存放的是函数调用的信息，值得一提的是数据库有静态数据库（.lib文件）和动态数据库（.dll文件）。
;
;需要添加外部库包含在项目属性中
;【链接器】-【常规】-【附加库目录】
;【链接器】-【输入】-【附加依赖项】
;【Microsoft Macro assemble】-【IncludePaths】
;
;使用VS2017测试时，如果报发现病毒需要做两个判断是否vs2017设置了不受信任路径
;【工具】-【选项】-【环境】-【信任设置】
;windows是否设置了软件不受信任  本机win10
;【windows安全中心】-【病毒和威胁防护】-【病毒和威胁防护设置】-【添加或删除排除项】
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