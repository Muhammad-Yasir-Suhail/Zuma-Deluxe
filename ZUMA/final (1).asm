INCLUDE Irvine32.inc
includelib Winmm.lib

PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD

.data
    ;SOUNDS
    deviceConnect BYTE "DeviceConnect",0

    SND_ALIAS    DWORD 00010000h
    SND_RESOURCE DWORD 00040005h
    SND_FILENAME DWORD 00002000h

    file BYTE "movement.wav",0
    fruitfile db "fruity.wav",0
    gameOvertrack db "gameover.wav",0
    death db  "death.wav",0
    explosion db "explode.wav",0



PACMAN_ART     db '                  ________  ________  ________  _____ ______   ________  ________      ',13,10
               db '                           |\   __  \|\   __  \|\   ____\|\   _ \  _   \|\   __  \|\   ___  \    ',13,10
               db '                           \ \  \|\  \ \  \|\  \ \  \___|\ \  \\\__\ \  \ \  \|\  \ \  \\ \  \   ',13,10
               db '                            \ \   ____\ \   __  \ \  \    \ \  \\|__| \  \ \   __  \ \  \\ \  \  ',13,10
               db '                             \ \  \___|\ \  \ \  \ \  \____\ \  \    \ \  \ \  \ \  \ \  \\ \  \ ',13,10
               db '                              \ \__\    \ \__\ \__\ \_______\ \__\    \ \__\ \__\ \__\ \__\\ \__\',13,10
               db '                               \|__|     \|__|\|__|\|_______|\|__|     \|__|\|__|\|__|\|__| \|__|',13,10
               db '                                                                                  ',13,10
               db 0                                                      
                                                                      
                                                                      
START             DB '                                               ___ ___ ___ ___ ___   ',13,10
                  DB '                                              / __|_ _| . | . |_ _|  ',13,10
                  DB '                                              \__ \| ||   |   /| |   ',13,10
                  DB '                                              <___/|_||_|_|_\_\|_|   ',13,10
                  DB 0   

INSTRUCTIONS    DB '                                     _ _ _ ___ ___ ___ _ _ ___ ___ _ ___ _ _ ___ ',13,10
                DB '                                    | | \ / __|_ _| . | | |  _|_ _| | . | \ / __>',13,10
                DB '                                    | |   \__ \| ||   |   | <__| || | | |   \__ \',13,10
                DB '                                    |_|_\_<___/|_||_\_`___`___/|_||_`___|_\_<___/',13,10
                DB 0
            
EXITED           DB '                                                  _____  _ _ ___   ',13,10
                 DB '                                                 | __\ \/ | |_ _|  ',13,10
                 DB '                                                 | _> \ \ | || |   ',13,10
                 DB '                                                 |____/\_\|_||_|   ',13,10
                 DB 0
                                           
 POINTER            DB'  <<<<<<<<<<<<<<<<   ',13,10
                    DB 0

pauseScreen         db'                 $$$$$$$\  $$$$$$$$\  $$$$$$\  $$\   $$\ $$\      $$\ $$$$$$$$\ ',13,10
                    db'                 $$  __$$\ $$  _____|$$  __$$\ $$ |  $$ |$$$\    $$$ |$$  _____|',13,10
                    db'                 $$ |  $$ |$$ |      $$ /  \__|$$ |  $$ |$$$$\  $$$$ |$$ |      ',13,10
                    db'                 $$$$$$$  |$$$$$\    \$$$$$$\  $$ |  $$ |$$\$$\$$ $$ |$$$$$\    ',13,10
                    db'                 $$  __$$< $$  __|    \____$$\ $$ |  $$ |$$ \$$$  $$ |$$  __|   ',13,10
                    db'                 $$ |  $$ |$$ |      $$\   $$ |$$ |  $$ |$$ |\$  /$$ |$$ |      ',13,10
                    db'                 $$ |  $$ |$$$$$$$$\ \$$$$$$  |\$$$$$$  |$$ | \_/ $$ |$$$$$$$$\ ',13,10
                    db'                 \__|  \__|\________| \______/  \______/ \__|     \__|\________|',13,10
                    db'                                                                                ',13,10
                    db'                                                                                ',13,10
                    db'                                                                                ',13,10
                    db'                             $$$$$$$$\ $$\   $$\ $$$$$$\ $$$$$$$$\              ',13,10
                    db'                             $$  _____|$$ |  $$ |\_$$  _|\__$$  __|             ',13,10
                    db'                             $$ |      \$$\ $$  |  $$ |     $$ |                ',13,10
                    db'                             $$$$$\     \$$$$  /   $$ |     $$ |                ',13,10
                    db'                             $$  __|    $$  $$<    $$ |     $$ |                ',13,10
                    db'                             $$ |      $$  /\$$\   $$ |     $$ |                ',13,10
                    db'                             $$$$$$$$\ $$ /  $$ |$$$$$$\    $$ |                ',13,10
                    db'                             \________|\__|  \__|\______|   \__|                ',13,10
                    db 0

INSTRUCTIONS_SCREEN             db'Controls:                                                                                        ',13,10
                               db'                                                                                                 ',13,10
                               db' 1-Use the (w a s d) to move Pac-Man through the maze.                                           ',13,10
                               db' 2-Try to eat all the dots in the maze to advance to the next level.                             ',13,10
                               db'                                                                                                 ',13,10
                               db' Gameplay:                                                                                       ',13,10
                               db'                                                                                                 ',13,10
                               db' 1-Pac-Man moves through the maze, consuming dots along the way.                                 ',13,10
                               db' 2-Avoid contact with the ghosts; they will try to catch Pac-Man.                                ',13,10
                               db' 3-Eating a power pellet turns the ghosts blue, allowing Pac-Man to eat them for a limited time. ',13,10
                               db' 4-Eating fruits for extra points may appear at certain times in the maze.                       ',13,10
                               db'                                                                                                 ',13,10
                               db' Scoring:                                                                                        ',13,10
                               db'                                                                                                 ',13,10
                               db' 1-Each dot consumed earns points.                                                               ',13,10
                               db' 2-Eating ghosts after consuming a power pellet earns bonus points.                              ',13,10
                               db' 3-Bonus points are awarded for completing a level.                                              ',13,10
                               db'                                                                                                 ',13,10
                               db' Game Over:                                                                                      ',13,10
                               db'                                                                                                 ',13,10
                               db' 1-If Pac-Man collides with a ghost without consuming a power pellet, a life is lost.            ',13,10
                               db' 2-Losing all lives ends the game. You have three lives to start.                                ',13,10
                               db 0
                               
 gameOverScreen   db'                    ______        ______  _______     _____  _    _ _______ ______                                    ',13,10
                  db'                   / _____)  /\  |  ___ \(_______)   / ___ \| |  | (_______(_____ \                                    ',13,10
                  db'                  | /  ___  /  \ | | _ | |_____     | |   | | |  | |_____   _____) )                                   ',13,10
                  db'                  | | (___)/ /\ \| || || |  ___)    | |   | |\ \/ /|  ___) (_____ (                                    ',13,10
                  db'                  | \____/| |__| | || || | |_____   | |___| | \  / | |_____      | |                                   ',13,10
                  db'                   \_____/|______|_||_||_|_______)   \_____/   \/  |_______)     |_|                                   ',13,10
                  db 0                                            
                  
                         anim1      db"        )        ",13,10
                                    db"        (        ",13,10
                                    db"       .-`-.     ",13,10
                                    db"       :   :     ",13,10
                                    db"       :TNT:     ",13,10
                                    db"       :___:     ",13,10,0
                                    db"                 ",13,10
                         anim2      db"       \|/       ",13,10
                                    db"      - o -      ",13,10
                                    db"       /-`-.     ",13,10
                                    db"       :   :     ",13,10
                                    db"       :TNT:     ",13,10
                                    db"       :___:     ",13,10,0
                                    db"                 ",13,10
                         anim3      db"       .---.     ",13,10
                                    db"       : | :     ",13,10
                                    db"       :-o-:     ",13,10
                                    db"       :_|_:     ",13,10,0
                                    db"                 ",13,10
                         anim4      db"       .---.     ",13,10
                                    db"       (\|/)     ",13,10
                                    db"       --0--     ",13,10
                                    db"       (/|\)     ",13,10,0
                                    db"                 ",13,10
                         anim5      db"      '.\|/.'    ",13,10
                                    db"      (\   /)    ",13,10
                                    db"      - -O- -    ",13,10
                                    db"      (/   \)    ",13,10
                                    db"      ,'/|\'.    ",13,10,0
                         anim6      db"   '.  \ | /  ,' ",13,10
                                    db"     `. `.' ,'   ",13,10
                                    db"    ( .`.|,' .)  ",13,10
                                    db"    - ~ -0- ~ -  ",13,10
                                    db"    (            ",13,10,0
                         anim7      db"                 ",13,10
                                    db"   ','|'.` )     ",13,10
                                    db"     .' .'. '.   ",13,10
                                    db"   ,'  / | \  '. ",13,10
                                    db"       \ '  '    ",13,10
                                    db"    ` . `.' ,'   ",13,10
                                    db"    . `` ,'. '   ",13,10
                                    db"      ~ (   ~ -  ",13,10
                                    db"   '             ",13,10,0
                        anim8       db"                 ",13,10
                                    db"   . ','|` ` .   ",13,10
                                    db"     .'  '  '    ",13,10
                                    db"   ,   ' , '  `  ",13,10,0
                        anim9       db"                 ",13,10
                                    db"      (  ) (     ",13,10
                                    db"       ) ( )     ",13,10
                                    db"       (  )      ",13,10
                                    db"        ) /      ",13,10
                                    db"       ,---.     ",13,10,0

