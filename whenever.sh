#!/bin/sh

#
# Usage: whenever.sh [path] [command]
#
# Executes a command whenever files are written into the path in the first parameter.
# "{}" in the command is replaced with the matching filename (via xargs).
# Requires inotifywait from inotify-tools.
#
# For example,
#
#    whenever.sh '/certs' 'cp /certs/* /certs/final/path'
# 
# It copies an auto-renewed certificate to it's final place.
#

set -e -u

WATCHEDPATH="$1"
COMMAND="$2"

inotifywait -q -m -r -e close_write $WATCHEDPATH \
    | xargs -I{} -r sh -c "echo [\$(date -Is)] $COMMAND && $COMMAND"
