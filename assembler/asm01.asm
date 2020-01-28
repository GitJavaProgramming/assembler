;第一个汇编源程序
;程序功能 将两个32位整数相加
;开始调试，在断点处选择调试窗口为寄存器可观察各个寄存器的值的变化
;观察到寄存器EAX EIP EFL值变化
;EAX=0000000B
;EIP=00251018
;在寄存器调试窗口右键可以查看每个寄存器的具体数据
;EFL中
;ZR PE设置为0

.386  ;伪指令表示这是一个32位汇编代码，能访问32位寄存器和地址
.model flat,stdcall
.stack 4096  
ExitProcess proto,dwExitCode:dword

.code  
main proc  
	mov eax,5  ;breakpoint查看寄存器值变化                 
	add eax,6                 
	invoke ExitProcess,0  
main endp  
end main