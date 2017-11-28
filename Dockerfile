FROM alpine
LABEL Author cossacksman

# Environment Variables
ENV PATH = "/usr/local/go/bin:${PATH}"

RUN apk update \
        apk add --no-cache bash ca-certificates wget openssl && \
        mkdir -p /home/go

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]