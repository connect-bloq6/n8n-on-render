FROM node:20-alpine

# Install n8n globally
RUN npm install -g n8n

# Set timezone
ENV TZ="Asia/Kolkata"
ENV GENERIC_TIMEZONE="Asia/Kolkata"

# Fix permissions warning
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Create n8n data directory and set permissions
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# Switch to node user (node image already has this user)
USER node

# Set working directory
WORKDIR /home/node

# Expose n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]