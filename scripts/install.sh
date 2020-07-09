#!/bin/bash

# cisco_amp controller
CTL="${BASEURL}index.php?/module/cisco_amp/"

# Get the scripts in the proper directories
"${CURL[@]}" "${CTL}get_script/cisco_amp.sh" -o "${MUNKIPATH}preflight.d/cisco_amp.sh"

# Check exit status of curl
if [ $? = 0 ]; then
	# Make executable
	chmod a+x "${MUNKIPATH}preflight.d/cisco_amp.sh"

	# Set preference to include this file in the preflight check
	setreportpref "cisco_amp" "${CACHEPATH}cisco_amp.txt"

else
	echo "Failed to download all required components!"
	rm -f "${MUNKIPATH}preflight.d/cisco_amp.sh"

	# Signal that we had an error
	ERR=1
fi
