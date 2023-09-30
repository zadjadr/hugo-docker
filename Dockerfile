FROM golang:alpine as hugobase

ENV HUGO_VERSION=0.119.0

WORKDIR /src
VOLUME [ "/src" ]

# Install HUGO
RUN set -x \
  && apk add --no-cache --update wget ca-certificates libstdc++ libc6-compat \
  && wget -q -O hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz \
  && tar xzf hugo.tar.gz hugo \
  && mv hugo /usr/bin \
  ## Cleanup
  && rm -rf * \
  && apk del wget ca-certificates