menuSelect db 1

ground BYTE "------------------------------------------------------------------------------------------------------------------------",0
ground1 BYTE "|",0ah,0
ground2 BYTE "|",0
ground3 db '_',0

pauseKey db 0
paused db 0

temp byte ?
temporary dw ?
temp2 dd ?
temp3 byte ?
addressTemp dd ?
x db 0
y db 0

strScore BYTE "Your score is: ",0
score dw 0

xPos BYTE 32
yPos BYTE 14

loopVarCoin db 30
xCoinPos BYTE ?
yCoinPos BYTE ?

inputChar BYTE ?

prompt1 db "Enter your name:",0
names db 20 dup (32)
strName db "Name:",0

livesString db "Lives:",0
lives3 db "$$$",0
lives2 db "$$",0
lives1 db "$",0
lives db 3

;GHOSTS
ghost db '@'
Xghost db 24
Yghost db 6
Xinky db 40
Yinky db 15
Xclyde db 100
Yclyde db 3
ghostDirection db 0

;Walls
XBlocksStarting db 10,50,100,20,60,115,30,70,110
YBlocksStarting db 5,5,5,14,14,14,10,10,10
XBlocksHorizontal db 11,51,61,67
YBlocksHorizontal db 4,9,25,4


XBlocksStarting1 db 5,20,35,50,65,80,95,110,5,20,35,50,65,80,95,110,5,20,35,50,65,80,95,110
YBlocksStarting1 db 5,5,5,5,5,5,5,5,13,13,13,13,13,13,13,13,21,21,21,21,21,21,21,21
XBlocksHorizontal1 db 6,6,36,36,66,66,96,96,6,6,36,36,66,66,96,96,6,6,36,36,66,66,96,96
YBlocksHorizontal1 db 4,9,4,9,4,9,4,9,12,17,12,17,12,17,12,17,20,25,20,25,20,25,20,25

XBlocksStarting2   db 20,35,50,70,85,100,16,31,46,66,81,96
YBlocksStarting2   db 5,7,5,7,5,7,14,16,14,16,14,16
XBlocksHorizontal2 db 10,25,40,60,75,90,6,21,36,55,71,86
YBlocksHorizontal2 db 9,11,9,11,9,11,18,20,18,20,18,20

XBlock db 6,36,66,96,6,36,66,96,6,36,66,96
YBlock db 5,5,5,5,13,13,13,13,21,21,21,21

Xcoordinates db 3332 dup(-1)
Ycoordinates db 3332 dup(-1)

Xwalls db 1000 dup(-1)
Ywalls db 1000 dup(-1)


fruits dd 30000,60000,10000,15000
Xfruit db 5,50,60,100,50
Yfruit db 3,3,10,18,16
starttimer dd 0
endTimer dd ?
timer dd ?
fruitMoved db 0
YfruitFinal db ?
XfruitFinal db ?
eaten db 0
lineCheck db 0
HighScores db "HIGHSCORES:",13,10,0

;FileHandling
scoreFile db "C:\Users\user\Desktop\Data_Structure\COAL_FINAL_PROJECT\Scores.txt",0
scoreFile1 db "C:\Users\user\Desktop\Data_Structure\COAL_FINAL_PROJECT\Scores1.txt",0
fileHandle  HANDLE ?
BUFSIZE = 5000
buffer BYTE BUFSIZE DUP(?)
bytesRead DWORD ?

n1 db 20 dup(?)
n2 db 20 dup(?)
n3 db 20 dup(?)

scr1 db 10 dup(?)
scr2 db 10 dup(?)
scr3 db 10 dup(?)

numscr1 dw ?
numscr2 dw ?
numscr3 dw ?

.code


