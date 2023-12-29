FROM alpine

RUN apk add --update coreutils && rm -rf /var/cache/apk/*

WORKDIR /app

COPY . .

CMD ["sh", "init.sh"]
