FROM ruby:2.7-slim

RUN set -o errexit -o xtrace \
    && apt-get update \
    && apt-get install --yes --quiet --no-install-recommends \
        build-essential \
        cmake \
        libffi-dev \
        libicu-dev \
        pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN gem install gollum --version 5.2.1

RUN apt-get purge --yes \
        build-essential \
        cmake \
        libffi-dev \
        libicu-dev \
        pkg-config \
    && apt-get autoremove --yes

RUN useradd wiki

USER wiki
WORKDIR /srv/wiki

COPY . .

ENTRYPOINT ["./docker-entrypoint.sh"]
