FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m -u 1000 -s /bin/bash chameleon

# Install pg_chameleon
RUN pip install --no-cache-dir pg_chameleon

# Create configuration directory with proper permissions
RUN mkdir -p /home/chameleon/.pg_chameleon/configuration && \
    chown -R chameleon:chameleon /home/chameleon/.pg_chameleon

# Create log directory with proper permissions
RUN mkdir -p /var/log/pg_chameleon && \
    chown -R chameleon:chameleon /var/log/pg_chameleon

# Switch to non-root user
USER chameleon

# Set working directory
WORKDIR /home/chameleon

# Default command
CMD ["bash"]
