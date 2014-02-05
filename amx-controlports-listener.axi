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
 * --------------------
 */

define_variable


// Serial ports
#if_not_defined dvSerialPorts
dev dvSerialPorts[] = { 5001:1:0, 5001:2:0, 5001:3:0 }
#end_if

// Relay ports
#if_not_defined dvRelayPorts
dev dvRelayPorts[] = { 5001:4:0 }
#end_if

// IR ports
#if_not_defined dvIrPorts
dev dvIrPorts[] = { 5001:5:0, 5001:6:0, 5001:7:0, 5001:8:0 }
#end_if

// IO ports
#if_not_defined dvIoPorts
dev dvIoPorts[] = { 5001:9:0 }
#end_if




#warn '@TODO - amx-controlports-listener - callback functions'



define_event


data_event [dvSerialPorts]
{
	string:
	{
		#warn '@TODO - amx-controlports-listener - serial ports incoming strings'
	}
	command:
	{
		#warn '@TODO - amx-controlports-listener - serial ports incoming commands'
	}
}

channel_event [dvSerialPorts,SERIAL_PORT_CTS_CHANNEL]
{
	on:
	{
		#warn '@TODO - amx-controlports-listener - serial ports CTS channel on'
	}
	off:
	{
		#warn '@TODO - amx-controlports-listener - serial ports CTS channel off'
	}
}


channel_event [dvRelayPorts,CHANNEL_CODE_WILDCARD]
{
	on:
	{
		#warn '@TODO - amx-controlports-listener - relay ports output channel on'
	}
	off:
	{
		#warn '@TODO - amx-controlports-listener - relay ports output channel off'
	}
}


data_event [dvIoPorts]
{
	command:
	{
		#warn '@TODO - amx-controlports-listener - IO ports incoming commands'
	}
}

button_event [dvIoPorts,CHANNEL_CODE_WILDCARD]
{
	push:
	{
		#warn '@TODO - amx-controlports-listener - IO ports input channel on'
	}
	release:
	{
		#warn '@TODO - amx-controlports-listener - IO ports input channel off'
	}
}


channel_event [dvIoPorts,CHANNEL_CODE_WILDCARD]
{
	on:
	{
		#warn '@TODO - amx-controlports-listener - IO ports output channel on'
	}
	off:
	{
		#warn '@TODO - amx-controlports-listener - IO ports output channel off'
	}
}


data_event [dvIrPorts]
{
	command:
	{
		#warn '@TODO - amx-controlports-listener - IR ports incoming commands'
	}
}

channel_event [dvIrPorts,CHANNEL_CODE_WILDCARD]
{
	on:
	{
		#warn '@TODO - amx-controlports-listener - IR ports output channel on'
	}
	off:
	{
		#warn '@TODO - amx-controlports-listener - IR ports output channel off'
	}
}








#end_if