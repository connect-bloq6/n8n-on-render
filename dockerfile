FROM n8nio/n8n:latest

# Set timezone
ENV GENERIC_TIMEZONE="Asia/Kolkata"
ENV TZ="Asia/Kolkata"

# Fix permissions warning
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Data folder
VOLUME /home/node/.n8n

# Run n8n directly using node - this avoids shell/PATH issues
# n8n is installed as a node module, so we can require it directly
CMD ["node", "/usr/local/lib/node_modules/n8n/bin/n8n"]