main PROC
    ;INVOKE PlaySound, OFFSET deviceConnect, NULL, 0
    ;MAIN SCREEN
    mov dl,10 
    mov dh,10
    ;mov eax,offset PACMAN_ART
    mov eax,white
    call settextcolor
    call gotoxy
    mov edx,offset PACMAN_ART
    call writestring
   ; call waitmsg
    call clrscr

    ;NAME INPUT
    mov dh,0
    mov dl,0
    call gotoxy
    mov edx,offset prompt1
    mov ecx,lengthof prompt1
    call writestring
    mov edx,offset names
    mov ecx,20
    call readstring
    call clrscr

    ;START MENU
    point1:
        mov dl,70
        mov dh,3
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov menuSelect,1
    jmp start_tab

    point2:
        mov dl,80
        mov dh,12
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov menuSelect,2
    jmp start_tab

    point3:
        mov dl,70
        mov dh,22
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov menuSelect,3
    jmp start_tab


    start_tab:
    mov dl,0
    mov dh,1
    call gotoxy
    mov edx,offset START
    call writestring

    mov dl,0
    mov dh,10
    call gotoxy
    mov edx,offset INSTRUCTIONS
    call writestring

    mov dl,0
    mov dh,20
    call gotoxy
    mov edx,offset EXITED
    call writestring
    

    call readchar
    call clrscr
    cmp al,'1'
    je point1
    cmp al,'2'
    je point2
    cmp al,'3'
    je point3
    cmp al,13
    je selection


    selection:
    cmp menuSelect,1
    je startGame
    cmp menuSelect,2
    je INSTRUCTIONSSCREEN
    cmp menuSelect,3
    je exitGame

    INSTRUCTIONSSCREEN:
    mov dl,0 
    mov dh,0
    call gotoxy
    mov edx,offset INSTRUCTIONS_SCREEN
    call writestring
    call readchar
    call clrscr
    cmp al,27
    je point2
    jmp INSTRUCTIONSSCREEN


    startGame:
    
    
    ; draw ground at (0,29):
    mov eax,blue ;(black * 16)
    call SetTextColor
    mov dl,0
    mov dh,29
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    mov ecx,27
    mov dl,0
    mov dh,2
    l1:
    mov temp,dh
    call Gotoxy
    mov edx,OFFSET ground1
    call WriteString
    inc temp
    mov dh,temp
    loop l1


    mov ecx,27
    mov dh,2
    mov temp,dh
    l2:
    mov dh,temp
    mov dl,119
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    inc temp
    loop l2
    cmp paused,0
    jne skipPausing
        call DrawCoin
        jmp drawingplayer
    skipPausing:
        call updateCoin
    drawingplayer:
    call DrawPlayer

    ;BLOCKS
    mov esi,offset XBlocksStarting
    mov edi,offset YBlocksStarting
    mov ecx,9
    mov eax,offset Xwalls
    mov ebx,offset Ywalls
    loopBlock:
        mov temp,0

        loopPrint:
            mov dl,[esi]
            mov dh,[edi]
            add dh,temp
            call gotoxy
            mov [eax],dl
            mov [ebx],dh
            inc eax
            inc ebx
            mov edx,offset ground1
            call writestring
            

        inc temp
        cmp temp,15
        jne loopPrint

        inc esi
        inc edi
    loop loopBlock

    
    mov esi,offset XBlocksHorizontal
    mov edi,offset YBlocksHorizontal
    mov ecx,4
    loopBlock1:
        mov temp,0

        loopPrint1:
            mov dl,[esi]
            mov dh,[edi]
            add dl,temp
            call gotoxy
            mov [eax],dl
            mov [ebx],dh
            inc eax
            inc ebx
            mov edx,offset ground3
            call writestring
            

        inc temp
        cmp temp,49
        jne loopPrint1

        inc esi
        inc edi
    loop loopBlock1
    



    ;call CreateRandomCoin

    call Randomize

    gameLoop:
    

        cmp pauseKey,1
        jne skipPause
        PauseMenu:
            call clrscr
            mov dl,30
            mov dh,20
            mov edx,offset pauseScreen
            call writestring
            call readchar
            cmp al,27
            je exitGame
            cmp al,13
            jne PauseMenu
            call clrscr
            dec pauseKey
            ;call updateCoin
            jmp startGame
    skipPause:
        call updateGhost
        mov al,xGhost
        cmp xPos,al
        jne skipLives
            mov al,yGhost
            cmp yPos,al
                jne skipLives
            INVOKE PlaySound, OFFSET death, NULL, 1
            dec lives
            mov eax,2000
            call delay
            mov al,58
            mov xPos,al
            mov al,15
            mov yPos,al

        skipLives:
        ; getting points:
        mov bl,xPos
        cmp bl,xCoinPos
        jne notCollecting
        mov bl,yPos
        cmp bl,yCoinPos
        jne notCollecting
        ; player is intersecting coin:
        inc score
        call CreateRandomCoin
        call DrawCoin
        notCollecting:

        mov eax,white (black * 16)
        call SetTextColor

        mov al,0

        ;draw lives:
        mov dl,110
        mov dh,0
        call gotoxy
        mov edx,offset livesString
        mov ecx,lengthof livesString
        call writestring
        mov dl,116
        mov dh,0
        call gotoxy
        mov al,32
        call writechar
        call writechar
        call writechar
        mov dl,116
        mov dh,0
        call gotoxy
        movzx ecx,lives
        cmp cl,0
        je GameOver
        mov al,'$'
        loop2:
            call writechar
        loop loop2
        ;cmp al,1
        ;jne str2
        ;    mov edx,offset lives1
        ;    jmp liveSkip
        ;str2:
        ;cmp al,2
        ;jne str3
        ;    mov edx,offset lives2
        ;    jmp liveSkip
        ;str3:
        ;    mov edx,offset lives3
        ;liveSkip:
        ;call writestring

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        movzx eax,score
        call WriteInt

        ;draw name:
        mov dl,20
        mov dh,0
        call gotoxy
        mov edx,offset strName
        mov ecx,lengthof strName
        call writestring
        mov dl,25
        mov dh,0
        call gotoxy
        mov edx,offset names
        mov ecx,lengthof names
        call writestring



        ; gravity logic:
        ;gravity:
        ;cmp yPos,27
        ;jg onGround
        ; make player fall:
        call UpdatePlayer
        ;inc yPos
        call DrawPlayer
        ;jmp gravity
        onGround:

        

        ; get user key input:
        
        mov  eax,400          ; sleep, to allow OS to time slice
        call Delay 

        call readkey
        jz   gameLoop
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar,"p"
        jne skipPausing1
        inc pauseKey
        inc paused
        skipPausing1:


        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight

        cmp inputChar,"n"
        je Level2

        jmp gameLoop

        mov bl,0
        moveUp:
        INVOKE PlaySound, OFFSET file, NULL, 1
        cmp yPos,2
        je gameLoop
        mov al,0
        mov ah,-1
        call WallCollision
        cmp bl,1
        je gameLoop
        ; allow player to jump:
        mov ecx,1
        jumpLoop:
            call UpdatePlayer
            dec yPos
            call DrawPlayer
        loop jumpLoop
        call UpdateScore
        jmp gameLoop

        moveDown:
        INVOKE PlaySound, OFFSET file, NULL, 1
        cmp yPos,28
        je gameLoop
        mov al,0
        mov ah,1
        call WallCollision
        cmp bl,1
        je gameLoop
        call UpdatePlayer
        inc yPos
        call DrawPlayer
        call UpdateScore
        jmp gameLoop

        moveLeft:
        INVOKE PlaySound, OFFSET file, NULL, 1
        cmp xPos,1
        je gameLoop
        mov al,-1
        mov ah,0
        call WallCollision
        cmp bl,1
        je gameLoop
        call UpdatePlayer
        dec xPos
        call DrawPlayer
        call UpdateScore
        jmp gameLoop

        moveRight:
        INVOKE PlaySound, OFFSET file, NULL, 1
        cmp xPos,118
        je gameLoop
        mov al,1
        mov ah,0
        call WallCollision
        cmp bl,1
        je gameLoop
        call UpdatePlayer
        inc xPos
        call DrawPlayer
        call UpdateScore
        jmp gameLoop

        

    jmp gameLoop


    Level2:
    mov lives,3
    mov paused,0
    mov xPos,57
    mov yPos,15
    mov al,27
    mov Xghost,al
    mov al,5
    mov Yghost,al
    mov al,0
    mov ghostDirection,al

    Level2Start:

    ; draw ground at (0,29):
    mov eax,blue ;(black * 16)
    call SetTextColor
    mov dl,0
    mov dh,29
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    mov ecx,27
    mov dl,0
    mov dh,2
    l10:
    mov temp,dh
    call Gotoxy
    mov edx,OFFSET ground1
    call WriteString
    inc temp
    mov dh,temp
    loop l10


    mov ecx,27
    mov dh,2
    mov temp,dh
    l20:
    mov dh,temp
    mov dl,119
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    inc temp
    loop l20
    cmp paused,0
    jne skipPausing0
        call DrawCoin
        jmp drawingplayer1
    skipPausing0:
        call updatecoin
    drawingplayer1:
    call DrawPlayer
    inc paused

    ;BLOCKS
    mov esi,offset XBlocksStarting1
    mov edi,offset YBlocksStarting1
    mov ecx,24
    mov eax,offset Xwalls
    mov ebx,offset Ywalls
    loopBlock0:
        mov temp,0

        loopPrint0:
            mov dl,[esi]
            mov dh,[edi]
            add dh,temp
            call gotoxy
            mov [eax],dl
            mov [ebx],dh
            inc eax
            inc ebx
            mov edx,offset ground1
            call writestring
            

        inc temp
        cmp temp,5
        jne loopPrint0

        inc esi
        inc edi
    loop loopBlock0

    
    mov esi,offset XBlocksHorizontal1
    mov edi,offset YBlocksHorizontal1
    mov ecx,24
    loopBlock10:
        mov temp,0

        loopPrint10:
            mov dl,[esi]
            mov dh,[edi]
            add dl,temp
            call gotoxy
            mov [eax],dl
            mov [ebx],dh
            inc eax
            inc ebx
            mov edx,offset ground3
            call writestring
            

        inc temp
        cmp temp,14
        jne loopPrint10

        inc esi
        inc edi
    loop loopBlock10


    ;call CreateRandomCoin

    call Randomize

    gameLoop1:
        

        cmp pauseKey,1
        jne skipPause1
        PauseMenu1:
            call clrscr
            mov dl,30
            mov dh,20
            mov edx,offset pauseScreen
            call writestring
            call readchar
            cmp al,27
            je exitGame
            cmp al,13
            jne PauseMenu1
            call clrscr
            dec pauseKey
            call updateCoin
            jmp Level2Start
    skipPause1:
        call updateGhost1
        mov al,xGhost
        cmp xPos,al
        jne skipLives1
            mov al,yGhost
            cmp yPos,al
                jne skipLives1
            dec lives
            INVOKE PlaySound, OFFSET death, NULL, 1
            mov eax,2000
            call delay
            mov al,60
            mov xPos,al
            mov al,4
            mov yPos,al

        skipLives1:
        ; getting points:
        mov bl,xPos
        cmp bl,xCoinPos
        jne notCollecting1
        mov bl,yPos
        cmp bl,yCoinPos
        jne notCollecting1
        ; player is intersecting coin:
        inc score
        call CreateRandomCoin
        call DrawCoin
        notCollecting1:

        mov eax,white (black * 16)
        call SetTextColor

        ;draw lives:
        mov dl,110
        mov dh,0
        call gotoxy
        mov edx,offset livesString
        mov ecx,lengthof livesString
        call writestring
        mov dl,116
        mov dh,0
        call gotoxy
        mov al,32
        call writechar
        call writechar
        call writechar
        mov dl,116
        mov dh,0
        call gotoxy
        movzx ecx,lives
        cmp cl,0
        je GameOver
        mov al,'$'
        loop20:
            call writechar
        loop loop20
        ;cmp al,1
        ;jne str2
        ;    mov edx,offset lives1
        ;    jmp liveSkip
        ;str2:
        ;cmp al,2
        ;jne str3
        ;    mov edx,offset lives2
        ;    jmp liveSkip
        ;str3:
        ;    mov edx,offset lives3
        ;liveSkip:
        ;call writestring

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        movzx eax,score
        call WriteInt

        ;draw name:
        mov dl,20
        mov dh,0
        call gotoxy
        mov edx,offset strName
        mov ecx,lengthof strName
        call writestring
        mov dl,25
        mov dh,0
        call gotoxy
        mov edx,offset names
        mov ecx,lengthof names
        call writestring

        ;draw Inner Block
        mov temp3,12
        mov esi,offset XBlock
        mov edi,offset YBlock
        outerBlock2:
        mov dh,[edi]
        
            mov temp,4
            outerBlock:
            mov eax,yellow
            call settextcolor
            mov dl,[esi]
                mov ecx,14
                innerBlock:
                    call gotoxy
                    mov al,'*'
                    call writechar
                    inc dl
                loop innerBlock
                inc dh
            dec temp
            cmp temp,0
            jne outerBlock
        inc esi
        inc edi
        dec temp3
        cmp temp3,0
        jne outerBlock2
        ;draw fruits
        mov eax,0
        cmp starttimer,eax
        je getFirstTime
            call GetMseconds
            sub eax,starttimer
            cmp eax,timer
            jl skipFruit
            jmp drawFruit
            

        getFirstTime:
        call GetMseconds
        mov  starttimer,eax

        mov eax,4
        call randomrange
        mov esi,offset fruits
        mov ecx,4
        mul ecx
        add esi,eax
        mov eax,[esi]
        mov timer,eax  
        jmp skipFruit
        drawFruit:
            mov eax,4
            mov esi,offset Xfruit
            mov edi,offset Yfruit
            call randomrange
            cmp fruitMoved,0
            jne alreadyPlaced
                mov dl,[esi+eax]
                mov dh,[edi+eax]
                mov XfruitFinal,dl
                mov YfruitFinal,dh
            alreadyPlaced:
            inc fruitMoved
                
            mov dl,XfruitFinal
            mov dh,YfruitFinal

            call gotoxy
            mov ch,0
            cmp eaten,ch
            jne onlySpace
                mov al,'F'
                jmp write
            onlySpace:
            mov al,32
            write:
            call writechar
        skipFruit:
        mov al,xPos
        cmp XfruitFinal,al
        jne skippingFruit
            mov al,yPos
            cmp YfruitFinal,al
            jne skippingFruit
                mov al,0
                cmp eaten,al
                jne skippingFruit
                add score,14
                inc eaten
                INVOKE PlaySound, OFFSET fruitfile, NULL, 1
        skippingFruit:



        ; gravity logic:
        ;gravity:
        ;cmp yPos,27
        ;jg onGround1
        ; make player fall:
        call UpdatePlayer
        ;inc yPos
        call DrawPlayer
        ;jmp gravity
        onGround1:

        

        ; get user key input:
        mov  eax,400          ; sleep, to allow OS to time slice
        call Delay 

        call readkey
        jz   gameLoop1
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar,"p"
        jne skipPausing10
        inc pauseKey
        inc paused
        skipPausing10:


        cmp inputChar,"w"
        je moveUp1

        cmp inputChar,"s"
        je moveDown1

        cmp inputChar,"a"
        je moveLeft1

        cmp inputChar,"d"
        je moveRight1

        cmp inputChar,"n"
        je Level3

        jmp gameLoop1

        mov bl,0
        moveUp1:
        INVOKE PlaySound, OFFSET file, NULL, 1
        cmp yPos,2
        je gameLoop1
        mov al,0
        mov ah,-1
        call WallCollision
        cmp bl,1
        je gameLoop1
        ; allow player to jump:
        mov ecx,1
        jumpLoop1:
            call UpdatePlayer
            dec yPos
            call DrawPlayer
        loop jumpLoop1
        call UpdateScore
        jmp gameLoop1

        moveDown1:
        INVOKE PlaySound, OFFSET file, NULL, 1
        cmp yPos,28
        je gameLoop1
        mov al,0
        mov ah,1
        call WallCollision
        cmp bl,1
        je gameLoop1
        call UpdatePlayer
        inc yPos
        call DrawPlayer
        call UpdateScore
        jmp gameLoop1

        moveLeft1:
        INVOKE PlaySound, OFFSET file, NULL, 1
        cmp xPos,1
        je gameLoop1
        mov al,-1
        mov ah,0
        call WallCollision
        cmp bl,1
        je gameLoop1
        call UpdatePlayer
        dec xPos
        call DrawPlayer
        call UpdateScore
        jmp gameLoop1

        moveRight1:
        INVOKE PlaySound, OFFSET file, NULL, 1
        cmp xPos,118
        je gameLoop1
        mov al,1
        mov ah,0
        call WallCollision
        cmp bl,1
        je gameLoop1
        call UpdatePlayer
        inc xPos
        call DrawPlayer
        call UpdateScore
        jmp gameLoop1

        


    jmp gameLoop1


    Level3:
    mov lives,3
    mov paused,0
    mov xPos,1
    mov yPos,2
    mov al,3
    mov Xghost,al
    mov al,3
    mov Yghost,al
    mov al,0
    mov ghostDirection,al

    Level3Start:

    ; draw ground at (0,29):
    mov eax,blue ;(black * 16)
    call SetTextColor
    mov dl,0
    mov dh,29
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    mov ecx,27
    mov dl,0
    mov dh,2
    l100:
    mov temp,dh
    call Gotoxy
    mov edx,OFFSET ground1
    call WriteString
    inc temp
    mov dh,temp
    loop l100


    mov ecx,27
    mov dh,2
    mov temp,dh
    l200:
    mov dh,temp
    mov dl,119
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    inc temp
    loop l200
    cmp paused,0
    jne skipPausing00
        call DrawCoin
        jmp drawingplayer2
    skipPausing00:
        ;call updatecoin
    drawingplayer2:
    call DrawPlayer
    inc paused

  


    ;BLOCKS
    mov ecx,lengthof Xwalls
    mov esi,offset Xwalls
    mov edi,offset Ywalls
    wallReset:
        mov al,-1
        mov [esi],al
        mov [edi],al
        inc esi
        inc edi


    loop wallReset

    mov esi,offset XBlocksHorizontal2
    mov edi,offset YBlocksHorizontal2
    mov ecx,12
    mov eax,offset Xwalls
    mov ebx,offset Ywalls
    loopBlock100:
        mov temp,0

        loopPrint100:
            mov dl,[esi]
            mov dh,[edi]
            add dl,temp
            call gotoxy
            mov [eax],dl
            mov [ebx],dh
            inc eax
            inc ebx
            mov edx,offset ground3
            call writestring
            

        inc temp
        cmp temp,21
        jne loopPrint100

        inc esi
        inc edi
    loop loopBlock100

    mov esi,offset XBlocksStarting2
    mov edi,offset YBlocksStarting2
    mov ecx,12
    loopBlock00:
        mov temp,0

        loopPrint00:
            mov dl,[esi]
            mov dh,[edi]
            add dh,temp
            call gotoxy
            mov [eax],dl
            mov [ebx],dh
            inc eax
            inc ebx
            mov edx,offset ground1
            call writestring
            

        inc temp
        cmp temp,10
        jne loopPrint00

        inc esi
        inc edi
    loop loopBlock00

    
    


    ;call CreateRandomCoin

    mov pauseKey,0
    call Randomize
    gameLoop2:
        

        cmp pauseKey,1
        jne skipPause10
        PauseMenu10:
            call clrscr
            mov dl,30
            mov dh,20
            mov edx,offset pauseScreen
            call writestring
            call readchar
            cmp al,27
            je exitGame
            cmp al,13
            jne PauseMenu10
            call clrscr
            dec pauseKey
            call updateCoin
            jmp Level3Start
    skipPause10:
        call updateGhost2
        call updateInky
        call updateClyde
        mov al,xGhost
        cmp xPos,al
        jne skipLives10
            mov al,yGhost
            cmp yPos,al
                jne skipLives10
            dec lives
            INVOKE PlaySound, OFFSET death, NULL, 1
            mov eax,2000
            call delay

        skipLives10:
        ; getting points:
        mov bl,xPos
        cmp bl,xCoinPos
        jne notCollecting10
        mov bl,yPos
        cmp bl,yCoinPos
        jne notCollecting10
        ; player is intersecting coin:
        inc score
        call CreateRandomCoin
        call DrawCoin
        notCollecting10:

        mov eax,white (black * 16)
        call SetTextColor

        ;draw lives:
        mov dl,110
        mov dh,0
        call gotoxy
        mov edx,offset livesString
        mov ecx,lengthof livesString
        call writestring
        mov dl,116
        mov dh,0
        call gotoxy
        mov al,32
        call writechar
        call writechar
        call writechar
        mov dl,116
        mov dh,0
        call gotoxy
        movzx ecx,lives
        cmp cl,0
        je GameOver
        mov al,'$'
        loop200:
            call writechar
        loop loop200
        ;cmp al,1
        ;jne str2
        ;    mov edx,offset lives1
        ;    jmp liveSkip
        ;str2:
        ;cmp al,2
        ;jne str3
        ;    mov edx,offset lives2
        ;    jmp liveSkip
        ;str3:
        ;    mov edx,offset lives3
        ;liveSkip:
        ;call writestring

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        movzx eax,score
        call WriteInt

        ;draw name:
        mov dl,20
        mov dh,0
        call gotoxy
        mov edx,offset strName
        mov ecx,lengthof strName
        call writestring
        mov dl,25
        mov dh,0
        call gotoxy
        mov edx,offset names
        mov ecx,lengthof names
        call writestring

        ;draw Inner Block
        ;mov temp3,12
        ;mov esi,offset XBlock
        ;mov edi,offset YBlock
        ;outerBlock20:
        ;mov dh,[edi]
        ;
        ;    mov temp,4
        ;    outerBlock0:
        ;    mov eax,yellow
        ;    call settextcolor
        ;    mov dl,[esi]
        ;        mov ecx,14
        ;        innerBlock0:
        ;            call gotoxy
        ;            mov al,'*'
        ;            call writechar
        ;            inc dl
        ;        loop innerBlock0
        ;        inc dh
        ;    dec temp
        ;    cmp temp,0
        ;    jne outerBlock0
        ;inc esi
        ;inc edi
        ;dec temp3
        ;cmp temp3,0
        ;jne outerBlock20
        ;draw fruits
        mov eax,0
        cmp starttimer,eax
        je getFirstTime1
            call GetMseconds
            sub eax,starttimer
            cmp eax,timer
            jl skipFruit1
            jmp drawFruit1
            

        getFirstTime1:
        call GetMseconds
        mov  starttimer,eax

        mov eax,4
        call randomrange
        mov esi,offset fruits
        mov ecx,4
        mul ecx
        add esi,eax
        mov eax,[esi]
        mov timer,eax  
        jmp skipFruit1
        drawFruit1:
            mov eax,4
            mov esi,offset Xfruit
            mov edi,offset Yfruit
            call randomrange
            cmp fruitMoved,0
            jne alreadyPlaced1
                mov dl,[esi+eax]
                mov dh,[edi+eax]
                mov XfruitFinal,dl
                mov YfruitFinal,dh
            alreadyPlaced1:
            inc fruitMoved
            mov dl,XfruitFinal
            mov dh,YfruitFinal

            call gotoxy
            mov ch,0
            cmp eaten,ch
            jne onlySpace1
                mov al,'F'
                jmp write1
            onlySpace1:
            mov al,32
            write1:
            call writechar
        skipFruit1:
        mov al,xPos
        cmp XfruitFinal,al
        jne skippingFruit1
            mov al,yPos
            cmp YfruitFinal,al
            jne skippingFruit1
                mov al,0 
                cmp eaten,al
                jne skippingFruit1
                add score,14
                inc eaten
                INVOKE PlaySound, OFFSET fruitfile, NULL, 1
        skippingFruit1:

        mov al,xPos
        cmp Xinky,al
        jne liveCheck
            mov al,yPos
            cmp Yinky,al
            jne liveCheck
            dec lives
            INVOKE PlaySound, OFFSET death, NULL, 1
            mov eax,2000
            call delay
            mov al,60
            mov xPos,al
            mov al,15
            mov yPos,al
        liveCheck:

        mov al,xPos
        cmp Xclyde,al
        jne liveCheck2
            mov al,yPos
            cmp Yclyde,al
            jne liveCheck2
            dec lives
            INVOKE PlaySound, OFFSET death, NULL, 1
            mov eax,2000
            call delay
            mov al,60
            mov xPos,al
            mov al,15
            mov yPos,al
        liveCheck2:


        ; gravity logic:
        ;gravity:
        ;cmp yPos,27
        ;jg onGround1
        ; make player fall:
        call UpdatePlayer
        ;inc yPos
        call DrawPlayer
        ;jmp gravity
        onGround2:

        

        ; get user key input:
        mov  eax,400          ; sleep, to allow OS to time slice
        call Delay 

        call readkey
        jz   gameLoop2
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar,"p"
        jne skipPausing20
        inc pauseKey
        inc paused
        skipPausing20:


        cmp inputChar,"w"
        je moveUp2

        cmp inputChar,"s"
        je moveDown2

        cmp inputChar,"a"
        je moveLeft2

        cmp inputChar,"d"
        je moveRight2

        cmp inputChar,"n"
        je gameOver

        jmp gameLoop2

        mov bl,0
        moveUp2:
        INVOKE PlaySound, OFFSET file, NULL, 1
        cmp yPos,2
        je gameLoop2
        mov al,0
        mov ah,-1
        call WallCollision
        cmp bl,1
        je gameLoop2
        ; allow player to jump:
        mov ecx,1
        jumpLoop2:
            call UpdatePlayer
            dec yPos
            call DrawPlayer
        loop jumpLoop2
        call UpdateScore
        jmp gameLoop2

        moveDown2:
        INVOKE PlaySound, OFFSET file, NULL, 1
        cmp yPos,28
        je gameLoop2
        mov al,0
        mov ah,1
        call WallCollision
        cmp bl,1
        je gameLoop2
        call UpdatePlayer
        inc yPos
        call DrawPlayer
        call UpdateScore
        jmp gameLoop2

        moveLeft2:
        INVOKE PlaySound, OFFSET file, NULL, 1
        cmp xPos,1
        jg normalMove
        cmp yPos,2
        jne teleportCheck
        cmp lineCheck,1
        je normalMove
            mov esi,offset Xcoordinates
            mov edi,offset Ycoordinates
            mov ecx,236
            eatCoin:
                mov al,-1
                mov dl,[esi]
                mov dh,[edi]
                mov [esi],al
                mov [edi],al
                call gotoxy
                mov al,32
                call writechar
                inc esi
                inc edi
                inc score
            loop eatCoin
            inc lineCheck
        teleportCheck:
            mov dl,28
            cmp yPos,dl
            jne normalMove
            mov dl,xPos
            mov dh,yPos
            mov al,32
            call gotoxy
            call writechar
            mov al,118
            mov ah,2
            mov xPos,al
            mov yPos,ah
        jmp gameLoop2
        normalMove:
        mov al,-1
        mov ah,0
        call WallCollision
        cmp bl,1
        je gameLoop2
        cmp xPos,1
        je skipDrawing
            call UpdatePlayer
        dec xPos
        skipDrawing:
        call DrawPlayer
        call UpdateScore
        mov lineCheck,0
        jmp gameLoop2

        moveRight2:
        INVOKE PlaySound, OFFSET file, NULL, 1
        mov al,118
        cmp xPos,al
        jne normalMove1
        mov al,2
        cmp yPos,al
        jne normalMove1
        teleportCheck1:
            mov dl,xPos
            mov dh,yPos
            mov al,32
            call gotoxy
            call writechar
            mov al,1
            mov ah,28
            mov xPos,al
            mov yPos,ah
            mov temp,1
        normalMove1:

        cmp xPos,118
        je gameLoop2
        mov al,1
        mov ah,0
        call WallCollision
        cmp bl,1
        je gameLoop2
        call UpdatePlayer 
        cmp temp,1
        je skipInc
        inc xPos
        skipInc:
        mov temp,0
        call DrawPlayer
        call UpdateScore
        jmp gameLoop2

        


    jmp gameLoop2



    GameOver:

    mov edx,OFFSET scoreFile
    call OpenInputFile
    mov fileHandle,eax

    mov  edx,OFFSET buffer
    mov  ecx,BUFSIZE
    call ReadFromFile
    
    mov eax,fileHandle
    call CloseFile

    mov esi,offset n1
    mov ecx,offset n2
    mov edx,offset n3
    mov edi,offset buffer
    
    mov temp,20
    lup1:
        mov al,[edi]
        mov [esi],al
        mov al,[edi+32]
        mov [ecx],al
        mov al,[edi+64]
        mov [edx],al
        inc esi
        inc ecx
        inc edx
        inc edi

    dec temp
    cmp temp,0
    jne lup1



    mov esi,offset scr1
    mov ecx,offset scr2
    mov edx,offset scr3
    mov edi,offset buffer
    add edi,20
    
    mov temp,10
    lup2:
        mov al,[edi]
        mov [esi],al
        mov al,[edi+32]
        mov [ecx],al
        mov al,[edi+64]
        mov [edx],al
        inc esi
        inc ecx
        inc edx
        inc edi

    dec temp
    cmp temp,0
    jne lup2

    mov edx,offset scr1
    mov ecx,10
    call ParseDecimal32
    mov numscr1,ax
    
    mov edx,offset scr2
    mov ecx,10
    call ParseDecimal32
    mov numscr2,ax
    
    mov edx,offset scr3
    mov ecx,10
    call ParseDecimal32
    mov numscr3,ax
    
    mov ax,score
    cmp ax,numscr1
    jg first
    cmp ax,numscr2
    jg second
    cmp ax,numscr3
    jg third
    jmp skipFileHandling

    first:
        mov dl,0
        mov x,dl
            mov bl,10
            mov ecx,10
            lup3:
                div bl
                mov dh,0
                mov dl,al
                mov temporary,dx
                mov temp,ah
                movzx dx,temp
                push dx
                inc x
                cmp al,0
                je endOfDigits
                movzx eax,temporary
            loop lup3

        endOfDigits:

        mov esi,offset buffer
        mov edi,offset names
        mov ecx,20
        lup4:
            mov al,[edi]
            cmp al,0
            je spaccing
            cmp al,10
            je spaccing
            mov [esi],al
            jmp skkiping
            spaccing:
                mov al,32
                mov [esi],al
            skkiping:
            inc esi
            inc edi
        loop lup4

        mov esi,offset buffer
        add esi,20
        movzx ecx,x
        lup5:
            pop ax
            add al,48
            cmp al,57
            jg spacer
            mov [esi],al
            jmp digitAdded

            spacer:
                mov al,32
                mov [esi],al
            digitAdded:
            inc esi

        loop lup5

        jmp fileHandling

    second:
        mov dl,0
        mov x,dl
            mov bl,10
            mov ecx,10
            lup6:
                div bl
                mov dh,0
                mov dl,al
                mov temporary,dx
                mov temp,ah
                movzx dx,temp
                push dx
                inc x
                cmp al,0
                je endOfDigits1
                movzx eax,temporary
            loop lup6

        endOfDigits1:


        mov esi,offset buffer
        add esi,32
        mov edi,offset names
        mov ecx,20
        lup7:
            mov al,[edi]
            cmp al,0
            je spaccing1
            cmp al,10
            je spaccing1
            mov [esi],al
            jmp skkiping1
            spaccing1:
                mov al,32
                mov [esi],al
            skkiping1:
            inc esi
            inc edi
        loop lup7

        mov esi,offset buffer
        add esi,52
        movzx ecx,x
        lup8:
            pop ax
            add al,48
            cmp al,57
            jg spacer1
            mov [esi],al
            jmp digitAdded1

            spacer1:
                mov al,32
                mov [esi],al
            digitAdded1:
            inc esi

        loop lup8

        jmp fileHandling
    
    third:
        mov dl,0
        mov x,dl
            mov bl,10
            mov ecx,10
            lup9:
                div bl
                mov dh,0
                mov dl,al
                mov temporary,dx
                mov temp,ah
                movzx dx,temp
                push dx
                inc x
                cmp al,0
                je endOfDigits2
                movzx eax,temporary
            loop lup9

        endOfDigits2:

        mov esi,offset buffer
        add esi,64
        mov edi,offset names
        mov ecx,20
        lup10:
            mov al,[edi]
            cmp al,0
            je spaccing2
            cmp al,10
            je spaccing2
            mov [esi],al
            jmp skkiping2
            spaccing2:
                mov al,32
                mov [esi],al
            skkiping2:
            inc esi
            inc edi
        loop lup10

        mov esi,offset buffer
        add esi,84
        movzx ecx,x
        lup11:
            pop ax
            add al,48
            cmp al,57
            jg spacer2
            mov [esi],al
            jmp digitAdded2

            spacer2:
                mov al,32
                mov [esi],al
            digitAdded2:
            inc esi

        loop lup11


    fileHandling:

    mov eax,fileHandle
    mov  edx,OFFSET scoreFile
    call CreateOutputFile
    mov fileHandle,eax
    mov  edx,OFFSET buffer
    mov  ecx,96
    mov eax,fileHandle
    call WriteToFile


    skipFileHandling:

    mov dl,0 
    mov dh,10
    mov eax,white
    call settextcolor
    call gotoxy
    mov edx,offset gameOverScreen
    call writestring
    INVOKE PlaySound, OFFSET gameOvertrack, NULL, 1
    mov eax,4000
    call delay
    call waitmsg
    call clrscr

    ;Score:
    call animation
    mov edx,offset HighScores
    call WriteString
    mov edx,offset buffer
    call writestring
    mov dl,50
    mov dh,15
    mov eax,white
    call settextcolor
    call gotoxy
    mov edx,offset names
    call writestring
    mov eax,':'
    call writechar
    movzx eax,score
    call writeint
    mov al,10
    mov ecx,5
    looping:
        call writechar
    loop looping
    call waitmsg
    call clrscr

    exitGame:
      ;mov  eax,fileHandle
      ;mov  edx,OFFSET buffer
      ;mov  ecx,BUFSIZE
      ;call ReadFromFile
      ;jc   show_error_message
      ;mov  bytesRead,eax


    exit
