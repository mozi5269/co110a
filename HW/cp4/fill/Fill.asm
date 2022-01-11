// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// FOREVER:          // (FOREVER)
//   int i = 16384;  //   @16384, D=A, @i, M=D
// 
// WHILE:           // (WHILE)
//    if (i >= 24576)  //   @24576, D=A, @i, D=M-D           註：(D=i-24576)
//      goto WEND;     //   @WEND, D;JGE
//    int color = 0;   //   @color, M=0   // 白色
//    if (M[24576]==0) //   @24576, D=M
//      goto NEXT;     //   @NEXT, D;JEQ
//    color = -1;      //   @color, M=-1  // 黑色
//  NEXT:              // (NEXT)
//    M[i] = color;    //   @color, D=M, @i, A=M, M=D // 重要!
//    i++;             //   @i, M=M+1
//    goto WHILE;      //   @WHILE, 0;JMP
//  WEND:              // (WEND)
//
//  goto FOREVER;      //   @FOREVER, 0;JMP


(TRUE)

@16384
D=A
@i
M=D
(LOOP)
//跑完一圈，歸零
@24576
D=A
@i
D=M-D   
@BREAK
D;JGE

//顏色初始設為0
@color
M=0
    //如果沒按，跳到PASS
    @24576
    D=M
    @PASS
    D;JEQ
//否則顏色為-1
@color
M=-1
(PASS)

//color 放進 D
@color
D=M
@i
//取當前i值，放進Ａ以select M[i]
A=M
// Memory[i] = color 
M=D
// i++
@i
M=M+1
@LOOP
0;JMP

(BREAK)

@TRUE
0;JMP