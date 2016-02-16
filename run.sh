#!/bin/bash

set -e 

if [ "${CLEAN_PERIOD}" == "**None**" ]; then
    echo "=> CLEAN_PERIOD not defined, use the default value."
    CLEAN_PERIOD=3600
fi

if [ "${ELASTICSEARCH_ENDPOINT}" == "**None**" ]; then
    echo "=> ELASTICSEARCH_ENDPOINT not defined, exiting"
    exit 1
fi

echo "=> Run the script every ${CLEAN_PERIOD} seconds"

trap '{ echo "User Interupt."; exit 1; }' SIGINT
trap '{ echo "SIGTERM received, exiting."; exit 0; }' SIGTERM
while [ 1 ]
do
    # Cleanup old indicies
    echo "Running '/elasticsearch-remove-old-indices.sh -e "$ELASTICSEARCH_ENDPOINT" -i 2'"
    /elasticsearch-remove-old-indices.sh -e "$ELASTICSEARCH_ENDPOINT" -g $INDEX -i 2

    echo "=> Next clean will be started in ${CLEAN_PERIOD} seconds"
    sleep ${CLEAN_PERIOD} & wait
done
