
_GetKeyPressed:

;clavier.c,29 :: 		unsigned short GetKeyPressed(void)
;clavier.c,31 :: 		kp=0;
	CLRF       _kp+0
;clavier.c,32 :: 		do
L_GetKeyPressed0:
;clavier.c,34 :: 		kp = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;clavier.c,35 :: 		while (!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_GetKeyPressed0
;clavier.c,37 :: 		switch (kp)
	GOTO       L_GetKeyPressed3
;clavier.c,39 :: 		case  1: kp = 49; break; // 1
L_GetKeyPressed5:
	MOVLW      49
	MOVWF      _kp+0
	GOTO       L_GetKeyPressed4
;clavier.c,40 :: 		case  2: kp = 50; break; // 2
L_GetKeyPressed6:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_GetKeyPressed4
;clavier.c,41 :: 		case  3: kp = 51; break; // 3
L_GetKeyPressed7:
	MOVLW      51
	MOVWF      _kp+0
	GOTO       L_GetKeyPressed4
;clavier.c,42 :: 		case  5: kp = 52; break; // 4
L_GetKeyPressed8:
	MOVLW      52
	MOVWF      _kp+0
	GOTO       L_GetKeyPressed4
;clavier.c,43 :: 		case  6: kp = 53; break; // 5
L_GetKeyPressed9:
	MOVLW      53
	MOVWF      _kp+0
	GOTO       L_GetKeyPressed4
;clavier.c,44 :: 		case  7: kp = 54; break; // 6
L_GetKeyPressed10:
	MOVLW      54
	MOVWF      _kp+0
	GOTO       L_GetKeyPressed4
;clavier.c,45 :: 		case  9: kp = 55; break; // 7
L_GetKeyPressed11:
	MOVLW      55
	MOVWF      _kp+0
	GOTO       L_GetKeyPressed4
;clavier.c,46 :: 		case 10: kp = 56; break; // 8
L_GetKeyPressed12:
	MOVLW      56
	MOVWF      _kp+0
	GOTO       L_GetKeyPressed4
;clavier.c,47 :: 		case 11: kp = 57; break; // 9
L_GetKeyPressed13:
	MOVLW      57
	MOVWF      _kp+0
	GOTO       L_GetKeyPressed4
;clavier.c,48 :: 		case 13: kp = 42; break; // *
L_GetKeyPressed14:
	MOVLW      42
	MOVWF      _kp+0
	GOTO       L_GetKeyPressed4
;clavier.c,49 :: 		case 14: kp = 48; break; // 0
L_GetKeyPressed15:
	MOVLW      48
	MOVWF      _kp+0
	GOTO       L_GetKeyPressed4
;clavier.c,50 :: 		case 15: kp = 35; break; // #
L_GetKeyPressed16:
	MOVLW      35
	MOVWF      _kp+0
	GOTO       L_GetKeyPressed4
;clavier.c,51 :: 		}
L_GetKeyPressed3:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_GetKeyPressed5
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_GetKeyPressed6
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_GetKeyPressed7
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_GetKeyPressed8
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_GetKeyPressed9
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_GetKeyPressed10
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_GetKeyPressed11
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_GetKeyPressed12
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_GetKeyPressed13
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_GetKeyPressed14
	MOVF       _kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_GetKeyPressed15
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_GetKeyPressed16
L_GetKeyPressed4:
;clavier.c,52 :: 		return kp ;
	MOVF       _kp+0, 0
	MOVWF      R0+0
;clavier.c,53 :: 		}
L_end_GetKeyPressed:
	RETURN
; end of _GetKeyPressed

_main:

;clavier.c,55 :: 		void main()
;clavier.c,57 :: 		TRISA=0x00;
	CLRF       TRISA+0
;clavier.c,58 :: 		PORTA=0x00;
	CLRF       PORTA+0
;clavier.c,59 :: 		TRISB = 0x01;
	MOVLW      1
	MOVWF      TRISB+0
;clavier.c,60 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;clavier.c,61 :: 		PORTC=  0x00;
	CLRF       PORTC+0
;clavier.c,62 :: 		TRISE=0x00;
	CLRF       TRISE+0
;clavier.c,63 :: 		PORTE=0x00;
	CLRF       PORTE+0
;clavier.c,65 :: 		Keypad_Init();                           // Init clavier                  // Init Sound
	CALL       _Keypad_Init+0
;clavier.c,66 :: 		Lcd_Init();                              // Init LCD
	CALL       _Lcd_Init+0
