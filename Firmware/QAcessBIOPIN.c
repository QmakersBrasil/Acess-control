//Saidas
#define RFC PORTB.RB4     
#define RC2 PORTB.RB5    
#define RC1 PORTB.RB7     
//Entradas
#define CFC PORTA.RA1    
#define CM2 PORTA.RA2    
#define CM3 PORTA.RA3    
#define CM4 PORTA.RA4
int P;

void main()
{
CMCON=0x07;
TRISA=0b00011110;
PORTA=0b11111111;
TRISB=0b00000000;
PORTB=0b00000000;
RC2=1; 
delay_ms(1305);
RC2=0;

aberta:
P=1;
Delay_ms(1);
if (CM3==0)
 {
  volta:
  if (CM4==0)         
   {
    RFC=1;            
    Delay_ms(2000);   
    RFC=0;            
    goto aberta;
    }
  if (CM2==0)         
   {
    RC1=1;            
    }
  if (CM3==1 && p==0) 
   {
    RC1=1;            
    }
  if (CFC==0)         
   {
    delay_ms(300);    
    if (CFC==0)       
     {
      delay_ms(100);  
      if (CFC==0)     
       {
        delay_ms(118);
        if (CFC==0)   
         {
          delay_ms(25);
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
    
  }
  goto aberta;
}
