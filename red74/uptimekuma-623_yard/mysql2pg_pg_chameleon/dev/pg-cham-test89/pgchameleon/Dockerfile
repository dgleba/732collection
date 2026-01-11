
FROM python:3.11

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      gcc \
      libpq-dev \
      libmariadb-dev \
      ca-certificates mc && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir pg_chameleon

# Create non-root user
ENV CHAMELEON_HOME=/pgchamdir
RUN useradd -m -u 1000 chameleon

# Required directories
RUN mkdir -p /etc/pgchameleon /pgchamdir && \
    chown -R chameleon:chameleon /etc/pgchameleon /pgchamdir

# Make home config directory and copy default.yml
RUN mkdir -p /home/chameleon/.pg_chameleon/configuration && \
    chown -R chameleon:chameleon /home/chameleon/.pg_chameleon

# Copy default.yml into the expected path
COPY ./default.yml /home/chameleon/.pg_chameleon/configuration/default.yml
RUN chown chameleon:chameleon /home/chameleon/.pg_chameleon/configuration/default.yml

USER chameleon
WORKDIR /pgchamdir

# Just to debug
RUN echo "home is: $HOME"

