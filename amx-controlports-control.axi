program_name='amx-controlports-control'

#if_not_defined __AMX_CONTROLPORTS_CONTROL__
#define __AMX_CONTROLPORTS_CONTROL__


include 'amx-device-control'


define_constant

char AMX_SERIAL_BAUD_RATE_115200[]	= '115200'
char AMX_SERIAL_BAUD_RATE_76800[]	= '76800'
char AMX_SERIAL_BAUD_RATE_57600[]	= '57600'
char AMX_SERIAL_BAUD_RATE_38400[]	= '38400'
char AMX_SERIAL_BAUD_RATE_19200[]	= '19200'
char AMX_SERIAL_BAUD_RATE_9600[]	= '9600'
char AMX_SERIAL_BAUD_RATE_4800[]	= '4800'
char AMX_SERIAL_BAUD_RATE_2400[]	= '2400'
char AMX_SERIAL_BAUD_RATE_1200[]	= '1200'
char AMX_SERIAL_BAUD_RATE_600[]		= '600'
char AMX_SERIAL_BAUD_RATE_300[]		= '300'
char AMX_SERIAL_BAUD_RATE_150[]		= '150'

char AMX_SERIAL_BAUD_PARITY_NONE[]	= 'N'
char AMX_SERIAL_BAUD_PARITY_ODD[]	= 'O'
char AMX_SERIAL_BAUD_PARITY_EVEN[]	= 'E'
char AMX_SERIAL_BAUD_PARITY_MARK[]	= 'M'
char AMX_SERIAL_BAUD_PARITY_SPACE[]	= 'S'

char AMX_SERIAL_DATA_BITS_8[]	= '8'
char AMX_SERIAL_DATA_BITS_9[]	= '9'	// only valid with no parity and 1 stop bit

char AMX_SERIAL_STOP_BITS_1[]	= '1'
char AMX_SERIAL_STOP_BITS_2[]	= '2'

char AMX_SERIAL_485_ENABLE[]	= '485 Enable'
char AMX_SERIAL_485_DISABLE[]	= '485 Disable'
char AMX_SERIAL_485_IGNORE[]	= ''


char AMX_IO_STATE_HIGH[]	= 'HIGH'
char AMX_IO_STATE_LOW[]		= 'LOW'


char AMX_IR_BAUD_RATE_19200[]	= '19200'
char AMX_IR_BAUD_RATE_9600[]	= '9600'
char AMX_IR_BAUD_RATE_4800[]	= '4800'
char AMX_IR_BAUD_RATE_2400[]	= '2400'
char AMX_IR_BAUD_RATE_1200[]	= '1200'

char AMX_IR_MODE_SERIAL[]	= 'SERIAL'
char AMX_IR_MODE_DATA[]		= 'DATA'
char AMX_IR_MODE_IR[]		= 'IR'






/*
 * --------------------
 * General functions
 * --------------------
 */

/*
 * --------------------
 * Function: amxControllerEnableLeds
 *
 * Parameters:	dev controllerPort1 - port 1 on AMX controller
 * 
 * Description: Turn LEDs on.
 * --------------------
 */
define_function amxControllerEnableLeds (dev controllerPort1)
{
	sendCommand (controllerPort1, 'LED-EN')
}

/*
 * --------------------
 * Function: amxControllerDisableLeds
 *
 * Parameters:	dev controllerPort1 - port 1 on AMX controller
 * 
 * Description: Turn LEDs off.
 * --------------------
 */
