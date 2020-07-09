# Cisco AMP Module
==============

This module uses the [ampcli](https://www.cisco.com/c/en/us/support/docs/security/amp-endpoints/215256-cisco-amp-for-endpoints-mac-linux-cli.html) binary to report on the Cisco AMP status and policy information


Table Schema
-----

Table name: cisco_amp

Database:
* status - varchar(255) - Get ampdaemon status
* mode - varchar(255) - mode type
* scan - varchar(255) - scan status 
* last scan - int - last time a virus scan was run
* policy - varchar(255) - shows the current policy for the Connector running on the Mac
* command_line - varchar(255) - is `ampcli` enabled
* faults - big integer -show the number of faults present for each severity level (Critical/Major/Minor)
* quarantine_behavior - varchar(255) - how to handle quarantine files
* protection - big integer - protection status 
* proxy - varchar(255) - is a proxy set
* notifications - varchar(255) - are cloud notifications on or off
* last_update - int - last time sync policy was updated
* definition_version - varchar(255) - version of the Virus definitions
* definition_last_updated - int - last time virus definitions were updated
* app_version - int - Cisco AMP version 
