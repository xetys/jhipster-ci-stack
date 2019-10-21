FROM openjdk:11

RUN \
  #install dependencies
  apt-get update && \
  apt-get install -y \
    python \
    g++ \
    build-essential

RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

  #install node.js
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash && \
  apt-get install -y nodejs && \

  # upgrade npm
  npm install -g npm


# installing docker
#RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    #apt-get -y install apt-transport-https ca-certificates gnupg2  && \
    #echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list && \
    #apt-get update && \
    #apt-get -y install docker-engine=1.11.2-0~jessie && \
    #docker -v

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install docker-ce=18.06.3~ce~3-0~debian docker-ce-cli=18.06.3~ce~3-0~debian containerd.io \
    docker -v

RUN curl -o /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl && chmod a+x /usr/bin/kubectl