main ENDP

animation PROC
    
    INVOKE PlaySound, OFFSET explosion, NULL, 1
    mov eax,1000
    call delay 
    call clrscr

    mov al,0
    mov x,al
    mov al,14
    mov y,al
    mov dl,x
    mov dh,y
    call gotoxy
    mov eax,red
    call settextcolor
    mov edx,offset anim1
    call writestring
    mov eax,30
    call delay
    call clrscr

    mov dl,x
    mov dh,y
    call gotoxy
    mov eax,white
    call settextcolor
    mov edx,offset anim2
    call writestring
    mov eax,30
    call delay
    call clrscr

    
    mov dl,x
    mov dh,y
    call gotoxy
    mov eax,red
    call settextcolor
    mov edx,offset anim3
    call writestring
    mov eax,30
    call delay
    call clrscr

    mov dl,x
    mov dh,y
    call gotoxy
    mov eax,white
    call settextcolor
    mov edx,offset anim4
    call writestring
    mov eax,30
    call delay
    call clrscr

    mov dl,x
    mov dh,y
    call gotoxy
    mov eax,red
    call settextcolor
    mov edx,offset anim5
    call writestring
    mov eax,30
    call delay
    call clrscr

    mov dl,x
    mov dh,y
    call gotoxy
    mov eax,white
    call settextcolor
    mov edx,offset anim6
    call writestring
    mov eax,30
    call delay
    call clrscr

    mov dl,x
    mov dh,y
    call gotoxy
    mov eax,red
    call settextcolor
    mov edx,offset anim7
    call writestring
    mov eax,30
    call delay
    call clrscr

    mov dl,x
    mov dh,y
    call gotoxy
    mov eax,white
    call settextcolor
    mov edx,offset anim8
    call writestring
    mov eax,30
    call delay
    call clrscr

    mov dl,x
    mov dh,y
    call gotoxy
    mov eax,red
    call settextcolor
    mov edx,offset anim9
    call writestring
    mov eax,30
    call delay
    call clrscr


