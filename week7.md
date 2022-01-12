# Mult

```
M[2] = 0;
int j = M[1];
(LOOP)
    if(j == 0)
        break;
    j = M[0];
    M[2] = M[2] + D;
    M[1] = M[1] - 1;
    j = M[1];
 goto LOOP

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

