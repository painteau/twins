# Using the official Golang latest image
FROM golang:latest

# Installing dependencies
RUN apt-get update && apt-get install -y \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Installing twins
RUN go install code.rocketnine.space/tslocum/twins@latest

# Creating necessary directories
RUN mkdir -p /home/twins/certs /home/twins/sites

# Defining environment variables
ENV DOMAINS="example.com example.net"

# Copying the entry script
COPY start /usr/local/bin/start
RUN chmod +x /usr/local/bin/start

# Exposing the Gemini port
EXPOSE 1965

# Defining the entry point
CMD ["/usr/local/bin/start"]
