program_name='amx-controlports-control'

#if_not_defined __AMX_CONTROLPORTS_CONTROL__
#define __AMX_CONTROLPORTS_CONTROL__


include 'amx-device-control'
include 'amx-controlports-api'



/*
 * --------------------
 * General functions
 * --------------------
 */

/*
 * --------------------
 * Function: amxControllerEnableLeds
 *
 * Parameters:  dev controllerPort1 - port 1 on AMX controller
 * 
 * Description: Turn LEDs on.
 * --------------------
 */
define_function amxControllerEnableLeds (dev controllerPort1)
{
	sendCommand (controllerPort1, "CONTROLLER_COMMAND_ENABLE_LEDS")
}

/*
 * --------------------
 * Function: amxControllerDisableLeds
 *
 * Parameters:  dev controllerPort1 - port 1 on AMX controller
 * 
 * Description: Turn LEDs off.
 * --------------------
 */
define_function amxControllerDisableLeds (dev controllerPort1)
{
	sendCommand (controllerPort1, "CONTROLLER_COMMAND_DISABLE_LEDS")
}



/*
 * --------------------
 * Relay functions
 * --------------------
 */

/*
 * --------------------
 * Function: amxRelayOn
 *
 * Parameters:  dev relays - bank of relays
 *              integer relayChannel - relay channel code
 * 
 * Description: Turn Relay on.
 * --------------------
 */
define_function amxRelayOn (dev relays, integer relayChannel)
{
	channelOn (relays, relayChannel)
}

/*
 * --------------------
 * Function: amxRelayOff
 *
 * Parameters:  dev relays - bank of relays
 *              integer relayChannel - relay channel code
 * 
 * Description: Turn Relay off.
 * --------------------
 */
define_function amxRelayOff (dev relays, integer relayChannel)
{
	channelOff (relays, relayChannel)
}

/*
 * --------------------
 * Function: amxRelayPulse
 *
 * Parameters:  dev relays - bank of relays
 *              integer relayChannel - relay channel code
 * 
 * Description: Pulse a relay.
 * --------------------
 */
define_function amxRelayPulse (dev relays, integer relayChannel)
{
	channelPulse (relays, relayChannel)
}



/*
 * --------------------
 * RS232/422/485 functions
 * --------------------
 */
 
 
define_constant

integer SERIAL_PORT_CTS_CHANNEL = 255

/*
define_function amxSerial....
{
	sendCommand (serialPort, 'B9MOFF')
}

define_function amxSerial....
{
	sendCommand (serialPort, 'B9MON')
}
*/

/*
 * --------------------
 * Function: amxSerialSetBaud
 *
 * Parameters:  dev serialPort - serial port
 *              char baudRate[] - baud rate
 *              char parity[] - parity
 *              char dataBits[] - data bits
 *              char stopBits[] - stop bits
 *              char status485[] - RS485 status
 * 
 * Description: Configure the baud rate info of a serial port.
 * --------------------
 */
define_function amxSerialSetBaud (dev serialPort, char baudRate[], char parity[], char dataBits[], char stopBits[], char status485[])
{
	if (status485 == SERIAL_485_IGNORE)
		sendCommand (serialPort, "SERIAL_COMMAND_BAUD_CONFIGURE,baudRate,',',parity,',',dataBits,',',stopBits")
	else
		sendCommand (serialPort, "SERIAL_COMMAND_BAUD_CONFIGURE,baudRate,',',parity,',',dataBits,',',stopBits,' ',status485")
}

/*
 * --------------------
 * Function: amxSerialSetBaudTemporary
 *
 * Parameters:  dev serialPort - serial port
 *              char baudRate[] - baud rate
 *              char parity[] - parity
 *              char dataBits[] - data bits
 *              char stopBits[] - stop bits
 *              char status485[] - RS485 status
 * 
 * Description: Temporarily configure the baud rate info of a serial port. Settings
 *              will be lost after a reboot of the device.
 * --------------------
 */
