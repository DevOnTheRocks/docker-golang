FROM alpine
LABEL Author cossacksman

# Environment Variables
ENV PATH = "/usr/local/go/bin:${PATH}"

RUN apk add --no-cache bash \
    mkdir -p /home/go

WORKDIR /home/go

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]