;clavier.c,67 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Effacer LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;clavier.c,68 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                // Désactiver le curseur
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;clavier.c,72 :: 		Lcd_Out(1, 3, "Bienvenue");                // Write message text on LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_clavier+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;clavier.c,73 :: 		Lcd_Out(2, 1, "Saisir Code ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_clavier+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;clavier.c,76 :: 		while(1)
L_main17:
;clavier.c,78 :: 		for(i=0;i<LengthPassWord;i++)
	CLRF       _i+0
L_main19:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main20
;clavier.c,81 :: 		kp=GetKeyPressed();
	CALL       _GetKeyPressed+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;clavier.c,84 :: 		Lcd_Chr(2, 12+i, '*');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       _i+0, 0
	ADDLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;clavier.c,85 :: 		if(Password[i]+48==kp  ) count++;
	MOVF       _i+0, 0
	ADDLW      _Password+0
	MOVWF      FSR
	MOVLW      48
	ADDWF      INDF+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSC      STATUS+0, 0
	INCF       R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVF       _kp+0, 0
	XORWF      R1+0, 0
L__main36:
	BTFSS      STATUS+0, 2
	GOTO       L_main22
	INCF       _count+0, 1
L_main22:
;clavier.c,78 :: 		for(i=0;i<LengthPassWord;i++)
	INCF       _i+0, 1
;clavier.c,86 :: 		}
	GOTO       L_main19
L_main20:
;clavier.c,88 :: 		if (count==LengthPassWord)
	MOVF       _count+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_main23
;clavier.c,90 :: 		count = 0;
	CLRF       _count+0
;clavier.c,91 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Effacer LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;clavier.c,92 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;clavier.c,93 :: 		Lcd_Out(1,1,"ACCES AUTORISE");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_clavier+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;clavier.c,95 :: 		PORTE=1;
	MOVLW      1
	MOVWF      PORTE+0
;clavier.c,96 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
	NOP
;clavier.c,97 :: 		PORTE=0;
	CLRF       PORTE+0
;clavier.c,99 :: 		}
	GOTO       L_main25
L_main23:
;clavier.c,102 :: 		count++;
	INCF       _count+0, 1
;clavier.c,103 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Effacer LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;clavier.c,104 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;clavier.c,105 :: 		Lcd_Out(1,2,"ACCES REFUSE");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_clavier+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;clavier.c,106 :: 		PORTE=4;
	MOVLW      4
	MOVWF      PORTE+0
;clavier.c,107 :: 		PORTA=0xff;
	MOVLW      255
	MOVWF      PORTA+0
;clavier.c,108 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	DECFSZ     R11+0, 1
	GOTO       L_main26
	NOP
	NOP
;clavier.c,109 :: 		PORTE=0;
	CLRF       PORTE+0
;clavier.c,110 :: 		PORTA=0;
	CLRF       PORTA+0
;clavier.c,113 :: 		CntWrongPW++;
	INCF       _CntWrongPW+0, 1
;clavier.c,115 :: 		if(CntWrongPW==NumCodeRepeat)
	MOVF       _CntWrongPW+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main27
;clavier.c,117 :: 		CntWrongPW=0;
	CLRF       _CntWrongPW+0
;clavier.c,118 :: 		count=0;
	CLRF       _count+0
;clavier.c,119 :: 		while(kp=GetKeyPressed()-48!=Enable_PW)
	CALL       _GetKeyPressed+0
	MOVLW      48
	SUBWF      R0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVLW      8
	XORWF      R1+0, 0
L__main37:
	MOVLW      1
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main29
;clavier.c,121 :: 		Lcd_Out(2,1,"Password Blocked");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_clavier+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;clavier.c,122 :: 		Lcd_Out(1,1,"Password Blocked");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_clavier+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;clavier.c,123 :: 		PORTA=0xff;
	MOVLW      255
	MOVWF      PORTA+0
;clavier.c,124 :: 		while(1)
L_main30:
;clavier.c,126 :: 		if(RB0==1) break;
L_main32:
;clavier.c,127 :: 		}
	GOTO       L_main30
;clavier.c,130 :: 		}
L_main29:
;clavier.c,131 :: 		}
L_main27:
;clavier.c,132 :: 		}
L_main25:
;clavier.c,134 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main33:
	DECFSZ     R13+0, 1
	GOTO       L_main33
	DECFSZ     R12+0, 1
	GOTO       L_main33
	DECFSZ     R11+0, 1
	GOTO       L_main33
	NOP
	NOP
;clavier.c,136 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;clavier.c,138 :: 		Lcd_Out(1, 3, "Bienvenue");                // Write message text on LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_clavier+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;clavier.c,139 :: 		Lcd_Out(2, 1, "Saisir le Code");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_clavier+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;clavier.c,141 :: 		}
	GOTO       L_main17
;clavier.c,142 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
