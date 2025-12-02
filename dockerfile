FROM n8nio/n8n:1.62.0

# Set timezone
ENV TZ="Asia/Kolkata"
ENV GENERIC_TIMEZONE="Asia/Kolkata"

# Fix permissions warning
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Don't override anything - let the base image handle startup
# The n8n base image already has ENTRYPOINT and CMD configured