animation ENDP

DrawPlayer PROC
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al,"X"
    call WriteChar
    ret
DrawPlayer ENDP

UpdatePlayer PROC
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al," "
    call WriteChar
    ret
UpdatePlayer ENDP

DrawCoin PROC
    mov eax,green ;(red * 16)
    call SetTextColor
    mov dh,1
    mov al,"."
    mov ecx,27
    mov ah,118
    mov edi,offset Xcoordinates
    mov esi,offset Ycoordinates
    loopCoin:
            inc dh
            mov dl,0
            mov loopVarCoin,ah
        loopCoin1:
            inc dl
            call Gotoxy
            mov [esi],dh
            mov [edi],dl
            inc esi
            inc edi
            call WriteChar
        dec loopVarCoin
        cmp loopVarCoin,0
        jne loopCoin1
    loop loopCoin
    ret
DrawCoin ENDP

CreateRandomCoin PROC
    mov eax,55
    inc eax
    call RandomRange
    mov xCoinPos,al
    mov yCoinPos,27
    ret
CreateRandomCoin ENDP

UpdateScore PROC
    mov esi,offset Xcoordinates
    mov edi,offset Ycoordinates
    mov ecx,lengthof Xcoordinates
    loopScore:
        mov al,[edi]
        mov ah,[esi]
        inc esi
        inc edi
        cmp al,yPos
        jne skipScore
        cmp ah,xPos
        je increment
        skipScore:
    loop loopScore
    jmp noInc
    increment:
        dec edi
        dec esi
        mov al,-1
        mov [esi],al
        mov [edi],al
        inc score
    noInc:
    ret
