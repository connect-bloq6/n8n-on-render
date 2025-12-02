FROM n8nio/n8n:latest

# Set timezone
ENV GENERIC_TIMEZONE="Asia/Kolkata"

# Data folder
VOLUME /home/node/.n8n

CMD ["n8n", "start"]