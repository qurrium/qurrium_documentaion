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
COPY requirements.txt /requirements.txt
COPY tox.ini /tox.ini
COPY pytest.ini /pytest.ini
COPY docs/ /tmp/docs/

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

RUN uv pip install --no-cache-dir --system -r /requirements.txt

ARG QURRIUM_VERSION
ENV QURRIUM_VERSION=${QURRIUM_VERSION}

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

WORKDIR /tmp

RUN black /tmp
RUN flake8 /tmp --count --exit-zero --statistics