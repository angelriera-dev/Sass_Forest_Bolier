# =============================================================================
# STAGE 1: Builder
# =============================================================================
FROM python:3.12-slim-bookworm AS builder

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on

WORKDIR /app

# Install system build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Create wheels for production dependencies
COPY requirements/ /tmp/requirements/
RUN pip wheel --no-cache-dir --wheel-dir /app/wheels -r /tmp/requirements/production.txt


# =============================================================================
# STAGE 2: Runner
# =============================================================================
FROM python:3.12-slim-bookworm AS runner

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app

WORKDIR /app

# Create a non-root user
RUN groupadd -g 1000 django && \
    useradd -u 1000 -g django -m -s /bin/bash django

# Install runtime system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq5 \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy wheels from builder and install them
COPY --from=builder /app/wheels /wheels
RUN pip install --no-cache-dir /wheels/* && \
    rm -rf /wheels

# Copy project files and set ownership
COPY --chown=django:django . .

# Security: use non-root user
USER django

EXPOSE 8000

# Default command (can be overridden in docker-compose for dev)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
