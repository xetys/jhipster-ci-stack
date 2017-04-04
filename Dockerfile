FROM openjdk:8

RUN \
  #install dependencies
  apt-get update && \
  apt-get install -y \
    python \
    g++ \
    build-essential && \

  #install node.js
  curl -sL https://deb.nodesource.com/setup_6.x | bash && \
  apt-get install -y nodejs && \

  # upgrade npm
  npm install -g npm && \

  # install bower gulp yarn
  npm install -g \
    bower \
    gulp-cli \
    yarn && \

  echo '{ "allow_root": true }' > /root/.bowerrc

# installing docker
RUN set -x \
    && curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-$DOCKER_VERSION.tgz" -o docker.tgz \
    && echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
    && tar -xzvf docker.tgz \
    && mv docker/* /usr/local/bin/ \
    && rmdir docker \
    && rm docker.tgz \
    && docker -v

RUN curl -o /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/kubectl && chmod a+x /usr/bin/kubectl

