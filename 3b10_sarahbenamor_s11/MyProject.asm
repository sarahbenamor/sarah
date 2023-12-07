
_Keypad_Get_Key:

;MyProject.c,23 :: 		char Keypad_Get_Key() {
;MyProject.c,24 :: 		char keyPressed = 0;
	CLRF       Keypad_Get_Key_keyPressed_L0+0
;MyProject.c,25 :: 		do {
L_Keypad_Get_Key0:
;MyProject.c,26 :: 		keyPressed = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      Keypad_Get_Key_keyPressed_L0+0
;MyProject.c,27 :: 		} while (!keyPressed);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Keypad_Get_Key0
;MyProject.c,28 :: 		return keyPressed;
	MOVF       Keypad_Get_Key_keyPressed_L0+0, 0
	MOVWF      R0+0
;MyProject.c,29 :: 		}
L_end_Keypad_Get_Key:
	RETURN
; end of _Keypad_Get_Key

_main:

;MyProject.c,30 :: 		void main(){
;MyProject.c,31 :: 		char ccode[5]="4321";
;MyProject.c,32 :: 		TRISD = 0xF0;
	MOVLW      240
	MOVWF      TRISD+0
;MyProject.c,33 :: 		TRISB = 0b11000001;
	MOVLW      193
	MOVWF      TRISB+0
;MyProject.c,34 :: 		TRISE=7;
	MOVLW      7
	MOVWF      TRISE+0
;MyProject.c,35 :: 		Portb=0;
	CLRF       PORTB+0
;MyProject.c,36 :: 		intcon.gie=1;
	BSF        INTCON+0, 7
;MyProject.c,37 :: 		intcon.inte=1;
	BSF        INTCON+0, 4
;MyProject.c,38 :: 		option_reg.intedg=0; // passage de 1-->0
	BCF        OPTION_REG+0, 6
;MyProject.c,39 :: 		intcon.rbie=1;
	BSF        INTCON+0, 3
;MyProject.c,40 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,41 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,42 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,43 :: 		Lcd_Out(1,4,txt1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,44 :: 		Lcd_Out(2,2,txt2);               // Write text in first row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,45 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;MyProject.c,46 :: 		Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
;MyProject.c,47 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;MyProject.c,49 :: 		for (i=0;i<3;i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main4:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      3
	SUBWF      _i+0, 0
L__main17:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;MyProject.c,50 :: 		char keyPressed = Keypad_Get_Key();
	CALL       _Keypad_Get_Key+0
	MOVF       R0+0, 0
	MOVWF      main_keyPressed_L1+0
;MyProject.c,51 :: 		if (keyPressed) {
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
;MyProject.c,52 :: 		inputCode[i] = keyPressed;
	MOVF       _i+0, 0
	ADDLW      _inputCode+0
	MOVWF      FSR
	MOVF       main_keyPressed_L1+0, 0
	MOVWF      INDF+0
;MyProject.c,53 :: 		}
L_main7:
;MyProject.c,49 :: 		for (i=0;i<3;i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,54 :: 		}
	GOTO       L_main4
L_main5:
;MyProject.c,56 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,57 :: 		void interrupt(){
;MyProject.c,59 :: 		porta.RA1 =0;
	BCF        PORTA+0, 1
;MyProject.c,60 :: 		intcon.intf=0;}
	BCF        INTCON+0, 1
L_interrupt8:
;MyProject.c,61 :: 		if (rbif==1){
	GOTO       L_interrupt9
;MyProject.c,66 :: 		delay_ms(500);
L_interrupt12:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt12
	DECFSZ     R12+0, 1
	GOTO       L_interrupt12
	DECFSZ     R11+0, 1
	GOTO       L_interrupt12
	NOP
	NOP
;MyProject.c,67 :: 		porte.re0=0;
	BCF        PORTE+0, 0
;MyProject.c,68 :: 		} else {
	GOTO       L_interrupt13
;MyProject.c,71 :: 		delay_ms(500);
L_interrupt14:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt14
	DECFSZ     R12+0, 1
	GOTO       L_interrupt14
	DECFSZ     R11+0, 1
	GOTO       L_interrupt14
	NOP
	NOP
;MyProject.c,72 :: 		porte.re2=0;
	BCF        PORTE+0, 2
;MyProject.c,73 :: 		porta.ra1 = 1;
	BSF        PORTA+0, 1
;MyProject.c,74 :: 		intcon.rbif=0;
	BCF        INTCON+0, 0
;MyProject.c,75 :: 		}
L_interrupt13:
;MyProject.c,77 :: 		}
L_interrupt9:
;MyProject.c,78 :: 		}
L_end_interrupt:
L__interrupt19:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
