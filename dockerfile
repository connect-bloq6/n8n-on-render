FROM n8nio/n8n:latest

# Set timezone
ENV GENERIC_TIMEZONE="Asia/Kolkata"
ENV TZ="Asia/Kolkata"

# Fix permissions warning
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Data folder
VOLUME /home/node/.n8n

# Use shell to find and run n8n - try multiple locations
# Avoid nested quotes by using single quotes inside the node -e command
CMD ["sh", "-c", "if command -v n8n >/dev/null 2>&1; then exec n8n; elif [ -x /usr/local/bin/n8n ]; then exec /usr/local/bin/n8n; elif [ -f /usr/local/lib/node_modules/n8n/bin/n8n ]; then exec node /usr/local/lib/node_modules/n8n/bin/n8n; else N8N_MODULE=$(find /usr -path '*/node_modules/n8n/bin/n8n' 2>/dev/null | head -1); exec node \"$N8N_MODULE\"; fi"]