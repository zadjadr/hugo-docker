ARG ALPINE_VERSION=3.18

FROM alpine:${ALPINE_VERSION} as hugobase

ENV HUGO_VERSION=0.119.0

WORKDIR /tmp
VOLUME [ "/tmp" ]

# Install HUGO
RUN set -x \
  && apk add --update wget ca-certificates libstdc++ libc6-compat
RUN wget -q -O hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz \
  && tar xzf hugo.tar.gz hugo \
  && mv hugo /usr/bin \
  ## Cleanup
  && rm -r hugo.tar.gz \
  && apk del wget ca-certificates \
  && rm /var/cache/apk/*
