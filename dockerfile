# Use a base image with Node.js installed
FROM node:14

# Set the working directory
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && apt-get install -y curl wget libx11-xcb1 libxcb-dri3-0 libdrm2 libgbm1 libxkbcommon0 libxss1 libnss3 libasound2

# Download and install VS Code server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Expose the port for the VS Code server
EXPOSE 8080

# Start the VS Code server
CMD ["code-server", "--auth", "none", "--port", "8080"]
