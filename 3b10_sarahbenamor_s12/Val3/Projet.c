#define led_vert RE0
#define led_orangé RE1
#define led_rouge RE2
#define STOP RB0
#define SAISI RB6
#define VALIDER RB7
#define CHANGER RA4
#define BUZZER RA1
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
// End LCD module connections
char keypadPort at PORTD;
char txt1[] = "Bienvenue"; 
char txt2[] = "Saisir le Code";
char txt3[] = "Accés autorisé";
char txt4[] = "Accés Réfusé";
char code[4] = "4321";
char inputCode[4];
char Keypad_Get_Key();
int i;
void main(){
TRISD = 0xF0;
TRISB = 0b11000001;
TRISE=7;
gie=1;
rbie=1 ;
inte=1;
 Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,4,txt1);
 Lcd_Out(2,2,txt2);               // Write text in first row
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
BUZZER =0;
intf=0;}
if (rbif==1){
   if VALIDER ==1){
      if (strcmp(inputCode, code) == 0) {
         Lcd_Out(1,2,txt3);
         led_vert =1 ;
         delay_ms(500);
         led_vert=0;
        } else {
            Lcd_Out(1,2,txt4);
            led_rouge =1 ;
            delay_ms(500);
            led_rouge=0;
            BUZZER = 1;
            rbif=0;
        }
        }
        
    
char Keypad_Get_Key() {
    char keyPressed = 0;
    do {
        keyPressed = Keypad_Key_Click();
    } while (!keyPressed);
    return keyPressed;
}