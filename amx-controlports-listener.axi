program_name='amx-controlports-listener'

#if_not_defined __AMX_CONTROLPORTS_LISTENER__
#define __AMX_CONTROLPORTS_LISTENER__


/*
 * --------------------
 * amx-controlports-listener
 *
 * For usage, check out the readme for the amx-controlports-library.
 * --------------------
 */

define_constant

char VERSION_AMX_CONTROLPORTS_LISTENER[] = 'v1.0.0'

include 'amx-device-control'
include 'amx-controlports-api'

/*
 * --------------------
 * Device arrays
 *
 * Any components that are to be monitored should have the appropriate
 * device array copied into the main program DEFINE_VARIABLE section and the 
 * associated #DEFINE compiler directives should be copied to the top of the 
 * main program, above the line of code that this include file is included 
 * into the main program.
 * --------------------
 */

define_variable

// Serial ports
#DEFINE INCLUDE_SERIAL_PORTS_MONITOR
dev dvSerialPorts[] = { 5001:1:0, 5001:2:0, 5001:3:0 }

// Relay ports
#DEFINE INCLUDE_RELAY_PORTS_MONITOR
dev dvRelayPorts[] = { 5001:4:0 }

// IR ports
#DEFINE INCLUDE_IR_PORTS_MONITOR
dev dvIrPorts[] = { 5001:5:0, 5001:6:0, 5001:7:0, 5001:8:0 }

// IO ports
#DEFINE INCLUDE_IO_PORTS_MONITOR
dev dvIoPorts[] = { 5001:9:0 }


/*
 * --------------------
 * Callback functions
 * --------------------
 */


/*
 * --------------------
 * Serial port callback functions
 * --------------------
 */


/*
#define INCLUDE_CONTROLPORTS_NOTIFY_SERIAL_STRING_RECEIVED_CALLBACK
define_function amxControlPortNotifySerialStringReceived (dev serialPort, char strReceived[])
{
	// serialPort is the serial port.
	// strReceived is the string received.
}
*/

/*
#define INCLUDE_CONTROLPORTS_NOTIFY_SERIAL_BAUD_CALLBACK
define_function amxControlPortNotifySerialBaud (dev serialPort, char baudRate[], char parity[], char dataBits[], char stopBits[], char status485[])
{
	// serialPort is the serial port
	// baudrate is the baud rate (SERIAL_BAUD_RATE_115200 | SERIAL_BAUD_RATE_76800 | SERIAL_BAUD_RATE_57600 | SERIAL_BAUD_RATE_38400 | SERIAL_BAUD_RATE_19200 | SERIAL_BAUD_RATE_9600 | SERIAL_BAUD_RATE_4800 | SERIAL_BAUD_RATE_2400 | SERIAL_BAUD_RATE_1200 | SERIAL_BAUD_RATE_600 | SERIAL_BAUD_RATE_300 | SERIAL_BAUD_RATE_150)
	// parity is the parity (SERIAL_BAUD_PARITY_NONE | SERIAL_BAUD_PARITY_ODD | SERIAL_BAUD_PARITY_EVEN | SERIAL_BAUD_PARITY_MARK | SERIAL_BAUD_PARITY_SPACE)
	// dataBits is the number of data bits (SERIAL_DATA_BITS_8 | SERIAL_DATA_BITS_9)
	// stopBits is the number of stop bits (SERIAL_STOP_BITS_1 | SERIAL_STOP_BITS_2)
	// status485 is the RS285 status (SERIAL_485_ENABLED | SERIAL_485_DISABLED)
}
*/

/*
#define INCLUDE_CONTROLPORTS_NOTIFY_SERIAL_CTS_ON_CALLBACK
define_function amxControlPortNotifySerialCtsOn (dev serialPort)
{
	// serialPort is the serial port.
}
*/

/*
#define INCLUDE_CONTROLPORTS_NOTIFY_SERIAL_CTS_OFF_CALLBACK
define_function amxControlPortNotifySerialCtsOff (dev serialPort)
{
	// serialPort is the serial port.
}
*/


/*
 * --------------------
 * Relay port callback functions
 * --------------------
 */

/*
#define INCLUDE_CONTROLPORTS_NOTIFY_RELAY_ON_CALLBACK
define_function amxControlPortNotifyRelayOn (dev relayPort, integer relChanCde)
{
	// relayPort is the relay port.
	// relChanCde is the relay channel code.
}
*/

/*
#define INCLUDE_CONTROLPORTS_NOTIFY_RELAY_OFF_CALLBACK
define_function amxControlPortNotifyRelayOff (dev relayPort, integer relChanCde)
{
	// relayPort is the relay port.
	// relChanCde is the relay channel code.
}
*/


/*
 * --------------------
 * IR port callback functions
 * --------------------
 */


