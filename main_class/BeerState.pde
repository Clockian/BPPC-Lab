/* BeerState.pde
Contributers:
    Jasque Saydyk
	
Purpose: Controls the beer states
*/
#include <BeerState.h>
#include <Switch.h>
#include <Oled.h>

BeerState::BeerState(Switch SW1, Switch SW3, Switch SW4, int LD5, int LD6, int LD7, int LD8)
    :SW1_system(SW1), SW3_temperature(SW3), SW4_level(SW4), LD5_pump(LD5), LD6_valve(LD6), LD7_heater(LD7), LD8_chiller(LD8)
    {
    }

void BeerState::init_var(){
    state = 0;
    
    oled.init_var();
        
    SW1_system.init_var();
    SW3_temperature.init_var();
    SW4_level.init_var();
        
    pinMode(LD5_pump, OUTPUT);
    pinMode(LD6_valve, OUTPUT);
    pinMode(LD7_heater, OUTPUT);
    pinMode(LD8_chiller, OUTPUT);
    
    digitalWrite(LD5_pump, LOW);
    digitalWrite(LD6_valve, LOW);
    digitalWrite(LD7_heater, LOW);
    digitalWrite(LD8_chiller, LOW);
}

void BeerState::show_status(){
    char currentStatusToCharX[50];
    String currentStatusX;
    currentStatusX = "state=";
    currentStatusX += state;
    currentStatusX.toCharArray(currentStatusToCharX, 50);
    oled.print_string(currentStatusToCharX, 2);
}

void BeerState::light_leds(bool LD1, bool LD2, bool LD3, bool LD4){
    if(LD1 == 0){ digitalWrite(LD5_pump, LOW); }
      else { digitalWrite(LD5_pump, HIGH); }
      
    if(LD2 == 0){ digitalWrite(LD6_valve, LOW); }
      else { digitalWrite(LD6_valve, HIGH); }
      
    if(LD3 == 0){ digitalWrite(LD7_heater, LOW); }
      else { digitalWrite(LD7_heater, HIGH); }
      
    if(LD4 == 0){ digitalWrite(LD8_chiller, LOW); }
      else { digitalWrite(LD8_chiller, HIGH); }
}

void BeerState::bppc_states(){
    oled.print_string("BPPC_Lab 11-3-16", 0);
    oled.print_string("================", 1);
    show_status();
    
    switch (state) {
        case 0:
            light_leds(0, 0, 0, 0);
            if(SW1_system.on_off() == 1) {state = 1;}
            break;
            
        case 1:
            light_leds(0, 1, 0, 0);
            if(SW4_level.on_off() == 1) {state = 2;}
            break;
            
        case 2:
            light_leds(0, 0, 1, 0);
            if(SW3_temperature.on_off() == 1) {state = 3;}
            break;
            
        case 3:
            light_leds(0, 0, 0, 0);
            delay(7000);
            state = 4;
            break;
            
        case 4:
            light_leds(0, 0, 0, 1);
            if(SW3_temperature.on_off() == 0) {state = 5;}
            break;
            
        case 5:
            light_leds(1, 0, 0, 0);
            if(SW4_level.on_off() == 0) {state = 0;}
            break;
    }
}
