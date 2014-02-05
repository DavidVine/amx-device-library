amx-device-library
===============


Files
-----
+ amx-device-control.axi
+ amx-controlports-api.axi
+ amx-controlports-control.axi
+ amx-controlports-listener.axi


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



amx-controlports-api
-----------
#####Dependencies:
+ none

#####Description:
Contains constants for AMX Control ports (serial, relays, IR, IO) NetLinx command headers and parameter values. These are used extensively by the accompanying library files **amx-controlports-control** and **amx-controlports-listener**. The constants defined within **amx-controlports-api** can also be referenced when passing values to control functions (where function parameters have a limited allowable set of values for one or more parameters) or checking to see the values of the callback function parameters.

#####Usage:
Include **amx-controlports-api** into the main program using the `#include` compiler directive. E.g:

	#include 'amx-controlports-api'

NOTE: If the main program file includes **amx-controlports-control** and/or **amx-controlports-listener** it is not neccessary to include **amx-controlports-api** in the main program file as well as each of them already includes **amx-controlports-api** but doing so will not cause any issues.


amx-controlports-control
----------------
#####Dependencies:
+ amx-device-control
+ amx-controlports-api

#####Description:
Contains functions for configuring the various control ports of an AMX device (serial, relays, IR, IO).

#####Usage:
Include **amx-controlports-control** into the main program using the `#include` compiler directive. E.g:

	#include 'amx-controlports-control'

and call the function(s) defined within **amx-controlports-control** from the main program file,. E.g:

	data_event [dvProjector]
	{
		online:
		{
			amxSerialSetBaud (dvProjector, AMX_SERIAL_BAUD_RATE_9600, AMX_SERIAL_BAUD_PARITY_NONE, AMX_SERIAL_STOP_BITS_1, AMX_SERIAL_485_DISABLE)
			amxSerialDisableHardwareHandshaking (dvProjector)
			amxSerialDisableSoftwareHandshaking (dvProjector)
			amxSerialEnableRx (dvProjector)
		}
	}


amx-controlports-listener
----------------
#####Dependencies:
+ amx-controlports-api

#####Description:
Contains dev arrays for listening to traffic returned from the AMX control ports (serial, relays, IR, IO).

You should copy the required dev arrays to their main program and instantiate them with dev values corresponding to the control ports you wish to listen to.

Contains commented out callback functions and events required to capture information from the AMX control ports. The events (data_events, channel_events, & level_events) will parse the information returned from the control ports and call the associated callback functions passing the information through as arguments to the call back functions' parameter list.

Callback functions may be triggered from both unprompted data and responses to requests for information.

#####Usage:
Include **amx-controlports-listener** into the main program using the `#include` compiler directive. E.g:

	#include 'amx-controlports-listener'

Copy the required DEV arrays from **amx-controlports-listener**:

	define_variable

	#if_not_defined dvIoPorts
	dev dvIoPorts[] = { 5001:9:0 }
	#end_if

to the main program file and populate the contents of the DEV arrays with only the control ports that you want to listen to. E.g:

	define_device

	dvIoBoardroom = 5001:17:1   // IO's on DVX-3150 in boardroom
	dvIoMeetingRoom = 5001:9:2  // IO's on NI-2100 in meeting room

	define_variable

	// DEV array for IO ports copied from amx-controlports-listener
	dev dvIoPorts[] = {dvIoBoardroom, dvIoMeetingRoom}

NOTE: The order of the devices within the DEV arrays does not matter. You can also have control ports from multiple devices within the same DEV array. You can have as few (1) or as many devices defined within the DEV array as you want to listen to.

Copy whichever callback functions you would like to use to monitor changes on the AMX control port or capture responses to requests for information in your main program file. The callback function should then be uncommented and the contents of the statement block filled in appropriately. The callback functions should not be uncommented within **amx-controlports-listener**. E.g:

Copy an empty, commented out callback function from **amx-controlports-listener** and the associated `#define` statement:

	/*
	#define INCLUDE_CONTROLPORTS_NOTIFY_RELAY_ON_CALLBACK
	define_function amxControlPortNotifyRelayOn (dev relayPort, integer relChanCde)
	{
		// relayPort is the relay port.
		// relChanCde is the relay channel code.
	}
	*/

paste the callback function and `#define` statement into the main program file, uncomment, and add any code statements you want:

	#define INCLUDE_CONTROLPORTS_NOTIFY_RELAY_ON_CALLBACK
	define_function amxControlPortNotifyRelayOn (dev relayPort, integer relChanCde)
	{
		// relayPort is the relay port.
		// relChanCde is the relay channel code.

		if (relChanCde == relProjLeftDown)
		{
			on[dvTp,btnProjLiftDown]    // button feedback to show user position of projector lift
		}
	}

The callback function will be automatically triggered whenever a change occurs on the AMX control port (that initiates an unsolicted feedback response) or a response to a request for information is received.

###IMPORTANT!
1. The `#define` compiler directive found directly above the callback function within **amx-controlports-listener** must also be copied to the main program and uncommented along with the callback function itself.

2. Due to the way the NetLinx compiler scans the program for `#define` staments **amx-controlports-listener** must be included in the main program file underneath any callback functions and associated `#define` statements or the callback functions will not trigger.

E.g:

		#program_name='main program'
		 
		define_device

		dvProjector = 5001:1:0  // Projector connected to 1st serial port on NI-2100
		dvAmplifier = 5001:2:0  //  Projector connected to 2nd serial port on NI-2100
		dvRelays = 5001:4:0     // Relays on NI-2100
		dvIos = 5001:9:0        // IO's on NI-2100 in meeting room
		
		define_variable
		
		// DEV arrays for amx-controlports-listener to use
		dev dvSerialPorts[] = { dvProjector, dvAmplifier }
		dev dvRelayPorts[] = { dvRelays }
		dev dvIoPorts[] = { dvIos }
		
		#define INCLUDE_CONTROLPORTS_NOTIFY_SERIAL_STRING_RECEIVED_CALLBACK
		define_function amxControlPortNotifySerialStringReceived (dev serialPort, char strReceived[])
		{
		}

		#define INCLUDE_CONTROLPORTS_NOTIFY_RELAY_ON_CALLBACK
		define_function amxControlPortNotifyRelayOn (dev relayPort, integer relChanCde)
		{
		}

		#define INCLUDE_CONTROLPORTS_NOTIFY_RELAY_OFF_CALLBACK
		define_function amxControlPortNotifyRelayOff (dev relayPort, integer relChanCde)
		{
		}

		#define INCLUDE_CONTROLPORTS_NOTIFY_IO_INPUT_ON_CALLBACK
		define_function amxControlPortNotifyIoInputOn (dev ioPort, integer ioChanCde)
		{
		}

		#define INCLUDE_CONTROLPORTS_NOTIFY_IO_INPUT_OFF_CALLBACK
		define_function amxControlPortNotifyIoInputOff (dev ioPort, integer ioChanCde)
		{
		}

		#include 'amx-controlports-listener'

---------------------------------------------------------------

Author: David Vine - AMX Australia  
Readme formatted with markdown  
Any questions, email <support@amxaustralia.com.au> or phone +61 (7) 5531 3103.
