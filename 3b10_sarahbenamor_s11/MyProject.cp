#line 1 "C:/Users/Lenovo/Desktop/New begginings/esprit/Projectmicro/val3/MyProject.c"
sbit LCD_RS at RC4_bit;
sbit LCD_EN at RC5_bit;
sbit LCD_D4 at RC0_bit;
sbit LCD_D5 at RC1_bit;
sbit LCD_D6 at RC2_bit;
sbit LCD_D7 at RC3_bit;
sbit LCD_RS_Direction at TRISC4_bit;
sbit LCD_EN_Direction at TRISC5_bit;
sbit LCD_D4_Direction at TRISC0_bit;
sbit LCD_D5_Direction at TRISC1_bit;
sbit LCD_D6_Direction at TRISC2_bit;
sbit LCD_D7_Direction at TRISC3_bit;

char keypadPort at PORTD;
char txt1[] = "Bienvenue";
char txt2[] = "Saisir le Code";
char txt3[] = "Accés autorisé";
char txt4[] = "Accés Réfusé";
char ccode[4] ;
char inputCode[4];
char Keypad_Get_Key();
int i;
char Keypad_Get_Key() {
 char keyPressed = 0;
 do {
 keyPressed = Keypad_Key_Click();
 } while (!keyPressed);
 return keyPressed;
}
void main(){
char ccode[5]="4321";
TRISD = 0xF0;
TRISB = 0b11000001;
TRISE=7;
Portb=0;
intcon.gie=1;
intcon.inte=1;
option_reg.intedg=0;
intcon.rbie=1;
 Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1,4,txt1);
Lcd_Out(2,2,txt2);
 Keypad_Init();
 Keypad_Key_Click();
 Delay_ms(500);

 for (i=0;i<3;i++) {
 char keyPressed = Keypad_Get_Key();
 if (keyPressed) {
 inputCode[i] = keyPressed;
 }
 }

 }
void interrupt(){
if(intf==1){
porta.RA1 =0;
intcon.intf=0;}
if (rbif==1){
 if (rb7 ==1){
 if (strcmp(inputCode, ccode) == 0) {
 Lcd_Out(1,2,txt3);
 porte.re0 =1 ;
 delay_ms(500);
 porte.re0=0;
 } else {
 Lcd_Out(1,2,txt4);
 porte.re2 =1 ;
 delay_ms(500);
 porte.re2=0;
 porta.ra1 = 1;
 intcon.rbif=0;
 }
}
}
}
