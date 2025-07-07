FROM ghcr.io/astral-sh/uv:debian-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install build tools
RUN apt-get update && apt-get install -y \
    git pandoc make curl zip unzip fontconfig
RUN apt-get update && apt-get install -y \
    fonts-noto-cjk \
    fonts-noto-mono \
    fonts-roboto

# Install Roboto Flex font
RUN mkdir -p /usr/share/fonts/truetype/roboto-flex && \
    curl -L https://github.com/google/fonts/raw/main/ofl/robotoflex/RobotoFlex%5BGRAD%2CXOPQ%2CXTRA%2CYOPQ%2CYTAS%2CYTDE%2CYTFI%2CYTLC%2CYTUC%2Copsz%2Cslnt%2Cwdth%2Cwght%5D.ttf -o /usr/share/fonts/truetype/roboto-flex/RobotoFlex.ttf

# Update font cache
RUN fc-cache -fv

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
COPY requirements.txt /requirements.txt
RUN uv pip install -r /requirements.txt

# Copy additional configuration files
COPY docs/conf.py /app/docs/conf.py
# RUN rm /app/docs/_static/switcher.json
# COPY tools/switcher.json /app/docs/_static/switcher.json

# Install Qurrium package based on the specified version
RUN if [ "$QURRIUM_VERSION" = "stable" ]; then \
    # uv pip install qurrium; \
    uv pip install -i https://test.pypi.org/simple/ qurry==0.13.1.dev1; \
    echo "0.13.0" > /.venv/lib/python3.13/site-packages/qurry/VERSION.txt; \
    elif [ "$QURRIUM_VERSION" = "0.13.0" ]; then \
    # The completed docstring for 0.13.0 is actually on 0.13.1.dev1
    uv pip install -i https://test.pypi.org/simple/ qurry==0.13.1.dev1; \
    echo "0.13.0" > /.venv/lib/python3.13/site-packages/qurry/VERSION.txt; \
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