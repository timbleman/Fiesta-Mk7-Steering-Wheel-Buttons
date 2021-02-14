/************************************************************************
This code adds functionality to the steering wheel buttons of a mk7 Ford 
Fiesta with the audio package 1. With the correspondent hardware songs 
can be skipped and paused via the aux cord. Long pressing the prev button
launches the google assistant on android phones. 
Wiring diagrams and a PCB-design are in the repository.
A sleep mode may be added, but isn't necessary depending on the power
source and due to the low energy consumption of the ATtiny45.
Settings may need to be tweaked.

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

//define relay values
//duration of relay short press
#define SHORTPRESS 100
//duration of relay long press
#define LONGPRESS 1000
//duration between relay on
#define PAUSETIME 100

//define number of reads needed for registering a press
#define PRESSTIMES 50
#define LONGPRESSTIMES 700

//define typical values for each state
#define AVGVOLDOWN 82
#define AVGVOLUP 157
#define AVGSKIP 258
#define AVGPREV 393
#define AVGMENUE 562
#define AVGIDLE 766
//margin up and down to counter noise, tune for best results
//can be a lot smaller than 15, however values are far apart, so it doesn't matter
#define ERRORMARGIN 15


//protoype functions 
int ADCsingleREAD(uint8_t adctouse);
void pressRelayNtimes(uint8_t n);
void longPressRelay();

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


int main(void){  
    int16_t ADCvalue;
    struct pressCount Presses = {0};

    //initialize PB4 for relay output
    DDRB |= (1 << PB4);

    while (1){
      //read output of the steering wheel buttons
      ADCvalue = ADCsingleREAD(3);
      
      //check current state, increment button press times
      switch(ADCvalue){
  
        case 0 ... ERRORMARGIN:          //0 --> radio is turned off, could trigger stand by
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
                                  // Start long press while still holding the button
                                  if (Presses.prevs >= LONGPRESSTIMES)
                                    longPressRelay();
                                  break;
                                  
        case (AVGMENUE-ERRORMARGIN) ... (AVGMENUE+ERRORMARGIN)://menue/m-button
                                  Presses.menues++;
                                  break;
                                  
        case (AVGIDLE-ERRORMARGIN) ... (AVGIDLE+ERRORMARGIN): //idle, check if a button has been pushed
  
                                  //check if buttons have been pressed
                                  if (Presses.menues > PRESSTIMES)
                                    pressRelayNtimes(1); 
                                  
                                  if (Presses.skips > PRESSTIMES)
                                    pressRelayNtimes(2);
  
                                  //check if prev button is pressed long or short
                                  if (Presses.prevs > PRESSTIMES && Presses.prevs < LONGPRESSTIMES)
                                    pressRelayNtimes(3);  
                                  
                                  //reset button counts
                                  if (Presses.menues > 0 || Presses.skips > 0 || Presses.prevs > 0)
                                    memset(&Presses, 0, sizeof(Presses));
                                  
                                  break;
        default: 
                                  break;
      }
  
      //delay 1ms, to check only in discrete intervals
      _delay_ms(1);
    }
}


// activates relay n times --> 1: play/pause; 2: next song; 3; previous song
void pressRelayNtimes(uint8_t n){
  for (int i = 0; i < n; i++){
    PORTB |= (1<<PB4);
    _delay_ms(SHORTPRESS);
    PORTB &= ~(1<<PB4);
    _delay_ms(PAUSETIME);
  }
};


// activates relay long --> starts google assistant
void longPressRelay(){
   PORTB |= (1<<PB4);
   _delay_ms(LONGPRESS);
   PORTB &= ~(1<<PB4);
}


// read analog value from adc pin
int16_t ADCsingleREAD(uint8_t adctouse){
    int16_t ADCval;

    // use selected analog in pin
    ADMUX = adctouse;  
    //if REFS2, REFS1 and REFS0 are 0, Vcc is Reference, works best and doesnt limit programming 
    // use AREF as reference, must be connected to Vcc    
    //ADMUX &= ~((1 << REFS1) | (1 << REFS0));
    //clear for 10 bit resolution
    ADMUX &= ~(1 << ADLAR);

    // 8 prescale for 1Mhz (4 and 16 would work good too)
    ADCSRA |= (1 << ADPS1) | (1 << ADPS0);
    ADCSRA &= ~(1 << ADPS2);
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
