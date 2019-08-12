/************************************************************************
<one line to give the program's name and a brief idea of what it does.>
Copyright (C) 2019  Tim Fraunholz

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details. <http://www.gnu.org/licenses/>
*************************************************************************/

#include <avr/io.h>
#include <stdint.h>

#define SERIAL
//#define SERIALVALUES
#define SERIALSWITCH

//define relay values
//duration of relay on
#define HOLDTIME 100
//duration between relay on
#define PAUSETIME 100

//define number of reads needed for registering a press
#define PRESSTIMES 20

//define typical values for each state
#define AVGVOLDOWN 82
#define AVGVOLUP 157
#define AVGSKIP 258
#define AVGPREV 393
#define AVGMENUE 562
#define AVGIDLE 766
//margin up and down to counter noise, tune for best results
#define ERRORMARGIN 5


//protoype functions 
int ADCsingleREAD(uint8_t adctouse);
void pressRelayNtimes(uint8_t n);

//structs
//counts the duration how long a button is pressed
struct pressCount {
  uint16_t zeros;
  uint16_t skips;
  uint16_t prevs;
  uint16_t menues;
  
  //not used
  uint16_t vol_ups;
  uint16_t vol_downs;
};

void setup(){
  Serial.begin(9600);
  }

int main(void){
    #ifdef SERIAL
    
    for (int i = 0; i < 100; i++){
      Serial.println("Serial initialized");
    }
    #endif

    //initialize PB1 for relay output
    DDRB |= (1 << PB1);
  
    int16_t ADCvalue;
    struct pressCount Presses = {0};

    while (1){
            ADCvalue = ADCsingleREAD(0);
            
            #ifdef SERIALVALUES
            Serial.println(ADCvalue);
            #endif



            //check current state
            switch(ADCvalue){

              case 0 ... ERRORMARGIN:          //0 --> radio is turned off, should trigger stand by
                                        Presses.zeros++;
                                        break;

              case (AVGVOLDOWN-ERRORMARGIN) ... (AVGVOLDOWN+ERRORMARGIN)://vol down pressed
                                        Presses.vol_downs++;
                                        break;
 
              case (AVGVOLUP-ERRORMARGIN) ... (AVGVOLUP+ERRORMARGIN)://vol up pressed
                                        Presses.vol_ups++;
                                        break;

              case (AVGSKIP-ERRORMARGIN) ... (AVGSKIP+ERRORMARGIN)://skip
                                        Presses.skips++;
                                        break;

              case (AVGPREV-ERRORMARGIN) ... (AVGPREV+ERRORMARGIN)://previous
                                        Presses.prevs++;
                                        break;
                                        
              case (AVGMENUE-ERRORMARGIN) ... (AVGMENUE+ERRORMARGIN)://menue/m-button
                                        Presses.menues++;
                                        break;
              //case (765):
              case (AVGIDLE-ERRORMARGIN) ... (AVGIDLE+ERRORMARGIN): //idle, check if a button has been pushed
                                        
                                        if (Presses.menues > PRESSTIMES){
                                          pressRelayNtimes(1);
                                          
                                          #ifdef SERIALSWITCH
                                          Serial.println("Menue press detected");
                                          #endif

                                          
                                        }
                                        if (Presses.skips > PRESSTIMES){
                                          pressRelayNtimes(2);
                                          
                                          #ifdef SERIALSWITCH
                                          Serial.println("Skip press detected");
                                          #endif
                                          
                                        }
                                        if (Presses.prevs > PRESSTIMES){
                                          pressRelayNtimes(3);
                                          
                                          #ifdef SERIALSWITCH
                                          Serial.println("Previous press detected");
                                          #endif
                                          
                                        }

                                        memset(&Presses, 0, sizeof(Presses));
                                        
                                        break;
              default: 
                                        
                                        break;
            }
  
            //delay 1ms, to check only in discrete intervals
            _delay_ms(1);
    }
}


void pressRelayNtimes(uint8_t n){
  for (int i = 0; i < n; i++){
    PORTB |= (1<<PB1);
    _delay_ms(HOLDTIME);
    PORTB &= ~(1<<PB1);
    _delay_ms(PAUSETIME);
  }
};


int16_t ADCsingleREAD(uint8_t adctouse){
    int16_t ADCval;

    // use selected analog in pin
    ADMUX = adctouse;   
    // use AVcc as reference      
    ADMUX |= (1 << REFS0);
    // clear for 10 bit resolution
    ADMUX &= ~(1 << ADLAR);

    // 128 prescale for 16Mhz
    ADCSRA |= (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);
    // Enable the ADC
    ADCSRA |= (1 << ADEN);

    // Start the ADC conversion
    ADCSRA |= (1 << ADSC);

    //waiting for the ADC
    while(ADCSRA & (1 << ADSC));

    //save two 8 bit values in 16 bit int
    ADCval = ADCL;
    ADCval = (ADCH << 8) + ADCval;

    return ADCval;
}
