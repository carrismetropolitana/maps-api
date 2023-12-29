#!/bin/sh

# DIRECTORY
directory="/data"

# FREQUENCY
frequency=21600 # Run every 6 hours (21600 seconds)

# Define the region to extract
portugal_bbox="-10.0,-36.5,-5.5,42.5"


# Infinite loop
while true; do

    # Build the date string for yesterday
    yesterday_date_string=$(date -d "yesterday 13:00" '+%Y%m%d')

    # Extract Portugal from the larger dataset
    ./pmtiles extract https://build.protomaps.com/$yesterday_date_string.pmtiles /data/next.pmtiles --bbox=-$portugal_bbox

    # Remove the previous archive and replace with the new one
    rm /data/latest.pmtiles
    mv /data/next.pmtiles /data/latest.pmtiles

    # Log end of program
    echo "Complete! Next run in $frequency seconds :)"

    # Sleep until the next iteration
    sleep $frequency

done