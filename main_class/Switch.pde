/* RunStopSwitch.pde
Contributers:
    Jasque Saydyk
	
Purpose: Controls run stop switch on hardware
*/
#include <Switch.h>

Switch::Switch(int S1)
    :SW1(S1)
    {
    }

void Switch::init_var(){
    pinMode(SW1, INPUT);
}

bool Switch::on_off(){
    return digitalRead(SW1);
}
