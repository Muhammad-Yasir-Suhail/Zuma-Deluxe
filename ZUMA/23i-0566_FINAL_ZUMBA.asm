
include Irvine32.inc
include macros.inc

.data

    readName db 25 dup(?)

    zum db "--------     |        |      |\     /|     ----------      ----------  ",0
        db "      /      |        |      | \   / |    |          \    |          | ",0
        db "     /       |        |      |  \ /  |    |          |    |          | ",0
        db "    /        |        |      |   \   |    |----------|    |----------| ",0
        db "   /         |        |      |       |    |          |    |          | ",0
        db "  /          |        |      |       |    |          |    |          | ",0
        db " --------    |________|      |       |    |__________/    |          | ",0
   
                                                                          
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

LEVELS db '                                               _        _____  _           _    _____   _      _____',13,10
       db '                                              | |      |  ___| \ \        / /  |  ___| | |    |      ',13,10
       db '                                              | |      | |___   \ \      / /   | |___  | |    |_____ ',13,10
       db '                                              | |      |  ___|   \ \    / /    |  ___| | |          |',13,10
       db '                                              | |____  | |___     \ \  / /     | |___  | |___       |',13,10
       db '                                              |______| |_____|     \_\/_/      |_____| |_____| _____|',13,10
       db 0

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


menuSelect db 0

INSTRUCTIONS_SCREEN             db'Controls:                                                                                        ',13,10
                               db'                                                                                                 ',13,10
                               db' 1-Use the (QWEADZXC) to move Frog in the game.                                                  ',13,10
                               db' 2-Destroy all the balls before they reach the end.                                              ',13,10
                               db'                                                                                                 ',13,10
                               db' Gameplay:                                                                                       ',13,10
                               db'                                                                                                 ',13,10
                               db' 1-Balls move along the path.                                                                    ',13,10
                               db' 2-Destroy all the balls by combining 3 balls of the same colour.                                ',13,10
                               db' 3-If you do itbefore they reach there home back then, you win else, you lose.                   ',13,10
                               db'                                                                                                 ',13,10
                               db'                                                                                                 ',13,10
                               db' Scoring:                                                                                        ',13,10
                               db'                                                                                                 ',13,10
                               db' 1-When you combine three balls of same colour you earn points.                                  ',13,10
                               db'                                                                                                 ',13,10
                               db'                                                                                                 ',13,10
                               db'                                                                                                 ',13,10
                               db' Game Over:                                                                                      ',13,10
                               db'                                                                                                 ',13,10
                               db' 1-If you are not able to stop the balls from reaching home you lose 1 life.                     ',13,10
                               db' 2-Losing all lives ends the game. You have three lives to start.                                ',13,10

     nme db " ________              ___________    ________        ------            |\      |   --------   |\      /|   ---------",0
         db "|           |\     |        |        |               |      \           | \     |  |        |  | \    / |  |         ",0
         db "|           | \    |        |        |               |      |           |  \    |  |        |  |  \  /  |  |         ",0
         db "|--------   |  \   |        |        |--------       |      |           |   \   |  |--------|  |   \/   |  |---------",0
         db "|           |   \  |        |        |               |------            |    \  |  |        |  |        |  |         ",0
         db "|           |    \ |        |        |               |      \           |     \ |  |        |  |        |  |         ",0
         db " --------   |     \|        |         --------       |       \          |      \|  |        |  |        |   ---------",0
         db "                                                                  |                                                  ",0
         db "                                                                  |                                                  ",0
         db "                                                                  |                                                  ",0
         db "                                                                  |                                                  ",0
         db "                                                                  |                                                  ",0
         db "                                                                  |                                                  ",0
         db "                                                                  |                                                  ",0
         db "                                                                 \_/                                                 ",0
       
    ; Level layout

    walls BYTE " _____________________________________________________________________________ ", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                    ---                                      |", 0
          BYTE "|                                   |   |                                     |", 0
          BYTE "|                                   |   |                                     |", 0
          BYTE "|                                   |   |                                     |", 0
          BYTE "|                                    ---                                      |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|_____________________________________________________________________________|", 0


    ; Player sprite
    player_right BYTE "   ", 0
                 BYTE " O-", 0
                 BYTE "   ", 0

    player_left BYTE "   ", 0
                BYTE "-O ", 0
                BYTE "   ", 0

    player_up BYTE " | ", 0
              BYTE " O ", 0
              BYTE "   ", 0

    player_down BYTE "   ", 0
                BYTE " O ", 0
                BYTE " | ", 0

    player_upright BYTE "  /", 0
                   BYTE " O ", 0
                   BYTE "   ", 0

    player_upleft BYTE "\  ", 0
                  BYTE " O ", 0
                  BYTE "   ", 0

    player_downright BYTE "   ", 0
                     BYTE " O ", 0
                     BYTE "  \", 0

    player_downleft BYTE "   ", 0
                    BYTE " O ", 0
                    BYTE "/  ", 0

    xPos db 56     
    yPos db 15      

    xDir db 0
    yDir db 0

 
    inputChar db 0
    direction db "d"


  
    ; ball_colors db 4, 2, 1, 14  
    ball_count db 20            
    ball_positions db 30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49
    ball_colors db 4, 2, 1, 14
    current_color_index db 0          

    ball_path db 30, 10, 31, 10, 32, 10, 33, 10, 34, 10, 35, 10, 36, 10, 37, 10, 38, 10, 39, 10, 40, 10
         db 41, 10, 42, 10, 43, 10, 44, 10, 45, 10, 46, 10, 47, 10, 48, 10, 49, 10, 50, 10, 51, 10
         db 52, 10, 53, 10, 54, 10, 55, 10, 56, 10, 57, 10, 58, 10, 59, 10, 60, 10, 61, 10, 62, 10
         db 63, 10, 64, 10, 65, 10, 66, 10, 67, 10, 68, 10, 69, 10, 70, 10, 71, 10, 72, 10, 73, 10
         db 74, 10, 75, 10, 76, 10, 77, 10, 78, 10, 79, 10, 80, 10, 81, 10, 82, 10, 83, 10, 84, 10
         db 85, 10, 86, 10, 87, 10, 88, 10, 89, 10, 90, 10, 91, 10, 92, 10, 93, 10, 94, 10, 95, 10
         db 96, 10, 97, 10, 98, 10, 99, 10, 100, 10, 101, 10, 102, 10, 103, 10, 104, 10, 105, 10, 106, 10
         db 0  ; End of path
 

    color_red db 4       
    color_green db 2    
    color_yellow db 14   

    current_color db 4 

    emitter_color1 db 2 
    emitter_color2 db 4  

    fire_color db 14     


    emitter_symbol db "#"
    emitter_row db 0   
    emitter_col db 1  

    fire_symbol db "*", 0
    fire_row db 0        
    fire_col db 0       

    score db 0         
    lives db 3         
    levelInfo db 1
    
    
    counter1 db 0
    counter2 db 0

