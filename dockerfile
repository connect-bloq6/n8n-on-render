FROM n8nio/n8n:latest

# Set timezone
ENV GENERIC_TIMEZONE="Asia/Kolkata"
ENV TZ="Asia/Kolkata"

# Fix permissions warning
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Data folder
VOLUME /home/node/.n8n

# Use npx to run n8n - this will find n8n in node_modules or global install
CMD ["npx", "n8n", "start"]