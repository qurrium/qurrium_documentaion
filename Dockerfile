FROM python:3.12-slim-bookworm

# The installer requires curl (and certificates) to download the release archive
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates

# Download the latest installer
ADD https://astral.sh/uv/install.sh /uv-installer.sh

# Run the installer then remove it
RUN sh /uv-installer.sh && rm /uv-installer.sh

# Ensure the installed binary is on the `PATH`
ENV PATH="/root/.local/bin/:$PATH"

# Install build tools
RUN apt-get install -y git pandoc make

# Install Sphinx and optional extensions
RUN uv pip install --no-cache-dir --system \
    sphinx \
    myst-parser \
    sphinx-book-theme \
    sphinxext-opengraph \
    jupyter-book \
    pydata-sphinx-theme \
    sphinxcontrib-bibtex \
    ipykernel \
    matplotlib \
    pandas \
    numpy

ARG QURRIUM_VERSION
ENV QURRIUM_VERSION=${QURRIUM_VERSION}
ARG DOC_VERSION
ENV DOC_VERSION=${DOC_VERSION}

RUN git clone https://github.com/qurrium/qurrium_documentaion.git app
RUN cd /app && git checkout ${DOC_VERSION} && git fetch && git pull && cd /
RUN uv pip install --no-cache-dir --system -r /app/requirements.txt

COPY docs/conf.py /app/docs/conf.py
RUN rm /app/docs/_static/switcher.json
COPY tools/switcher.json /app/docs/_static/switcher.json

RUN if [ "$QURRIUM_VERSION" = "stable" ]; then \
    uv pip install --no-cache-dir --system qurrium; \
    elif [ "$QURRIUM_VERSION" = "dev" ]; then \
    uv pip install --no-cache-dir --system -i https://test.pypi.org/simple/ qurry; \
    elif [ -z "$QURRIUM_VERSION" ]; then \
    echo "QURRIUM_VERSION is not set. Please set it to 'stable' or 'dev'."; \
    exit 1; \
    else \
    uv pip install --no-cache-dir --system qurrium==${QURRIUM_VERSION}; \
    fi

WORKDIR /app

RUN black /app
RUN flake8 /app --count --exit-zero --statistics --config /app/tox.ini