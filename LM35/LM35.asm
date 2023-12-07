
_main:

;LM35.c,25 :: 		void main(){
;LM35.c,26 :: 		TRISE =0b00000000;
	CLRF       TRISE+0
;LM35.c,27 :: 		PORTE=0;
	CLRF       PORTE+0
;LM35.c,28 :: 		while(1)
L_main0:
;LM35.c,30 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;LM35.c,32 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LM35.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LM35.c,34 :: 		Lcd_Out(1,1,txt1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35.c,36 :: 		temp = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
;LM35.c,37 :: 		x = temp*0.5;
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      126
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _x+0
	MOVF       R0+1, 0
	MOVWF      _x+1
;LM35.c,38 :: 		if (x<=15){
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVF       R0+0, 0
	SUBLW      15
L__main8:
	BTFSS      STATUS+0, 0
	GOTO       L_main2
;LM35.c,39 :: 		IntToStr(x, txt2);
	MOVF       _x+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _x+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt2+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;LM35.c,41 :: 		Lcd_Out(1,10,txt2);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35.c,42 :: 		Lcd_Out(2,2,txt3);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35.c,43 :: 		PORTE=0b00000010;
	MOVLW      2
	MOVWF      PORTE+0
;LM35.c,44 :: 		Delay_ms(500);
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
;LM35.c,45 :: 		PORTE=0b00000000;
	CLRF       PORTE+0
;LM35.c,46 :: 		}
	GOTO       L_main4
L_main2:
;LM35.c,47 :: 		else if(x>15){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _x+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVF       _x+0, 0
	SUBLW      15
L__main9:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;LM35.c,48 :: 		IntToStr(x, txt2);
	MOVF       _x+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _x+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt2+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;LM35.c,50 :: 		Lcd_Out(1,10,txt2);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35.c,51 :: 		Lcd_Out(2,2,txt4);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35.c,52 :: 		PORTE=0b00000010;
	MOVLW      2
	MOVWF      PORTE+0
;LM35.c,53 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;LM35.c,54 :: 		PORTE=0b00000000;
	CLRF       PORTE+0
;LM35.c,55 :: 		}
L_main5:
L_main4:
;LM35.c,56 :: 		}
	GOTO       L_main0
;LM35.c,57 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
