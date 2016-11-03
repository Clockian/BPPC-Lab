// Beer-Pasteurization-Process-Control Lab
// 11-02-16
// Jasque Saydyk

// Functional Description:
// ======================
// 1. Read switch input
// 2. Display state on Oled
// 3. Vending Machine logics:

// State Assignments:
// ------------------
//        state = 0 (Output) :Outputs: P=0, V=0, H=0, C=0 :Transition: SW1=1
//        state = 1 (Filling) :Outputs: P=0, V=1, H=0, C=0 :Transition: SW4=1
//        state = 2 (Heating) :Outputs: P=0, V=0, H=1, C=0 :Transition: SW3=1
//        state = 3 (Soaking) :Outputs: P=0, V=0, H=0, C=0 :Transition: delay(7 seconds)
//        state = 4 (Chilling) :Outputs: P=0, V=0, H=0, C=1 :Transition: SW3=0
//        state = 5 (Pumping) :Outputs: P=1, V=0, H=0, C=0 :Transition: SW4=0

#include <IOShieldOled.h>
#include <BeerState.h>
#include <Switch.h>

Switch SW1(2);
Switch SW3(8);
Switch SW4(79);

BeerState beer(SW1, SW3, SW4, 74, 75, 76, 77);

void setup() {
    beer.init_var();
}

void loop() {
    beer.bppc_states();
}
