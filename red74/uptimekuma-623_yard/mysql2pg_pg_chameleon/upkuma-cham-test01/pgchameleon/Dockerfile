FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        libpq-dev \
        libmariadb-dev \
        libmariadb-dev-compat \
        git \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir pg_chameleon

RUN mkdir -p /etc/pg_chameleon /var/lib/pg_chameleon

WORKDIR /var/lib/pg_chameleon

ENTRYPOINT ["sh", "-c"]
CMD ["chameleon --help"]
