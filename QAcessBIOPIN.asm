
_main:

;QAcessBIOPIN.c,12 :: 		void main()
;QAcessBIOPIN.c,14 :: 		CMCON=0x07;
	MOVLW      7
	MOVWF      CMCON+0
;QAcessBIOPIN.c,15 :: 		TRISA=0b00011110;
	MOVLW      30
	MOVWF      TRISA+0
;QAcessBIOPIN.c,16 :: 		PORTA=0b11111111;
	MOVLW      255
	MOVWF      PORTA+0
;QAcessBIOPIN.c,17 :: 		TRISB=0b00000000;
	CLRF       TRISB+0
;QAcessBIOPIN.c,18 :: 		PORTB=0b00000000;
	CLRF       PORTB+0
;QAcessBIOPIN.c,19 :: 		RC2=1; // Aciona o Transistor do Menu
	BSF        PORTB+0, 5
;QAcessBIOPIN.c,20 :: 		delay_ms(1305); // Aguarda 500 milissegundos
	MOVLW      7
	MOVWF      R11+0
	MOVLW      159
	MOVWF      R12+0
	MOVLW      199
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;QAcessBIOPIN.c,21 :: 		RC2=0; // desliga o Transistor do Menu
	BCF        PORTB+0, 5
;QAcessBIOPIN.c,23 :: 		aberta:
___main_aberta:
;QAcessBIOPIN.c,24 :: 		P=1;
	MOVLW      1
	MOVWF      _P+0
	MOVLW      0
	MOVWF      _P+1
;QAcessBIOPIN.c,25 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
;QAcessBIOPIN.c,26 :: 		if (CM3==0)
	BTFSC      PORTA+0, 3
	GOTO       L_main2
;QAcessBIOPIN.c,28 :: 		volta:
___main_volta:
;QAcessBIOPIN.c,29 :: 		if (CM4==0)         // Se o botao de abertura de porta for pressionado
	BTFSC      PORTA+0, 4
	GOTO       L_main3
;QAcessBIOPIN.c,31 :: 		RFC=1;            // Ativa o rele de abertura de porta
	BSF        PORTB+0, 4
;QAcessBIOPIN.c,32 :: 		Delay_ms(2000);   // Aguarda 2 segundos
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;QAcessBIOPIN.c,33 :: 		RFC=0;            // Desativa o rele de abertura de porta
	BCF        PORTB+0, 4
;QAcessBIOPIN.c,34 :: 		goto aberta;
	GOTO       ___main_aberta
;QAcessBIOPIN.c,35 :: 		}
L_main3:
;QAcessBIOPIN.c,36 :: 		if (CM2==0)         // Se o sensor de vandalismo for acionado
	BTFSC      PORTA+0, 2
	GOTO       L_main5
;QAcessBIOPIN.c,38 :: 		RC1=1;            // Aciona o rele de alarme
	BSF        PORTB+0, 7
;QAcessBIOPIN.c,39 :: 		}
L_main5:
;QAcessBIOPIN.c,40 :: 		if (CM3==1 && p==0) // Se o sensor de porta aberta estiver ativado e
	BTFSS      PORTA+0, 3
	GOTO       L_main8
	MOVLW      0
	XORWF      _P+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVLW      0
	XORWF      _P+0, 0
L__main26:
	BTFSS      STATUS+0, 2
	GOTO       L_main8
L__main24:
;QAcessBIOPIN.c,42 :: 		RC1=1;            //
	BSF        PORTB+0, 7
;QAcessBIOPIN.c,43 :: 		}
L_main8:
;QAcessBIOPIN.c,44 :: 		if (CFC==0)         // Se o comando de abertura de porta for iniciado
	BTFSC      PORTA+0, 1
	GOTO       L_main9
;QAcessBIOPIN.c,46 :: 		delay_ms(300);    // Aguarda 300 milissegundos
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
;QAcessBIOPIN.c,47 :: 		if (CFC==0)       // Se o comando de abertura de porta continuar acionado
	BTFSC      PORTA+0, 1
	GOTO       L_main11
;QAcessBIOPIN.c,49 :: 		delay_ms(100);  // Aguarda 100 milissegundos
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
	NOP
;QAcessBIOPIN.c,50 :: 		if (CFC==0)     // Se o comando de abertura de porta continuar acionado
	BTFSC      PORTA+0, 1
	GOTO       L_main13
;QAcessBIOPIN.c,52 :: 		delay_ms(118); // Aguarda 118 milissegundos
	MOVLW      154
	MOVWF      R12+0
	MOVLW      61
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	NOP
	NOP
;QAcessBIOPIN.c,53 :: 		if (CFC==0)    // Se o comando de abertura de porta continuar acionado
	BTFSC      PORTA+0, 1
	GOTO       L_main15
;QAcessBIOPIN.c,55 :: 		delay_ms(25); // Aguarda 25 milissegundos
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	NOP
;QAcessBIOPIN.c,56 :: 		if (CFC==1)
	BTFSS      PORTA+0, 1
	GOTO       L_main17
;QAcessBIOPIN.c,58 :: 		RFC=1;
	BSF        PORTB+0, 4
;QAcessBIOPIN.c,59 :: 		RC2=1;
	BSF        PORTB+0, 5
;QAcessBIOPIN.c,60 :: 		delay_ms(2000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
	NOP
;QAcessBIOPIN.c,61 :: 		RC1=0;
	BCF        PORTB+0, 7
;QAcessBIOPIN.c,62 :: 		RFC=0;
	BCF        PORTB+0, 4
;QAcessBIOPIN.c,63 :: 		RC2=0;
	BCF        PORTB+0, 5
;QAcessBIOPIN.c,64 :: 		goto aberta;
	GOTO       ___main_aberta
;QAcessBIOPIN.c,65 :: 		}
L_main17:
;QAcessBIOPIN.c,66 :: 		else{p=0;goto volta;}
	CLRF       _P+0
	CLRF       _P+1
	GOTO       ___main_volta
;QAcessBIOPIN.c,67 :: 		}
L_main15:
;QAcessBIOPIN.c,68 :: 		else{p=0;goto volta;}
	CLRF       _P+0
	CLRF       _P+1
	GOTO       ___main_volta
;QAcessBIOPIN.c,69 :: 		}
L_main13:
;QAcessBIOPIN.c,70 :: 		else{p=0;goto volta;}
	CLRF       _P+0
	CLRF       _P+1
	GOTO       ___main_volta
;QAcessBIOPIN.c,71 :: 		}
L_main11:
;QAcessBIOPIN.c,72 :: 		else{p=0;goto volta;}
	CLRF       _P+0
	CLRF       _P+1
	GOTO       ___main_volta
;QAcessBIOPIN.c,73 :: 		}
L_main9:
;QAcessBIOPIN.c,74 :: 		else{p=0;goto volta;}
	CLRF       _P+0
	CLRF       _P+1
	GOTO       ___main_volta
;QAcessBIOPIN.c,76 :: 		}
L_main2:
;QAcessBIOPIN.c,77 :: 		goto aberta;
	GOTO       ___main_aberta
;QAcessBIOPIN.c,78 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