/*
#define INCLUDE_CONTROLPORTS_NOTIFY_IR_BAUD_CALLBACK
define_function amxControlPortNotifyIrBaud (dev irPort, char baudRate[], char parity[], char dataBits[], char stopBits[])
{
	// irPort is the ir port
	// baudrate is the baud rate (IR_BAUD_RATE_19200 | IR_BAUD_RATE_9600 | IR_BAUD_RATE_4800 | IR_BAUD_RATE_2400 | IR_BAUD_RATE_1200)
	// parity is the parity (IR_PARITY_NONE | IR_PARITY_ODD | IR_PARITY_EVEN | IR_PARITY_MARK | IR_PARITY_SPACE)
	// dataBits is the number of data bits (IR_DATA_BITS_7 | IR_DATA_BITS_8)
	// stopBits is the number of stop bits (IR_STOP_BITS_1 | IR_STOP_BITS_2)
}
*/

/*
#define INCLUDE_CONTROLPORTS_NOTIFY_IR_OUTPUT_ON_CALLBACK
define_function amxControlPortNotifyIrOutputOn (dev irPort, integer irChanCde)
{
	// irPort is the IR port.
	// irChanCde is the IR channel code.
}
*/

/*
#define INCLUDE_CONTROLPORTS_NOTIFY_IR_OUTPUT_OFF_CALLBACK
define_function amxControlPortNotifyIrOutputOff (dev irPort, integer irChanCde)
{
	// irPort is the IR port.
	// irChanCde is the IR channel code.
}
*/

/*
#define INCLUDE_CONTROLPORTS_NOTIFY_IR_MODE_CALLBACK
define_function amxControlPortNotifyIrMode (dev irPort, char mode[])
{
	// irPort is the IR port.
	// mode is the IR mode (IR_MODE_IR | IR_MODE_SERIAL | IR_MODE_DATA).
}
*/

/*
#define INCLUDE_CONTROLPORTS_NOTIFY_IR_CARRIER_STATUS_CALLBACK
define_function amxControlPortNotifyIrCarrierStatus (dev irPort, char status[])
{
	// irPort is the IR port.
	// status is the IR carrier status (IR_CARRIER_ENABLED | IR_CARRIER_DISABLED).
}
*/

/*
#define INCLUDE_CONTROLPORTS_NOTIFY_IR_IO_LINK_CALLBACK
define_function amxControlPortNotifyIrIoLink (dev irPort, integer ioChannel)
{
	// irPort is the IR port.
	// ioChannel is the Io channel code that the IR port is linked to (zero (0) means not linked).
}
*/



/*
 * --------------------
 * IO port callback functions
 * --------------------
 */
 
 /*
#define INCLUDE_CONTROLPORTS_NOTIFY_IO_ACTIVE_STATE_CALLBACK
define_function amxControlPortNotifyIoActiveState (dev ioPort, integer ioChanCde, char activeState[])
{
	// ioPort is the IO port.
	// ioChanCde is the IO channel code.
	// activeState is the state at which the IO (acting as an input port) is considered active (IO_ACTIVE_STATE_LOW | IO_ACTIVE_STATE_HIGH)
}
*/

/*
#define INCLUDE_CONTROLPORTS_NOTIFY_IO_OUTPUT_ON_CALLBACK
define_function amxControlPortNotifyIoOutputOn (dev ioPort, integer ioChanCde)
{
	// ioPort is the IO port.
	// ioChanCde is the IO channel code.
}
*/

/*
#define INCLUDE_CONTROLPORTS_NOTIFY_IO_OUTPUT_OFF_CALLBACK
define_function amxControlPortNotifyIoOutputOff (dev ioPort, integer ioChanCde)
{
	// ioPort is the IO port.
	// ioChanCde is the IO channel code.
}
*/

/*
#define INCLUDE_CONTROLPORTS_NOTIFY_IO_INPUT_ON_CALLBACK
define_function amxControlPortNotifyIoInputOn (dev ioPort, integer ioChanCde)
{
	// ioPort is the IO port.
	// ioChanCde is the IO channel code.
}
*/

/*
#define INCLUDE_CONTROLPORTS_NOTIFY_IO_INPUT_OFF_CALLBACK
define_function amxControlPortNotifyIoInputOff (dev ioPort, integer ioChanCde)
{
	// ioPort is the IO port.
	// ioChanCde is the IO channel code.
}
*/


/*
 * --------------------
 * Events to capture responses from the control ports or update notifications
 * --------------------
 */

define_event


/*
 * --------------------
 * Serial port events
 * --------------------
 */