.code

FireBall PROC
    

    mov dl, xPos   
    mov dh, yPos 

    mov fire_col, dl
    mov fire_row, dh 

    mov al, direction
    cmp al, "w"
    je fire_up

    cmp al, "x"
    je fire_down

    cmp al, "a"
    je fire_left

    cmp al, "d"
    je fire_right

    cmp al, "q"
    je fire_upleft

    cmp al, "e"
    je fire_upright

    cmp al, "z"
    je fire_downleft

    cmp al, "c"
    je fire_downright

    jmp end_fire

fire_up:
    mov fire_row, 14       
    mov fire_col, 57       
    mov xDir, 0
    mov yDir, -1
    jmp fire_loop

fire_down:
    mov fire_row, 18         
    mov fire_col, 57         
    mov xDir, 0
    mov yDir, 1
    jmp fire_loop

fire_left:
    mov fire_col, 55         
    mov fire_row, 16         
    mov xDir, -1
    mov yDir, 0
    jmp fire_loop

fire_right:
    mov fire_col, 59         
    mov fire_row, 16
    mov xDir, 1
    mov yDir, 0
    jmp fire_loop

fire_upleft:
    mov fire_row, 14      
    mov fire_col, 55        
    mov xDir, -1
    mov yDir, -1
    jmp fire_loop

fire_upright:
    mov fire_row, 14      
    mov fire_col, 59         
    mov xDir, 1
    mov yDir, -1
    jmp fire_loop

fire_downleft:
    mov fire_row, 18        
    mov fire_col, 55       
    mov xDir, -1
    mov yDir, 1
    jmp fire_loop

fire_downright:
    mov fire_row, 18        
    mov fire_col, 59         
    mov xDir, 1
    mov yDir, 1
    jmp fire_loop

fire_loop:
    mov dl, fire_col
    mov dh, fire_row
    call GoToXY

 
    L1:

       
        cmp dl, 20 
        jle end_fire

        cmp dl, 96  
        jge end_fire

        cmp dh, 5   
        jle end_fire

        cmp dh, 27  
        jge end_fire

  
        movzx eax, fire_color   
        call SetTextColor

        add dl, xDir
        add dh, yDir
        call Gotoxy                                                                       

        mWrite "*"

        mov eax, 50
        call Delay

 
        call GoToXY
        mWrite " "

        jmp L1

    end_fire:
        mov dx, 0
        call GoToXY

    ret
FireBall ENDP

