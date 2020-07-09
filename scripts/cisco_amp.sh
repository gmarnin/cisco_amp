#!/bin/sh

CWD=$(dirname $0)
CACHEDIR="$CWD/cache/"
OUTPUT_FILE="${CACHEDIR}cisco_amp.txt"
SEPARATOR=' = '

# Warning.. This script is one big ugly hack #macadminshame

# ampcli documentation: https://www.cisco.com/c/en/us/support/docs/security/amp-endpoints/215256-cisco-amp-for-endpoints-mac-linux-cli.html

# To Do: Suppress these log messages: [logger] Set minimum reported log level to notice


# About
cat <<EOF > /tmp/amp-about.txt
$(/opt/cisco/amp/ampcli about)
EOF
APP_VERSION=`sed -n "s/AMP for Endpoints Connector//p" /tmp/amp-about.txt | xargs`

# Status
cat <<EOF > /tmp/amp-status.txt
$(/opt/cisco/amp/ampcli status)
EOF
STATUS=`sed -n "s/Status://p" /tmp/amp-status.txt | xargs`
MODE=`sed -n "s/Mode://p" /tmp/amp-status.txt | xargs`
SCAN=`grep -m1 "Scan:" /tmp/amp-status.txt | xargs | cut -c7-`
LAST_SCAN=`sed -n "s/Last Scan://p" /tmp/amp-status.txt | xargs`
POLICY=`sed -n "s/Policy://p" /tmp/amp-status.txt | xargs`
COMMAND_LINE=`sed -n "s/Command\-line://p" /tmp/amp-status.txt | xargs`
FAULTS=`sed -n "s/Faults://p" /tmp/amp-status.txt | xargs`

# Policy
cat <<EOF > /tmp/amp-policy.txt
$(/opt/cisco/amp/ampcli policy)
EOF
QUARANTINE_BEHAVIOR=`grep -A1 "Quarantine Behavior:" /tmp/amp-policy.txt | xargs | cut -d' ' -f3-`
PROTECTION=`grep -A3 "Protection:" /tmp/amp-policy.txt | xargs | cut -d' ' -f2-`
PROXY=`sed -n "s/Proxy://p" /tmp/amp-policy.txt | xargs`
NOTIFICATIONS=`sed -n "s/Notifications://p" /tmp/amp-policy.txt | xargs`
LAST_UPDATE=`sed -n 's/Last Updated://p' /tmp/amp-policy.txt | xargs | awk '{print $1, $2}'`
DEFINITION_VERSION=`sed -n "s/Definition Version://p" /tmp/amp-policy.txt | xargs`
DEFINITION_LAST_UPDATED=`sed -n "s/Definitions Last Updated://p" /tmp/amp-policy.txt | xargs`


# Output data here
echo "status${SEPARATOR}${STATUS}" > ${OUTPUT_FILE}
echo "mode${SEPARATOR}${MODE}" >> ${OUTPUT_FILE}
echo "scan${SEPARATOR}${SCAN}" >> ${OUTPUT_FILE}
echo "last_scan${SEPARATOR}${LAST_SCAN}" >> ${OUTPUT_FILE}
echo "policy${SEPARATOR}${POLICY}" >> ${OUTPUT_FILE}
echo "command_line${SEPARATOR}${COMMAND_LINE}" >> ${OUTPUT_FILE}
echo "faults${SEPARATOR}${FAULTS}" >> ${OUTPUT_FILE}
echo "quarantine_behavior${SEPARATOR}${QUARANTINE_BEHAVIOR}" >> ${OUTPUT_FILE}
echo "protection${SEPARATOR}${PROTECTION}" >> ${OUTPUT_FILE}
echo "proxy${SEPARATOR}${PROXY}" >> ${OUTPUT_FILE}
echo "notifications${SEPARATOR}${NOTIFICATIONS}" >> ${OUTPUT_FILE}
echo "last_update${SEPARATOR}${LAST_UPDATE}" >> ${OUTPUT_FILE}
echo "definition_version${SEPARATOR}${DEFINITION_VERSION}" >> ${OUTPUT_FILE}
echo "definition_last_updated${SEPARATOR}${DEFINITION_LAST_UPDATED}" >> ${OUTPUT_FILE}
echo "app_version${SEPARATOR}${APP_VERSION}" >> ${OUTPUT_FILE}