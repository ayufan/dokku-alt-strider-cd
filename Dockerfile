FROM ubuntu:trusty
MAINTAINER Kamil Trzcinski <ayufan@ayufan.eu>

# Configure environment
RUN apt-get update
RUN apt-get install -y curl wget build-essential git make
RUN locale-gen en_US en_US.UTF-8
RUN curl https://raw.github.com/isaacs/nave/master/nave.sh > /bin/nave && chmod a+x /bin/nave
RUN nave usemain stable

# Install Strider-CD
RUN useradd -m strider
RUN git clone https://github.com/Strider-CD/strider.git /src -b 1.4.5
WORKDIR /src
RUN apt-get install -y nodejs npm
RUN (rm -rf node_modules || exit 0) && npm install

# Configure Strider-CD
RUN mkdir -p /strider/builds && chown -R strider:strider /strider
ENV STRIDER_CLONE_DEST /strider/builds
ENV SERVER_NAME https://strider-ci.ayufan.eu/
USER strider

# Run Strider-CD
CMD ["sh", "-c", "NODE_ENV=${NODE_ENV:=production} DB_URI=$MONGODB_URL PORT=8080 exec bin/strider"]
EXPOSE 8080
