# Qurrium Documentation 📖 - The documentation and tutorials of Qurrium 📏

This repository contains the documentation and tutorials for Qurrium 📏.
Created by Sphinx.

See the [Qurrium Documentation](https://docs.qurrium.org/en/latest/) for more details.

## Docker Usage

You will need to pass 2 environment arguments to docker container.

- `QURRIUM_VERSION`: The Qurrium version you want to execute.
  - `stable`: Current latest stable version from PyPI.
  - `(qurrium version number)`: Specific Qurrium version
  - `dev`: Current latest nightly version from TestPyPI
- `DOC_VERSION`: The documentation version you want to build.
  - `(the git branch or git tag)`

### Image Building

- Building:

```sh
docker build -t qurrium_doc_sphinx_img \
  --build-arg QURRIUM_VERSION=stable \
  --build-arg DOC_VERSION=master .
```

- Entering its shell:

```sh
docker run -it qurrium_doc_sphinx_img /bin/bash
```

### Docker compose

For example when `QURRIUM_VERSION=stable` and `DOC_VERSION=master`

```sh
QURRIUM_VERSION=stable DOC_VERSION=master docker compose up --build
```
