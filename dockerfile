FROM ubuntu:latest

# Update package lists and install necessary dependencies
RUN apt-get update && apt-get install -y curl wget libx11-xcb1 libxcb-dri3-0 libdrm2 libgbm1 libxkbcommon0 libxss1 libnss3 libasound2

# Download and install VS Code server
RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN docker build -t vs-code-server

RUN docker run -d -p 8080:8080 vs-code-server

# Expose the port for the VS Code server
EXPOSE 8080

# Start the VS Code server
CMD ["code-server", "--auth", "none", "--port", "8080"]
