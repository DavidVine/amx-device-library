program_name='amx-device-control'

#if_not_defined __AMX_DEVICE_CONTROL__
#define __AMX_DEVICE_CONTROL__

define_constant

char cMasterControlVersion[] = 'v1.0.0'

integer ADDRESS_CODE_WILDCARD = 0
integer CHANNEL_CODE_WILDCARD = 0
integer LEVEL_CODE_WILDCARD = 0

char STRING_EMPTY[] = ''


/*
 * --------------------
 * Common AMX master functions
 * --------------------
 */

/*
 * --------------------
 * Function: channelOn
 *
 * Parameters:  dev device - device
 *              integer chan - channel code
 * 
 * Description: Turn a channel on.
 * --------------------
 */
define_function channelOn (dev device, integer chan)
{
	on [device, chan]
}

/*
 * --------------------
 * Function: channelOff
 *
 * Parameters:  dev device - device
 *              integer chan - channel code
 * 
 * Description: Turn a channel off.
 * --------------------
 */
define_function channelOff (dev device, integer chan)
{
	off [device, chan]
}

/*
 * --------------------
 * Function: channelPulse
 *
 * Parameters:  dev device - device
 *              integer chan - channel code
 * 
 * Description: Pulse a channel.
 * --------------------
 */
define_function channelPulse (dev device, integer chan)
{
	pulse [device, chan]
}

/*
 * --------------------
 * Function: channelTo
 *
 * Parameters:  dev device - device
 *              integer chan - channel code
 * 
 * Description: Turn an output channel on for as long as a corresponding input
 *              channel is held on.
 *
 * Note:        TO statements that occur outside the data flow of PUSH events/statements 
 *              may not work. Only call this function from within the PUSH statement of 
 *              a BUTTON_EVENT.
 * --------------------
 */
define_function channelTo (dev device, integer chan)
{
	to [device, chan]
}

/*
 * --------------------
 * Function: channelMinTo
 *
 * Parameters:  dev device - device
 *              integer chan - channel code
 * 
 * Description: Turn an output channel on for as long as a corresponding input
 *              channel is held on or at least 1/2 a second, whichever is longer.
 *
 * Note:        TO statements that occur outside the data flow of PUSH events/statements 
 *              may not work. Only call this function from within the PUSH statement of 
 *              a BUTTON_EVENT.
 * --------------------
 */
define_function channelMinTo (dev device, integer chan)
{
	min_to [device, chan]
}

/*
 * --------------------
 * Function: channelToggle
 *
 * Parameters:  dev device - device
 *              integer chan - channel code
 * 
 * Description: Toggle a channel.
 * --------------------
 */
define_function channelToggle (dev device, integer chan)
{
	[device, chan] = ![device, chan]
}

/*
 * --------------------
 * Function: channelSet
 *
 * Parameters:  dev device - device
 *              integer chan - channel code
 *              integer status - status (TRUE or FALSE)
 * 
 * Description: Turn a channel on or off based on the status parameter.
 * --------------------
 */
define_function channelSet (dev device, integer chan, integer status)
{
	[device, chan] = status
}

/*
 * --------------------
 * Function: sendLevel
 *
 * Parameters:  dev device - device
 *              integer lev - level code
 *              integer val - level value
 * 
 * Description: Send a level value to an AMX device.
 * --------------------
 */
define_function sendLevel (dev device, integer lev, integer val)
{
	send_level device, lev, val
}

/*
 * --------------------
 * Function: sendString
 *
 * Parameters:  dev device - device
 *              char str[] - string
 * 
 * Description: Send a string through an AMX device to a connected device.
 * --------------------
 */
define_function sendString (dev device, char str[])
{
	send_string device, str
}

/*
 * --------------------
 * Function: sendCommand
 *
 * Parameters:  dev device - device
 *              char cmd[] - command
 * 
 * Description: Send a command to an AMX device.
 * --------------------
 */
define_function sendCommand (dev device, char cmd[])
{
	send_command device, cmd
}

/*
 * --------------------
 * Function: irPulse
 *
 * Parameters:  dev device - device
 *              integer chan - channel code
 * 
 * Description: Pulse a channel on an AMX IR device
 * --------------------
 */
define_function irPulse (dev device, integer chan)
{
	channelPulse (device, chan)
}

/*
 * --------------------
 * Function: irOn
 *
 * Parameters:  dev device - device
 *              integer chan - channel code
 * 
 * Description: Pulse a channel on an AMX IR device
 * --------------------
 */
define_function irOn (dev device, integer chan)
{
	channelOn (device, chan)
}

/*
 * --------------------
 * Function: irOff
 *
 * Parameters:  dev device - device
 *              integer chan - channel code
 * 
 * Description: Pulse a channel on an AMX IR device
 * --------------------
 */
define_function irOff (dev device, integer chan)
{
	channelOff (device, chan)
}



#end_if