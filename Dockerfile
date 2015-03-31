FROM ubuntu:14.04.2
 
# Install dev tools: jdk (from Oracle), git, wget etc...
RUN apt-get update
RUN apt-get install -y git wget
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Install vertx
RUN \
  mkdir -p /usr/local/vertx && cd /usr/local/vertx && \
  wget http://dl.bintray.com/vertx/downloads/vert.x-2.1.2.tar.gz -qO - | tar -xz

# Install sshd
# RUN apt-get install -y openssh-server
# RUN mkdir /var/run/sshd
# RUN echo 'root:admin' | chpasswd
# RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# RUN echo "export VISIBLE=now" >> /etc/profile

# Add vertx to the path
ENV PATH /usr/local/vertx/vert.x-2.1.2/bin:$PATH
 
RUN mkdir -p /usr/local/src
WORKDIR /usr/local/src

EXPOSE 22
EXPOSE 80
EXPOSE 8080

CMD ["bash"]