define_function amxControllerDisableLeds (dev controllerPort1)
{
	sendCommand (controllerPort1, 'LED-DIS')
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

/*
 * --------------------
 * Function: amxRelayOff
 *
 * Parameters:	dev relays - bank of relays
 *				integer relayChannel - relay channel code
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
 * Parameters:	dev relays - bank of relays
 *				integer relayChannel - relay channel code
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

integer AMX_SERIAL_PORT_CTS_CHANNEL	= 255

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

/*
 * --------------------
 * Function: amxSerialSetBaudTemporary
 *
 * Parameters:	dev serialPort - serial port
 *				char baudRate[] - baud rate
 *				char parity[] - parity
 *				char dataBits[] - data bits
 *				char stopBits[] - stop bits
 *				char status485[] - RS485 status
 * 
 * Description: Temporarily configure the baud rate info of a serial port. Settings
 *		will be lost after a reboot of the device.
 * --------------------
 */
define_function amxSerialSetBaudTemporary (dev serialPort, char baudRate[], char parity[], char dataBits[], char stopBits[], char status485[])
{
	if (status485 == AMX_SERIAL_485_IGNORE)
		sendCommand (serialPort, "'TSET BAUD ',baudRate,',',parity,',',dataBits,',',stopBits")
	else
		sendCommand (serialPort, "'TSET BAUD ',baudRate,',',parity,',',dataBits,',',stopBits,' ',status485")
}

/*
 * --------------------
 * Function: amxSerialSetBaudTemporary
 *
 * Parameters:	dev serialPort - serial port
 * 
 * Description: Request the baud rate settings of the serial port.
 * --------------------
 */
define_function amxSerialRequestBaud (dev serialPort)
{
	sendCommand (serialPort, 'GET BAUD')
}

/*
 * --------------------
 * Function: amxSerialDisableHardwareHandshaking
 *
 * Parameters:	dev serialPort - serial port
 * 
 * Description: Disable hardware handshaking on the serial port.
 * --------------------
 */
define_function amxSerialDisableHardwareHandshaking (dev serialPort)
{
	sendCommand (serialPort, 'HSOFF')
}

/*
 * --------------------
 * Function: amxSerialEnableHardwareHandshaking
 *
 * Parameters:	dev serialPort - serial port
 * 
 * Description: Enable hardware handshaking on the serial port.
 * --------------------
 */
define_function amxSerialEnableHardwareHandshaking (dev serialPort)
{
	sendCommand (serialPort, 'HSON')
}

/*
 * --------------------
 * Function: amxSerialDisableSoftwareHandshaking
 *
 * Parameters:	dev serialPort - serial port
 * 
 * Description: Disable software handshaking on the serial port.
 * --------------------
 */
define_function amxSerialDisableSoftwareHandshaking (dev serialPort)
{
	sendCommand (serialPort, 'XOFF')
}

/*
 * --------------------
 * Function: amxSerialEnableSoftwareHandshaking
 *
 * Parameters:	dev serialPort - serial port
 * 
 * Description: Enable software handshaking on the serial port.
 * --------------------
 */
define_function amxSerialEnableSoftwareHandshaking (dev serialPort)
{
	sendCommand (serialPort, 'XON')
}

/*
 * --------------------
 * Function: amxSerialClearRxBuffer
 *
 * Parameters:	dev serialPort - serial port
 * 
 * Description: Clear the serial ports receive (RX) buffer.
 * --------------------
 */
define_function amxSerialClearRxBuffer (dev serialPort)
{
	sendCommand (serialPort, 'RXCLR')
}

/*
 * --------------------
 * Function: amxSerialClearTxBuffer
 *
 * Parameters:	dev serialPort - serial port
 * 
 * Description: Clear the serial ports transmit (TX) buffer.
 * --------------------
 */
define_function amxSerialClearTxBuffer (dev serialPort)
{
	sendCommand (serialPort, 'TXCLR')
}

/*
 * --------------------
 * Function: amxSerialEnableRx
 *
 * Parameters:	dev serialPort - serial port
 * 
 * Description: Enable the receive pin - incoming data will be sent to master.
 * --------------------
 */
define_function amxSerialEnableRx (dev serialPort)
{
	sendCommand (serialPort, 'RXON')
}

/*
 * --------------------
 * Function: amxSerialDisableRx
 *
 * Parameters:	dev serialPort - serial port
 * 
 * Description: Disable the receive pin - incoming data will not be sent to master.
 * --------------------
 */
define_function amxSerialDisableRx (dev serialPort)
{
	sendCommand (serialPort, 'RXOFF')
}

/*
 * --------------------
 * Function: amxSerialSetTxCharDelayTimeInMicroseconds
 *
 * Parameters:	dev serialPort - serial port
 *				integer microseconds - micro seconds (1/100th second)
 * 
 * Description: Set the delay time between transmitted characters from a serial 
 *		port. Time is in micro seconds (1/100ths of a second).
 * --------------------
 */
define_function amxSerialSetTxCharDelayTimeInMicroseconds (dev serialPort, integer microseconds)
{
	sendCommand (serialPort, "'CHARD-',itoa(microseconds)")
}

/*
 * --------------------
 * Function: amxSerialSetTxCharDelayTimeInMilliseconds
 *
 * Parameters:	dev serialPort - serial port
 *				integer microseconds - milli seconds (1/1000th second)
 * 
 * Description: Set the delay time between transmitted characters from a serial 
 *		port. Time is in milli seconds (1/1000ths of a second).
 * --------------------
 */
define_function amxSerialSetTxCharDelayTimeInMilliseconds (dev serialPort, integer milliseconds)
{
	sendCommand (serialPort, "'CHARDM-',itoa(milliseconds)")
}

/*
 * --------------------
 * Function: amxSerialEnableCtsReporting
 *
 * Parameters:	dev serialPort - serial port
 * 
 * Description: Enable reporting of the Clear-To-Send (CTS) pin.
 * --------------------
 */
define_function amxSerialEnableCtsReporting (dev serialPort)
{
	sendCommand (serialPort, 'CTSPSH')
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
	sendCommand (serialPort, 'CTSPSH OFF')
}


/*
 * --------------------
 * IR functions
 * --------------------
 */

#warn '@TODO - amx-controlports-control - commenting for IR functions'

define_function amxIrEnableCarrierSignal (dev irPort)
{
	sendCommand (irPort, 'CARON')
}

define_function amxIrDisableCarrierSignal (dev irPort)
{
	sendCommand (irPort, 'CAROFF')
}

define_function amxIrSendChannelNumber (dev irPort, integer channelNum)
{
	sendCommand (irPort, "'CH',channelNum")	// note: deliberate lack of itoa converstion - command needs raw data value not ASCII number
}

define_function amxIrClearBufferSendCode (dev irPort, integer irChannel)
{
	sendCommand (irPort, "'CP',irChannel")	// note: deliberate lack of itoa converstion - command needs raw data value not ASCII number
}

define_function amxIrSetOffTime (dev irPort, integer offTime)
{
	sendCommand (irPort, "'CTOF',offTime")	// note: deliberate lack of itoa converstion - command needs raw data value not ASCII number
}

define_function amxIrSetOnTime (dev irPort, integer onTime)
{
	sendCommand (irPort, "'CTON',onTime")	// note: deliberate lack of itoa converstion - command needs raw data value not ASCII number
}

define_function amxIrRequestBaud (dev irPort)
{
	sendCommand (irPort, "'GET BAUD'")
}

define_function amxIrRequestMode (dev irPort)
{
	sendCommand (irPort, "'GET MODE'")
}

define_function amxIrClearBuffer (dev irPort)
{
	sendCommand (irPort, "'IROFF'")
}

/*
define_function amxIrDisable.....
{
	sendCommand (irPort, "'POD'")
}


define_function amxIr....
{
	sendCommand (irPort, "'POF'")
}

define_function amxIr....
{
	sendCommand (irPort, "'PON'")
}


define_function amxIr....
{
	sendCommand (irPort, "'PTOF'")
}

define_function amxIr....
{
	sendCommand (irPort, "'PTON'")
}
*/

define_function amxIrSetBaud (dev irPort, char baudRate[], char parity[], char dataBits[], char stopBits[])
{
	sendCommand (irPort, "'SET BAUD ',baudRate,',',parity,',',dataBits,',',stopBits")
}


define_function amxIrSetIoLink (dev irPort, integer ioChannel)
{
	sendCommand (irPort, "'SET IO LINK ',itoa(ioChannel)")
}

define_function amxIrSetMode (dev irPort, char mode[])
{
	sendCommand (irPort, "'SET MODE ',mode")
}

define_function amxIrStackPulse (dev irPort, integer irChannel)
{
	sendCommand (irPort, "'SP',irChannel")	// note: deliberate lack of itoa converstion - command needs raw data value not ASCII number
}

/*
define_function amxIr
{
	sendCommand (irPort, "'XCH'")
}

define_function amxIr
{
	sendCommand (irPort, "'XCHM'")
}
*/



/*
 * --------------------
 * IO functions
 * --------------------
 */

/*
 * --------------------
 * Function: amxIoGetInputState
 *
 * Parameters:	dev ioPort - IO port
 *				integer ioChannel - IO channel code
 * 
 * Description: Request input state of IO.
 * --------------------
 */
define_function amxIoGetInputState (dev ioPort, integer ioChannel)
{
	sendCommand (ioPort, "'GET INPUT ',itoa(ioChannel)")
}

/*
 * --------------------
 * Function: amxIoSetInputState
 *
 * Parameters:	dev ioPort - IO port
 *				integer ioChannel - IO channel code
 *				char inputState[] - input state
 *							values:
 *								AMX_IO_STATE_HIGH
 *								AMX_IO_STATE_LOW
 * 
 * Description: Set input state of IO.
 * --------------------
 */
define_function amxIoSetInputState (dev ioPort, integer ioChannel, char inputState[])
{
	switch (inputState)
	{
		case AMX_IO_STATE_HIGH:
		case AMX_IO_STATE_LOW:
		{
			sendCommand (ioPort, "'SET INPUT ',itoa(ioChannel),' ',inputState")
		}
	}
}





