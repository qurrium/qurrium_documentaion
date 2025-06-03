FROM python:3.12-slim

# Install build tools
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Sphinx and optional extensions
RUN pip install uv

RUN uv pip install --no-cache-dir \
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

WORKDIR /docs
