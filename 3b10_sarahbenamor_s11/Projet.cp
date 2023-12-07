#line 1 "C:/Users/Lenovo/Desktop/New begginings/esprit/Projectmicro/val3/Projet.c"
unsigned short kp;
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
char txt3[] = "Acces autorise";
char txt4[] = "Acces Refuse";
char mcode[5] = "4321";
char inputcode[5];
int i;
int a,b;
void main() {
 TRISD = 0xF0;
 TRISB = 0b11000001;
 TRISE = 0b00000000;
 PORTB = 0;
 PORTE=0;
 INTCON.GIE = 1;
 INTCON.INTE = 1;
 OPTION_REG.INTEDG = 1;
 INTCON.RBIE = 1;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 4, txt1);
 Lcd_Out(2, 2, txt2);
 Keypad_Init();

 while (1) {
 kp = 0;
 do {
 kp = Keypad_Key_Press();
 } while (!kp);

 switch (kp) {
 case 1: kp = 49; break;
 case 2: kp = 50; break;
 case 3: kp = 51; break;
 case 5: kp = 52; break;
 case 6: kp = 53; break;
 case 7: kp = 54; break;
 case 9: kp = 55; break;
 case 10: kp = 56; break;
 case 11: kp = 57; break;
 case 13: kp = 42; break;
 case 14: kp = 48; break;
 case 15: kp = 35; break;
 default: kp += 48;
 }

 for (i = 0; i < 3; i++) {
 kp = Keypad_Key_Click();
 if (kp) {
 inputcode[i] = kp;
 }
 }
 }
 if (a==1){ Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,2,txt3);
 porte.re0 =1 ;
 delay_ms(500);
 porte.re0=0;
 a=0;}
 if (b==1){
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,2,txt4);
 porte.re2 =1 ;
 delay_ms(500);
 porte.re2=0;
 porta.ra1 = 1;
 intcon.rbif=0;
 b=0;}
}

void interrupt(){
if(intf==1){
porta.RA1 =0;
intcon.intf=0;}
if (rbif==1){
 if (rb7 ==1){
 if (strcmp(inputcode, mcode) == 0) {
 a=1;
 }
 else {
 b=1;
 }
}
 }
}