define_function amxSerialSetBaudTemporary (dev serialPort, char baudRate[], char parity[], char dataBits[], char stopBits[], char status485[])
{
	if (status485 == SERIAL_485_IGNORE)
		sendCommand (serialPort, "SERIAL_COMMAND_BAUD_CONFIGURE_TEMPORARY,baudRate,',',parity,',',dataBits,',',stopBits")
	else
		sendCommand (serialPort, "SERIAL_COMMAND_BAUD_CONFIGURE_TEMPORARY,baudRate,',',parity,',',dataBits,',',stopBits,' ',status485")
}

/*
 * --------------------
 * Function: amxSerialSetBaudTemporary
 *
 * Parameters:  dev serialPort - serial port
 * 
 * Description: Request the baud rate settings of the serial port.
 * --------------------
 */
define_function amxSerialRequestBaud (dev serialPort)
{
	sendCommand (serialPort, "SERIAL_COMMAND_BAUD_REQUEST")
}

/*
 * --------------------
 * Function: amxSerialDisableHardwareHandshaking
 *
 * Parameters:  dev serialPort - serial port
 * 
 * Description: Disable hardware handshaking on the serial port.
 * --------------------
 */
define_function amxSerialDisableHardwareHandshaking (dev serialPort)
{
	sendCommand (serialPort, "SERIAL_COMMAND_HARDWARE_HANDSHAKING_OFF")
}

/*
 * --------------------
 * Function: amxSerialEnableHardwareHandshaking
 *
 * Parameters:  dev serialPort - serial port
 * 
 * Description: Enable hardware handshaking on the serial port.
 * --------------------
 */
define_function amxSerialEnableHardwareHandshaking (dev serialPort)
{
	sendCommand (serialPort, "SERIAL_COMMAND_HARDWARE_HANDSHAKING_ON")
}

/*
 * --------------------
 * Function: amxSerialDisableSoftwareHandshaking
 *
 * Parameters:  dev serialPort - serial port
 * 
 * Description: Disable software handshaking on the serial port.
 * --------------------
 */
define_function amxSerialDisableSoftwareHandshaking (dev serialPort)
{
	sendCommand (serialPort, "SERIAL_COMMAND_SOFTWARE_HANDSHAKING_OFF")
}

/*
 * --------------------
 * Function: amxSerialEnableSoftwareHandshaking
 *
 * Parameters:  dev serialPort - serial port
 * 
 * Description: Enable software handshaking on the serial port.
 * --------------------
 */
define_function amxSerialEnableSoftwareHandshaking (dev serialPort)
{
	sendCommand (serialPort, "SERIAL_COMMAND_SOFTWARE_HANDSHAKING_ON")
}

/*
 * --------------------
 * Function: amxSerialClearRxBuffer
 *
 * Parameters:  dev serialPort - serial port
 * 
 * Description: Clear the serial ports receive (RX) buffer.
 * --------------------
 */
define_function amxSerialClearRxBuffer (dev serialPort)
{
	sendCommand (serialPort, "SERIAL_COMMAND_CLEAR_RECEIVE_BUFFER")
}

/*
 * --------------------
 * Function: amxSerialClearTxBuffer
 *
 * Parameters:  dev serialPort - serial port
 * 
 * Description: Clear the serial ports transmit (TX) buffer.
 * --------------------
 */
define_function amxSerialClearTxBuffer (dev serialPort)
{
	sendCommand (serialPort, "SERIAL_COMMAND_CLEAR_TRANSMIT_BUFFER")
}

/*
 * --------------------
 * Function: amxSerialEnableRx
 *
 * Parameters:  dev serialPort - serial port
 * 
 * Description: Enable the receive pin - incoming data will be sent to master.
 * --------------------
 */
define_function amxSerialEnableRx (dev serialPort)
{
	sendCommand (serialPort, "SERIAL_COMMAND_RECEIVED_DATA_PROCESS")
}

/*
 * --------------------
 * Function: amxSerialDisableRx
 *
 * Parameters:  dev serialPort - serial port
 * 
 * Description: Disable the receive pin - incoming data will not be sent to master.
 * --------------------
 */
define_function amxSerialDisableRx (dev serialPort)
{
	sendCommand (serialPort, "SERIAL_COMMAND_RECEIVED_DATA_IGNORE")
}

