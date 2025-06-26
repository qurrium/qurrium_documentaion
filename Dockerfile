FROM ghcr.io/astral-sh/uv:debian-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install build tools
RUN apt-get update && apt-get install -y git pandoc make
RUN apt-get update && \
    apt-get install -y fonts-noto-core fonts-noto-color-emoji && \
    rm -rf /var/lib/apt/lists/* && \
    fc-cache -f -v

# Prepare Python environment
RUN uv python install 3.13
RUN uv venv --python python3.13
RUN . .venv/bin/activate
RUN uv pip install --upgrade pip setuptools wheel

# Set environment variables for Qurrium version and documentation version
ARG QURRIUM_VERSION
ENV QURRIUM_VERSION=${QURRIUM_VERSION}
ARG DOC_VERSION
ENV DOC_VERSION=${DOC_VERSION}

# Clone the Qurrium documentation repository
RUN rm -rf /app
RUN git clone https://github.com/qurrium/qurrium_documentaion.git app
WORKDIR /app
RUN git checkout ${DOC_VERSION} && git fetch && git pull
WORKDIR /

# Install Python dependencies
RUN uv pip install -r /app/requirements.txt

# Copy additional configuration files
COPY docs/conf.py /app/docs/conf.py
RUN rm /app/docs/_static/switcher.json
COPY tools/switcher.json /app/docs/_static/switcher.json

# Install Qurrium package based on the specified version
RUN if [ "$QURRIUM_VERSION" = "stable" ]; then \
    uv pip install qurrium; \
    elif [ "$QURRIUM_VERSION" = "dev" ]; then \
    uv pip install -i https://test.pypi.org/simple/ qurry; \
    elif [ -z "$QURRIUM_VERSION" ]; then \
    echo "QURRIUM_VERSION is not set. Please set it to 'stable' or 'dev'."; \
    exit 1; \
    else \
    uv pip install qurrium==${QURRIUM_VERSION}; \
    fi

# Format and lint the documentation source code
RUN .venv/bin/black /app
RUN .venv/bin/flake8 /app --count --exit-zero --statistics --config /app/tox.ini