UpdateScore ENDP

WallCollision PROC
    mov esi,offset Xwalls
    mov edi,offset Ywalls
    mov ecx,lengthof Xwalls

    dec esi
    dec edi
    mov bl,0
    add al,xPos
    add ah,yPos
    loopWCollision:
        inc esi
        inc edi
        cmp al,[esi]
        jne skipCollision
        cmp ah,[edi]
        je collided
        skipCollision:
        jmp skipLoop
        collided:
        mov bl,1
        jmp exitLoop
        skipLoop:
    loop loopWCollision
    exitLoop:
    ret
WallCollision ENDP



updateGhost PROC
    
    ;cmp bl,1
    ;je skipGhost
    mov cl,Xghost
    mov ch,Yghost
    mov x,cl
    mov y,ch
    cmp Xghost,44
    jne s1
        cmp Yghost,6
        jne s2
            inc ghostDirection
        s2:
        cmp Yghost,25
        jne s1
            inc ghostDirection
    s1:
    
    cmp Xghost,24
    jne s3
        cmp Yghost,25
        jne s4
            inc ghostDirection
        s4:
        cmp Yghost,6
        jne s3
            mov ghostDirection,0
    s3:

    cmp ghostDirection,0
    jne a1
        inc Xghost
    a1:
    cmp ghostDirection,1
    jne a2
        inc Yghost
    a2:
    cmp ghostDirection,2
    jne a3
        dec Xghost
    a3:
    cmp ghostDirection,3
    jne a4
        dec Yghost
    a4:
    mov eax,18
    call delay
    mov dl,Xghost
    mov dh,Yghost
    mov al,'@'
    call gotoxy
    call writechar
    mov dl,cl
    mov dh,ch
    dec ch
    dec cl
    mov temp3,ch


    mov temp,cl
    movzx ecx,temp
    mov esi,offset Xcoordinates
    mov edi,offset Ycoordinates
    movzx eax,temp3
    mov ecx,118
    mul ecx
    movzx ecx,temp
    add ecx,eax
    sub esi,118
    add esi,ecx
    ;mov dl,temp
    mov dl,x
    sub ecx,118
    add edi,ecx
    mov dh,y
    call gotoxy
    mov eax,green
    call settextcolor
    mov al,-1
    cmp [esi],al
    jne point
        mov al,32
        jmp noPoint
    point:
        mov al,'.'
    noPoint:
    call writechar
    skipGhost:
    ret
