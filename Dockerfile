FROM python:3.8-alpine
ARG PIP_INDEX_URL
ARG PIP_TIMEOUT
ARG GIT_CONFIG_COUNT
ARG GIT_CONFIG_KEY_0
ARG GIT_CONFIG_VALUE_0

RUN apk --update add --no-cache bash git openssh \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apk/*

RUN python3 -m pip install \
        --no-cache-dir \
        --upgrade pip

RUN python3 -m pip install \
        --no-cache-dir \
        --no-python-version-warning \
        --disable-pip-version-check \
        git+https://github.com/emzeat/pre-commit.git@fix/git_config_env
