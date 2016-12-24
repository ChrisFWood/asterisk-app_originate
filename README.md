Asterisk Originate
==================

This is an Enhanced version of app_originate for Asterisk 11.25 which replaces the stock Asterisk Originate dial plan application. This version has been enhanced to support passing CallerID.

To use the new function, you must pass the following variables:
* tech_data - Channel technology and data for creating the outbound channel. For example, SIP/1234.
* type - This should be 'app' or 'exten', depending on whether the outbound channel should be connected to an application or extension.
* arg1 - If the type is 'app', then this is the application name. If the type is 'exten', then this is the context that the channel will be sent to.
* arg2 - If the type is 'app', then this is the data passed as arguments to the application. If the type is 'exten', then this is the extension that the channel will be sent to.
* arg3 - If the type is 'exten', then this is the priority that the channel is sent to. If the type is 'app', then this parameter is ignored.
* timeout - Timeout in seconds. Default is 30 seconds.
* options - The "options" parameter is optional. Valid options are defined in the next section.

## Options
The options parameter, which is optional, is a string containing zero or more of the following flags and parameters:
* **c**: callerid to be set based on a dialplan "hint" for the current channel.

## Example
To originate a call to SIP/1234 using the CALLERID(all) you would call the following from the dial plan:
```
	exten => _X.,n,Originate(SIP/1234,exten,context,extension,1,30,c(${CALLERID(all)}))
```