updateGhost ENDP

updateGhost1 PROC
    
    ;cmp bl,1
    ;je skipGhost
    mov cl,Xghost
    mov ch,Yghost
    mov x,cl
    mov y,ch
    cmp Yghost,25
    jne s2
        cmp Xghost,27
        jne s2
            mov al,58
            mov Xghost,al
            mov al,5
            mov Yghost,al
        s2:
    cmp Yghost,25
    jne s1
        cmp Xghost,58
        jne s1
            mov al,88
            mov Xghost,al
            mov al,5
            mov Yghost,al
    s1:

    cmp Yghost,25
    jne s0
        cmp Xghost,88
        jne s1
            mov al,27
            mov Xghost,al
            mov al,5
            mov Yghost,al
    s0:
    
    ;cmp Yghost,20
    ;jne s3
    ;    cmp Xghost,25
    ;    jne s4
    ;        inc ghostDirection
    ;    s4:
    ;    cmp Xghost,6
    ;    jne s3
    ;        mov ghostDirection,0
    ;s3:

    inc Yghost
    mov eax,18
    call delay
    mov dl,Xghost
    mov dh,Yghost
    mov al,'@'
    call gotoxy
    call writechar
    mov dl,cl
    mov dh,ch
    dec ch
    dec cl
    mov temp3,ch


    mov temp,cl
    movzx ecx,temp
    mov esi,offset Xcoordinates
    mov edi,offset Ycoordinates
    movzx eax,temp3
    mov ecx,118
    mul ecx
    movzx ecx,temp
    add ecx,eax
    sub esi,118
    add esi,ecx
    ;mov dl,temp
    mov dl,x
    sub ecx,118
    add edi,ecx
    mov dh,y
    call gotoxy
    mov eax,green
    call settextcolor
    mov al,-1
    cmp [esi],al
    jne point
        mov al,32
        jmp noPoint
    point:
        mov al,'.'
    noPoint:
    call writechar
    skipGhost:
    ret
updateGhost1 ENDP

updateGhost2 PROC
    
    ;cmp bl,1
    ;je skipGhost
    mov cl,Xghost
    mov ch,Yghost
    mov x,cl
    mov y,ch
    cmp Yghost,27
    jne s2
        cmp Xghost,3
        jne s2
            mov al,115
            mov Xghost,al
            mov al,3
            mov Yghost,al
        s2:
    cmp Yghost,27
    jne s1
        cmp Xghost,115
        jne s1
            mov al,3
            mov Xghost,al
            mov al,3
            mov Yghost,al
    s1:

    
    ;cmp Yghost,20
    ;jne s3
    ;    cmp Xghost,25
    ;    jne s4
    ;        inc ghostDirection
    ;    s4:
    ;    cmp Xghost,6
    ;    jne s3
    ;        mov ghostDirection,0
    ;s3:

    inc Yghost
    mov eax,18
    call delay
    mov dl,Xghost
    mov dh,Yghost
    mov al,'@'
    call gotoxy
    call writechar
    mov dl,cl
    mov dh,ch
    dec ch
    dec cl
    mov temp3,ch


    mov temp,cl
    movzx ecx,temp
    mov esi,offset Xcoordinates
    mov edi,offset Ycoordinates
    movzx eax,temp3
    mov ecx,118
    mul ecx
    movzx ecx,temp
    add ecx,eax
    sub esi,118
    add esi,ecx
    ;mov dl,temp
    mov dl,x
    sub ecx,118
    add edi,ecx
    mov dh,y
    call gotoxy
    mov eax,green
    call settextcolor
    mov al,-1
    cmp [esi],al
    jne point
        mov al,32
        jmp noPoint
    point:
        mov al,'.'
    noPoint:
    call writechar
    skipGhost:
    ret
updateGhost2 ENDP

