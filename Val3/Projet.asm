
_Move_Delay:

;Projet.c,22 :: 		void Move_Delay() {                  // Function used for text moving
;Projet.c,23 :: 		Delay_ms(500);                     // You can change the moving speed here
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_Move_Delay0:
	DECFSZ     R13+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R12+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R11+0, 1
	GOTO       L_Move_Delay0
	NOP
	NOP
;Projet.c,24 :: 		}
L_end_Move_Delay:
	RETURN
; end of _Move_Delay

_main:

;Projet.c,26 :: 		void main(){
;Projet.c,27 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Projet.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Projet.c,29 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Projet.c,30 :: 		Lcd_Out(1,4,txt1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Projet.c,31 :: 		Lcd_Out(2,2,txt2);               // Write text in first row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Projet.c,34 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
