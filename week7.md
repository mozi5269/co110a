# Mult

```
0.	@3  第一個值
1.	D=A  放入暫存
2.	@0  用M0存D
3.	M=D 
4.	@2  第二個值
5.	D=A 
6.	@1  M1存D
7.	M=D 
8.	@10 用此處用於判斷
9.	M=D 
10.	@0  
11.	D=M 
12.	@2  M2存放最後解答
13.	M=D+M 相加
14.	@10 紀錄點
15.	M=M-1   加完-1
16.	M;JNE   跳回
17.	@17     ＬＯＯＰ
18.	0;JMP   

```


# Fill
```
//input 24576  
//screen 16384 ~ 24576   8192
//JEQ if out = 0 jump

@8192
M = A

@24576
D = M

@16
D;JEQ

@8192   //black
D = M
M = M - 1
@0
D;JEQ
@16384
A = D + A
M = -1
@6
0;JMP

@8192   //white
D = M
M = M - 1
@0
D;JEQ
@16384
A = D + A
M = 0
@16
0;JMP
```