updateInky PROC
    mov al,Xinky
    mov x,al
    mov al,Yinky
    mov y,al
    mov eax,4
    call randomrange
    cmp al,0
    jne d1
        mov al,-1
        mov ah,0
        call collisionGhost
        cmp bl,1
        je d4
        mov al,Yinky
        mov temp3,al
        mov al,Xinky
        mov temp,al
        dec Xinky
        call DrawInky
        jmp d4
    d1:
        cmp al,1
        jne d2
            mov al,1
            mov ah,0
            call collisionGhost
            cmp bl,1
            je d4
            mov al,Yinky
            mov temp3,al
            mov al,Xinky
            mov temp,al
            inc Xinky
            call DrawInky
            jmp d4
    d2:
        cmp al,2
        jne d3
            mov al,0
            mov ah,-1
            call collisionGhost
            cmp bl,1
            je d4
            mov al,Yinky
            mov temp3,al
            mov al,Xinky
            mov temp,al
            dec Yinky
            call DrawInky
            jmp d4
    d3:
        cmp al,3
        jne d4
            mov al,0
            mov ah,1
            call collisionGhost
            cmp bl,1
            je d4
            mov al,Yinky
            mov temp3,al
            mov al,Xinky
            mov temp,al
            inc Yinky
            call DrawInky
    d4:
    ret
updateInky ENDP

updateClyde PROC
    mov cl,Xclyde
    mov ch,Yclyde
    mov x,cl
    mov y,ch
    
    mov eax,18
    call delay
    
    mov al,xClyde
    cmp al,xPos
    jl left
    jg right

    equal:
        mov al,Yclyde
        cmp al,yPos
        jg up
        jl down
        up:
            mov al,0
            mov ah,-1
            call collisionGhost1
            cmp bl,1
            je ending
            
            mov al,Xclyde
            mov x,al
            mov ah,Yclyde
            mov y,ah

            dec Yclyde
            call DrawClyde
            jmp ending
        down:
            mov al,0
            mov ah,1
            call collisionGhost1
            cmp bl,1
            je ending
            
            mov al,Xclyde
            mov x,al
            mov ah,Yclyde
            mov y,ah

            inc Yclyde
            call DrawClyde
            jmp ending


    left:
        mov al,Yclyde
        cmp al,yPos
        jl leftUp
        jg leftDown
        je leftLeft

        leftUp:
            mov al,1
            mov ah,1
            call collisionGhost1
            cmp bl,1
            je ending
            
            mov al,Xclyde
            mov x,al
            mov ah,Yclyde
            mov y,ah

            inc Xclyde
            inc Yclyde
            call DrawClyde
            jmp ending
        
        leftLeft:
            mov al,1
            mov ah,0
            call collisionGhost1
            cmp bl,1
            je ending
            
            mov al,Xclyde
            mov x,al
            mov ah,Yclyde
            mov y,ah

            inc xClyde
            call DrawClyde
            jmp ending

        leftDown:
            mov al,1
            mov ah,-1
            call collisionGhost1
            cmp bl,1
            je ending
            
            mov al,Xclyde
            mov x,al
            mov ah,Yclyde
            mov y,ah

            inc Xclyde
            dec Yclyde
            call DrawClyde
            jmp ending


    right:
        mov al,Yclyde
        cmp al,yPos
        jl rightUp
        jg rightDown
        je rightRight

        rightUp:
            mov al,-1
            mov ah,1
            call collisionGhost1
            cmp bl,1
            je ending
            
            mov al,Xclyde
            mov x,al
            mov ah,Yclyde
            mov y,ah

            dec Xclyde
            inc Yclyde
            call DrawClyde
            jmp ending
        
        rightRight:
            mov al,-1
            mov ah,0
            call collisionGhost1
            cmp bl,1
            je ending
            
            mov al,Xclyde
            mov x,al
            mov ah,Yclyde
            mov y,ah

            dec xClyde
            call DrawClyde
            jmp ending

        rightDown:
            mov al,-1
            mov ah,-1
            call collisionGhost1
            cmp bl,1
            je ending
            
            mov al,Xclyde
            mov x,al
            mov ah,Yclyde
            mov y,ah
            dec Xclyde
            dec Yclyde
            call DrawClyde

            jmp ending



    ending:

    
    ret
updateClyde ENDP

DrawClyde PROC
    mov dl,Xclyde
    mov dh,Yclyde
    mov al,'#'
    call gotoxy
    call writechar
    mov al,y
    mov temp3,al
    mov al,x
    mov temp,al
    mov dl,cl
    mov dh,ch
    dec temp3
    dec temp
    ;dec ch
    ;dec cl
    ;mov temp3,ch


    ;mov temp,cl
    movzx ecx,temp
    mov esi,offset Xcoordinates
    mov edi,offset Ycoordinates
    movzx eax,temp3
    mov ecx,118
    mul ecx
    movzx ecx,temp
    add ecx,eax
    sub esi,118
    add esi,ecx
    ;mov dl,temp
    mov dl,x
    sub ecx,118
    add edi,ecx
    mov dh,y
    call gotoxy
    mov eax,green
    call settextcolor
    mov al,-1
    cmp [esi],al
    jne point
        mov al,32
        jmp noPoint
    point:
        mov al,'.'
    noPoint:
    call writechar
    skipGhost:
    ret
DrawClyde ENDP

DrawInky PROC
        
    je skipGhost
    
    mov eax,18
    call delay
    mov dl,Xinky
    mov dh,Yinky
    mov al,'&'
    call gotoxy
    call writechar
    mov dl,x
    mov dh,y
    dec temp3
    dec temp
    ;dec ch
    ;dec cl
    ;mov temp3,ch


    ;mov temp,cl
    ;movzx ecx,temp
    mov esi,offset Xcoordinates
    mov edi,offset Ycoordinates
    movzx eax,temp3
    mov ecx,118
    mul ecx
    movzx ecx,temp
    add ecx,eax
    sub esi,118
    add esi,ecx
    ;mov dl,temp
    mov dl,x
    sub ecx,118
    add edi,ecx
    mov dh,y
    call gotoxy
    mov eax,green
    call settextcolor
    mov al,-1
    cmp [esi],al
    jne point
        mov al,32
        jmp noPoint
    point:
        mov al,'.'
    noPoint:
    call writechar
    skipGhost:
    ret
DrawInky ENDP

collisionGhost PROC
    mov esi,offset Xwalls
    mov edi,offset Ywalls
    mov ecx,lengthof Xwalls

    dec esi
    dec edi
    mov bl,0
    add al,Xinky
    add ah,Yinky
    cmp al,118
    je collided1
    cmp al,0
    je collided1
    cmp ah,29
    je collided1
    cmp ah,1
    je collided1
    loopWCollision1:
        inc esi
        inc edi
        cmp al,[esi]
        jne skipCollision1
        cmp ah,[edi]
        je collided1
        skipCollision1:
        jmp skipLoop1
        collided1:
        mov bl,1
        jmp exitLoop1
        skipLoop1:
    loop loopWCollision1
    exitLoop1:
    ret
collisionGhost ENDP

collisionGhost1 PROC
    mov esi,offset Xwalls
    mov edi,offset Ywalls
    mov ecx,lengthof Xwalls

    dec esi
    dec edi
    mov bl,0
    add al,Xclyde
    add ah,Yclyde
    cmp al,118
    je collided1
    cmp al,0
    je collided1
    cmp ah,29
    je collided1
    cmp ah,1
    je collided1
    loopWCollision1:
        inc esi
        inc edi
        cmp al,[esi]
        jne skipCollision1
        cmp ah,[edi]
        je collided1
        skipCollision1:
        jmp skipLoop1
        collided1:
        mov bl,1
        jmp exitLoop1
        skipLoop1:
    loop loopWCollision1
    exitLoop1:
    ret
collisionGhost1 ENDP

updateCoin PROC
    mov eax,green
    call settextcolor
    mov esi,offset Xcoordinates
    mov edi,offset Ycoordinates
    mov ecx,3186
    drawing:
        mov dl,[esi]
        mov dh,[edi]
        call gotoxy
        cmp dl,-1
        je spacing
        mov al,'.'
        jmp skipping
        spacing:
        mov al,32
        skipping:
        call writechar
        inc esi
        inc edi
    loop drawing
    ret
updateCoin ENDP

;UpdatingCoin PROC
;    mov esi,offset
;UpdatingCoin ENDP

END main