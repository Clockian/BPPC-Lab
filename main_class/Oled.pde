/* Oled.pde
Contributers:
    Jasque Saydyk
	
Purpose: Controls the Oled
*/
#include <IOShieldOled.h>
#include <Oled.h>

void Oled::init_var(){
    IOShieldOled.begin();
    IOShieldOled.displayOn();
    IOShieldOled.clearBuffer();
}

void Oled::wipe(){
    IOShieldOled.clearBuffer();
}

void Oled::update(){
    IOShieldOled.updateDisplay();
}

void Oled::print_string(char data[], int row){
    IOShieldOled.setCursor(0, row);
    IOShieldOled.putString(data);
}
