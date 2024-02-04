//Saidas
#define RFC PORTB.RB4     //Rele de abertura de porta
#define RC2 PORTB.RB5     //Transistor Menu
#define RC1 PORTB.RB7     //Rele Alarme
//Entradas
#define CFC PORTA.RA1     //Comando de abertura de porta
#define CM2 PORTA.RA2     //comando 2  Sensor de vandalismo
#define CM3 PORTA.RA3     //comando 3  Sensor de porta aberta (Arrombamento)
#define CM4 PORTA.RA4     //comando 4  Botao de abertura de porta
int P;

void main()
{
CMCON=0x07;
TRISA=0b00011110;
PORTA=0b11111111;
TRISB=0b00000000;
PORTB=0b00000000;
RC2=1; // Aciona o Transistor do Menu
delay_ms(1305); // Aguarda 500 milissegundos
RC2=0; // desliga o Transistor do Menu

aberta:
P=1;
Delay_ms(1);
if (CM3==0)
 {
  volta:
  if (CM4==0)         // Se o botao de abertura de porta for pressionado
   {
    RFC=1;            // Ativa o rele de abertura de porta
    Delay_ms(2000);   // Aguarda 2 segundos
    RFC=0;            // Desativa o rele de abertura de porta
    goto aberta;
    }
  if (CM2==0)         // Se o sensor de vandalismo for acionado
   {
    RC1=1;            // Aciona o rele de alarme
    }
  if (CM3==1 && p==0) // Se o sensor de porta aberta estiver ativado e
   {
    RC1=1;            //
    }
  if (CFC==0)         // Se o comando de abertura de porta for iniciado
   {
    delay_ms(300);    // Aguarda 300 milissegundos
    if (CFC==0)       // Se o comando de abertura de porta continuar acionado
     {
      delay_ms(100);  // Aguarda 100 milissegundos
      if (CFC==0)     // Se o comando de abertura de porta continuar acionado
       {
        delay_ms(118); // Aguarda 118 milissegundos
        if (CFC==0)    // Se o comando de abertura de porta continuar acionado
         {
          delay_ms(25); // Aguarda 25 milissegundos
          if (CFC==1)
           {
            RFC=1;
            RC2=1;
            delay_ms(2000);
            RC1=0;
            RFC=0;
            RC2=0;
            goto aberta;
            }
            else{p=0;goto volta;}
          }
          else{p=0;goto volta;}
        }
        else{p=0;goto volta;}
      }
      else{p=0;goto volta;}
    }
     else{p=0;goto volta;}
    //goto volta;
  }
  goto aberta;
}