DrawWall PROC
	call clrscr

    mov dl,19
	mov dh,2
	call Gotoxy
	mWrite <"Score: ">
	mov eax, Blue + (black * 16)
	call SetTextColor
	mov al, score
	call WriteDec

    mov eax, White + (black * 16)
	call SetTextColor

	mov dl,90
	mov dh,2
	call Gotoxy
	mWrite <"Lives: ">
	mov eax, Red + (black * 16)
	call SetTextColor
	mov al, lives
	call WriteDec

	mov eax, white + (black * 16)
	call SetTextColor

	mov dl,55
	mov dh,2
	call Gotoxy

	mWrite "LEVEL " 
	mov al, levelInfo
	call WriteDec

	mov eax, gray + (black*16)
	call SetTextColor

	mov dl, 19
	mov dh, 4
	call Gotoxy

	mov esi, offset walls

	mov counter1, 50
	mov counter2, 80
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow
		
        dec counter1
		movzx ecx, counter1

		mov dl, 19
		inc dh
		call Gotoxy
	loop printcolumn

	ret
DrawWall ENDP

PrintPlayer PROC
    mov eax, brown + (black * 16)
    call SetTextColor

    mov al, direction
    cmp al, "w"
    je print_up

    cmp al, "x"
    je print_down

    cmp al, "a"
    je print_left

    cmp al, "d"
    je print_right

    cmp al, "q"
    je print_upleft

    cmp al, "e"
    je print_upright

    cmp al, "z"
    je print_downleft

    cmp al, "c"
    je print_downright

    ret

    print_up:
        mov esi, offset player_up
        jmp print

    print_down:
        mov esi, offset player_down
        jmp print

    print_left:
        mov esi, offset player_left
        jmp print

    print_right:
        mov esi, offset player_right
        jmp print

    print_upleft:
        mov esi, offset player_upleft
        jmp print

    print_upright:
        mov esi, offset player_upright
        jmp print

    print_downleft:
        mov esi, offset player_downleft
        jmp print

    print_downright:
        mov esi, offset player_downright
        jmp print

    print:
    mov dl, xPos
    mov dh, yPos
    call GoToXY

    mov counter1, 3
	mov counter2, 4
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow

		movzx ecx, counter1

		mov dl, xPos
		inc dh
		call Gotoxy
	loop printcolumn
    
ret
PrintPlayer ENDP



MovePlayer PROC
    mov dx, 0
    call GoToXY

    checkInput:

    mov eax, 5
    call Delay

    mov eax, 0
    call ReadKey
    mov inputChar, al

    cmp inputChar, VK_SPACE
    je shoot

    cmp inputChar, VK_ESCAPE
    je paused

    cmp inputChar, "w"
    je move

    cmp inputChar, "a"
    je move

    cmp inputChar, "x"
    je move

    cmp inputChar, "d"
    je move

    cmp inputChar, "q"
    je move

    cmp inputChar, "e"
    je move

    cmp inputChar, "z"
    je move

    cmp inputChar, "c"
    je move


    jmp checkInput

    move:
        mov al, inputChar
        mov direction, al
        jmp chosen

    paused:
       
    call clrscr

  
    mov dx, 30          
    mov dh, 10
    call gotoxy
    mov edx, offset pauseScreen
    call writestring

    ; Wait for user input
pauseInput:
    call readkey
    cmp al, '1'          
    je resumeGame
    cmp al, '2'       
    je exitToMenu
    jmp pauseInput  

resumeGame:

    call clrscr
    jmp movePlayer   

exitToMenu:
   
    call clrscr
    call menuScreen
        ret
        
    shoot:
        call FireBall

    chosen:
        call PrintPlayer
        call MovePlayer

    ret
MovePlayer ENDP



DrawPath PROC
    mov edi, offset ball_path
    mov ecx, 66          



draw_path_loop:
    mov dl, [edi]           
    inc edi          
    mov dh, 11           
    inc edi          

    call Gotoxy                     
    mWrite "_"                     

    loop draw_path_loop       
    mwrite ")"
    ret
DrawPath ENDP



setBalls PROC

         
    mov esi, offset ball_positions   
    movzx ecx, ball_count           

place_balls:
    mov dl, [esi]   
    mov dh,10      
    inc esi           

    
    movzx eax, current_color_index
    mov al, [ball_colors + eax]  
    call SetTextColor                  

    call Gotoxy                
    mWrite "o"                  

    
    inc current_color_index
    cmp current_color_index, 4     
    jl continue
    mov current_color_index, 1 

continue:
    ;add edi, 2                
    loop place_balls   
    call DrawPath
    ;call moveBalls
    ret
setBalls ENDP

comment @
moveBalls PROC 

    pushad
 
    mov esi, offset ball_positions  
    mov edi, offset ball_path
    movzx ecx, ball_count           

  
