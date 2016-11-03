/* Oled.h
Contributers:
    Jasque Saydyk
	
Purpose: Controls the Oled
*/
#ifndef OLED_H
#define OLED_H

class Oled{
    private:
        
    public:
        void init_var();
        void wipe();
        void update();
        void print_string(char data[], int row);   
};
#endif
