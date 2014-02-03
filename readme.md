amx-device-library
===============


Files
-----
+ amx-controlports-control.axi
+ amx-device-control.axi


Overview
--------
The **amx-device-library** NetLinx library is intended as a tool to make things easier for anyone tasked with programming an AMX system. The library provides generic functions for controlling AMX (not 3rd party) devices and allows you to do away with the on, off, pulse, send_string, and send_command keywords and syntax.

The built-in constants and control functions assist you by simplifying control and configuration of control ports.

Everything is a function!

Consistent, descriptive control function names within **amx-device-control** replace the typical NetLinx keywords and syntax for channel/level control and sending strings/commands to AMX or 3rd party devices.

E.g:

	/*
	 * --------------------
	 * Function: channelOn
	 *
	 * Parameters:	dev device - device
	 * 				integer chan - channel code
	 * 
	 * Description: Turn a channel on.
	 * --------------------
	 */
	define_function channelOn (dev device, integer chan)
	{
		on [device, chan]
	}

E.g:

	/*
	 * --------------------
	 * Function: sendCommand
	 *
	 * Parameters:	dev device - device
	 *				char cmd[] - command
	 * 
	 * Description: Send a command to an AMX device.
	 * --------------------
	 */
	define_function sendCommand (dev device, char cmd[])
	{
		send_command device, cmd
	}

Consistent, descriptive control function names within **amx-controlports-control** make it easy for you to control the common control ports (serial, relay, IR, IO) found on many different AMX devices.

E.g:

	/*
	 * --------------------
	 * Function: amxRelayOn
	 *
	 * Parameters:	dev relays - bank of relays
	 *				integer relayChannel - relay channel code
	 * 
	 * Description: Turn Relay on.
	 * --------------------
	 */
	define_function amxRelayOn (dev relays, integer relayChannel)
	{
		channelOn (relays, relayChannel)
	}

E.g:

	/*
	 * --------------------
	 * Function: amxSerialSetBaud
	 *
	 * Parameters:	dev serialPort - serial port
	 *				char baudRate[] - baud rate
	 *				char parity[] - parity
	 *				char dataBits[] - data bits
	 *				char stopBits[] - stop bits
	 *				char status485[] - RS485 status
	 * 
	 * Description: Configure the baud rate info of a serial port.
	 * --------------------
	 */
	define_function amxSerialSetBaud (dev serialPort, char baudRate[], char parity[], char dataBits[], char stopBits[], char status485[])
	{
		if (status485 == AMX_SERIAL_485_IGNORE)
			sendCommand (serialPort, "'SET BAUD ',baudRate,',',parity,',',dataBits,',',stopBits")
		else
			sendCommand (serialPort, "'SET BAUD ',baudRate,',',parity,',',dataBits,',',stopBits,' ',status485")
	}

No longer are you required to refer to the device manual to work out what command headers are required or how to build a control string containing all the required values to configure a control port. This process was time consuming and often involved converting numeric data to string form and building string expressions which were long and complex.

With the control functions defined within **amx-controlports-control** values for commands are simply passed through as arguments in the appropriate data types (constants defined within **amx-device-api** can be used where required) and the control functions do the hard work.

Functions also assist to neaten up the programming and provide added readability to the code and the auto-prompter within the NetLinx Studio editor makes it easy to find the function you're looking for.

Extremely flexible!

All control functions have a DEV parameter. This makes **amx-device-library** extremely flexible as you can use the same control functions for different control ports on an AMX device or even multiple AMX devices. For the control functions you simply pass through the dev for the control port you want to control.

amx-device-control
---------------
#####Dependencies:
+ none

#####Description: 
Contains functions for controlling the various components of an AMX device (e.g., channels, levels, strings, commands).

#####Usage:
Include **amx-device-control** into the main program using the `#include` compiler directive. E.g:

	#include 'amx-device-control'

and call the function(s) defined within **amx-device-control** from the main program file,. E.g:

	button_event [dvTp,btnDisplayMonitorOff]
	{
		push:
		{
			sendCommand (vdvDisplay, 'POWER-0')
		}
	}

	define_program
	
	// feedback statement
	channelSet (dvTp, btnMute, muteStatus)


amx-controlports-control
----------------
#####Dependencies:
+ amx-device-control

#####Description:
Contains functions for configuring the various control components of an AMX device (e.g., serial ports, relays, IR ports, IO ports).

#####Usage:
Include **amx-controlports-control** into the main program using the `#include` compiler directive. E.g:

	#include 'amx-controlports-control'

and call the function(s) defined within **amx-controlports-control** from the main program file,. E.g:

	data_event [dvProjector]
	{
		amxSerialSetBaud (dvProjector, AMX_SERIAL_BAUD_RATE_9600, AMX_SERIAL_BAUD_PARITY_NONE, AMX_SERIAL_STOP_BITS_1, AMX_SERIAL_485_DISABLE)
		amxSerialDisableHardwareHandshaking (dvProjector)
		amxSerialDisableSoftwareHandshaking (dvProjector)
		amxSerialEnableRx (dvProjector)
	}

---------------------------------------------------------------

Author: David Vine - AMX Australia  
Readme formatted with markdown  
Any questions, email <support@amxaustralia.com.au> or phone +61 (7) 5531 3103.
