FROM niallo/strider
MAINTAINER Kamil Trzciński <ayufan@ayufan.eu>

RUN mkdir -p /strider/builds && chown strider:strider /strider /strider/builds
ENV STRIDER_CLONE_DEST /strider/builds
ENV SERVER_NAME https://strider-ci.ayufan.eu/
USER strider
WORKDIR /src
CMD ["sh", "-c", "NODE_ENV=${NODE_ENV:=production} DB_URI=$MONGODB_URL PORT=8080 exec bin/strider"]
EXPOSE 8080
