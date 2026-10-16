FROM python:3.9-slim@sha256:dad5b29e3506c35e0fd222736f4d4ef25d21b219acdd73f7bb41d59996ca8e0d

# add apache bench (ab) tool
RUN apt-get -o Acquire::Retries=5 update \
    && apt-get -o Acquire::Retries=5 install -y --no-install-recommends \
    apache2-utils \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd --gid 10001 app \
    && useradd --uid 10001 --gid app --home-dir /seed --shell /usr/sbin/nologin app

WORKDIR /seed

COPY --chown=app:app . .

# create POST data files with ab friendly formats
RUN python make-data.py && chown -R app:app /seed

USER app

CMD ["/seed/generate-votes.sh"]
