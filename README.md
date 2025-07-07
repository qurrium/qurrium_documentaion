# Qurrium Documentation 📖 - The documentation and tutorials of Qurrium 📏

This repository contains the documentation and tutorials for Qurrium 📏.
Created by Sphinx.

See the [Qurrium Documentation](https://docs.qurrium.org/latest/) for more details.

## Docker Usage

You will need to pass 2 environment arguments to docker container.

- `QURRIUM_VERSION`: The Qurrium version you want to execute.
  - `stable`: Current latest stable version from PyPI.
  - `(qurrium version number)`: Specific Qurrium version
  - `dev`: Current latest nightly version from TestPyPI
- `DOC_VERSION`: The documentation version you want to build.
  - `(the git branch or git tag)`

### Image Building

For example when `QURRIUM_VERSION=stable` and `DOC_VERSION=master`

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

## About Sphinx Theme

This documentation experience 4 themes changes:

```log
jupyter-book -> pydata-sphinx-theme -> sphinx-immaterial -> furo
```

- [jupyter-book](https://jupyterbook.org/en/stable/intro.html)

  - Less customization on Sphinx.
  - Also they are migrating to MyST which leaves Sphinx.

- [pydata-sphinx-theme](https://pydata-sphinx-theme.readthedocs.io/en/stable/index.html)

  - Multi-version switching.
  - Also as a frontend engineer, I have some reservations on its design.
  - Its navigation bar does not work with tablet screen, which becomes 2 stacks sometimes. I don't think we can call this responsive.
    - [For I even make a responsive website from 2K to watch screen](https://course.opennccu.com)
  - **IT'S BootStrap**.

- [sphinx-immaterial](https://jbms.github.io/sphinx-immaterial/)

  - Multi-version switching.
  - MkDocs is awesome.
  - Material UI is awesome.
  - **Unfortunately it will break `sphinxext-opengraph` currently.**
  - Also it not yet introduce the social cards feature from MkDocs.

- [furo](https://pradyunsg.me/furo/)
  - Simple.
  - New qiskit-sphinx-theme base on theme.
  - No multi-version swtiching 🫠.
