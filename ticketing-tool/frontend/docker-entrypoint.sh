#!/bin/sh
set -e

echo "Injecting runtime environment variables..."

# Replace placeholders in env-template.js with actual .env values
envsubst < /usr/share/nginx/html/env-template.js > /usr/share/nginx/html/env.js

# Start nginx
exec nginx -g 'daemon off;'

