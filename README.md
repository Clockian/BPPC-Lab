Beer-Pasteurization-Process-Control Lab  
11-02-16  
Jasque Saydyk  
  
Objective:   
=========  
Provide Starting Template for Simple State Machine  
  
Functional Description:  
======================  
1. Read switch input  
2. Display state on Oled  
3. Vending Machine logics   
  
Inputs:  
------  
SW1: Start/~Stop  
SW3: Temperature  
SW4: Level Sensor  
  
Outputs:  
--------  
LD5: Pump  
LD6: Inlet Valve  
LD7: Heater  
LD8: Chiller  
  
State Assignments:   
------------------  
state = 0 (Output) :Outputs: P=0, V=0, H=0, C=0 :Transition: SW1=1  
state = 1 (Filling) :Outputs: P=0, V=1, H=0, C=0 :Transition: SW4=1  
state = 2 (Heating) :Outputs: P=0, V=0, H=1, C=0 :Transition: SW3=1  
state = 3 (Soaking) :Outputs: P=0, V=0, H=0, C=0 :Transition: delay(7 seconds)  
state = 4 (Chilling) :Outputs: P=0, V=0, H=0, C=1 :Transition: SW3=0  
state = 5 (Pumping) :Outputs: P=1, V=0, H=0, C=0 :Transition: SW4=0  
