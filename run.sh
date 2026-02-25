#!/bin/sh

set -e

SHARE_FOLDER=$(node -p "try { require('/data/options.json').share_folder || 'default' } catch(e) { 'default' }")

# Ensure clips are served from Home Assistant shared storage
mkdir -p "/share/$SHARE_FOLDER/clips"
rm -rf /app/static/clips
ln -s "/share/$SHARE_FOLDER/clips" /app/static/clips

# Start the application
echo "Starting application..."
npm start
