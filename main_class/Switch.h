/* RunStopSwitch.h
Contributers:
    Jasque Saydyk
	
Purpose: Run Switch to stop and run hardware
*/
#ifndef SWITCH_H
#define SWITCH_H

class Switch{
	private:
		int SW1;
	public:
		Switch(int S1);
		void init_var();
		bool on_off();
};
#endif
