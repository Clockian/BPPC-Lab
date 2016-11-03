/* BeerState.h
Contributers:
    Jasque Saydyk
	
Purpose: Controls the beer states
*/
#ifndef BEERSTATE_H
#define BEERSTATE_H

#include <Switch.h>
#include <Oled.h>

class BeerState{
    private:
        int state;
        
        Switch SW1_system;
        Switch SW3_temperature;
        Switch SW4_level;
        
        int LD5_pump;
        int LD6_valve;
        int LD7_heater;
        int LD8_chiller;
        
        Oled oled;
        
    public:
        BeerState(Switch SW1, Switch SW3, Switch SW4, int LD5, int LD6, int LD7, int LD8);
        void init_var();
        void show_status();
        void light_leds(bool LD1, bool LD2, bool LD3, bool LD4);
        void bppc_states();
};
#endif
