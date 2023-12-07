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


char txt1[] = "Temp(C):";
char txt3[] = "CHAUFFAGE";
char txt4[] = "CLIMATISEUR";
char txt2[20];
char i;
unsigned int temp ;
int x;


void main(){
 TRISE =0b00000000;
 PORTE=0;
while(1)
{
  Lcd_Init();

  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Out(1,1,txt1);

  temp = ADC_Read(0);
  x = temp*0.5;
  if (x<=15){
 IntToStr(x, txt2);

  Lcd_Out(1,10,txt2);
  Lcd_Out(2,2,txt3);
  PORTE=0b00000010;
  Delay_ms(500);
  PORTE=0b00000000;
  }
  else if(x>15){
   IntToStr(x, txt2);

  Lcd_Out(1,10,txt2);
  Lcd_Out(2,2,txt4);
  PORTE=0b00000010;
  Delay_ms(500);
  PORTE=0b00000000;
  }
}
}