/*
 * --------------------
 * Function: amxSerialSetTxCharDelayTimeInMicroseconds
 *
 * Parameters:  dev serialPort - serial port
 *              integer microseconds - micro seconds (1/100th second)
 * 
 * Description: Set the delay time between transmitted characters from a serial 
 *              port. Time is in micro seconds (1/100ths of a second).
 * --------------------
 */
define_function amxSerialSetTxCharDelayTimeInMicroseconds (dev serialPort, integer microseconds)
{
	sendCommand (serialPort, "SERIAL_COMMAND_TRANSMIT_CHARACTER_DELAY_MICROSECONDS,itoa(microseconds)")
}

/*
 * --------------------
 * Function: amxSerialSetTxCharDelayTimeInMilliseconds
 *
 * Parameters:  dev serialPort - serial port
 *              integer microseconds - milli seconds (1/1000th second)
 * 
 * Description: Set the delay time between transmitted characters from a serial 
 *              port. Time is in milli seconds (1/1000ths of a second).
 * --------------------
 */
define_function amxSerialSetTxCharDelayTimeInMilliseconds (dev serialPort, integer milliseconds)
{
	sendCommand (serialPort, "SERIAL_COMMAND_TRANSMIT_CHARACTER_DELAY_MILLISECONDS,itoa(milliseconds)")
}

/*
 * --------------------
 * Function: amxSerialEnableCtsReporting
 *
 * Parameters:  dev serialPort - serial port
 * 
 * Description: Enable reporting of the Clear-To-Send (CTS) pin.
 * --------------------
 */
define_function amxSerialEnableCtsReporting (dev serialPort)
{
	sendCommand (serialPort, "SERIAL_COMMAND_CTS_REPORTING_ENABLE")
}

/*
 * --------------------
 * Function: amxSerialDisableCtsReporting
 *
 * 
 * Description: Disable reporting of the Clear-To-Send (CTS) pin.
 * --------------------
 */
define_function amxSerialDisableCtsReporting (dev serialPort)
{
	sendCommand (serialPort, "SERIAL_COMMAND_CTS_REPORTING_DISABLE")
}


/*
 * --------------------
 * IR functions
 * --------------------
 */

#warn '@TODO - amx-controlports-control - commenting for IR functions'

define_function amxIrEnableCarrierSignal (dev irPort)
{
	sendCommand (irPort, "IR_COMMAND_CARRIER_ON")
}

define_function amxIrDisableCarrierSignal (dev irPort)
{
	sendCommand (irPort, "IR_COMMAND_CARRIER_OFF")
}

define_function amxIrSendChannelNumber (dev irPort, integer channelNum)
{
	sendCommand (irPort, "IR_COMMAND_CHANNEL_SET_CHANNEL,channelNum")    // note: deliberate lack of itoa converstion - command needs raw data value not ASCII number
}

define_function amxIrClearBufferSendCode (dev irPort, integer irCde)
{
	sendCommand (irPort, "IR_COMMAND_HALT_AND_CLEAR_ALL_ACTIVE_AND_BUFFERED_IR_SEND_PULSE,irCde")     // note: deliberate lack of itoa converstion - command needs raw data value not ASCII number
}

define_function amxIrSetOffTime (dev irPort, integer offTime)
{
	sendCommand (irPort, "IR_COMMAND_DURATION_OFF_TIME_BETWEEN_PULSES,offTime")     // note: deliberate lack of itoa converstion - command needs raw data value not ASCII number
}

define_function amxIrSetOnTime (dev irPort, integer onTime)
{
	sendCommand (irPort, "IR_COMMAND_DURATION_ON_TIME_PULSE,onTime")      // note: deliberate lack of itoa converstion - command needs raw data value not ASCII number
}

define_function amxIrRequestBaud (dev irPort)
{
	sendCommand (irPort, "IR_COMMAND_BAUD_REQUEST")
}

define_function amxIrRequestMode (dev irPort)
{
	sendCommand (irPort, "IR_COMMAND_MODE_REQUEST")
}

define_function amxIrClearBuffer (dev irPort)
{
	sendCommand (irPort, "IR_COMMAND_HALT_AND_CLEAR_ALL_ACTIVE_AND_BUFFERED_IR")
}