move_balls_loop:
    
    cmp ecx, 0
    jle end_move                 

    
    mov dl, [esi]         
    mov dh, [esi + 1]   
    call Gotoxy               
    mWrite " "  

    
   
    mov bl, [edi]        
    mov bh, [edi + 1]    


    cmp bl, 0
    je end_move


    mov [esi], bl         
    mov [esi + 1], bh     

    
    mov dl, [esi]      
    mov dh, [esi + 1]  
    call Gotoxy                     

    
    push ecx        
    movzx eax, ball_count
    sub eax, ecx                 
    and eax, 3                  
    mov al, ball_colors[eax]
    call SetTextColor 

    mWrite "o"                      

    pop ecx                         

    
    add esi, 2             
    add edi, 2             
    dec ecx                       

  
    jmp move_balls_loop

end_move:

    popad
    ret
moveBalls ENDP
@

zumScreen PROC

     call clrscr
    mov eax, white + (black*16)
	call SetTextColor

    mov edx,0
    mov dl, 20
	mov dh, 10
	call Gotoxy

	mov esi, offset zum

	mov counter1, 7
	mov counter2, 72
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow
		
        
		movzx ecx, counter1

		mov dl,20
		inc dh
		call Gotoxy
	loop printcolumn
    call waitmsg
  
    ret
zumScreen ENDP



nameScreen PROC
    call clrscr
    mov eax, green + (black*16)
	call SetTextColor

    mov edx,0
    mov dl, 0
	mov dh, 4
	call Gotoxy

	mov esi, offset nme

	mov counter1, 15
	mov counter2, 118
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow
		
        
		movzx ecx, counter1

		mov dl,0
		inc dh
		call Gotoxy
	loop printcolumn

    mov eax, red + (black*16)
	call SetTextColor
   
    mov dl,60
    mov dh,20
    call gotoxy

  
    mov ecx,25
    mov edx,offset readName
    call readstring
    call crlf
    call waitmsg
  
    
    ret
nameScreen ENDP

menuScreen PROC
     call clrscr

    
    point1:
        mov dl, 70
        mov dh, 3
        call gotoxy
        mov edx, offset POINTER
        call writestring
        mov menuSelect, 1
    jmp start_tab

  
    point2:
        mov dl, 80
        mov dh, 9
        call gotoxy
        mov edx, offset POINTER
        call writestring
        mov menuSelect, 2
    jmp start_tab

  
    point3:
        mov dl, 100
        mov dh, 15
        call gotoxy
        mov edx, offset POINTER
        call writestring
        mov menuSelect, 3
    jmp start_tab


    point4:
        mov dl, 70
        mov dh, 25
        call gotoxy
        mov edx, offset POINTER
        call writestring
        mov menuSelect, 4
    jmp start_tab

  
    start_tab:
        mov dl, 0
        mov dh, 1
        call gotoxy
        mov edx, offset START
        call writestring

        mov dl, 0
        mov dh, 7
        call gotoxy
        mov edx, offset INSTRUCTIONS
        call writestring

        mov dl, 0
        mov dh, 13
        call gotoxy
        mov edx, offset LEVELS
        call writestring

        mov dl, 0
        mov dh, 23
        call gotoxy
        mov edx, offset EXITED
        call writestring

  
    call readchar
    call clrscr
    cmp al, '1'
    je point1
    cmp al, '2'
    je point2
    cmp al, '3'
    je point3
    cmp al, '4'
    je point4
    cmp al, 13
    je selection

    selection:
        cmp menuSelect, 1
        je startGame
        cmp menuSelect, 2
        je INSTRUCTIONSSCREEN
        cmp menuSelect, 3
        je levelsScreen
        cmp menuSelect, 4
        je exitGame


    INSTRUCTIONSSCREEN:
        mov dl, 0
        mov dh, 0
        call gotoxy
        mov edx, offset INSTRUCTIONS_SCREEN
        call writestring
        call readchar
        call clrscr
        cmp al, 27
        je point2
        jmp INSTRUCTIONSSCREEN

    
    levelsScreen:
        call clrscr
        mov dl, 0
        mov dh, 0
        call gotoxy
        mWrite "Select a Level (1, 2, 3, etc.):"
        call readchar
       
        sub al, '0'       
        mov levelInfo, al 
        call clrscr
        jmp point3

    
    startGame:
        call InitialiseScreen

   
    exitGame:
        ret
menuScreen ENDP

InitialiseScreen PROC

    
  
    call DrawWall

    call setBalls


   
    call PrintPlayer

    ret
InitialiseScreen ENDP



main PROC

    call zumScreen

   call nameScreen

    call menuScreen

    

    call MovePlayer

   
    comment @
    
    game_loop:
        call moveBalls             
        mov eax,5
        call delay     
        call Delay                 
        jmp game_loop             
@
      main_loop:
        ;call moveBalls           
        call Delay                  
                
;       call check_for_key_press
;        call update_emitter
 
        jmp main_loop

  


    exit
main ENDP
END main
