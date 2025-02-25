FROM golang:latest as builder

# Install dependencies
RUN apt-get update && apt-get install -y \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Download and compile twins
RUN go install code.rocketnine.space/tslocum/twins@latest

# Final stage (lightweight production image)
FROM debian:stable-slim

# Install required dependencies
RUN apt-get update && apt-get install -y \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Create necessary directories
RUN mkdir -p /home/twins/certs /home/twins/sites

# Copy twins binary from the build stage
COPY --from=builder /go/bin/twins /usr/local/bin/twins

# Copy the startup script
COPY start /usr/local/bin/start
RUN chmod +x /usr/local/bin/start

# Expose the Gemini port
EXPOSE 1965

# Define the entry point
CMD ["/usr/local/bin/start"]
