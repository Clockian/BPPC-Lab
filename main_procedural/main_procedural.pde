// Beer-Pasteurization-Process-Control Lab
// 11-02-16
// Jasque Saydyk

// Objective: 
// =========
// Provide Starting Template for Simple State Machine

// Functional Description:
// ======================
// 1. Read switch input

// 2. Display state on Oled

// 3. Vending Machine logics:

// Inputs:
// ------
//    SW1: Start/~Stop
//    SW3: Temperature
//    SW4: Level Sensor

// Outputs:
// --------
//    LD5: Pump
//    LD6: Inlet Valve
//    LD7: Heater
//    LD8: Chiller

// State Assignments:
// ------------------
//        state = 0 (Output) :Outputs: P=0, V=0, H=0, C=0 :Transition: SW1=1
//        state = 1 (Filling) :Outputs: P=0, V=1, H=0, C=0 :Transition: SW4=1
//        state = 2 (Heating) :Outputs: P=0, V=0, H=1, C=0 :Transition: SW3=1
//        state = 3 (Soaking) :Outputs: P=0, V=0, H=0, C=0 :Transition: delay(7 seconds)
//        state = 4 (Chilling) :Outputs: P=0, V=0, H=0, C=1 :Transition: SW3=0
//        state = 5 (Pumping) :Outputs: P=1, V=0, H=0, C=0 :Transition: SW4=0

#include <IOShieldOled.h>

const int LD5 =  74;
const int LD6 =  75;
const int LD7 =  76;
const int LD8 =  77;

const int SW1 = 2;
const int SW3 = 8;
const int SW4 = 79;

int SW1_state = 0;
int SW3_state = 0;
int SW4_state = 0;

int state = 0;

String displayString;
char displayCharArray[50];

void setup() {
    pinMode(LD5, OUTPUT);
    pinMode(LD6, OUTPUT);
    pinMode(LD7, OUTPUT);
    pinMode(LD8, OUTPUT);
    
    pinMode(SW1, INPUT);
    pinMode(SW3, INPUT);
    pinMode(SW4, INPUT);

    digitalWrite(LD5, LOW);
    digitalWrite(LD6, LOW);
    digitalWrite(LD7, LOW);
    digitalWrite(LD8, LOW);
    
    IOShieldOled.begin();
    IOShieldOled.displayOn();
}

void loop() {
    IOShieldOled.updateDisplay(); 
    IOShieldOled.clearBuffer();
    IOShieldOled.setCursor(0,0);
    IOShieldOled.putString("BPPC-Lab 11-02-16");
    
    IOShieldOled.setCursor(0,1);
    IOShieldOled.putString("==================");
    
    IOShieldOled.setCursor(0,2);
    displayString="State: ";
    displayString += state;
    displayString.toCharArray(displayCharArray,50);
    IOShieldOled.putString(displayCharArray);

    IOShieldOled.updateDisplay(); 
    
    SW1_state = digitalRead(SW1);
    SW3_state = digitalRead(SW3);
    SW4_state = digitalRead(SW4);
    
    switch (state) {
        case 0:
            digitalWrite(LD5, LOW);   //Pump = 0
            digitalWrite(LD6, LOW);   //Valve = 0
            digitalWrite(LD7, LOW);   //Heater = 0
            digitalWrite(LD8, LOW);   //Chiller = 0
        
            if (SW1_state == HIGH) {state = 1;}
            break;

        case 1:
            digitalWrite(LD5, LOW);   //Pump = 0
            digitalWrite(LD6, HIGH);   //Valve = 1
            digitalWrite(LD7, LOW);   //Heater = 0
            digitalWrite(LD8, LOW);   //Chiller = 0
        
            if (SW4_state == HIGH) {state = 2;}
            break;

        case 2:
            digitalWrite(LD5, LOW);   //Pump = 0
            digitalWrite(LD6, LOW);   //Valve = 0
            digitalWrite(LD7, HIGH);   //Heater = 1
            digitalWrite(LD8, LOW);   //Chiller = 0
        
            if (SW3_state == HIGH) {state = 3;}
            break;

        case 3:
            digitalWrite(LD5, LOW);   //Pump = 0
            digitalWrite(LD6, LOW);   //Valve = 0
            digitalWrite(LD7, LOW);   //Heater = 0
            digitalWrite(LD8, LOW);   //Chiller = 0
        
            delay(7000);
            state = 4;
            break;
        
        case 4:
            digitalWrite(LD5, LOW);   //Pump = 0
            digitalWrite(LD6, LOW);   //Valve = 0
            digitalWrite(LD7, LOW);   //Heater = 0
            digitalWrite(LD8, HIGH);   //Chiller = 1
        
            if (SW3_state == LOW) {state = 5;}
            break;
            
        case 5:
            digitalWrite(LD5, HIGH);   //Pump = 1
            digitalWrite(LD6, LOW);   //Valve = 0
            digitalWrite(LD7, LOW);   //Heater = 0
            digitalWrite(LD8, LOW);   //Chiller = 0
        
            if (SW4_state == LOW) {state = 0;}
            break;
    }
}
