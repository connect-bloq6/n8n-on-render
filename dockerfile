FROM n8nio/n8n:latest

# Set timezone
ENV GENERIC_TIMEZONE="Asia/Kolkata"
ENV TZ="Asia/Kolkata"

# Fix permissions warning
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Data folder
VOLUME /home/node/.n8n

# Create a wrapper script to find and run n8n
RUN echo '#!/bin/sh' > /start-n8n.sh && \
    echo 'if command -v n8n >/dev/null 2>&1; then' >> /start-n8n.sh && \
    echo '  exec n8n start' >> /start-n8n.sh && \
    echo 'elif [ -f /usr/local/bin/n8n ]; then' >> /start-n8n.sh && \
    echo '  exec /usr/local/bin/n8n start' >> /start-n8n.sh && \
    echo 'elif [ -f /usr/local/lib/node_modules/n8n/bin/n8n ]; then' >> /start-n8n.sh && \
    echo '  exec node /usr/local/lib/node_modules/n8n/bin/n8n start' >> /start-n8n.sh && \
    echo 'else' >> /start-n8n.sh && \
    echo '  exec node -e "require(\\"n8n/bin/n8n\\").start()"' >> /start-n8n.sh && \
    echo 'fi' >> /start-n8n.sh && \
    chmod +x /start-n8n.sh

CMD ["/start-n8n.sh"]