#if_defined INCLUDE_SERIAL_PORTS_MONITOR
data_event [dvSerialPorts]
{
	string:
	{
		
		if (find_string(data.text,"SERIAL_COMMAND_BAUD_REQUEST",1) == 1)
		{
			#if_defined INCLUDE_CONTROLPORTS_NOTIFY_SERIAL_BAUD_CALLBACK
			stack_var integer portNumber
			stack_var char baudRate[10]
			stack_var char parity[1]
			stack_var char dataBits[1]
			stack_var char stopBits[1]
			stack_var char status485[10]
			
			// Example incoming string: 'PORT 1,9600,N,8,1 485 DISABLED'
			
			remove_string (data.text,"SERIAL_COMMAND_BAUD_REQUEST",1)
			portNumber = atoi (data.text)    // ignore this
			
			remove_string (data.text, "','",1)
			baudRate = remove_string (data.text, "','",1)
			baudRate = left_string (baudRate, length_string(baudRate)-1)
			
			parity = remove_string (data.text, "','",1)
			parity = left_string (parity, length_string(parity)-1)
			
			dataBits = remove_string (data.text, "','",1)
			dataBits = left_string (dataBits, length_string(dataBits)-1)
			
			stopBits = itoa (atoi(remove_string (data.text, "' '",1)))
			stopBits = left_string (stopBits, length_string(stopBits)-1)
			
			status485 = data.text
			
			amxControlPortNotifySerialBaud (data.device, baudRate, parity, dataBits, stopBits, status485)
			#end_if
		}
		else
		{
			#if_defined INCLUDE_CONTROLPORTS_NOTIFY_SERIAL_STRING_RECEIVED_CALLBACK
			amxControlPortNotifySerialStringReceived (data.device, data.text)
			#end_if
		}
	}
}
#end_if

#if_defined INCLUDE_SERIAL_PORTS_MONITOR
channel_event [dvSerialPorts,SERIAL_PORT_CTS_CHANNEL]
{
	on:
	{
		#if_defined INCLUDE_CONTROLPORTS_NOTIFY_SERIAL_CTS_ON_CALLBACK
		amxControlPortNotifySerialCtsOn (channel.device)
		#end_if
	}
	off:
	{
		#if_defined INCLUDE_CONTROLPORTS_NOTIFY_SERIAL_CTS_OFF_CALLBACK
		amxControlPortNotifySerialCtsOff (channel.device)
		#end_if
	}
}
#end_if


/*
 * --------------------
 * Relay port events
 * --------------------
 */

#if_defined INCLUDE_RELAY_PORTS_MONITOR
channel_event [dvRelayPorts,CHANNEL_CODE_WILDCARD]
{
	on:
	{
		#if_defined INCLUDE_CONTROLPORTS_NOTIFY_RELAY_ON_CALLBACK
		amxControlPortNotifyRelayOn (channel.device, channel.channel)
		#end_if
	}
	off:
	{
		#if_defined INCLUDE_CONTROLPORTS_NOTIFY_RELAY_OFF_CALLBACK
		amxControlPortNotifyRelayOff (channel.device, channel.channel)
		#end_if
	}
}
#end_if


/*
 * --------------------
 * IR port events
 * --------------------
 */

