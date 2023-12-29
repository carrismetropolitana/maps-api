#!/bin/sh

# Define the region to extract
portugal_bbox="-10.0,-36.5,-5.5,42.5"

# Build the date string for yesterday
yesterday_date_string=$(date -d "yesterday" +"%Y%m%d")

# Extract Portugal from the larger dataset
./pmtiles extract https://build.protomaps.com/$yesterday_date_string.pmtiles /data/next.pmtiles --bbox=-$portugal_bbox

# Remove the previous archive and replace with the new one
rm /data/latest.pmtiles
mv /data/next.pmtiles /data/latest.pmtiles
