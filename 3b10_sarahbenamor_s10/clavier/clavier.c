#define                 LengthPassWord  4       // Nombre des caractère du mot de passe
#define                 NumCodeRepeat   2       // Nombre de tenation
#define                 Enable_PW       8       // Caractère de réactivation du clavier
#define EEPROM_START_ADDRESS 0x00


// LCD module connections
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

// Initialisation du clavier dans le port D
char  keypadPort at PORTD;

unsigned short kp, count=0,i;
unsigned short CntWrongPW=0;
unsigned short Password[LengthPassWord]={1,2,3,4};

unsigned short GetKeyPressed(void)
{
    kp=0;
    do
      //kp = Keypad_Key_Press();
      kp = Keypad_Key_Click();
    while (!kp);

    switch (kp)
    {
      case  1: kp = 49; break; // 1
      case  2: kp = 50; break; // 2
      case  3: kp = 51; break; // 3
      case  5: kp = 52; break; // 4
      case  6: kp = 53; break; // 5
      case  7: kp = 54; break; // 6
      case  9: kp = 55; break; // 7
      case 10: kp = 56; break; // 8
      case 11: kp = 57; break; // 9
      case 13: kp = 42; break; // *
      case 14: kp = 48; break; // 0
      case 15: kp = 35; break; // #
    }
    return kp ;
}

void main()
{
  TRISA=0x00;
  PORTA=0x00;
  TRISB = 0x01;
  TRISC = 0x00;
  PORTC=  0x00;
  TRISE=0x00;
  PORTE=0x00;

  Keypad_Init();                           // Init clavier                  // Init Sound
  Lcd_Init();                              // Init LCD
  Lcd_Cmd(_LCD_CLEAR);                     // Effacer LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);                // Désactiver le curseur

 // Lcd_Out(1, 1, "1");
  //Lcd_Out(1, 1, "Key  :"); 
   Lcd_Out(1, 3, "Bienvenue");                // Write message text on LCD
  Lcd_Out(2, 1, "Saisir Code ");


  while(1)
  {
    for(i=0;i<LengthPassWord;i++)
    {

        kp=GetKeyPressed();

      //  Lcd_Chr(1, 10+i, kp);
        Lcd_Chr(2, 12+i, '*');
        if(Password[i]+48==kp  ) count++;
    }

    if (count==LengthPassWord)
    {
      count = 0;
       Lcd_Cmd(_LCD_CLEAR);                     // Effacer LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);
      Lcd_Out(1,1,"ACCES AUTORISE");

      PORTE=1;
      delay_ms(500);
      PORTE=0;

    }
    else
    {
      count++;
       Lcd_Cmd(_LCD_CLEAR);                     // Effacer LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);
      Lcd_Out(1,2,"ACCES REFUSE");
       PORTE=4;
       PORTA=0xff;
      delay_ms(500);
      PORTE=0;
      PORTA=0;
      

      CntWrongPW++;

      if(CntWrongPW==NumCodeRepeat)
      {
         CntWrongPW=0;
         count=0;
         while(kp=GetKeyPressed()-48!=Enable_PW)
         {
             Lcd_Out(2,1,"Password Blocked");
             Lcd_Out(1,1,"Password Blocked");
             PORTA=0xff;
             while(1)
             {
                 if(RB0==1) break;
             }
             PORTC=0x00;

         }
      }
    }

    delay_ms(500);

    Lcd_Cmd(_LCD_CLEAR);
   // Lcd_Out(1, 1, "Key  :");
 Lcd_Out(1, 3, "Bienvenue");                // Write message text on LCD
  Lcd_Out(2, 1, "Saisir le Code");

  }
}