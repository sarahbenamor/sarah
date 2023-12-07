
_main:

;Projet.c,26 :: 		void main() {
;Projet.c,27 :: 		TRISD = 0xF0;
	MOVLW      240
	MOVWF      TRISD+0
;Projet.c,28 :: 		TRISB = 0b11000001;
	MOVLW      193
	MOVWF      TRISB+0
;Projet.c,29 :: 		TRISE = 0b00000000;
	CLRF       TRISE+0
;Projet.c,30 :: 		PORTB = 0;
	CLRF       PORTB+0
;Projet.c,31 :: 		PORTE=0;
	CLRF       PORTE+0
;Projet.c,32 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;Projet.c,33 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;Projet.c,34 :: 		OPTION_REG.INTEDG = 1;
	BSF        OPTION_REG+0, 6
;Projet.c,35 :: 		INTCON.RBIE = 1;
	BSF        INTCON+0, 3
;Projet.c,37 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Projet.c,38 :: 		Lcd_Cmd(_LCD_CLEAR);       // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Projet.c,39 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Projet.c,40 :: 		Lcd_Out(1, 4, txt1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Projet.c,41 :: 		Lcd_Out(2, 2, txt2);       // Write text in the first row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Projet.c,42 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;Projet.c,44 :: 		while (1) {
L_main0:
;Projet.c,45 :: 		kp = 0;                                // Reset key code variable
	CLRF       _kp+0
;Projet.c,46 :: 		do {
L_main2:
;Projet.c,47 :: 		kp = Keypad_Key_Press();          // Store key code in kp variable
	CALL       _Keypad_Key_Press+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;Projet.c,48 :: 		} while (!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;Projet.c,50 :: 		switch (kp) {
	GOTO       L_main5
;Projet.c,51 :: 		case 1: kp = 49; break; // 1
L_main7:
	MOVLW      49
	MOVWF      _kp+0
	GOTO       L_main6
;Projet.c,52 :: 		case 2: kp = 50; break; // 2
L_main8:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_main6
;Projet.c,53 :: 		case 3: kp = 51; break; // 3
L_main9:
	MOVLW      51
	MOVWF      _kp+0
	GOTO       L_main6
;Projet.c,54 :: 		case 5: kp = 52; break; // 4
L_main10:
	MOVLW      52
	MOVWF      _kp+0
	GOTO       L_main6
;Projet.c,55 :: 		case 6: kp = 53; break; // 5
L_main11:
	MOVLW      53
	MOVWF      _kp+0
	GOTO       L_main6
;Projet.c,56 :: 		case 7: kp = 54; break; // 6
L_main12:
	MOVLW      54
	MOVWF      _kp+0
	GOTO       L_main6
;Projet.c,57 :: 		case 9: kp = 55; break; // 7
L_main13:
	MOVLW      55
	MOVWF      _kp+0
	GOTO       L_main6
;Projet.c,58 :: 		case 10: kp = 56; break; // 8
L_main14:
	MOVLW      56
	MOVWF      _kp+0
	GOTO       L_main6
;Projet.c,59 :: 		case 11: kp = 57; break; // 9
L_main15:
	MOVLW      57
	MOVWF      _kp+0
	GOTO       L_main6
;Projet.c,60 :: 		case 13: kp = 42; break; // '*'
L_main16:
	MOVLW      42
	MOVWF      _kp+0
	GOTO       L_main6
;Projet.c,61 :: 		case 14: kp = 48; break; // '0'
L_main17:
	MOVLW      48
	MOVWF      _kp+0
	GOTO       L_main6
;Projet.c,62 :: 		case 15: kp = 35; break; // '#'
L_main18:
	MOVLW      35
	MOVWF      _kp+0
	GOTO       L_main6
;Projet.c,63 :: 		default: kp += 48;
L_main19:
	MOVLW      48
	ADDWF      _kp+0, 1
;Projet.c,64 :: 		}
	GOTO       L_main6
L_main5:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVF       _kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	GOTO       L_main19
L_main6:
;Projet.c,66 :: 		for (i = 0; i < 3; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main20:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVLW      3
	SUBWF      _i+0, 0
L__main34:
	BTFSC      STATUS+0, 0
	GOTO       L_main21
;Projet.c,67 :: 		kp = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;Projet.c,68 :: 		if (kp) {
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main23
;Projet.c,69 :: 		inputcode[i] = kp;
	MOVF       _i+0, 0
	ADDLW      _inputcode+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
;Projet.c,70 :: 		}
L_main23:
;Projet.c,66 :: 		for (i = 0; i < 3; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Projet.c,71 :: 		}
	GOTO       L_main20
L_main21:
;Projet.c,72 :: 		}
	GOTO       L_main0
;Projet.c,77 :: 		delay_ms(500);
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
	NOP
;Projet.c,78 :: 		porte.re0=0;
	BCF        PORTE+0, 0
;Projet.c,79 :: 		a=0;}
	CLRF       _a+0
	CLRF       _a+1
;Projet.c,80 :: 		if (b==1){
	MOVLW      0
	XORWF      _b+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVLW      1
	XORWF      _b+0, 0
L__main35:
	BTFSS      STATUS+0, 2
	GOTO       L_main26
;Projet.c,81 :: 		Lcd_Cmd(_LCD_CLEAR);       // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Projet.c,82 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Projet.c,83 :: 		Lcd_Out(1,2,txt4);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Projet.c,84 :: 		porte.re2 =1 ;
	BSF        PORTE+0, 2
;Projet.c,85 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
	NOP
	NOP
;Projet.c,86 :: 		porte.re2=0;
	BCF        PORTE+0, 2
;Projet.c,87 :: 		porta.ra1 = 1;
	BSF        PORTA+0, 1
;Projet.c,88 :: 		intcon.rbif=0;
	BCF        INTCON+0, 0
;Projet.c,89 :: 		b=0;}
	CLRF       _b+0
	CLRF       _b+1
L_main26:
;Projet.c,90 :: 		}
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

;Projet.c,92 :: 		void interrupt(){
;Projet.c,94 :: 		porta.RA1 =0;
	BCF        PORTA+0, 1
;Projet.c,95 :: 		intcon.intf=0;}
	BCF        INTCON+0, 1
;Projet.c,105 :: 		}
L_interrupt29:
;Projet.c,106 :: 		}
L_end_interrupt:
L__interrupt37:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