#if_defined INCLUDE_IR_PORTS_MONITOR
data_event [dvIrPorts]
{
	string:
	{
		if (find_string(data.text,"IR_COMMAND_BAUD_OR_MODE_CARRIER_AND_IO_LINK_RESPONSE",1) == 1)
		{
			// may have received a baud rate response or possibly the data mode, carrier, and IO link settings
			// 'PORT 9,9600,N,8,1'
			// 'PORT 9 IR,CARRIER,IO LINK 0'
			// 'PORT 9 IR,NO CARRIER,IO LINK 0'
			// 'PORT 9 DATA,CARRIER,IO LINK 0'
			// 'PORT 9 DATA,NO CARRIER,IO LINK 0'
			// 'PORT 9 SERIAL,CARRIER,IO LINK 0'
			// 'PORT 9 SERIAL,NO CARRIER,IO LINK 0'
			
			stack_var integer portNumber
						
			remove_string (data.text,"IR_COMMAND_BAUD_OR_MODE_CARRIER_AND_IO_LINK_RESPONSE",1)
			// 'PORT 9,9600,N,8,1'    -->    '9,9600,N,8,1'
			//      or
			// 'PORT 9 IR,CARRIER,IO LINK 0'    -->    '9 IR,CARRIER,IO LINK 0'
			portNumber = atoi (data.text)
			
			if (left_string(data.text, find_string(data.text,"','",1)) == "itoa(portNumber),','") // baud rate info
			{
				// '9,9600,N,8,1'
				stack_var char baudRate[10]
				stack_var char parity[1]
				stack_var char dataBits[1]
				stack_var char stopBits[1]
				
				remove_string (data.text, "','",1)
				
				baudRate = remove_string (data.text, "','",1)
				baudRate = left_string (baudRate, length_string(baudRate)-1)
				
				parity = remove_string (data.text, "','",1)
				parity = left_string (parity, length_string(parity)-1)
				
				dataBits = remove_string (data.text, "','",1)
				dataBits = left_string (dataBits, length_string(dataBits)-1)
				
				stopBits = data.text
				
				#if_defined INCLUDE_CONTROLPORTS_NOTIFY_IR_BAUD_CALLBACK
				amxControlPortNotifyIrBaud (data.device, baudRate, parity, dataBits, stopBits)
				#end_if
			}
			else // data, carrier, and io link info
			{
				// '9 IR,CARRIER,IO LINK 0'
				stack_var char mode[10]
				stack_var char carrierStatus[15]
				stack_var integer ioLinkChannel
				
				remove_string (data.text, "' '",1)
				
				mode = remove_string (data.text, "','",1)
				mode = left_string (mode, length_string(mode)-1)
				
				#if_defined INCLUDE_CONTROLPORTS_NOTIFY_IR_MODE_CALLBACK
				amxControlPortNotifyIrMode (data.device, mode)
				#end_if
				
				carrierStatus = remove_string (data.text, "','",1)
				carrierStatus = left_string (carrierStatus, length_string(carrierStatus)-1)
				
				#if_defined INCLUDE_CONTROLPORTS_NOTIFY_IR_CARRIER_STATUS_CALLBACK
				amxControlPortNotifyIrCarrierStatus (data.device, carrierStatus)
				#end_if
				
				remove_string (data.text, "'IO LINK '",1)
				ioLinkChannel = atoi(data.text)
				
				#if_defined INCLUDE_CONTROLPORTS_NOTIFY_IR_IO_LINK_CALLBACK
				amxControlPortNotifyIrIoLink (data.device, ioLinkChannel)
				#end_if
			}
		}
	}
}
#end_if

#if_defined INCLUDE_IR_PORTS_MONITOR
channel_event [dvIrPorts,CHANNEL_CODE_WILDCARD]
{
	on:
	{
		#if_defined INCLUDE_CONTROLPORTS_NOTIFY_IR_OUTPUT_ON_CALLBACK
		amxControlPortNotifyIrOutputOn (channel.device, channel.channel)
		#end_if
	}
	off:
	{
		#if_defined INCLUDE_CONTROLPORTS_NOTIFY_IR_OUTPUT_OFF_CALLBACK
		amxControlPortNotifyIrOutputOff (channel.device, channel.channel)
		#end_if
	}
}
#end_if


/*
 * --------------------
 * IO port events
 * --------------------
 */

#if_defined INCLUDE_IO_PORTS_MONITOR
data_event [dvIoPorts]
{
	string:
	{
		if (find_string(data.text,"IO_COMMAND_INPUT_STATE_RESPONSE",1) == 1)
		{
			#if_defined INCLUDE_CONTROLPORTS_NOTIFY_IO_ACTIVE_STATE_CALLBACK
			
			stack_var integer ioChannelCode
			
			remove_string (data.text, "IO_COMMAND_INPUT_STATE_RESPONSE", 1)
			
			ioChannelCode = atoi (data.text)
			
			remove_string (data.text, "' '",1)
			
			amxControlPortNotifyIoActiveState (data.device,  ioChannelCode, data.text)
			#end_if
		}
	}
}
#end_if

#if_defined INCLUDE_IO_PORTS_MONITOR
button_event [dvIoPorts,CHANNEL_CODE_WILDCARD]
{
	push:
	{
		#if_defined INCLUDE_CONTROLPORTS_NOTIFY_IO_INPUT_ON_CALLBACK
		amxControlPortNotifyIoInputOn (button.input.device, button.input.channel)
		#end_if
	}
	release:
	{
		#if_defined INCLUDE_CONTROLPORTS_NOTIFY_IO_INPUT_OFF_CALLBACK
		amxControlPortNotifyIoInputOff (button.input.device, button.input.channel)
		#end_if
	}
}
#end_if

#if_defined INCLUDE_IO_PORTS_MONITOR
channel_event [dvIoPorts,CHANNEL_CODE_WILDCARD]
{
	on:
	{
		#if_defined INCLUDE_CONTROLPORTS_NOTIFY_IO_OUTPUT_ON_CALLBACK
		amxControlPortNotifyIoOutputOn (channel.device, channel.channel)
		#end_if
	}
	off:
	{
		#if_defined INCLUDE_CONTROLPORTS_NOTIFY_IO_OUTPUT_OFF_CALLBACK
		amxControlPortNotifyIoOutputOff (channel.device, channel.channel)
		#end_if
	}
}
#end_if

#end_if