define_function amxIrDisableIoLinkPowerSettings (dev irPort)
{
	sendCommand (irPort, IR_COMMAND_DISABLE_IO_LINK_POWER_SETTINGS)
}

/*
define_function amxIr....
{
	sendCommand (irPort, "IR_COMMAND_TURN_OFF_DEVICE_BASED_ON_IO_LINK_STATUS")
}

define_function amxIr....
{
	sendCommand (irPort, "IR_COMMAND_TURN_ON_DEVICE_BASED_ON_IO_LINK_STATUS")
}


define_function amxIr....
{
	sendCommand (irPort, "IR_COMMAND_DURATION_OFF_TIME_BETWEEN_POWER_PULSES")
}

define_function amxIr....
{
	sendCommand (irPort, "IR_COMMAND_DURATION_ON_TIME_POWER_PULSES")
}
*/

define_function amxIrSetBaud (dev irPort, char baudRate[], char parity[], char dataBits[], char stopBits[])
{
	sendCommand (irPort, "IR_COMMAND_BAUD_CONFIGURE,baudRate,',',parity,',',dataBits,',',stopBits")
}


define_function amxIrSetIoLink (dev irPort, integer ioChannel)
{
	sendCommand (irPort, "IR_COMMAND_IO_LINK,itoa(ioChannel)")
}

define_function amxIrSetMode (dev irPort, char mode[])
{
	switch (mode)
	{
		case IR_MODE_SERIAL:
		case IR_MODE_DATA:
		case IR_MODE_IR:
		{
			sendCommand (irPort, "IR_COMMAND_MODE,mode")
		}
	}
}

define_function amxIrStackPulse (dev irPort, integer irCde)
{
	sendCommand (irPort, "IR_COMMAND_SINGLE_IR_PULSE,irCde") // note: deliberate lack of itoa converstion - command needs raw data value not ASCII number
}


define_function amxIrPulseUsingPatten (dev irPort, integer irChannel)
{
	sendCommand (irPort, "IR_COMMAND_TRANSMIT_CODE_USING_PATTERN,itoa(irChannel)")
}


define_function amxIrSetPattern (dev irPort, char pattern[])
{
	switch (pattern)
	{
		case IR_PATTERN_MODE_0:
		case IR_PATTERN_MODE_1:
		case IR_PATTERN_MODE_2:
		case IR_PATTERN_MODE_3:
		case IR_PATTERN_MODE_4:
		case IR_PATTERN_MODE_5:
		case IR_PATTERN_MODE_6:
		{
			sendCommand (irPort, "IR_COMMAND_CHANGE_IR_PATTERN,pattern")
		}
	}
}




/*
 * --------------------
 * IO functions
 * --------------------
 */

/*
 * --------------------
 * Function: amxIoRequestInputActiveState
 *
 * Parameters:  dev ioPort - IO port
 *              integer ioChannel - IO channel code
 * 
 * Description: Request the active state of IO. Does it trigger when 
 *              incoming voltage is high or low?
 * --------------------
 */
define_function amxIoRequestInputActiveState (dev ioPort, integer ioChannel)
{
	sendCommand (ioPort, "IO_COMMAND_INPUT_ACTIVE_STATE_REQUEST,itoa(ioChannel)")
}

/*
 * --------------------
 * Function: amxIoSetInputState
 *
 * Parameters:  dev ioPort - IO port
 *              integer ioChannel - IO channel code
 *              char inputState[] - input state
 *                      Values:
 *                          IO_ACTIVE_STATE_HIGH
 *                          IO_ACTIVE_STATE_LOW
 * 
 * Description: Set input state of IO.
 * --------------------
 */
define_function amxIoSetInputState (dev ioPort, integer ioChannel, char inputState[])
{
	switch (inputState)
	{
		case IO_STATE_HIGH:
		case IO_STATE_LOW:
		{
			sendCommand (ioPort, "IO_COMMAND_INPUT_ACTIVE_STATE_CONFIGURE,itoa(ioChannel),' ',inputState")
		}
	}
}





